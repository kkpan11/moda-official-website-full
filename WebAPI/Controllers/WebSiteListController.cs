using DBModel;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using Services;
using Services.Authorization;
using Services.Models.WebSite;
using Services.WebSite;
using System.Text.Json;
using System.Web;
using Utility;

namespace WebAPI.Controllers
{
    /// <summary>
    /// 列表頁
    /// </summary>
    [ApiController]
    [Route("[controller]/[action]")]
    [EnableCors("CorsPolicy")]
    public class WebSiteListController : Controller
    {
        /// <summary>
        /// 查詢新聞列表
        /// </summary>
        /// <param name="MainSN"></param>
        /// <param name="Lang"></param>
        /// <param name="StartDate"></param>
        /// <param name="EndDate"></param>
        /// <param name="SearchString"></param>
        /// <param name="p"></param>
        /// <param name="DisplayCount"></param>
        /// <returns></returns>
        [EnableCors("CorsPolicy")]
        [HttpPost]
        public ViewResult NewsList([FromBody] NewsListQuery query)
        {
            try
            {
                var WebSiteHost = Common.GetAppsetting("WebSiteHost");
                var webLevel = WebLevelManagementService.GetWebLevel(query.MainSN, query.Lang);
                DefaultPager pager = new DefaultPager();
                pager.Lang = query.Lang;
                pager.DisplayCount = query.DisplayCount;
                pager.p = query.P;
                var list = WebSiteListService.GetNewsListData(query.MainSN, query.Lang, query.StartDate, query.EndDate, query.SearchString, query.Condition4, query.Condition5, query.Condition6, query.CustomizeTagSN, query.SysZipCode, out List<WEBNewsListModel2> JSONModel, ref pager);
                var langCategory = CommonService.GetWebSiteCategory(webLevel.WebSiteID, webLevel.Lang);
                foreach (var item in list)
                {
                    var tagModel = CommFun.taggetattr(item.webNews.target, item.webNews.Title, langCategory.FirstOrDefault(x => x.SysCategoryKey == item.webNews.WebSiteID + "-7-33")?.Value, item.webFile?.FileType, item.webFile?.FileTitle);
                    var link = item.webNews.StatesUrl;
                    item.tagModel = tagModel;
                    switch (item.webNews.ArticleType)
                    {
                        case "1":
                            link = item.webFile != null ? item.webFile.FilePath : "";
                            break;
                        case "2":
                            link = item.webNews.URL;
                            break;
                    }
                    item.webUrl = link;
                }
                var ContentHeader = HttpUtility.HtmlEncode(webLevel.ContentHeader);
                ContentHeader = HttpUtility.HtmlDecode(ContentHeader);
                var viewLevel = new WebLevel() {
                    Module = webLevel.Module,
                    ContentHeader = ContentHeader,
                    ListType = webLevel.ListType,
                    WebSiteID = webLevel.WebSiteID,
                    ContentFooter = webLevel.ContentFooter
                };

                NewsListModel NewsListModel = new NewsListModel()
                {
                    webSiteBreadcrumbs = CommonService.GetWebSiteBreadcrumb(webLevel.Lang, webLevel.MainSN.Value),
                    ogData = CommonService.GetOgData(webLevel.Lang, webLevel.MainSN.Value),
                    WebLevel = viewLevel,
                    list = list,
                    pager = pager,
                    levelSN = query.MainSN,
                    str_Date = query.StartDate,
                    end_Date = query.EndDate,
                    txt = query.SearchString,
                    TitleBarModel = new TitleBarModel { Title = webLevel.Title, needSearch = true },
                    langCategory = langCategory,
                    SysWebSiteLang = CommonService.GetSysWebSiteLang(webLevel.WebSiteID, webLevel.Lang),
                    Conditions = webLevel.Condition != null ? webLevel.Condition.Split(',').ToList() : new List<string>(),
                    CustomizeTags = CommonService.GetWebLevelCustomizeTags(webLevel.WebLevelSN),
                    sysZipCodes = CommonService.GetZipCodes(),
                };

                var BigjsonData = JSONModel;

                foreach (var item in BigjsonData)
                {
                    item.crosslinkdisplay = item.filetype != "" ? "none" : CommonService.CheckLocalUrl(item.href) ? "none" : "inline";
                    item.contenttext = String.IsNullOrWhiteSpace(item.contenttext) ? "" : item.contenttext.Replace("\r\n", "").Replace("\n", "").Replace("\r", "").Replace("\\", "\\\\").Replace("	", "").Replace("	", "").Replace(@"""", "'");
                }

                NewsListModel.StrBigjsonData = JsonSerializer.Serialize(BigjsonData);

                return View(NewsListModel);
            }
            catch (Exception ex)
            {
                Common.WriteLog($"NewsList - Error {ex.ToString()}");
                NewsListModel NewsListModel = new NewsListModel()
                {
                    list = new List<WEBNewsListModel>(),
                    langCategory = CommonService.GetWebSiteCategory("MODA", "zh-tw"),
                };
                return View(NewsListModel);
            }
        }
        /// <summary>
        /// 左側選單
        /// </summary>
        /// <param name="sn"></param>
        /// <returns></returns>
        [EnableCors("CorsPolicy")]
        [HttpPost]
        public ViewResult LeftMenu(string sn)
        {
            //sn是weblevelSN - 可以抓取語系 & 站台  ，非MAIN sn
            int _sn = 0;
            if (int.TryParse(sn, out _sn))
            {
                var weblevelData = Services.WebSite.NewsService.GetWebLevelMbyWebLevelSN(_sn);
                if (weblevelData != null)
                {
                    var SysWebSiteLangData = HomeService.getSysWebSiteLang(weblevelData.WebSiteID, weblevelData.Lang);

                    var Breadcrumb = CommonService.GetWebSiteBreadcrumb(weblevelData.Lang, weblevelData.MainSN.Value);
                    var allLeftMenu = HomeService.getLeftMenu(weblevelData.WebSiteID, true);
                    var BaseSN = Breadcrumb.FirstOrDefault(x => x.mainSN == Breadcrumb.FirstOrDefault(x => x.IsActive)?.ParentSN) ?? Breadcrumb.FirstOrDefault(x => x.IsActive);
                    var leftMenuBigTitle = allLeftMenu.FirstOrDefault(x => x.MainSN == BaseSN?.ParentSN && x.Lang == weblevelData.Lang)?.Title ?? SysWebSiteLangData.Title;
                    var model = new WebAPI.Models.LeftMenuModel()
                    {
                        leftMenus = allLeftMenu.Where(x=>x.Lang == weblevelData.Lang).ToList(),
                        webSiteBreadcrumbModels = Breadcrumb,
                        BaseSN = BaseSN,
                        leftMenuBigTitle = leftMenuBigTitle,
                        Lang = weblevelData.Lang,
                        sysCategories = CommonService.GetWebSiteCategory(weblevelData.WebSiteID, weblevelData.Lang),
                        sysWebSiteId = weblevelData.WebSiteID
                    };
                    return View(model);
                }
                else
                {
                    Common.WriteLog($"LeftMenu - 查無Level {sn}");
                    return View(null);
                }
            }
            else
            {
                Common.WriteLog($"LeftMenu - 參數有誤 {sn}");
                return View(null);
            }
        }

        public static string _Host = Common.GetAppsetting("WebSiteHost");

        

    }
}
