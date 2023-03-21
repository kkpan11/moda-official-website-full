using DBModel;
using Management.Areas.MailBox.Models.CaseApply;
using Management.ManagementUtility;
using Microsoft.AspNetCore.Mvc;
using Services;
using Services.Authorization;
using Services.ModaMailBox;
using System;
using System.Collections.Generic;
using System.Linq;
using Utility;
using static Utility.Files;
using static Utility.MailBox.Api;

namespace Management.Areas.MailBox.Controllers
{
    [Area("MailBox")]
    public class CaseApplyController : BaseController
    {
        #region 申辦案件處理
        public IActionResult Index()
        {
            ViewData["Breadcrumb"] = CommonUtility.Breadcrumb(28);
            if (!CheckUserMenu(28).chk) { return RedirectToAction("ErrorCome", "Home", new { area = "" }); }
            var websiteId = UserData.WebSiteID;
            var viewModel = new Management.Areas.MailBox.Models.CaseApply.IndexModel();
            viewModel.casesModels = MailBoxService.GetCases("0").Where(x => x.WebSiteID == websiteId).ToList();
            viewModel.WEBScheduleUseTime = WEBScheduleService.GetWEBSchedule("mailbox")?.UseTime;

            return View(viewModel);
        }
        public IActionResult List(string strDate = "", string endDate = "", string CaseApplyClassSN = "", string dep = "", string keyword = "", int p = 1, int DisplayCount = 10, string status = "")
        {
            var _dep = 0;
            int.TryParse(dep, out _dep);
            var ListModels = new Management.Areas.MailBox.Models.CaseApply.ListModel();
            var websiteId = UserData.WebSiteID;
            DefaultPager pager = new DefaultPager();
            pager.DisplayCount = DisplayCount;
            pager.p = p;
            var lists = MailBoxService.GetCaseApplyList(websiteId, strDate, endDate, ref pager, _dep, keyword, CaseApplyClassSN, status);
            ListModels.defaultPager = pager;
            ListModels.GetCases = lists;
            return View(ListModels);
        }
        /// <summary>
        /// 申辦案件詳細資料
        /// </summary>
        /// <param name="sn"></param>
        /// <returns></returns>
        public IActionResult Detail(string sn)
        {
            SetSession("WEBFile", null);
            ViewData["Breadcrumb"] = CommonUtility.Breadcrumb(28);
            if (!CheckUserMenu(28).chk) { return RedirectToAction("ErrorCome", "Home", new { area = "" }); }
            var detail = MailBoxService.GetCaseApply(sn);
            var files = MailBoxService.GetCaseApplyFiles("CaseApply", detail.CaseApplySN, "MailBox");
            var files2 = MailBoxService.GetCaseApplyFiles("CaseApply", detail.CaseApplySN, "SpeedApi");
            var files3 = CommonUtility.GetFileByDB(detail.CaseApplySN.ToString(), "CaseApply");
            SetSession("WEBFile", files3);

            var viewData = new Management.Areas.MailBox.Models.CaseApply.DetailModel();
            viewData.caseApply = detail;
            viewData.wEBFiles = files;
            viewData.wEBFiles2 = files2;
            viewData.wEBFiles3 = files3;
            viewData.casesModel = MailBoxService.GetCase(detail.CaseApplyClassSN);
            viewData.replyModels = LogCaseApply(detail.CaseApplySN);

            detail.DocDept = DepartmentManagementService.GetDepartmentList().FirstOrDefault(x => x.DepartmentID == detail.DocDept && x.Lang == "zh-tw")?.DepartmentName ?? "";

            return View(viewData);
        }

