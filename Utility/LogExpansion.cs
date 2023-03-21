using System;
using System.IO;

namespace Utility
{
    public class LogExpansion
    {
        /// <summary>
        /// 共用 log
        /// </summary>
        /// <param name="logFolder">路徑</param>
        /// <param name="text">訊息</param>
        public static void Write(string logFolder, string text)
        {
            try
            {
                var txt = text.Replace("/", "").Replace("..", "");
                logFolder = logFolder.Replace("/", "").Replace("..", "");
                if (!Directory.Exists(logFolder))
                {
                    Directory.CreateDirectory(logFolder);
                }
                File.AppendAllText($"{logFolder}/{DateTime.Now.ToString("yyyyMMdd")}.txt", $"{txt}〔{DateTime.Now.ToString("MM/dd HH:mm:ss")}〕" + Environment.NewLine);
            }
            catch (Exception)
            {

            }
        }
        /// <summary>
        /// Log版本
        /// </summary>
        /// <param name="logFolder"></param>
        /// <param name="text"></param>
        /// <param name="user"></param>
        public static void Write(string logFolder, string text, string user)
        {
            try
            {
                var txt = text.Replace("/", "").Replace("..", "");
                logFolder = logFolder.Replace("/", "").Replace("..", "");
                string[] paths = {
                    logFolder,
                    DateTime.Now.ToString("yyyy"),
                    DateTime.Now.ToString("MM"),
                    DateTime.Now.ToString("dd")
                };
                string fullPath = Path.Combine(paths);
                if (!Directory.Exists(fullPath))
                {
                    Directory.CreateDirectory(fullPath);
                }
                File.AppendAllText(
                    $"{fullPath}/{user}.txt", 
                    $"〔{DateTime.Now:MM/dd HH:mm:ss}〕{txt}" + Environment.NewLine);
            }
            catch (Exception)
            {

            }
        }

    }
}
