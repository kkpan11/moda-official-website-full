using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;

namespace Utility
{
    public class Mail
    {
        public static List<DefaultMailSettingModel> MailSetting { get; set; } = new List<DefaultMailSettingModel>();

        #region 預設
        /// <summary>
        /// //預設
        /// </summary>
        public static string MailServer { get; set; }
        /// <summary>
        /// //預設
        /// </summary>
        public static string MailUserName { get; set; }
        /// <summary>
        /// 預設
        /// </summary>
        public static string MailPD { get; set; }
        /// <summary>
        /// 預設
        /// </summary>
        public static string MailFrom { get; set; }
        /// <summary>
        /// 預設
        /// </summary>
        public static string MailFromDisplayName { get; set; }
        /// <summary>
        /// 預設
        /// </summary>
        public static int MailPort { get; set; }
        /// <summary>
        /// 預設
        /// </summary>
        public static bool MailSSL { get; set; } = true;

        public static bool IsAccountPWD { get; set; } = true;

        public static bool IsOfficialMail { get; set; } = true;

        #endregion


        public static string sysAdmin { get; set; }
        /// <summary>
        /// 發生錯誤寄信
        /// </summary>
        /// <param name="body"></param>
        public static void Error(string body)
        {
            var subject = "系統發生錯誤，請查閱錯誤紀錄";
            Exception outex = new Exception();
            MailInfoModel mailInfo = new MailInfoModel()
            {
                ToMail = sysAdmin,
                Body = body,
                Subject = subject,
            };
            Send(mailInfo ,out Exception ex);
        }

        /// <summary>
        /// <整合>寄信
        /// </summary>
        /// <param name="mailInfoModel"></param>
        /// <param name="outex"></param>
        /// <returns></returns>
        public static bool Send(MailInfoModel mailInfoModel, out Exception outex)
        {
            outex = new Exception();
            try
            {
                #region 先抓取預設資料
                var _MailFromDisplayName = string.IsNullOrWhiteSpace(MailFromDisplayName) ? MailFrom : MailFromDisplayName;
                var _MailFrom = MailFrom;
                var _MailServer = MailServer;
                var _MailPort = MailPort;
                var _MailUserName = MailUserName;
                var _MailPD = MailPD;
                var _MailSSL = MailSSL;
                #endregion
                #region 設定基本資料
                var setting = MailSetting.FirstOrDefault(x => x.Type == mailInfoModel.Type);
                _MailFromDisplayName = string.IsNullOrWhiteSpace(setting.DisplayName) ? setting.From : setting.DisplayName;
                _MailFrom = setting.From;
                _MailServer = setting.Server;
                _MailPort = setting.Port;
                _MailUserName = setting.UserName;
                _MailPD = setting.Password;
                _MailSSL = setting.SSL;
                MailAddress from = new MailAddress(_MailFrom, _MailFromDisplayName, System.Text.Encoding.UTF8);
                MailMessage message = new MailMessage();
                message.From = from;
                message.Priority = MailPriority.High;                   //高重要性
                message.SubjectEncoding = System.Text.Encoding.UTF8;    //郵件編碼
                message.IsBodyHtml = true;                              //是否為Html格式 
                #endregion
                message.Subject = $@"{(IsOfficialMail == false ? "測試" : "")}{mailInfoModel.Subject}";      //主題
                message.Body = mailInfoModel.Body;
                SmtpClient client = new SmtpClient(_MailServer, _MailPort);
                if (IsAccountPWD) client.Credentials = new NetworkCredential(_MailUserName, _MailPD);
                if (_MailSSL) client.EnableSsl = true;
                #region 設定收件者
                if (IsOfficialMail)
                {
                    foreach (var tso in mailInfoModel.ToMail.Split(';'))
                    {
                        if (!string.IsNullOrWhiteSpace(tso))
                        {
                            message.To.Add(tso.Trim());
                        }
                    }
                }
                else { message.To.Add(sysAdmin); }
                #endregion
                #region 附加檔案
                if (!string.IsNullOrWhiteSpace(mailInfoModel.FilePath))
                {
                    Attachment attachment = new Attachment(mailInfoModel.FilePath);
                    attachment.Name = mailInfoModel.FilePath.Split('/')[(mailInfoModel.FilePath.Split('/')).Length - 1];
                    message.Attachments.Add(attachment);
                }
                if (mailInfoModel.Files != null)
                {
                    foreach (var file in mailInfoModel.Files)
                    {
                        Attachment attachment = new Attachment(file.stream, file.FileName);
                        attachment.Name = file.FileName;
                        message.Attachments.Add(attachment);
                    }
                }
                #endregion
                client.Send(message);
                client.Dispose();
                #region 釋放夾帶檔資源
                if (message.Attachments != null && message.Attachments.Count > 0)
                {
                    for (int i = 0; i < message.Attachments.Count; i++)
                    {
                        message.Attachments[i].Dispose();
                    }
                }
                #endregion
                message.Dispose();
                outex = null;
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }
        }

