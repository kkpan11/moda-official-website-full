
using HtmlAgilityPack;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Text;

namespace Utility
{
    public static class DownloadFile
    {

        public static string GitPush { get; set; }


        public static void Log(string msg)
        {
            try
            {
                var path = $@"{Directory.GetCurrentDirectory()}\Log";
                Utility.Files.FileExists(path);
                using (StreamWriter tw = new StreamWriter($@"{path}\{DateTime.Now.ToString("yyyyMMdd")}.txt", true))  
                {
                    tw.WriteLine(msg);
                }
            }
            catch (Exception)
            {
            }
        }

        /// <summary>
        /// 靜態化
        /// </summary>
        ///   <param name="gitPath">git push位置</param>
        /// <param name="url">下載位置</param>
        /// <param name="path">客製位置</param>
        /// <param name="fsModels">替換Url</param>
        public static void GetStaticData(string gitPath, string url, string path, List<FsModel> fsModels = null)
        {
            try
            {
                var html = DownloadHtml(url);
                if (!string.IsNullOrWhiteSpace(html))
                {
                    var UrlData = RelaxHtml(html, fsModels);
                    ReplaceHtml(ref html, UrlData);
                    SaveHtml(gitPath, html, path);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("-- GetStaticData  error --  " + ex.ToString());

            }
        }

        /// <summary>
        /// 刪除檔案<<過期或下架>>
        /// </summary>
        /// <param name="url"></param>
        /// <param name="websiteId"></param>
        public static void DeleteData(string gitPath, string path)
        {
            try
            {
                if (!string.IsNullOrWhiteSpace(path))
                {
                    var filePath = $@"{gitPath}{path.Replace(@"/", @"\")}";
                    System.IO.File.Delete(filePath);
                }
            }
            catch (Exception ex)
            {
            }
        }

        public static Stream DownloadStream(string url)
        {
            try
            {
                if (!string.IsNullOrWhiteSpace(url))
                {
                    ServicePointManager.ServerCertificateValidationCallback = delegate (object sender, X509Certificate certificate, X509Chain chain, SslPolicyErrors errors) { return true; };
                    using (WebClient client = new WebClient())
                    {
                        var byteArray = client.DownloadData(url);
                        Stream stream = new MemoryStream(byteArray);
                        return stream;
                    }
                }
                return null;
            }
            catch (Exception ex)
            {
               
                return null;
            }


        }

        /// <summary>
        /// 下載網頁
        /// </summary>
        /// <param name="url"></param>
        /// <returns></returns>
       public static string DownloadHtml(string url)
        {
            try
            {
                if (!string.IsNullOrWhiteSpace(url))
                {
                    ServicePointManager.ServerCertificateValidationCallback = delegate (object sender, X509Certificate certificate, X509Chain chain, SslPolicyErrors errors) { return true; };
                    using (WebClient client = new WebClient())
                    {
                        var html = client.DownloadData(url);
                        return Encoding.UTF8.GetString(html);
                    }
                }
                return "";
            }
            catch (Exception ex)
            {
                Console.WriteLine("-- DownloadHtml  error --  " + url);
                Console.WriteLine("-- DownloadHtml  error --  " + ex.ToString());
                return "";
            }
        }
        static void ReplaceHtml(ref string html, List<UrlModel> fsModels = null)
        {
            try
            {
                foreach (var item in fsModels.Where(x => x.oldPath != "" && !string.IsNullOrWhiteSpace(x.newPath)).OrderByDescending(x => x.oldPath.Length))
                {
                    html = html.Replace(item.oldPath, item.newPath);
                }
            }
            catch (Exception)
            {
            }
        }
        static List<UrlModel> RelaxHtml(string html, List<FsModel> fsModels = null)
        {
            List<UrlModel> urlModels = new List<UrlModel>();
            try
            {
                if (!string.IsNullOrWhiteSpace(html))
                {
                    var doc = new HtmlDocument();
                    doc.LoadHtml(html);
                    var hrefNodes = doc.DocumentNode.SelectNodes("//a[@href]");
                    foreach (var node in hrefNodes)
                    {
                        var href = "";
                        try
                        {
                            href = node.GetAttributeValue("href", "");
                            if (!string.IsNullOrWhiteSpace(href))
                            {
                                if (href.Substring(0, 1) == @"/")
                                {
                                    var newsPath = fsModels.FirstOrDefault(x => x.Link.ToUpper() == href.ToUpper());
                                    urlModels.Add(new UrlModel()
                                    {
                                        oldPath = href,
                                        newPath = newsPath?.StaticUrl,
                                    });
                                }
                            }
                        }
                        catch (Exception EX)
                        {
                            var s = href;
                            var error = EX;

                        }
                    }
                }

            }
            catch (Exception)
            {
            }
            return urlModels;
        }
        static void SaveHtml(string gitPath, string html, string path)
        {
            try
            {
                var filePath = $@"{gitPath}{path.Replace(@"/", @"\")}";
                var filnName = filePath.Split(@"\")[filePath.Split(@"\").Length - 1];
                Utility.Files.FileExists(filePath.Replace(filnName, ""));
                using (StreamWriter tw = new StreamWriter(filePath, false))  // 'false',或沒填:新建或覆蓋.
                {
                    tw.Write(html);
                }
            }
            catch (Exception ex)
            {
            }
        }

        static HttpClientHandler setHttpNotSafeSSl()
        {
            var handler = new HttpClientHandler();
            handler.ClientCertificateOptions = ClientCertificateOption.Manual;
            handler.ServerCertificateCustomValidationCallback =
               (httpRequestMessage, cert, cetChain, policyErrors) =>
               {
                   return true;
               };
            return handler;
        }


        class UrlModel
        {
            public string oldPath { get; set; }
            public string newPath { get; set; }
        }
        public class FsModel
        {
            /// <summary>
            /// 原始
            /// </summary>
            public string Link { get; set; }
            /// <summary>
            /// 靜態
            /// </summary>
            public string StaticUrl { get; set; }
        }

    }
}
