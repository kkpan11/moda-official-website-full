using DBModel;
using System.Xml.Serialization;

namespace ConsoleApp
{
    /// <summary>
    /// 介接徵才公告
    /// </summary>
    public class RecruitmentNewsApi
    {
        /// <summary>
        /// 取得資料
        /// </summary>
        public static void Get()
        {
            //數發部代碼  A29000000G A29020000G A29010000G
            var ORG_ID = new List<string>() { "A29000000G", "A29020000G", "A29010000G" };
            var v1 = Utility.DownloadFile.DownloadHtml("https://web3.dgpa.gov.tw/WANT03FRONT/AP/WANTF00003.aspx?GETJOB=Y");
            var reader = new StringReader(v1);
            var serializer = new XmlSerializer(typeof(ConsoleApp.Model.RecruitmentModel.ROOT));
            var instance = (Model.RecruitmentModel.ROOT)serializer.Deserialize(reader);
            var data = instance.ROW.Where(x => ORG_ID.Contains(x.ORG_ID)).ToList();
            if (data?.Count() > 0)
            {


                var source = data.Select(x => new WEBNews
                {
                    Title = $"{x.ORG_NAME}-{x.TITLE}",
                    ArticleType = "2",
                    ContentText = "",
                    CreatedDate = DateTime.Now,
                    CreatedUserID = "須提供",
                    IsEnable = Utility.EnumTpye.GetEnumNumberToSting(Utility.Default.EnumDefaultIsEnable.start),
                    DepartmentID = "須提供",
                    ProcessDate = DateTime.Now,
                    ProcessUserID = "須提供",
                    WebSiteID = "須提供",
                    target = "_blank",
                    URL = x.VIEW_URL,
                    StatesUrl = x.VIEW_URL,
                    Module = Utility.EnumTpye.GetEnumName(Utility.EnumWebLevelModuleLevel2.NEWS),
                    PublishDate = Utility.CommFun.DateROCToAD(x.DATE_FROM.ToString(), "00:00:00"),
                    StartDate = Utility.CommFun.DateROCToAD(x.DATE_FROM.ToString(), "00:00:00"),
                    EndDate = Utility.CommFun.DateROCToAD(x.DATE_TO.ToString(), "23:59:59"),
                    WebLevelSN = 0, //須提供哪一個主題下面的新聞
                    Lang = "zh-tw",
                    //x.ORG_ID,
                    //x.ORG_NAME,
                    //x.TITLE,
                    //x.DATE_TO,
                    //x.DATE_FROM,
                    //x.VIEW_URL
                }).ToList();
            }

        }
    }
}
