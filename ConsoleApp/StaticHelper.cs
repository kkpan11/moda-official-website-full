using DBModel;
using static Utility.DownloadFile;

namespace ConsoleApp
{
    public class StaticHelper
    {
        public static string? gitPush { get; set; }//本地路徑
        public static string? DemoDNS { get; set; }
        public static string? ResetHours { get; set; }
        public static void Start()
        {
            var StaticLink = Services.Static.StaticLinkService.GetStaticData();
            if (StaticLink != null)
            {
                var AllTrueData = StaticLink.Where(x => x.IsEnable == "1").ToList();
                Console.WriteLine("-- AllTrueData count ---  " + AllTrueData.Count());
                var NewTrueData = StaticLink.Where(x => x.IsEnable == "1" ).ToList();
                var _ResetHours = 22; //晚上 10點之後 網站會全部重新刷新
                int.TryParse(ResetHours, out _ResetHours);
                if (DateTime.Now.Hour < _ResetHours)
                {
                    NewTrueData = NewTrueData.Where(x =>  x.IsLive == "0").ToList();
                }
                Console.WriteLine("-- NewTrueData count ---  " + NewTrueData.Count());
                var FalseData = StaticLink.Where(x => x.IsEnable == "0").ToList();
                Console.WriteLine("-- FalseData count ---  " + FalseData.Count());
                OffData(FalseData);
                Console.WriteLine("-- str OnData OnData1---  ");
                OnData(NewTrueData, AllTrueData);
                var doubleCheckData = Services.Static.StaticLinkService.DoubleCheckData(AllTrueData);
                Console.WriteLine("-- str OnData OnData2---  ");
                OnData(doubleCheckData, AllTrueData);
                Console.WriteLine("-- str Update  IsLiveSaveStatic---  ");
                Services.Static.StaticLinkService.IsLiveSaveStatic(NewTrueData, true);
                Services.Static.StaticLinkService.IsLiveSaveStatic(FalseData, false);
                Console.WriteLine("-- end Update  IsLiveSaveStatic---  ");
            }
        }

        //上線資料
        static void OnData(List<StaticLink> data, List<StaticLink> FsModel)
        {
            var faData = FsModel.Select(x => new FsModel()
            {
                Link = x.Link != null ? x.Link.Replace(DemoDNS, "") : "",
                StaticUrl = x.StaticUrl,
            }).ToList();
            foreach (var hrefData in data.Where(x=> !string.IsNullOrWhiteSpace(x.Link)).OrderBy(x => x.WebSiteID).ThenByDescending(x=>x.SourseTable))
            {
                Console.WriteLine("-- str OnData  IsLiveSaveStatic---  " + hrefData.StaticUrl);
                Utility.DownloadFile.GetStaticData(gitPush, hrefData.Link, hrefData.StaticUrl, faData);
            }
        }
        /// <summary>
        /// 下線資料
        /// </summary>
        /// <param name="data"></param>
        /// <returns></returns>
        static void OffData(List<StaticLink> data)
        {
            var AllCount = data.Count();
            var InsertCount = 0;
            Console.WriteLine("-- str OffData AllCount---  " + AllCount);
            foreach (var hrefData in data.OrderBy(x => x.WebSiteID))
            {
                try
                {
                    InsertCount++;
                    Utility.DownloadFile.DeleteData(gitPush, hrefData.StaticUrl);
                }
                catch (Exception ex)
                {
                    Console.WriteLine("-- OffData error --- "  + hrefData.StaticUrl);

                }
            }
            Console.WriteLine("-- end OffData ---  InsertCount" + InsertCount);
        }
    }
}
