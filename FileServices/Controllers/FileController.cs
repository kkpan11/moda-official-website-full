using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using Utility;
using static Utility.Files;

namespace FileServices.Controllers
{
    public class FileController : BaseController
    {
        [HttpPost]
        public IActionResult TestPost()
        {
            return StatusResult(System.Net.HttpStatusCode.OK, "Post");
        }
        [HttpGet]
        public IActionResult TestGet()
        {
            return StatusResult(System.Net.HttpStatusCode.OK, "Get");
        }
        /// <summary>
        /// 儲存
        /// </summary>
        /// <param name="saveFileModel"></param>
        /// <returns></returns>
        [HttpPost]
        public IActionResult Save([FromBody] SaveFileModel saveFileModel = null)
        {
            var item = JsonConvert.SerializeObject(saveFileModel);
            try
            {
                saveFileModel.localPath = AppSettingHelper.GetAppsetting("Upload");

                if (saveFileModel.bytes == null) return StatusResult(System.Net.HttpStatusCode.Unauthorized, item);
                var file = Files.Upload(saveFileModel);
                return StatusResult(System.Net.HttpStatusCode.OK, file);
            }
            catch (System.Exception ex)
            {
                return StatusResult(System.Net.HttpStatusCode.BadRequest, ex.Message);
            }
        }
        /// <summary>
        /// 抓取檔案
        /// </summary>
        /// <param name="saveFileModel"></param>
        /// <returns></returns>
        [HttpPost]
        public IActionResult Get([FromBody] SaveFileModel saveFileModel = null)
        {
            try
            {
                string localPath = AppSettingHelper.GetAppsetting("Upload").ToString().Replace("//Uploads","");
                string path = localPath + saveFileModel.path.Replace("/","\\");
                if (GetFile(path, out FileResponse response))
                {
                    var frStr = System.Text.Json.JsonSerializer.Serialize(response);
                    return StatusResult(System.Net.HttpStatusCode.OK, frStr);
                }
                else 
                {
                    return StatusResult(System.Net.HttpStatusCode.BadRequest, response.msg);
                }
            }
            catch (Exception ex)
            {
                return StatusResult(System.Net.HttpStatusCode.BadRequest, ex.Message);
            }
        }
    }
}
