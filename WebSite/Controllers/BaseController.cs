
using DBModel;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Services.Authorization;
using Services.Models.WebSite;
using Services.WebSite;
namespace WebSite.Controllers
{
    public class BaseController : Controller, IActionFilter
    {
        public static string MainWebSite { get; set; } = AppSettingHelper.GetAppsetting("MainWebSite");
        public static string MainLang { get; set; } = AppSettingHelper.GetAppsetting("MainLang");

        #region Session 相關資料
        /// <summary>
        /// 設定Session
        /// </summary>
        /// <param name="key"></param>
        /// <param name="data"></param>
        public void SetSession(string key, object data)
        {            
            HttpContext.Session.SetObjectAsJson(key, data);
        }
        /// <summary>
        /// 讀取Session
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="key"></param>
        /// <returns></returns>
        public T GetSession<T>(string key)
        {
            try
            {
                return HttpContext.Session.GetObjectFromJson<T>(key);

            }
            catch (Exception)
            {
                return default(T);

            }
        }
        public void ResetSession()
        {
            HttpContext.Session.Clear();
        }
        #endregion
        public static string? WebSiteUrl { get;set; }

        /// <summary>
        /// WebSiteID 站台 預設 MainWebSite
        /// </summary>
        public static string WebSiteID { get; set; } = MainWebSite;
        /// <summary>
        /// Lang 語系 預設中文
        /// </summary>
        public static string Lang { get; set; } = MainLang;

        public static string? Host { get; set; } 

        /// <summary>
        ///WebSiteMasterModel 
        /// </summary>
        public static WebSiteMasterModel? WebSiteMasterModel { get; set; } 

        public override void OnActionExecuting(ActionExecutingContext context)
        {
            Host = $"{Request.Scheme}://{Request.Host}/";
        }

        public override void OnActionExecuted(ActionExecutedContext context)
        {
            try
            {
                if (ViewData["WebSiteMaster"] == null)
                {
                    var data = HomeService.getMasterModel(WebSiteID, Lang);
                    ViewData["WebSiteMaster"] = data;
                }
                else { 
                    var data = ViewData["WebSiteMaster"]  as WebSiteMasterModel;
                    if (data.SysWebSiteLang.WebSiteID != WebSiteID || data.SysWebSiteLang.Lang != Lang)
                    {
                        data = HomeService.getMasterModel(WebSiteID, Lang);
                        ViewData["WebSiteMaster"] = data;
                    }
                }
            }
            catch (Exception ex)
            {
                LogService.CreateLogAction(new LogAction()
                {
                    Status = "0",
                    MessageResult = ex.ToString(),
                    ProcessIPAddress = HttpContext.Request.HttpContext.Connection.RemoteIpAddress.ToString(),
                    UserID = "",
                    WebSiteID = "",
                    CreatedDate = DateTime.Now
                });
            }
        }
    }
}
