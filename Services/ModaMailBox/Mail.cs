using DBModel;
//using Grpc.Core;
using Services.Models.ModaMailBox;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text.Json;
using Utility;
using static Utility.Files;

namespace Services.ModaMailBox
{
    public class MailBoxSendMail
    {
        public static string MailBoxUrl = "";

        public string actionKey;

        /// <summary>
        /// 信箱驗證信
        /// </summary>
        /// <param name="data"></param>
        public static bool verifyemailSend(CaseApplyValidate data)
        {
            try
            {
                var Url = $@"{MailBoxUrl}/writemail?token={data.Token}";
                var filePath = $@"{Directory.GetCurrentDirectory()}/wwwroot/mail/A-3-1.html";
                var mailTemplate = System.IO.File.ReadAllText(filePath);
                mailTemplate = mailTemplate
                   .Replace("[writemail]", Url)
                   .Replace("[EffectiveDate]", data.EffectiveDate.ToString("yyyy-MM-dd HH:mm:ss"));
                //Exception outex = new Exception();
                //Utility.Mail.Send(data.Email.Trim(), "數位發展部民意信箱─電子信箱認證信", mailTemplate, true, ref outex);
                MailInfoModel mailInfo = new MailInfoModel()
                {
                    ToMail = data.Email.Trim(),
                    Subject = "數位發展部民意信箱─電子信箱認證信",
                    Body = mailTemplate,
                };
                Utility.Mail.Send(mailInfo, out Exception exception);

                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        /// <summary>
        /// 案件確認信
        /// </summary>
        /// <param name="data"></param>
        /// <param name="casesModel"></param>
        /// <param name="type">0- 確認信   1-已確認</param>
        public static bool writemailSend(CaseApply data, CasesModel casesModel, SysCategory sysCategory, int type = 0, List<SaveFileModel> saveFiles = null, string token = "")
        {
            try
            {
                var Url = $@"{MailBoxUrl}/confirmation?token={token}";
                var mailname = ""; var filePath = "";
                if (type == 0)
                {
                    mailname = "申請確認信";
                    filePath = $@"{Directory.GetCurrentDirectory()}/wwwroot/mail/A-5-1.html";
                }
                else
                {
                    mailname = "案件受理通知信";
                    filePath = $@"{Directory.GetCurrentDirectory()}/wwwroot/mail/A-9-1.html";
                }
                var mailTemplate = System.IO.File.ReadAllText(filePath);
                //附件
                var filearea = "";
                if (saveFiles?.Count() > 0)
                {
                    filearea += $"<tr><th class='text-nowrap' scope='row' rowspan='" + saveFiles.Count() + "'>附&emsp;&emsp;件 </th>";
                    filearea += $"<td>" + saveFiles[0].FileName + "</td></tr>";
                    for (int i = 1; i < saveFiles.Count(); i++)
                    {
                        filearea += $"<tr><td>" + saveFiles[i].FileName + "</td></tr>";
                    }
                }

                mailTemplate = mailTemplate
                    .Replace("[href]", Url)
                    .Replace("[CaseNo]", data.CaseNo)
                    .Replace("[CasePwd]", data.CasePwd)
                    .Replace("[CreateDate]", data.CreateDate.ToString("yyyy-MM-dd HH:mm"))
                    .Replace("[ApplyUser]", data.ApplyUser)
                    .Replace("[ContactEmail]", data.ContactEmail)
                    .Replace("[Tel]", string.IsNullOrWhiteSpace(data.Tel) ? "" : $@"{data.TelAreacode}-{data.Tel}" + (!string.IsNullOrEmpty(data.TelExtension) ? $" 分機 {data.TelExtension}" : ""))
                    .Replace("[Mobile]", data.Mobile)
                    .Replace("[WebName]", casesModel.WebSiteName)
                    .Replace("[SysCategory]", sysCategory?.Value ?? "")
                    .Replace("[CaseApplyClass]", casesModel.CaseName)
                    .Replace("[Subject]", data.Subject)
                    .Replace("[EffectiveDate]", data.EffectiveDate?.ToString("yyyy-MM-dd HH:mm:ss") ?? "")
                    .Replace("[FileArea]", filearea)
                    .Replace("[CaseContent]", data.CaseContent.Replace("\n", "<br>"));
                Exception outex = new Exception();
                MailInfoModel mailInfo = new MailInfoModel()
                {
                    Type = "MailBox",
                    ToMail = data.ContactEmail.Trim(),
                    Subject = $@"數位發展部民意信箱─{mailname}",
                    Body = mailTemplate,

                };


                if (Utility.Mail.Send(mailInfo, out Exception exception))
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            catch (Exception)
            {
                return false;
            }
        }

        /// <summary>
        /// 案件指派通知信
        /// </summary>
        /// <param name="data"></param>
        /// <param name="casesModel"></param>
        /// <param name="mailto"></param>
        public void writeAssignCase(CaseApply data, CasesModel casesModel, SysCategory sysCategory, List<CaseApplyClassTo> mailto)
        {
            try
            {
                if (mailto == null) return;
                var mailList = string.Join(";", mailto);

                var filePath = $@"{Directory.GetCurrentDirectory()}/wwwroot/mail/A-9-2.html";
                var mailTemplate = System.IO.File.ReadAllText(filePath);
                mailTemplate = mailTemplate
                    .Replace("[CaseNo]", data.CaseNo)
                    .Replace("[CasePwd]", data.CasePwd)
                    .Replace("[ReplyCaseNo]", data.ReplyCaseNo)
                    .Replace("[CreateDate]", data.CreateDate.ToString("yyyy-MM-dd HH:mm"))
                    .Replace("[ApplyUser]", data.ApplyUser)
                    .Replace("[WebName]", casesModel.WebSiteName)
                    .Replace("[SysCategory]", sysCategory?.Value ?? "")
                    .Replace("[CaseApplyClass]", casesModel.CaseName)
                    .Replace("[Subject]", data.Subject)
                    .Replace("[CaseContent]", data.CaseContent.Replace("\n", "<br>"));
                //Exception outex = new Exception();
                //Utility.Mail.Send(mailList.Trim(), $@"數位發展部民意信箱─{"民意信箱案件受理通知信"}", mailTemplate, true, ref outex);
                MailInfoModel mailInfo = new MailInfoModel()
                {
                    Type = "MailBox",
                    ToMail = data.ContactEmail.Trim(),
                    Subject = $@"數位發展部民意信箱─{"民意信箱案件受理通知信"}",
                    Body = mailTemplate,

                };
                Utility.Mail.Send(mailInfo, out Exception exception);
            }
            catch (Exception)
            {
            }
        }

        /// <summary>
        /// 案件回覆處理信
        /// </summary>
        /// <param name="data">案件資料</param>
        /// <param name="casesModel">分類</param>
        /// <param name="saveFiles">民眾上傳檔案</param>
        /// <param name="mailFiles">回覆夾檔</param>
        public static bool SendReplyMail(CaseApply data, CasesModel casesModel, SysCategory sysCategory, bool NeedSurvey, out string errorMsg, List<SaveFileModel> saveFiles = null, List<Utility.MailFile> mailFiles = null, string presetReply = "")
        {
            try
            {
                var filePath = $@"{Directory.GetCurrentDirectory()}/wwwroot/mail/A-9-3.html";
                var mailTemplate = System.IO.File.ReadAllText(filePath);
                //附件
                var filearea = "";
                if (saveFiles?.Count() > 0)
                {
                    filearea += $"<tr><th class='text-nowrap' scope='row' rowspan='" + saveFiles.Count() + "'>附&emsp;&emsp;件 </th>";
                    filearea += $"<td>" + saveFiles[0].FileName + "</td></tr>";
                    for (int i = 1; i < saveFiles.Count(); i++)
                    {
                        filearea += $"<tr><td>" + saveFiles[i].FileName + "</td></tr>";
                    }
                }
                var surveyarea = "";
                if (NeedSurvey)
                {
                    var url = $@"{MailBoxUrl}/survey";
                    surveyarea = @$"<p>針對本案處理情形，敬請點選以下連結，協助完成滿意度調查。</p>
                                    <strong class='align_end'>若<a class='btn text-nowrap' href='[surveyurl]' target='_blank'>滿意度調查</a>連結無法點擊，請完整複製下方網址並貼至瀏覽器上執行：</strong>
                                    [surveyurl] <br>
                                    <p>請務必在20天內填寫，逾期則本滿意度調查問卷會自動失效。</p>
                                    <br /> ";
                    surveyarea = surveyarea.Replace("[surveyurl]", url);
                }
                var FileNames = "";
                if (mailFiles?.Count() > 0)
                {
                    FileNames = string.Join("<br/>", mailFiles.Select(x => x.FileName).ToArray());
                }
                var ReplyContent = "";
                if (string.IsNullOrWhiteSpace(data.ReplyContent) && string.IsNullOrWhiteSpace(data.ReplySource2))
                {
                    ReplyContent = presetReply;
                }
                else
                {
                    ReplyContent = string.IsNullOrWhiteSpace(data.ReplyContent) ? data.ReplySource2?.Replace("\n", "<br>") : data.ReplyContent.Replace("\n", "<br>");
                }
                mailTemplate = mailTemplate
                    .Replace("[CaseNo]", data.CaseNo)
                    .Replace("[CasePwd]", data.CasePwd)
                    .Replace("[CreateDate]", data.CreateDate.ToString("yyyy-MM-dd HH:mm"))
                    .Replace("[AcceptDate]", data.AcceptDate?.ToString("yyyy-MM-dd HH:mm") ?? "")
                    .Replace("[ApplyUser]", data.ApplyUser)
                    .Replace("[ContactEmail]", data.ContactEmail)
                    .Replace("[Tel]", string.IsNullOrWhiteSpace(data.Tel) ? "" : $@"{data.TelAreacode}-{data.Tel}" + (!string.IsNullOrEmpty(data.TelExtension) ? $" 分機 {data.TelExtension}" : ""))
                    .Replace("[Mobile]", data.Mobile)
                    .Replace("[WebName]", casesModel.WebSiteName)
                    .Replace("[SysCategory]", sysCategory?.Value ?? "")
                    .Replace("[CaseApplyClass]", casesModel.CaseName)
                    .Replace("[Subject]", data.Subject)
                    .Replace("[EffectiveDate]", data.EffectiveDate?.ToString("yyyy-MM-dd HH:mm:ss") ?? "")
                    .Replace("[FileArea]", filearea)
                    .Replace("[NeedSurvey]", surveyarea)
                    .Replace("[CaseContent]", data.CaseContent.Replace("\n", "<br>"))
                    .Replace("[ReplyContent]", ReplyContent)
                    .Replace("[ReplyFile]", mailFiles?.Count() > 0 ? FileNames : "無")
                    .Replace("[ReplyDate]", data.ReplyDate?.ToString("yyyy-MM-dd HH:mm:ss") ?? data.ReplySource2Date?.ToString("yyyy-MM-dd HH:mm:ss") ?? "");
                MailInfoModel mailInfo = new MailInfoModel()
                {
                    Type = "MailBox",
                    ToMail = data.ContactEmail.Trim(),
                    Subject = $@"數位發展部民意信箱─{"案件回覆說明信"}",
                    Body = mailTemplate,
                    Files = mailFiles
                };

                if (Utility.Mail.Send(mailInfo, out Exception exception))
                {
                    errorMsg = "";
                    return true;
                }
                else
                {
                    errorMsg = exception.Message;
                    return false;
                }
            }
            catch (Exception ex)
            {
                errorMsg = ex.Message;
                return false;
            }
        }
    }
}
