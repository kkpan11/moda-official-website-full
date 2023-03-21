
using DBModel;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Http.Extensions;
using Microsoft.AspNetCore.Mvc;
using Services;
using Services.Authorization;
using Services.Models.WebSite;
using Services.WebSite;
using WebSite.Models;

namespace WebSite.Controllers
{

    public class HomeController : BaseController
    {
        private readonly ILogger<HomeController> _logger;


        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        [Route("")]
        [Route("{WebSiteID?}/Index")]
        [Route("{WebSiteID?}/{Lang?}/Index")]
        public IActionResult Index(string WebSiteID, string Lang)
        {
            BaseController.WebSiteID = WebSiteID ?? BaseController.MainWebSite;
            BaseController.Lang = Lang ?? BaseController.MainLang;
            var model = new WebSite.Models.HomeModel.IndexModel();
            model.SysWebSiteLang = CommonService.GetSysWebSiteLang(BaseController.WebSiteID, BaseController.Lang);
            //Index Child
            switch (BaseController.WebSiteID)
            {
                case "MODA":
                    model.modaIndexModel = new HomeModel.MODAIndexModel();
                    model.modaIndexModel.Children = HomeService.getIndexChild(BaseController.WebSiteID, BaseController.Lang);
                    break;
                case "ACS":
                    model.acsIndexModel = new HomeModel.ACSIndexModel();
                    model.acsIndexModel.Children = HomeService.getIndexChild(BaseController.WebSiteID, BaseController.Lang);
                    break;
                case "ADI":
                    model.adiIndexModel = new HomeModel.ADIIndexModel();
                    model.adiIndexModel.Children = HomeService.getIndexChild(BaseController.WebSiteID, BaseController.Lang);
                    break;
            }
            return View(model);
        }
        /// <summary>
        /// Header
        /// </summary>
        /// <returns></returns>
        [Route("Home/Header")]
        [Route("{WebSiteID?}/Header")]
        [Route("{WebSiteID?}/{Lang?}/Header")]
        public IActionResult Header(string WebSiteID, string Lang)
        {
            BaseController.WebSiteID = WebSiteID ?? BaseController.MainWebSite;
            BaseController.Lang = Lang ?? BaseController.MainLang;
            return View();
        }
        /// <summary>
        /// Footer
        /// </summary>
        /// <returns></returns>
        [Route("Home/Footer")]
        [Route("{WebSiteID?}/Footer")]
        [Route("{WebSiteID?}/{Lang?}/Footer")]
        public IActionResult Footer(string WebSiteID, string Lang)
        {
            BaseController.WebSiteID = WebSiteID ?? BaseController.MainWebSite;
            BaseController.Lang = Lang ?? BaseController.MainLang;
            return View();
        }
        [Route("{WebSiteID?}/{Lang?}/Home/sitemap")]
        public IActionResult sitemap(string WebSiteID, string Lang)
        {
            BaseController.WebSiteID = WebSiteID ?? BaseController.MainWebSite;
            BaseController.Lang = Lang ?? BaseController.MainLang;
            var WebLevelKey = "sitemap";
            var webLevelDATA = new WebLevel()
            {
                WebSiteID = BaseController.WebSiteID,
                Lang = BaseController.Lang,
                WebLevelKey = WebLevelKey
            };
            var localLevel = WebLevelManagementService.GetWebLevelByWebLevelData(webLevelDATA);
            var siteMapViewModel = new sitemapModel()
            {
                webSiteBreadcrumbs = CommonService.GetWebSiteBreadcrumb(localLevel.Lang, localLevel.MainSN.Value),
                ogData = CommonService.GetOgData(localLevel.Lang, localLevel.MainSN.Value),
                localLevel = localLevel,
                titleBarMdel = new TitleBarModel() { needSearch = false, Title = localLevel.Title },
                langCategory = CommonService.GetWebSiteCategory(localLevel.WebSiteID, localLevel.Lang),
                SysWebSiteLang = CommonService.GetSysWebSiteLang(BaseController.WebSiteID, BaseController.Lang),
                webLevels = HomeService.GetSiteMap(localLevel.WebSiteID).Where(x => x.Lang == BaseController.Lang).ToList(),
            };
            return View(siteMapViewModel);
        }
        public IActionResult Privacy()
        {
            return View();
        }
        [Route("{WebSiteID?}/{Lang?}/Home/search")]
        public IActionResult Search(string WebSiteID, string Lang)
        {
            BaseController.WebSiteID = WebSiteID ?? BaseController.MainWebSite;
            BaseController.Lang = Lang ?? BaseController.MainLang;
            var webSitelang = CommonService.GetSysWebSiteLang(BaseController.WebSiteID, BaseController.Lang);
            var langCategory = CommonService.GetWebSiteCategory(BaseController.WebSiteID, BaseController.Lang);
            var title = langCategory.FirstOrDefault(x => x.SysCategoryKey == webSitelang.WebSiteID + "-7-12")?.Value;
            var viewModel = new WebSite.Models.Home.SearchModel()
            {
                SysWebSiteLang = webSitelang,
                langCategory = CommonService.GetWebSiteCategory(BaseController.WebSiteID, BaseController.Lang),
                ogData = new Services.Models.WebSite.ogModel()
                {
                    title = $@"{title} | {webSitelang.Title}",
                    description = $@"{title} | {webSitelang.Title}",
                },
                titleBarMdel = new TitleBarModel() { Title = title }
            };

            if (WebSiteID == MainWebSite)
            {
                viewModel.ogData.image = "/assets/img/fbshare.jpg";
            }
            else
            {
                viewModel.ogData.image = $"{BaseController.WebSiteID}/assets/img/fbshare.jpg";
            }
            viewModel.ogData.image_type = "image/jpeg";
            return View(viewModel);
        }
    }
}