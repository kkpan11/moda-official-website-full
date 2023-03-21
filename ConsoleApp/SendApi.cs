using Services.Authorization;
using Services.ModaMailBox;

namespace ConsoleApp
{
    public class SendApi
    {
        public static string? SpeedAPIMore { get; set; }
        public static string? ManagementUrl { get; set; }
        public static void MailBoxApi()
        {
            Utility.Mail.sysAdmin = LogService.GetErroEmailAccount();
            var mailboxData = Services.WEBScheduleService.GetWEBSchedule("mailbox");
            switch (SpeedAPIMore)
            {
                case "create": SendAgain(); break;
                case "search": SendSearchApi(); break;
                default: SendAgain(); break;
            }
        }

        /// <summary>
        /// 發送 新增case / 再次新增失敗的case
        /// </summary>
        static void SendAgain()
        {
            var BigData = MailBoxService.GetCassApply();
            var errorList = new List<string>();
            foreach (var b in BigData)
            {
                if (MailBox.SendAPI(b, out string errorMsg))
                {

                }
                else
                {
                    errorList.Add(errorMsg);
                };
            }
            if (errorList.Count() > 0)
            {
                MailBoxService.SendErrorCreateApi(errorList);
            }
        }
        /// <summary>
        /// 查詢結果
        /// </summary>
        static void SendSearchApi()
        {
            var BigData = MailBoxService.GetSearchCaseList();
            var ReturnCount = 0;
            foreach (var b in BigData)
            {
                MailBox.SearchAPI(b, "Console", out bool isReturn, out bool isClose);
                if (isReturn)
                {
                    ReturnCount++;
                }
            }
            if (ReturnCount > 0)
            {
                MailBoxService.SendReSetTellUser(ManagementUrl);
            }
        }
    }
}
