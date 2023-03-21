using DBModel;
using Services.Files;
using System.Net;

namespace ConsoleApp
{

    public class ReadData
    {
        public static string? IsFirstTimeRead { get; set; }
        public static int GetPdfDataMinsAgo { get; set; }
        public static string? TempFolder { get; set; }
        public static void Start()
        {
            RemakeTempFilder();
            DeleteWebFileExtend();
            ReadingFile();
        }
        static List<WEBFile> GatData(int minutes, string fileType, string type, string isFirstTimeRead)
        {
            return FilesService.GetFiles(minutes, fileType, type, isFirstTimeRead);
        }
        /// <summary>
        /// 重製暫存資料夾
        /// </summary>
        static void RemakeTempFilder()
        {
            #region 重製暫存資料夾
            if (Directory.Exists(TempFolder))
            {
                System.IO.Directory.Delete(TempFolder, true);
            }
            System.IO.Directory.CreateDirectory(TempFolder);
            #endregion
        }
        /// <summary>
        /// 刪除 -99 以及 0 的資料(非啟用的資料)
        /// </summary>
        static void DeleteWebFileExtend()
        {
            //刪除TempDATA
            var delete = GatData(0, "", "delete", IsFirstTimeRead);
            FilesService.DeleteWebFileExtend(delete.Select(x => x.WEBFileSN).ToList());
        }

        /// <summary>
        /// 讀取需要寫入的
        /// </summary>
        static void ReadingFile()
        {
            var files = GatData(GetPdfDataMinsAgo, ".pdf", "reader", IsFirstTimeRead);

            var tFile = 0;
            var fFile = 0;
            var iCount = 0;
            foreach (var file in files)
            {
                iCount++;
                WebFileExtend WebFileExtend = new WebFileExtend();
                WebFileExtend.WebFileExtendSN = file.WEBFileSN;
                var tmpeFilePath = $@"{TempFolder}\{iCount}{file.FileType}";
                var isHaveFile = true;
                try
                {
                    using (WebClient client = new WebClient())
                    {
                        client.DownloadFile(file.FilePath, tmpeFilePath);
                    }
                }
                catch (Exception)
                {
                    isHaveFile = false;
                }
                if (isHaveFile)
                {
                    using (var reader = new EPocalipse.IFilter.FilterReader(tmpeFilePath))
                    {
                        try
                        {

                            var detail = reader.ReadToEnd();
                            WebFileExtend.FileContentText = detail;
                            WebFileExtend.IsProtect = false;
                            tFile++;
                        }
                        catch (Exception ex)
                        {
                            WebFileExtend.IsProtect = true;
                            var error = "加密無法讀取";
                            fFile++;
                        }
                        finally
                        {
                            reader.Dispose();
                        }
                    }
                    FilesService.SaveWebFileExtend(WebFileExtend);
                }
            }
        }

    }
}