        #endregion
        public IActionResult ReSet()
        {
            ViewData["Breadcrumb"] = CommonUtility.Breadcrumb(32);
            if (!CheckUserMenu(28).chk) { return RedirectToAction("ErrorCome", "Home", new { area = "" }); }

            var viewModel = new Management.Areas.MailBox.Models.CaseApply.IndexModel();
            viewModel.casesModels = MailBoxService.GetCases("0").ToList();
            return View(viewModel);
        }
        public IActionResult ReSetList(string CaseApplyClassSN0 = "", string CaseApplyClassSN = "", string keyword = "", int p = 1, int DisplayCount = 10)
        {
            var _dep = 0;
            var ListModels = new Management.Areas.MailBox.Models.CaseApply.ListModel();
            DefaultPager pager = new DefaultPager();
            pager.DisplayCount = DisplayCount;
            pager.p = p;
            var lists = MailBoxService.GetCaseApplyList2(CaseApplyClassSN0, ref pager, _dep, keyword, CaseApplyClassSN);
            ListModels.defaultPager = pager;
            ListModels.GetCases = lists;
            return View(ListModels);
        }
        public IActionResult ReSetDetail(string sn)
        {
            ViewData["Breadcrumb"] = CommonUtility.Breadcrumb(32);
            if (!CheckUserMenu(32).chk) { return RedirectToAction("ErrorCome", "Home", new { area = "" }); }
            var detail = MailBoxService.GetCaseApply(sn);
            var Logs = MailBoxService.GetReturnLog(detail.CaseApplySN);
            var LogDatas = new List<CaseApplySpeedApiLogModel>();
            foreach (var log in Logs.OrderByDescending(x => x.SpeedApiLogSn))
            {
                var Message = Newtonsoft.Json.JsonConvert.DeserializeObject<returnSearchCaseModel>(log.Message);
                LogDatas.Add(new CaseApplySpeedApiLogModel()
                {
                    speedApiLogSn = log.SpeedApiLogSn,
                    returnCaseNo = Message.Data.CaseReplyStatus[0].CaseNo,
                    returnMessage = Message.Data.CaseProcessStatus.Status,
                    closedat = Message.Data.CaseProcessStatus.Closedat
                });
            }
            var viewData = new Management.Areas.MailBox.Models.CaseApply.ReSetDetailModel();
            var files = MailBoxService.GetCaseApplyFiles("CaseApply", detail.CaseApplySN, "MailBox");
            viewData.caseApply = detail;
            viewData.wEBFiles = files;
            viewData.casesModel = MailBoxService.GetCase(detail.CaseApplyClassSN);
            viewData.casesModels = MailBoxService.GetCases("0").ToList();
            viewData.ReturnLog = LogDatas;
            return View(viewData);
        }
        [HttpPost]
        public IActionResult ReSetCaseApply(int CaseApplyClassSN, string CaseNo)
        {
            SetLogActionModel(Action2: Utility.Model.LoginModel.Action2.update, SourceTable: "CaseApply");
            if (CaseApplyClassSN == 0)
            {
                return StatusResult(System.Net.HttpStatusCode.BadRequest, "請選擇意見分類");
            }
            var Case = MailBoxService.GetCaseApply(CaseNo);
            Case.ProcessUser = UserData.sysUser.UserID;
            Case.ProcessIPAddress = HttpContext.Request.HttpContext.Connection.RemoteIpAddress.ToString();

            if (Services.ModaMailBox.MailBox.ChangeCaseClass(Case, CaseApplyClassSN, out string errorMsg))
            {
                return StatusResult(System.Net.HttpStatusCode.BadRequest, errorMsg);
            }
            try
            {
                return StatusResult(System.Net.HttpStatusCode.OK, "更新成功，並請等待排程(每5分鐘)拋轉給公文系統。");

                //統一排程處理
                //var bigdata = MailBoxService.GetCassApply("3", CaseNo).FirstOrDefault();
                //if (updateData != null && bigdata != null)
                //{
                //    var returnData = new Utility.MailBox.Api.returnAddNewCaseModel();
                //    returnData = Utility.MailBox.Api.SendAddNewCase(bigdata.addNewCaseModel1, bigdata.fileModels, bigdata.addNewCaseModel1.CompanyId, out List<Utility.MailBox.Api.returnFileModel> _returnFileModel);
                //    MailBoxService.SpeedApiLog(returnData, _returnFileModel, bigdata.CaseApplySN, "MailBox");
                //    MailBoxService.UpdateCassApply(bigdata.addNewCaseModel1.CompanyCaseNo, returnData?.Data?.CaseNo, returnData?.Data?.CasePwd);
                //    var SendMail = new Services.ModaMailBox.MailBoxSendMail();
                //    if (!string.IsNullOrWhiteSpace(returnData?.Data?.CaseNo))
                //    {
                //        var cases = MailBoxService.GetCase(CaseApplyClassSN);
                //        var sysCategory = MailBoxService.GetSysCategory().FirstOrDefault(x => x.SysCategoryKey == cases.SysCategoryKey);
                //        updateData.ReplyCaseNo = returnData?.Data?.CaseNo;
                //        var mailto = MailBoxService.GetCaseApplyClassTos(CaseApplyClassSN);
                //        SendMail.writeAssignCase(updateData, cases, sysCategory, mailto);
                //        return StatusResult(System.Net.HttpStatusCode.OK, "更新成功，並發送API給公文系統");
                //    }
                //}
                //return StatusResult(System.Net.HttpStatusCode.OK, "更新成功");
            }
            catch (System.Exception ex)
            {
                MailBoxService.UpdateCassApplyStatus(CaseNo, Utility.MailBox.EnumCassApplyStatus.step5);
                Utility.Mail.Error($"民意信箱API發生錯誤 ，請確認API狀況 error ReSetCaseApply : {ex.Message}");
                return StatusResult(System.Net.HttpStatusCode.BadRequest, "資料已更新，公文系統API系統異常");
            }
        }

