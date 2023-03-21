using DBModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utility.MailBox;
using Utility;
using System.Text.RegularExpressions;
using System.ComponentModel.DataAnnotations;
using static Utility.Files;
using static Utility.MailBox.Api;
using System.Net.Http;
using Services.Files;
using System.Text.Json;
using Services.Models.MailBox;
using Utility.sysConstTable.field;

namespace Services.ModaMailBox
{
    /// <summary>
    /// 民意信箱流程
    /// </summary>
    public class MailBox
    {
        #region 驗證信件 (status 0~3)

        /// <summary>
        /// 發送驗證信箱通知信
        /// </summary>
        public static bool SendValidateMail(CaseApplyValidate Validate)
        {
            // status 0
            if (MailBoxService.CreateCaseApplyValidate(Validate))
            {
                if (MailBoxSendMail.verifyemailSend(Validate))
                {
                    // status 1
                    MailBoxService.ChangeCaseValidateStatus(Validate, EnumTpye.GetEnumNumberToSting(EnumCassApplyStatus.step1));
                    return true;
                }
                else
                {
                    //status 2
                    MailBoxService.ChangeCaseValidateStatus(Validate, EnumTpye.GetEnumNumberToSting(EnumCassApplyStatus.step2));
                    return false;
                }
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// 驗證信箱
        /// </summary>
        public static bool MailValidate(string token, out CaseApplyValidate Validate, out string errorMsg)
        {
            Validate = MailBoxService.GetCaseApplyValidateBytoken(token);
            if (Validate == null)
            {
                errorMsg = "認證信箱連結已失效，請重新認證電子信箱";
                return false;
            }
            else if (Validate.EffectiveDate < DateTime.Now)
            {
                errorMsg = "認證信箱連結已失效，請重新認證電子信箱";
                return false;
            }
            else
            {
                var Case = MailBoxService.GetCaseApplyByValidateSN(Validate.CaseValidateSN);

                if (Case != null)
                {
                    errorMsg = "案件已成立，若需再次填寫請重新驗證信箱";
                    return false;
                }
                else if (Validate.Status == EnumTpye.GetEnumNumberToSting(EnumCassApplyStatus.step1) || Validate.Status == EnumTpye.GetEnumNumberToSting(EnumCassApplyStatus.step3))
                {
                    // status 3
                    Validate.StatementCheckDate = DateTime.Now;
                    Validate.Status = EnumTpye.GetEnumNumberToSting(EnumCassApplyStatus.step3);
                    MailBoxService.UpdateCaseApplyValidate(Validate);

                    errorMsg = "";
                    return true;
                }
                else
                {
                    errorMsg = "認證信箱連結已失效，請重新認證電子信箱";
                    return false;
                }
            }
        }

        #endregion

        #region 填寫意見內容 (status 4~7)

        /// <summary>
        /// 新增案件並寄案件確認信
        /// 230316 - 移除確認信步驟
        /// </summary>
        /// <param name="Case">意見內容</param>
        /// <param name="EffectDays">有效日天數</param>
        /// <returns></returns>
        public static bool CreateCase(CaseApply Case, List<SaveFileModel> Files, string EffectDays, string EncodeKey, string FileApiUrl, string WebApiUrl)
        {
            // status 4
            if (MailBoxService.CreateCaseApply(Case, EffectDays))
            {
                if (Files?.Count() > 0)
                {
                    foreach (var file in Files)
                    {
                        if (FileUpload(file, Case, FileApiUrl, out ResultFileApiModel Result))
                        {
                            var WEBFileID = Regular.GetRandomString(15, RegularType.notspecial);
                            InsertFile(Result, WEBFileID, Case, WebApiUrl);
                        }
                    }
                }

                //SendConfirmMail(Case, EncodeKey);
                SendInProgressMail(Case);
            }
            return true;
        }

        /// <summary>
        /// 確認案件並寄案件成立信
        /// 230316 - 移除確認信步驟
        /// </summary>
        /// <param name="Token"></param>
        /// <param name="ActionKey"></param>
        /// <param name="errorMsg"></param>
        /// <returns></returns>
        public static bool ConfirmCase(string Token, string ActionKey, out string errorMsg)
        {
            errorMsg = "";
            var data = DataProtectionUnProtect(Token, ActionKey);

            var Case = MailBoxService.GetCaseApply(data.CaseNo, data.CasePwd);
            if (Case == null)
            {
                errorMsg = "驗證碼錯誤";
            }
            else if (Case.Status != EnumTpye.GetEnumNumberToSting(EnumCassApplyStatus.step5))
            {
                errorMsg = "此案件已成立";
            }
            else if (Case.EffectiveDate < DateTime.Now)
            {
                errorMsg = "此案件已過期，請重新申請";
            }
            else
            {
                // status 7
                MailBoxService.ConfirmCase(ref Case);

                SendInProgressMail(Case);
            }

            return errorMsg == "";
        }

        /// <summary>
        /// 重寄案件確認信（最後一筆案件）
        /// </summary>
        public static bool ResendLastConfirmMail(string email, string EncodeKey, out string errorMsg)
        {
            errorMsg = "";
            var Case = MailBoxService.GetLastCase(email);

            if (Case == null)
            {
                errorMsg = "無此E-mail相關資料，請重新申請";
            }
            else if (Case.AcceptDate != null)
            {
                errorMsg = "已成案，請至「案件進度查詢」進行案件查詢";
            }
            else if (Case.EffectiveDate < DateTime.Now)
            {
                errorMsg = "確認信已過時效，請重新申請";
            }
            else
            {
                SendConfirmMail(Case, EncodeKey);
            }

            return errorMsg == "";
        }

        /// <summary>
        /// 重寄案件成立信（最後一筆處理中案件）
        /// </summary>
        public static bool ResendLastInProgressMail(string email, out string errorMsg)
        {
            errorMsg = "";
            var Case = MailBoxService.GetLastInProgressCase(email);

            if (Case == null)
            {
                errorMsg = "無此E-mail相關資料，請重新申請";
            }
            else
            {
                SendInProgressMail(Case);
            }

            return errorMsg == "";
        }

        /// <summary>
        /// 發送案件確認信
        /// </summary>
        public static bool SendConfirmMail(CaseApply Case, string EncodeKey)
        {
            var CaseClass = MailBoxService.GetCase(Case.CaseApplyClassSN);
            var sysCategory = MailBoxService.GetSysCategory().FirstOrDefault(x => x.SysCategoryKey == CaseClass.SysCategoryKey);
            var token = DataProtectionProtect(new Query { CaseNo = Case.CaseNo, CasePwd = Case.CasePwd }, EncodeKey);
            var Files = MailBoxService.GetCaseApplyFiles("CaseApply", Case.CaseApplySN, "MailBox")
                .Select(x => new SaveFileModel
                {
                    FileName = x.OriginalFileName
                }).ToList();

            if (MailBoxSendMail.writemailSend(Case, CaseClass, sysCategory, 0, Files, token))
            {
                // status 5
                MailBoxService.ChangeCaseStatus(Case, EnumTpye.GetEnumNumberToSting(EnumCassApplyStatus.step5));
                return true;
            }
            else
            {
                // status 6
                MailBoxService.ChangeCaseStatus(Case, EnumTpye.GetEnumNumberToSting(EnumCassApplyStatus.step6));
                return false;
            }
        }

        /// <summary>
        /// 發送案件成立信
        /// </summary>
        private static bool SendInProgressMail(CaseApply Case)
        {
            var CaseClass = MailBoxService.GetCase(Case.CaseApplyClassSN);
            var SysCategory = MailBoxService.GetSysCategory().FirstOrDefault(x => x.SysCategoryKey == CaseClass.SysCategoryKey);
            var files = MailBoxService.GetCaseApplyFiles("CaseApply", Case.CaseApplySN, "MailBox")
                   .Select(x => new SaveFileModel
                   {
                       FileName = x.OriginalFileName
                   }).ToList();

            return MailBoxSendMail.writemailSend(Case, CaseClass, SysCategory, 1, files);
        }

        #region 檢核內容 & 儲存檔案

        /// <summary>
        /// 檢核意見內容
        /// </summary>
        public static bool Checkwritemail(string syscategory, ref CaseApply Case, out checkmodel CheckModel)
        {
            CheckModel = new checkmodel();
            var error = new List<string>();

            Case.Subject = Case.Subject == null ? "" : Case.Subject.Trim();
            Case.CaseContent = Case.CaseContent == null ? "" : Case.CaseContent.Trim();
            Case.WebSiteId = Case.WebSiteId == null ? "" : Case.WebSiteId.Trim();
            Case.ApplyUser = Case.ApplyUser == null ? "" : Case.ApplyUser.Trim();
            Case.ContactEmail = Case.ContactEmail == null ? "" : Case.ContactEmail.Trim();
            Case.TelAreacode = Case.TelAreacode == null ? "" : Case.TelAreacode.Trim();
            Case.Tel = Case.Tel == null ? "" : Case.Tel.Trim();
            Case.TelExtension = Case.TelExtension == null ? "" : Case.TelExtension.Trim();
            Case.Mobile = Case.Mobile == null ? "" : Case.Mobile.Trim();

            if (Case.ApplyUser.Length == 0)
            {
                CheckModel.focusOn = CheckModel.focusOn ?? "input_name";
                error.Add("真實姓名不能為空");
            }
            else
            {
                if (Regex.IsMatch(Case.ApplyUser.Replace(".", "").Replace(" ", ""), @"[\W]+"))
                {
                    CheckModel.focusOn = CheckModel.focusOn ?? "input_name";
                    error.Add("真實姓名請勿使用特殊符號");
                }

                if (Case.ApplyUser.Length > 80)
                {
                    CheckModel.focusOn = CheckModel.focusOn ?? "input_name";
                    error.Add("真實姓名長度不能超過80個字");
                }
            }

            if (Case.ContactEmail.Length == 0)
            {
                error.Add("Email不能為空");
            }
            else if (!new EmailAddressAttribute().IsValid(Case.ContactEmail.Trim()))
            {
                error.Add("Email格式錯誤");
            }
            var chkTel = (Case.TelAreacode?.Trim().Length > 0 && Case.Tel?.Trim().Length > 0);
            var chkMobile = Case.Mobile.Trim().Length > 0;
            if (!chkTel && !chkMobile)
            {
                CheckModel.focusOn = CheckModel.focusOn ?? "TelAreacode";
                error.Add("聯絡電話或行動電話需擇一填寫");
            }
            else
            {
                if (Case.TelAreacode.Trim().Length > 0)
                {
                    if (Case.TelAreacode.Length < 2 || Case.TelAreacode.Length > 4)
                    {
                        CheckModel.focusOn = CheckModel.focusOn ?? "TelAreacode";
                        error.Add("區域碼限2~4碼");
                    }

                    if (!Regex.IsMatch(Case.TelAreacode, @"^[0-9]*$"))
                    {
                        CheckModel.focusOn = CheckModel.focusOn ?? "TelAreacode";
                        error.Add("區域碼請輸入純數字");
                    }
                }

                if (Case.Tel.Trim().Length > 0)
                {
                    if (Case.Tel.Length < 5 || Case.Tel.Length > 10)
                    {
                        CheckModel.focusOn = CheckModel.focusOn ?? "Tel";
                        error.Add("聯絡電話限5~10碼");
                    }

                    if (!Regex.IsMatch(Case.Tel, @"^[0-9]*$"))
                    {
                        CheckModel.focusOn = CheckModel.focusOn ?? "Tel";
                        error.Add("聯絡電話請輸入純數字");
                    }
                }

                if (Case.TelExtension.Trim().Length > 0)
                {
                    if (Case.TelExtension.Length > 10)
                    {
                        CheckModel.focusOn = CheckModel.focusOn ?? "TelExtension";
                        error.Add("分機號碼不能超過10個數字");
                    }

                    if (!Regex.IsMatch(Case.TelExtension, @"^[0-9]*$"))
                    {
                        CheckModel.focusOn = CheckModel.focusOn ?? "TelExtension";
                        error.Add("分機號碼請輸入純數字");
                    }
                }

                if (Case.Mobile.Trim().Length > 0)
                {
                    if (Case.Mobile.Length != 10)
                    {
                        CheckModel.focusOn = CheckModel.focusOn ?? "Mobile";
                        error.Add("行動電話需為10碼");
                    }

                    if (!Regex.IsMatch(Case.Mobile, @"^[0-9]*$"))
                    {
                        CheckModel.focusOn = CheckModel.focusOn ?? "Mobile";
                        error.Add("行動電話請輸入純數字");
                    }
                }
            }

            if (Case.WebSiteId.Length == 0 && Case.CaseApplyClassSN == 0)
            {
                CheckModel.focusOn = CheckModel.focusOn ?? "webSelect";
                error.Add("請選擇機關信箱，再選擇意見分類");
            }
            else if (Case.WebSiteId.Length == 0)
            {
                CheckModel.focusOn = CheckModel.focusOn ?? "webSelect";
                error.Add("機關信箱不能為空");
            }
            else if (Case.CaseApplyClassSN == 0)
            {
                if (string.IsNullOrEmpty(syscategory))
                {
                    CheckModel.focusOn = CheckModel.focusOn ?? "selectSysCategory";
                    error.Add("請先選擇民意信箱意見分類");
                }
                else
                {
                    CheckModel.focusOn = CheckModel.focusOn ?? "selectCaseApplyClassSN";
                    error.Add("意見分類不能為空");
                }
            }

            if (Case.Subject.Length == 0)
            {
                CheckModel.focusOn = CheckModel.focusOn ?? "input_title";
                error.Add("主旨不能為空");
            }
            else if (Case.Subject.Length > 200)
            {
                CheckModel.focusOn = CheckModel.focusOn ?? "input_title";
                error.Add("主旨不能超過200字元");
            }
            else if (Regex.IsMatch(Case.Subject, @"<[^>]+>") || Regex.IsMatch(Case.Subject, @"<script[^>]*?>[\\s\\S]*?<\\/script>") || excludeHex(Case.Subject))
            {
                CheckModel.focusOn = CheckModel.focusOn ?? "input_title";
                error.Add("主旨請勿使用特殊符號");
            }

            if (Case.CaseContent.Length == 0)
            {
                CheckModel.focusOn = CheckModel.focusOn ?? "FormControlTextarea";
                error.Add("內容不能為空");
            }
            else if (Case.CaseContent.Length > 2000)
            {
                CheckModel.focusOn = CheckModel.focusOn ?? "FormControlTextarea";
                error.Add("內容不能超過2000字元");
            }
            else if (Regex.IsMatch(Case.CaseContent, @"<[^>]+>") || Regex.IsMatch(Case.CaseContent, @"<script[^>]*?>[\\s\\S]*?<\\/script>") || excludeHex(Case.CaseContent))
            {
                CheckModel.focusOn = CheckModel.focusOn ?? "FormControlTextarea";
                error.Add("內容請勿輸入HTML或其他網頁語法");
            }

            if (error.Count() > 0)
            {
                CheckModel.errormsg = String.Join("<br/>", error);
                return false;
            }
            else
            {
                return true;
            }
        }

        static List<string> hexEntitiesStart = new List<string>
        {
            "&lt;",
            "&#60;",
            "&#x3C;",
            "<"
        };

        static List<string> hexEntitiesEnd = new List<string>
        {
            ">",
            "&gt;",
            "&#62;",
            "&#x3E;"
        };

        /// <summary>
        /// 字串排除html tag (因應滲透測試
        /// </summary>
        static bool excludeHex(string text)
        {
            if (hexEntitiesStart.Any(s => text.Contains(s)) && hexEntitiesEnd.Any(s => text.Contains(s)))
            {
                int startIndex = 0;
                int endIndex = 0;
                foreach (var s in hexEntitiesStart)
                {
                    int indexS = text.IndexOf(s);
                    if (indexS != -1)
                    {
                        if (startIndex == 0 || indexS < startIndex)
                        {
                            startIndex = indexS;
                        }
                    }
                }

                foreach (var e in hexEntitiesEnd)
                {
                    int indexE = text.IndexOf(e);
                    if (indexE != -1)
                    {
                        if (endIndex == 0 || indexE < endIndex)
                        {
                            endIndex = indexE;
                        }
                    }
                }

                if (startIndex < endIndex)
                {
                    return true;
                }
            }

            return false;
        }

        /// <summary>
        /// 上傳檔案至FileServer
        /// </summary>
        static bool FileUpload(SaveFileModel fileMdeol, CaseApply caseApply, string FileApiUrl, out ResultFileApiModel Result)
        {
            Result = new ResultFileApiModel();

            var httpClientHandler = new HttpClientHandler
            {
                ServerCertificateCustomValidationCallback = (message, certificate2, arg3, arg4) => true
            };

            using (var client = new HttpClient(httpClientHandler))
            {
                string requestJson = Newtonsoft.Json.JsonConvert.SerializeObject(fileMdeol);
                HttpContent httpContent = new StringContent(requestJson);
                httpContent.Headers.ContentType = new System.Net.Http.Headers.MediaTypeHeaderValue("application/json");
                var result = client.PostAsync($"{FileApiUrl}/File/Save", httpContent).GetAwaiter().GetResult().Content.ReadAsStringAsync().Result;
                if (!string.IsNullOrEmpty(result))
                {
                    Result = Newtonsoft.Json.JsonConvert.DeserializeObject<ResultFileApiModel>(result);
                    if (Result.statusCode == System.Net.HttpStatusCode.OK)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
                else
                {
                    return false;
                }
            }
        }

        /// <summary>
        /// DB新增上傳檔案資料
        /// </summary>
        static void InsertFile(ResultFileApiModel item, string WEBFileID, CaseApply caseApply, string WebApiUrl)
        {
            var FileSession = new List<CommonFileModel>();
            var file = item.content;
            file.CommonFileModel.GroupID = "MailBox";
            file.CommonFileModel.fileTitle = file.CommonFileModel.fileOriginName;
            file.CommonFileModel.webFileID = WEBFileID;
            FileSession.Add(file.CommonFileModel);

            //DB動作
            WEBFile tt = new WEBFile()
            {
                WEBFileID = file.CommonFileModel.webFileID,
                CreatedDate = DateTime.Now,
                FileType = file.CommonFileModel.fileExt,
                FileName = file.CommonFileModel.fileNewName,
                OriginalFileName = file.CommonFileModel.fileOriginName,
                FilePath = $"{WebApiUrl}{file.CommonFileModel.webFileID}",
                FileSize = (int)file.CommonFileModel.fileSize,
                FileApiPath = file.CommonFileModel.filePath,
                IsEnable = "1",
            };
            FilesService.Create(tt);
            RelWebFileContent rf = new RelWebFileContent()
            {
                CreatedDate = DateTime.Now,
                CreatedUserID = "",
                GroupID = file.CommonFileModel.GroupID,
                PageView = 0,
                SortOrder = 0,
                SourceTable = "CaseApply",
                SourceSN = caseApply.CaseApplySN,
                WEBFileSN = tt.WEBFileSN
            };
            FilesService.CreateRelWebFileContent(rf);
        }

        #endregion

        #endregion

        #region 串接公文Api (status 8~12)

        /// <summary>
        /// 傳送至公文系統API
        /// </summary>
        public static bool SendAPI(BigFileData b, out string errorMsg)
        {
            errorMsg = "";
            var returnFileModel = new List<returnFileModel>();

            if (GetServerToken(out returnToekenModel returnToeken))
            {
                if (b.fileModels != null && b.fileModels.Count() > 0)
                {
                    foreach (var file in b.fileModels)
                    {
                        if (AddCaseFile(returnToeken, file, b.addNewCaseModel1.CompanyId, out returnFileModel reFile))
                        {
                            returnFileModel.Add(reFile);
                        }

                        MailBoxService.SpeedApiLog(reFile, b.CaseApplySN, "Console");
                    }
                }

                if (AddNewCase(returnToeken, b.addNewCaseModel1, returnFileModel, out returnAddNewCaseModel reCase))
                {
                    if (!string.IsNullOrWhiteSpace(reCase?.Data?.CaseNo))
                    {
                        // status 8
                        MailBoxService.UpdateCassApply(b.addNewCaseModel1.CompanyCaseNo, reCase?.Data?.CaseNo, reCase?.Data?.CasePwd);
                    }
                    else
                    {
                        // status 9
                        var Case = new CaseApply { CaseApplySN = b.CaseApplySN };
                        MailBoxService.ChangeCaseStatus(Case, EnumTpye.GetEnumNumberToSting(EnumCassApplyStatus.step9));
                        errorMsg = @$"案件編號 :{ b.addNewCaseModel1.CompanyCaseNo }  錯誤訊息 : { reCase?.Context }";
                    }
                }
                else
                {
                    // status 10
                    var Case = new CaseApply { CaseApplySN = b.CaseApplySN };
                    MailBoxService.ChangeCaseStatus(Case, EnumTpye.GetEnumNumberToSting(EnumCassApplyStatus.step10));
                    errorMsg = @$"案件編號 :{ b.addNewCaseModel1.CompanyCaseNo }  錯誤訊息 : { reCase?.Context }";
                }
                MailBoxService.SpeedApiLog(reCase, b.CaseApplySN, "Console");
            }
            else
            {
                errorMsg = @$"案件編號 :{ b.addNewCaseModel1.CompanyCaseNo }  錯誤訊息 : 取得token失敗";
            }

            return errorMsg == "";
        }

        /// <summary>
        /// 查詢公文系統API資訊
        /// </summary>
        /// <param name="SearchModel"></param>
        /// <param name="IsReturn">是否為退回</param>
        /// <param name="IsColse">是否結案</param>
        /// <returns></returns>
        public static bool SearchAPI(SearchModel SearchModel, string userID, out bool IsReturn, out bool IsClose)
        {
            bool result = true;
            IsReturn = false;
            IsClose = false;
            if (GetServerToken(out returnToekenModel returnToeken))
            {
                var files = new List<FileMessage>();

                if (SearchCase(returnToeken, SearchModel.SearchCaseModel, out returnSearchCaseModel returnData))
                {
                    if (returnData.Data?.CaseProcessStatus != null && returnData.Data?.CaseProcessStatus.Status == "發文完成")
                    {
                        files = DownloadAttachment(returnToeken,
                            returnData.Data.CaseReplyStatus[returnData.Data.CaseReplyStatus.Length - 1].ReplySaveFileName.ToList(),
                            SearchModel.SearchCaseModel.CaseNo,
                            returnData.Data.CaseReplyStatus[returnData.Data.CaseReplyStatus.Length - 1].DocDept);
                    }

                    if (returnData.ApiStatus == "1")
                    {
                        var closedat = returnData.Data.CaseProcessStatus?.Closedat;
                        var replycontent = returnData.Data.CaseReplyStatus[returnData.Data.CaseReplyStatus.Length - 1]?.ReplyContent;
                        var docNo = returnData.Data.CaseReplyStatus[returnData.Data.CaseReplyStatus.Length - 1]?.DocNo;
                        var docDept = returnData.Data.CaseReplyStatus[returnData.Data.CaseReplyStatus.Length - 1]?.DocDept;
                        var replyCaseNo = SearchModel.SearchCaseModel.CaseNo;
                        var replyCasePwd = SearchModel.SearchCaseModel.CasePwd;
                        CaseApply Case;

                        switch (returnData.Data.CaseProcessStatus.Status)
                        {
                            case "辦理中":
                                break;
                            case "發文完成":
                                if (!string.IsNullOrWhiteSpace(closedat))
                                {
                                    var already = false;
                                    Case = MailBoxService.GetCaseApply(replyCaseNo, true);
                                    if (MailBoxService.UploadReplyFile(Case.CaseApplySN, files, ref already))
                                    {
                                        if (!already)
                                        {
                                            // status 12
                                            MailBoxService.UpdateReplyCassApply(replyCaseNo, replyCasePwd, replycontent, closedat, true, "", docNo, docDept);

                                            if (SendReplyMail(Case.CaseApplySN, out string errorMsg))
                                            {
                                                IsClose = true;
                                            }
                                        }
                                    }
                                }
                                break;
                            case "部移文/署待收文":
                                {
                                    Case = MailBoxService.GetCaseApply(replyCaseNo, true);
                                    MailBoxService.UpdateReplyCassApply(replyCaseNo, replyCasePwd, "部移文/署待收文");
                                }
                                break;
                            case String a when a.StartsWith("公文已銷號"):
                                {
                                    // status 11
                                    MailBoxService.UpdateReplyCassApply(replyCaseNo, replyCasePwd, "", closedat, IsOver: false);
                                    IsReturn = true;
                                }
                                break;
                            default:
                                result = false;
                                break;

                        }
                    }
                }
                else
                {
                    result = false;
                }

                MailBoxService.SpeedApiLog(returnData, SearchModel.CaseApplySN, userID);
                return result;
            }
            else
            {
                return false;
            }
        }

        #endregion

        #region 後台系統回覆 (status 13)

        /// <summary>
        /// 暫存後台回覆
        /// </summary>
        public static bool TempReplyCase(CaseApply Case, string ReplyContent, List<CommonFileModel> ReplyFile, out string errorMsg, bool submit = false)
        {
            errorMsg = "";

            if (Case.ReplySource == EnumTpye.GetEnumNumberToSting(EnumReplySource.Speed))
            {
                errorMsg = "已經有回覆資料，請重新整理此頁面";
            }
            else if (string.IsNullOrEmpty(ReplyContent))
            {
                errorMsg = "請填寫系統回覆內容";
            }
            else
            {
                Case.ReplySource = EnumTpye.GetEnumNumberToSting(EnumReplySource.Mgr);
                Case.ReplySource2 = ReplyContent;
                if (submit)
                {
                    Case.Status = EnumTpye.GetEnumNumberToSting(EnumCassApplyStatus.step13);
                    Case.ReplySource2Date = DateTime.Now;
                }

                if (!MailBoxService.EditCaseApplyModeReply(Case, ReplyContent, ReplyFile))
                {
                    errorMsg = "儲存有誤，請重新操作";
                }
            }
            return errorMsg == "";
        }



        #endregion

        #region 傳送回覆信件 (status 14~15)

        /// <summary>
        /// 傳送回覆信件
        /// </summary>
        /// <param name="CaseApplySN"></param>
        /// <param name="errorMsg"></param>
        /// <param name="onlySendMail">false-需要更新資料 true - 不更新資料只發信</param>
        /// <returns></returns>
        public static bool SendReplyMail(int CaseApplySN, out string errorMsg, bool onlySendMail = false)
        {
            errorMsg = "";
            var groupID = "";
            var Case = MailBoxService.GetCaseApply(CaseApplySN);

            if (string.IsNullOrEmpty(Case?.ReplySource))
            {
                return false;
            }
            else if (Case.ReplySource == EnumTpye.GetEnumNumberToSting(EnumReplySource.Speed))
            {
                groupID = Utility.WebFileGroupID.MailBox.SpeedApiFile;
            }
            else if (Case.ReplySource == EnumTpye.GetEnumNumberToSting(EnumReplySource.Mgr))
            {
                groupID = Utility.WebFileGroupID.MailBox.File;
            }
            else
            {
                return false;
            }

            Case.ReplySource2Date = System.DateTime.Now;

            var caseclass = MailBoxService.GetCase(Case.CaseApplyClassSN);
            var MailBoxFiles = MailBoxService
                        .GetCaseApplyFiles("CaseApply", Case.CaseApplySN, Utility.WebFileGroupID.MailBox.MailBoxFile)
                        .Select(x => new SaveFileModel
                        {
                            FileName = x.OriginalFileName
                        }).ToList();

            var ReplyFiles = MailBoxService
                        .GetCaseApplyFiles("CaseApply", Case.CaseApplySN, groupID)
                        .Select(x => new Utility.MailFile
                        {
                            FileName = x.OriginalFileName,
                            stream = GetApiFileAsync(x.FileApiPath)
                        }).ToList();

            var CaseWeb = MailBoxService.GetCaseApplyWeb();
            var needSurvey = CaseWeb.Satisfaction;
            var sysCategory = MailBoxService.GetSysCategory().FirstOrDefault(x => x.SysCategoryKey == caseclass.SysCategoryKey);
            var presetReply = MailBoxService.GetPresetReply();
            if (MailBoxSendMail.SendReplyMail(Case, caseclass, sysCategory, needSurvey, out errorMsg, MailBoxFiles, ReplyFiles, presetReply))
            {
                if (!onlySendMail)
                {
                    // status 14
                    MailBoxService.ChangeCaseStatus(Case, EnumTpye.GetEnumNumberToSting(EnumCassApplyStatus.step14));

                }
                return true;
            }
            else
            {
                // status 15
                if (!onlySendMail)
                {
                    MailBoxService.ChangeCaseStatus(Case, EnumTpye.GetEnumNumberToSting(EnumCassApplyStatus.step15));
                }
                return false;
            }
        }

        #endregion

        #region 案件改分

        /// <summary>
        /// 案件改分
        /// </summary>
        public static bool ChangeCaseClass(CaseApply Case, int CaseApplyClassSN, out string errorMsg)
        {
            var _Case = ModaMailBox.MailBoxService.GetCaseApply(Case.CaseNo);
            if (_Case == null)
            {
                errorMsg = "查無此案件";
                return false;
            }
            else if (_Case.Status != EnumTpye.GetEnumNumberToSting(EnumCassApplyStatus.step11))
            {
                errorMsg = "此案非待改分案件";
                return false;
            }
            else
            {
                Case.CaseApplyClassSN = CaseApplyClassSN;
                Case.Status = EnumTpye.GetEnumNumberToSting(EnumCassApplyStatus.step11);
                Case.ProcessDate = DateTime.Now;
                MailBoxService.UpdateCaseClass(Case);
                errorMsg = "";
                return true;
            }
        }

        #endregion

        #region 滿意度調查

        public static checkmodel CheckSurvey(CaseApplySurvey survey)
        {
            var checkmodel = new MailBox.checkmodel();
            var error = new List<string>();
            if (MailBoxService.CheckSurveyExists(survey.CaseApplySn.Value))
            {
                error.Add("已填寫過問券調查");
            }

            if (0 > survey.CaseSatisfy || survey.CaseSatisfy > 10)
            {
                checkmodel.focusOn = checkmodel.focusOn ?? "CaseSatisfy";
                error.Add("答覆內容滿意度超出範圍");
            }

            if (string.IsNullOrEmpty(survey.CaseSolved))
            {
                checkmodel.focusOn = checkmodel.focusOn ?? "CaseSolved";
                error.Add("問題是否解決不能為空");
            }
            else if (!Regex.IsMatch(survey.CaseSolved, @"^[A-D]+$"))
            {
                checkmodel.focusOn = checkmodel.focusOn ?? "CaseSolved";
                error.Add("問題是否解決超出範圍");
            }

            if (string.IsNullOrEmpty(survey.CaseDefect))
            {
                checkmodel.focusOn = checkmodel.focusOn ?? "CaseDefect";
                error.Add("若沒有不滿意的部分請選擇無");
            }
            else
            {
                var d = survey.CaseDefect.Split(',');
                var c = d.Any(x => !Regex.IsMatch(x, @"^[A-H]+$") ? true : false);
                if (c)
                {
                    checkmodel.focusOn = checkmodel.focusOn ?? "CaseDefect";
                    error.Add("不滿意的部分超出範圍");
                }
            }

            if (!string.IsNullOrEmpty(survey.CaseProposal) && (Regex.IsMatch(survey.CaseProposal, @"<[^>]+>") || Regex.IsMatch(survey.CaseProposal, @"<script[^>]*?>[\\s\\S]*?<\\/script>")))
            {
                checkmodel.focusOn = checkmodel.focusOn ?? "CaseProposal";
                error.Add("其他建議事項內容請勿輸入HTML或其他網頁語法");
            }

            checkmodel.errormsg = String.Join("<br/>", error);
            return checkmodel;
        }

        #endregion

        #region 加解密

        public class Query
        {
            public string CaseNo { get; set; }

            public string CasePwd { get; set; }
        }

        public static string DataProtectionProtect(Query query, string actionKey)
        {
            var token = Utility.AES.AesEncrypt(JsonSerializer.Serialize(query), actionKey);
            Byte[] bytesEncode = System.Text.Encoding.UTF8.GetBytes(token);
            string resultEncode = Convert.ToBase64String(bytesEncode);
            return resultEncode;
        }

        public static Query DataProtectionUnProtect(string token, string actionKey)
        {
            Byte[] bytesDecode = Convert.FromBase64String(token);
            string resultText = System.Text.Encoding.UTF8.GetString(bytesDecode);
            var _token = Utility.AES.AesDecrypt(resultText, actionKey);
            return JsonSerializer.Deserialize<Query>(_token);
        }

        #endregion

        #region 共用 Model

        public class checkmodel
        {
            public string focusOn { get; set; }

            public string errormsg { get; set; }
        }

        #endregion
    }
}