        /// <summary>
        /// 發信
        /// </summary>
        /// <param name="tomail">收件人</param>
        /// <param name="subject">主旨</param>
        /// <param name="body">內文</param>
        /// <param name="IsOfficialMail">是否正式環境</param>
        /// <param name="outex">錯誤輸入</param>
        /// <param name="files">附件</param>
        /// <param name="IsAccountPWD">是否有密碼</param>
        /// <returns></returns>
        //public static bool SendMailBox(string tomail, string subject, string body, bool IsOfficialMail, out Exception outex, List<MailFile> files = null, bool IsAccountPWD = true, string Type = "")
        //{
        //    try
        //    {
        //        var _MailFromDisplayName = string.IsNullOrWhiteSpace(MailFromDisplayName) ? MailFrom : MailFromDisplayName;
        //        var _MailFrom = MailFrom;
        //        var _MailServer = MailServer;
        //        var _MailPort = MailPort;
        //        var _MailUserName = MailUserName;
        //        var _MailPD = MailPD;
        //        var _MailSSL = MailSSL;
        //        #region 設定
        //        if (!string.IsNullOrWhiteSpace(Type) && MailSetting?.Count > 0)
        //        {
        //            var setting = MailSetting.FirstOrDefault(x => x.Type == Type);
        //            if (setting != null)
        //            {
        //                _MailFromDisplayName = string.IsNullOrWhiteSpace(setting.DisplayName) ? setting.From : setting.DisplayName;
        //                _MailFrom = setting.From;
        //                _MailServer = setting.Server;
        //                _MailPort = setting.Port;
        //                _MailUserName = setting.UserName;
        //                _MailPD = setting.Password;
        //                _MailSSL = setting.SSL;
        //            }
        //        }
        //        MailAddress from = new MailAddress(_MailFrom, _MailFromDisplayName, System.Text.Encoding.UTF8);
        //        MailMessage message = new MailMessage();
        //        message.From = from;
        //        message.Priority = MailPriority.High;                   //高重要性
        //        message.SubjectEncoding = System.Text.Encoding.UTF8;    //郵件編碼
        //        message.IsBodyHtml = true;                              //是否為Html格式
        //        message.Subject = $@"{(IsOfficialMail == false ? "測試" : "")}{subject}";      //主題
        //        message.Body = body;
        //        SmtpClient client = new SmtpClient(_MailServer, _MailPort);
        //        if (IsAccountPWD) client.Credentials = new NetworkCredential(_MailUserName, _MailPD);
        //        if (_MailSSL) client.EnableSsl = true;

        //        #endregion

        //        if (IsOfficialMail)
        //        {
        //            foreach (var tso in tomail.Split(';'))
        //            {
        //                if (!string.IsNullOrWhiteSpace(tso))
        //                {
        //                    message.To.Add(tso.Trim());
        //                }
        //            }
        //        }
        //        else
        //        {
        //            message.To.Add(sysAdmin);
        //        }

        //        //設定smtp

        //        if (files != null)
        //        {
        //            foreach (var file in files)
        //            {
        //                Attachment attachment = new Attachment(file.stream, file.FileName);
        //                attachment.Name = file.FileName;
        //                message.Attachments.Add(attachment);
        //            }
        //        }
        //        //發送
        //        client.Send(message);
        //        client.Dispose();
        //        if (message.Attachments != null && message.Attachments.Count > 0)
        //        {
        //            for (int i = 0; i < message.Attachments.Count; i++)
        //            {
        //                message.Attachments[i].Dispose();
        //            }
        //        }
        //        message.Dispose();
        //        outex = null;
        //        return true;
        //    }
        //    catch (Exception ex)
        //    {
        //        outex = ex;
        //        return false;
        //    }
        //}

    }
}