        [HttpPost]
        public IActionResult SaveCaseApply(int CaseApplySN, string ReplySource2)
        {
            SetLogActionModel(Action2: Utility.Model.LoginModel.Action2.update, SourceTable: "CaseApply", SourceSN: CaseApplySN, webPath: CommonUtility.Breadcrumb(28));
            try
            {
                var replyfile = GetSession<List<CommonFileModel>>("WEBFile");
                var CaseApply = MailBoxService.GetCaseApply(CaseApplySN);
                CaseApply.ProcessUser = UserData.sysUser.UserID;
                CaseApply.ProcessIPAddress = HttpContext.Request.HttpContext.Connection.RemoteIpAddress.ToString();

                if (Services.ModaMailBox.MailBox.TempReplyCase(CaseApply, ReplySource2, replyfile, out string errorMsg))
                {
                    var replyfileStr = "";
                    if (replyfile?.Count() > 0)
                    {
                        var EasyReplyfile = replyfile.Select(x => new { x.webFileID, x.fileTitle }).ToList();
                        replyfileStr =  Newtonsoft.Json.JsonConvert.SerializeObject(EasyReplyfile);
                    }
                    logActionModel.response = replyfileStr;
                    return StatusResult(System.Net.HttpStatusCode.OK, "");
                }
                else
                {
                    return StatusResult(System.Net.HttpStatusCode.BadRequest, errorMsg);
                }
            }
            catch (System.Exception ex)
            {
                Utility.Mail.Error($"民意信箱發生錯誤 ，請確認狀況 error SaveCaseApply : {ex.Message}");
                return StatusResult(System.Net.HttpStatusCode.BadRequest, "資料異常請聯絡系統工程師");
            }
        }

        [HttpPost]
        public IActionResult SendMail(int CaseApplySN, string ReplySource2)
        {
            SetLogActionModel(Action2: Utility.Model.LoginModel.Action2.update, SourceTable: "CaseApply", SourceSN: CaseApplySN, webPath: CommonUtility.Breadcrumb(28));
            try
            {
                var replyfile = GetSession<List<CommonFileModel>>("WEBFile");
                var CaseApply = MailBoxService.GetCaseApply(CaseApplySN);
                CaseApply.ProcessUser = UserData.sysUser.UserID;
                CaseApply.ProcessIPAddress = HttpContext.Request.HttpContext.Connection.RemoteIpAddress.ToString();

                if (Services.ModaMailBox.MailBox.TempReplyCase(CaseApply, ReplySource2, replyfile, out string errorMsg, true))
                {
                    if (Services.ModaMailBox.MailBox.SendReplyMail(CaseApply.CaseApplySN, out errorMsg))
                    {
                        var replyfileStr = "";
                        if (replyfile?.Count() > 0)
                        {
                            var EasyReplyfile = replyfile.Select(x => new { x.webFileID, x.fileTitle }).ToList();
                            replyfileStr = Newtonsoft.Json.JsonConvert.SerializeObject(EasyReplyfile);
                        }
                        logActionModel.response = replyfileStr;
                        return StatusResult(System.Net.HttpStatusCode.OK, "");
                    }
                    else
                    {
                        return StatusResult(System.Net.HttpStatusCode.BadRequest, "發信異常，請重新操作");
                    }
                }
                else
                {
                    return StatusResult(System.Net.HttpStatusCode.BadRequest, errorMsg);
                }
            }
            catch (System.Exception)
            {
                return StatusResult(System.Net.HttpStatusCode.BadRequest, "資料異常請聯絡系統工程師");
            }
        }

