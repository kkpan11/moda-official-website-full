using Microsoft.AspNetCore.Http.Extensions;
using Microsoft.AspNetCore.Mvc;
using Services;
using Services.Models.WebSite;
using Services.WebSite;
using Utility;
using WebSite.Models;
using WebSite.WebSiteUtility;

namespace WebSite.Controllers
{
    public class DeptController : BaseController
    {
        [Route("{WebSiteID?}/{Lang?}/Dept/{Key}")]
        public IActionResult Index(int Key, string Lang, string WebSiteID)
        {
            BaseController.WebSiteID = WebSiteID ??  BaseController.MainWebSite;
            BaseController.Lang = Lang ?? BaseController.MainLang;
            DeptModel deptModel = new DeptModel();
            var webLevel = HomeService.getWebLevelSNByKey(BaseController.Lang, Key);
            deptModel.webSiteBreadcrumbs = CommonService.GetWebSiteBreadcrumb(webLevel.Lang, webLevel.MainSN.Value);

            if (webLevel.Module != "DEPT" || webLevel.Parameter == null || !int.TryParse(webLevel.Parameter ,out int _Parameter)) 
            { 
                return View(); 
            }
            //司首頁
            deptModel.Dept = HomeService.getWebLevelSNByKey(Lang, _Parameter);
            deptModel.LogoImg = HomeService.getLogoImg(deptModel.Dept?.MainSN).FirstOrDefault();
            deptModel.SysWebSiteLang = CommonService.GetSysWebSiteLang(BaseController.WebSiteID, BaseController.Lang);

            var lastTilte = string.Join('-', deptModel.webSiteBreadcrumbs.Select(x => x.Title));
            //meta-og
            deptModel.ogData = new Services.Models.WebSite.ogModel()
            {
                title = lastTilte + "｜" + deptModel.SysWebSiteLang.Title,
                image = $"{WebSiteUrl}{deptModel.LogoImg?.FilePath}" ,
                image_type = deptModel.LogoImg?.FileType != null ? OpenGragh.getImageType(deptModel.LogoImg?.FileType) : "image/jpeg",
                description = OpenGragh.getFormattedDescription(deptModel.Dept?.ContentHeader)
            };

            //get image 
            if (OpenGragh.getImageSize(deptModel.ogData.image, out int Height, out int Width)) 
            {
                deptModel.ogData.image_height = Height.ToString();
                deptModel.ogData.image_width = Width.ToString();
            }

            if (deptModel.Dept != null) 
            {
                //第一層
                var levels = HomeService.getDeptChild(deptModel.Dept.MainSN.Value, deptModel.Dept.WebSiteID, deptModel.Dept.Lang);
                deptModel.ChildNodes = new List<WebSiteChildModel>();
                foreach (var level in levels.ToList())
                {
                    var child = new WebSiteChildModel();
                    child = HomeService.getChild(level);
                    deptModel.ChildNodes.Add(child);
                }
            }
            return View(deptModel);
        }
    }
}
