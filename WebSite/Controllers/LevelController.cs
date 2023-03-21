using DBModel;
using Microsoft.AspNetCore.Http.Extensions;
using Microsoft.AspNetCore.Mvc;
using Services;
using Services.Models.WebSite;
using Services.Authorization;
using System.Text.Json;
using Utility;
using WebSite.Models;
using Services.WebSite;
using Services.Models.WebContent.WebLevelManagement;

namespace WebSite.Controllers
{
    public class LevelController : BaseController
    {
        /// <summary>
        /// 列表資料
        /// </summary>
        /// <param name="Key">MainSN</param>
        /// <param name="Lang">語系</param>
        /// <returns></returns>
        [Route("{WebSiteID}/{Lang?}/Level/{Key?}")]
        public IActionResult Index(string WebSiteID, int Key, string Lang)
        {
            BaseController.WebSiteID = WebSiteID ?? BaseController.MainWebSite;
            BaseController.Lang = Lang ?? BaseController.MainLang;
            var WebLevelData = WebLevelManagementService.GetWebLevelByMainSN(Key);
            var MainData = WebLevelData.FirstOrDefault(x => x.Lang == "zh-tw" );
            var LangData = WebLevelData.FirstOrDefault(x => x.Lang == BaseController.Lang && x.IsEnable == "1");
            if (MainData != null && LangData != null)
            {
                switch (LangData.Module)
                {
                    case "PAGELIST":
                    case "RSS":
                        return RedirectToAction("PageList", "Level", new { Key = LangData.WebLevelSN });
                    case "NEWS":
                    case "Schedule":
                        return RedirectToAction("NewsList", "Level", new { Key = LangData.WebLevelSN });
                    case "CP":
                        return RedirectToAction("CP", "News", new { WebLevelMainSN = LangData.MainSN, Lang = BaseController.Lang });
                }
            }
            return RedirectToAction("Error", "Hoom");
        }

        /// <summary>
        /// 類型 - 列表頁
        /// </summary>
        /// <param name="model"></param>
        /// <returns></returns>

        public IActionResult PageList(int Key)
        {
            var webLevel = WebLevelManagementService.GetWebLevel(Key);
            BaseController.Lang = webLevel.Lang;
            BaseController.WebSiteID = webLevel.WebSiteID;

            var ChiledData = new List<WebSiteWebLevelPageListModel>();
            if (webLevel.Module == "RSS")
            {
                ChiledData = WebSiteListService.GetRSSListData(webLevel.WebSiteID, webLevel.Lang);
            }
            else 
            {
                ChiledData = WebLevelManagementService.GetWebSiteLevleListData(webLevel.MainSN.Value, webLevel.Lang);
            }

            PageListModel PageListModel = new PageListModel()
            {
                webSiteBreadcrumbs = CommonService.GetWebSiteBreadcrumb(webLevel.Lang, webLevel.MainSN.Value),
                ogData = CommonService.GetOgData(webLevel.Lang, webLevel.MainSN.Value),
                webLevel = webLevel,
                webSiteWebLevelPageListModels = ChiledData,
                titleBarMdel = new Services.Models.WebSite.TitleBarModel() { needSearch = false, Title = webLevel.Title },
                langCategory = CommonService.GetWebSiteCategory(webLevel.WebSiteID, webLevel.Lang),
                SysWebSiteLang = CommonService.GetSysWebSiteLang(BaseController.WebSiteID, BaseController.Lang)
            };
            //imagesize
            WebSiteUtility.OpenGragh.getImageSize(PageListModel.ogData.image, out int Height, out int width);
            PageListModel.ogData.image_height = Height.ToString();
            PageListModel.ogData.image_width = width.ToString();
            return View(PageListModel);
        }

        /// <summary>
        /// News 列表
        /// </summary>
        /// <param name="Key">WebLevelSN</param>
        /// <param name="str_date"></param>
        /// <param name="end_date"></param>
        /// <param name="txt"></param>
        /// <param name="p"></param>
        /// <param name="DisplayCount"></param>
        /// <returns></returns>
        public IActionResult NewsList(int Key, string str_date = "", string end_date = "", string txt = "", string Condition4 = "", string Condition5 = "", string Condition6 = "", string CustomizeTag = "",string SysZipCode = "", int p = 1, int DisplayCount = 15)
        {
            var webLevel = WebLevelManagementService.GetWebLevel(Key);
            BaseController.Lang = webLevel.Lang;
            BaseController.WebSiteID = webLevel.WebSiteID;
            DefaultPager pager = new DefaultPager();
            pager.Lang = webLevel.Lang;
            pager.DisplayCount = DisplayCount;
            pager.p = p;
            var list = WebSiteListService.GetNewsListData(webLevel.MainSN.Value, webLevel.Lang, str_date, end_date, txt, Condition4, Condition5, Condition6, CustomizeTag, SysZipCode, out List<WEBNewsListModel2> JSONModel, ref pager);
           
            foreach (var item in list)
            {
                var link = item.webNews.StatesUrl;
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

            NewsListModel NewsListModel = new NewsListModel()
            {
                webSiteBreadcrumbs = CommonService.GetWebSiteBreadcrumb(webLevel.Lang, webLevel.MainSN.Value),
                ogData = CommonService.GetOgData(webLevel.Lang, webLevel.MainSN.Value),
                WebLevel = webLevel,
                list = list,
                pager = pager,
                levelSN = Key,
                str_Date = str_date,
                end_Date = end_date,
                txt = txt,
                TitleBarModel = new Services.Models.WebSite.TitleBarModel { Title = webLevel.Title, needSearch = true },
                langCategory = CommonService.GetWebSiteCategory(webLevel.WebSiteID, webLevel.Lang),
                SysWebSiteLang = CommonService.GetSysWebSiteLang(BaseController.WebSiteID, BaseController.Lang),
                Conditions = webLevel.Condition != null ? webLevel.Condition.Split(',').ToList() : new List<string>(),
                CustomizeTags = CommonService.GetWebLevelCustomizeTags(webLevel.WebLevelSN),
                sysZipCodes = CommonService.GetZipCodes(),
            };
            //imagesize
            WebSiteUtility.OpenGragh.getImageSize(NewsListModel.ogData.image, out int Height, out int width);
            NewsListModel.ogData.image_height = Height.ToString();
            NewsListModel.ogData.image_width = width.ToString();
            NewsListModel.BigjsonData = JSONModel;
            foreach (var item in NewsListModel.BigjsonData)
            {
                item.crosslinkdisplay = item.filetype != "" ? "none" : CommonService.CheckLocalUrl(item.href) ? "none" : "inline";
                item.contenttext = String.IsNullOrWhiteSpace(item.contenttext) ? "": item.contenttext.Replace("\r\n", "").Replace("\n", "").Replace("\r", "").Replace("\\", "\\\\").Replace("	", "").Replace("	", "").Replace(@"""", "'");
            }
            NewsListModel.StrBigjsonData = JsonSerializer.Serialize(NewsListModel.BigjsonData);
            if (webLevel.Module == "Schedule" || webLevel.ListType == "AccordionList")
            {
                NewsListModel.foreverApi = true;
            }
            return View(NewsListModel);
        }
    }
}