        [HttpPost]
        public IActionResult SendAPI(string CaseNo)
        {
            SetLogActionModel(Action2: Utility.Model.LoginModel.Action2.update, SourceTable: "CaseApply");
            try
            {
                var CaseApply = MailBoxService.GetCaseApply(CaseNo);
                var _Status = int.Parse(CaseApply.Status);
                switch (_Status)
                {
                    case (int)Utility.MailBox.EnumCassApplyStatus.step8:
                        {
                            var fileModel = new List<FileMessage>();
                            var SearchModel = MailBoxService.GetSearchCaseList(CaseApply.CaseNo).FirstOrDefault();

                            if (Services.ModaMailBox.MailBox.SearchAPI(SearchModel, UserData.sysUser.UserID, out bool isReturn, out bool isClosed))
                            {
                                if (isReturn)
                                {
                                    MailBoxService.SendReSetTellUser(AppSettingHelper.GetAppsetting("LocalUrl"));
                                    return StatusResult(System.Net.HttpStatusCode.OK, "公文已銷號，請至退回案件辦理重新分類");
                                }
                                if (isClosed)
                                {
                                    return StatusResult(System.Net.HttpStatusCode.OK, "回覆信件已寄送");
                                }

                                return StatusResult(System.Net.HttpStatusCode.OK, "辦理中");
                            }
                            else
                            {

                            }
                        }
                        break;
                }
                return StatusResult(System.Net.HttpStatusCode.OK, "辦理中");
            }
            catch (System.Exception ex)
            {
                logActionModel.status = Utility.Model.LoginModel.Status.Error;
                logActionModel.response = ex.ToString();
                Log(logActionModel);

                Utility.Mail.Error($"民意信箱API發生錯誤 ，請確認API狀況 error SendAPI : {ex.Message}");
                return StatusResult(System.Net.HttpStatusCode.BadRequest, "資料異常請聯絡系統工程師");
            }
        }

        [HttpPost]
        public IActionResult BatchSendAPI()
        {
            SetLogActionModel(Action2: Utility.Model.LoginModel.Action2.update, SourceTable: "CaseApply");
            try
            {
                var BigData = MailBoxService.GetSearchCaseList();
                var ReturnCount = 0;
                var CloseCount = 0;
                foreach (var b in BigData)
                {
                    Services.ModaMailBox.MailBox.SearchAPI(b, UserData.sysUser.UserID, out bool isReturn, out bool isClosed);
                    if (isReturn)
                    {
                        ReturnCount++;
                    }
                    if (isClosed)
                    {
                        CloseCount++;
                    }
                }
                if (ReturnCount > 0)
                {
                    MailBoxService.SendReSetTellUser(AppSettingHelper.GetAppsetting("LocalUrl"));
                }
                return StatusResult(System.Net.HttpStatusCode.OK, $"已完成批次接收API，總筆數為{BigData.Count()}筆，已發文完成:{CloseCount}，已銷號:{ReturnCount}");
            }
            catch (System.Exception ex)
            {
                Utility.Mail.Error($"民意信箱API發生錯誤 ，請確認API狀況 error BatchSendAPI : {ex.Message}");
                return StatusResult(System.Net.HttpStatusCode.BadRequest, "資料異常請聯絡系統工程師");
            }
        }

        static List<ReplyModel> LogCaseApply(int sourceSN)
        {
            var source = LogService.GetLogAction(sourceSN, "CaseApply", Action2: "update");
            List<ReplyModel> logData = new List<ReplyModel>();
            foreach (var s in source)
            {
                try
                {
                    var jsonData = Newtonsoft.Json.JsonConvert.DeserializeObject<Management.Areas.MailBox.Models.CaseApply.ReplyModel>(s.MessageInput);

                    try
                    {
                        if (!string.IsNullOrWhiteSpace(s.MessageResult))
                        {
                            var jsonFiles = Newtonsoft.Json.JsonConvert.DeserializeObject<List<ReplyFileModel>>(s.MessageResult);
                            jsonData.files = jsonFiles;
                        }
                    }
                    catch { } 
                   

                    jsonData.dateTime = s.CreatedDate;
                    jsonData.UserID = s.UserID;
                    logData.Add(jsonData);
                }
                catch (Exception)
                {
                }
            }
            return logData;


        }

        /// <summary>
        /// 重新發送完成信
        /// </summary>
        /// <param name="CaseNo"></param>
        /// <returns></returns>
        [HttpPost]
        public IActionResult SendAgain(string CaseNo) {
            SetLogActionModel(Action2: Utility.Model.LoginModel.Action2.update, SourceTable: "CaseApply");
            var CaseApply = MailBoxService.GetCaseApply(CaseNo);
            try
            {
                Services.ModaMailBox.MailBox.SendReplyMail(CaseApply.CaseApplySN, out string erroe, false);
                return StatusResult(System.Net.HttpStatusCode.OK, "重寄成功");
            }
            catch (Exception ex)
            {
                return StatusResult(System.Net.HttpStatusCode.OK, "重寄失敗");
            }
        }
    }
}
