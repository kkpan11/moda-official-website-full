using Microsoft.AspNetCore.Mvc;
using System.Drawing.Imaging;
using System.Globalization;
using System.Net;
using System.Text.RegularExpressions;
using Utility;
using static Utility.Files;

namespace ModaMailBox.Controllers
{
    public class CommonController : BaseController
    {
        public IActionResult Index()
        {
            return View();
        }
        /// <summary> 圖形驗證 </summary>
        /// <returns></returns>
        public ActionResult GetCaptcha()
        {
            var captcha = new Captcha();

            captcha.ShowRandomLine = false;
            string code;
            var bm = captcha.GetCaptcha(out code, 5, "0123456789", 5);
            byte[] result = null;

            using (MemoryStream ms = new MemoryStream())
            {
                bm.Save(ms, ImageFormat.Gif);
                SetSession("CaptchaCode", code);
                result = ms.GetBuffer();
            }
            return File(result, "image/gif");
        }
        
        [HttpPost]
        public ActionResult SendAgain()
        {
            var no = GetSession<string>("MBN");
            var _no = 0;
            if (int.TryParse(no, out _no)) {
                Services.ModaMailBox.MailBox.SendReplyMail(_no, out string erroe, true);
                return StatusResult(System.Net.HttpStatusCode.OK, "請查收案件回覆說明信");
            } else {
                return StatusResult(System.Net.HttpStatusCode.OK, "請重新查詢資料");
            }
        }
        [HttpPost]
        public async Task<IActionResult> ScanFile()
        {
            try
            {
                var date = Request;
                var files = Request.Form.Files;
                long size = files.Sum(f => f.Length);
                foreach (var formFile in files)
                {
                    if (formFile.Length > 0)
                    {
                        List<IFormFile> iFormFile = new List<IFormFile>();
                        iFormFile.Add(formFile);
                        //step 1驗證准許的副檔名
                        //檔案格式須為txt、 pdf、doc、docx、odt、xls、xlsx、 ods、ppt、pptx、odp、gif、jpg、jpeg、png、tif、tiff、mp3、mp4、avi
                        var FileExtList = new List<string>() { "txt", "pdf", "doc", "docx", "odt", "xls", "xlsx", "ods", "ppt", "pptx", "odp", "gif", "jpg", "jpeg", "png", "tif", "tiff", "mp3", "mp4", "avi" };
                        string fileExt = formFile.FileName.Split('.').Last().ToLower();
                        string filename = formFile.FileName.Replace("." + formFile.FileName.Split('.').Last(),"");
                        if (!FileExtList.Any(x => x == fileExt))
                        {
                            return StatusResult(System.Net.HttpStatusCode.BadRequest, "檔案格式須為txt、 pdf、doc、docx、odt、xls、xlsx、 ods、ppt、pptx、odp、gif、jpg、jpeg、png、tif、tiff、mp3、mp4、avi");
                        }
                        //step 2 驗證檔案大小 & 單檔限制2MB
                        var Maxlength = 2 * 1024 * 1024;
                        var fileLength = formFile.Length;
                        if (fileLength > Maxlength)
                        {
                            return StatusResult(System.Net.HttpStatusCode.BadRequest, "檔案超過 2MB");
                        }
                        //step 3 驗證副檔名正確性
                        if (!Files.CheckFileCentType(iFormFile))
                        {
                            return StatusResult(System.Net.HttpStatusCode.BadRequest, "副檔名不符合");
                        }
                        if (!Utility.Regular.FileNameRule(filename))
                        {
                            return StatusResult(System.Net.HttpStatusCode.BadRequest, "檔名為「文字」和「數字」組合，請勿含 「\\」、 「/」、 「:」、 「*」、 「?」、 「\"」、 「<」、 「>」、 「|」、 「#」、 「{」、 「}」、 「%」、 「~」、 「&」等特殊符號。");
                        }
                        //step 4 掃描
                        var IsEsetScan = AppSettingHelper.GetAppsetting("IsEsetScan");

                        if (IsEsetScan == "1")
                        {
                            var tempFile = AppSettingHelper.GetAppsetting("tempFile");
                            tempFile =Utility.Files.PathTraversal(tempFile);
                            if (string.IsNullOrWhiteSpace(tempFile))
                            {
                                ///不掃毒
                                return StatusResult(System.Net.HttpStatusCode.OK, formFile.Length);
                            }
                            var scan = Utility.MailBox.EsetScan.Scan(iFormFile,   tempFile);

                            if (scan.statusCode.ToString() != "OK")
                            {
                                return StatusResult(System.Net.HttpStatusCode.BadRequest, string.Join(",", scan.Msg));
                            }
                            else
                            {
                                var FileName = scan.uploadFileRlt.FirstOrDefault().NewFileName;
                                Files.DelFile(tempFile, FileName);
                                return StatusResult(System.Net.HttpStatusCode.OK, formFile.Length);
                            }
                        }
                        else
                        {
                            ///不掃毒
                            return StatusResult(System.Net.HttpStatusCode.OK, formFile.Length);
                        }

                    }
                }
                return StatusResult(System.Net.HttpStatusCode.BadRequest, "請選擇檔案");
            }
            catch (Exception)
            {
                return StatusResult(System.Net.HttpStatusCode.BadRequest, "檔案格式須為txt、 pdf、doc、docx、odt、xls、xlsx、 ods、ppt、pptx、odp、gif、jpg、jpeg、png、tif、tiff、mp3、mp4、avi");
            }

        }
        [HttpPost]
        public async Task<IActionResult> TempFile()
        {
            SetSession("TempFile", null);
            try
            {
                var date = Request;
                var files = Request.Form.Files;
                long size = files.Sum(f => f.Length);
                List<SaveFileModel> iFormFile = new List<SaveFileModel>();
                foreach (var formFile in files)
                {
                    if (formFile.Length > 0)
                    {
                        var stream = formFile.OpenReadStream();
                        var fileMdeol = new SaveFileModel()
                        {
                            bytes = getByteByStream(stream),
                            FileName = formFile.FileName,
                            isFileShare = false,
                            path = @$"MailBox",
                        };

                        iFormFile.Add(fileMdeol);
                    }
                }
                SetSession("TempFile", iFormFile);
                return StatusResult(System.Net.HttpStatusCode.OK, "");
            }
            catch (Exception)
            {
                SetSession("TempFile", null);
                return StatusResult(System.Net.HttpStatusCode.BadRequest, "上傳檔案失敗");
            }
        }
    }
}
