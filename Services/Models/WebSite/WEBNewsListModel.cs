using DBModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Utility.CommFun;

namespace Services.Models.WebSite
{
    public class WEBNewsListModel
    {
        public WEBNews webNews { get; set; }

        public List<SysCategory> sysCategories { get; set; }

        /// <summary>
        /// 下載檔案
        /// </summary>
        public WEBFile webFile { get; set; } = new WEBFile();

        /// <summary>
        /// 列表-Logo
        /// </summary>
        public WEBFile webLogo { get; set; }

        /// <summary>
        /// 列表-影音
        /// </summary>
        public WEBNewsExtend webVideo { get; set; }

        public string webUrl { get; set; }

        /// <summary>
        /// 首長行程
        /// </summary>
        public Schedule schedule { get; set; }

        public tagModel tagModel { get; set; }

        /// <summary>
        /// 相關(檔案)
        /// </summary>
        public List<webfile> relatedFile { get; set; } = null;
        /// <summary>
        /// 相關(圖片)
        /// </summary>
        public List<webfile> relatedImg { get; set; } = null;
        /// <summary>
        /// 相關連結
        /// </summary>
        public List<webnewsextend> relatedlink { get; set; } = null;
        /// <summary>
        /// 相關影片
        /// </summary>
        public List<webnewsextend> relatedvideo { get; set; } = null;
        /// <summary>
        /// 相關法規
        /// </summary>
        public List<webnewsextend> relatedmoj { get; set; } = null;

    }

    public class WEBNewsListModel2
    {
        public string mainsn { get; set; }

        /// <summary>
        /// 是否置頂 0 無 / 1 有 
        /// </summary>
        public string istopdisplay { get; set; } = "none";

        /// <summary>
        /// 超連結
        /// </summary>
        public string href { get; set; }
        /// <summary>
        /// 超連結 target
        /// </summary>
        public string target { get; set; }
        /// <summary>
        /// 超連結 title
        /// </summary>
        public string title { get; set; }
        /// <summary>
        /// 發布日期
        /// </summary>
        public string startdate { get; set; }

        /// <summary>
        /// 標題
        /// </summary>
        public string newstitle { get; set; }
        /// <summary>
        /// 簡介
        /// </summary>
        public string newssubtitle { get; set; }

        /// <summary>
        /// filetypedisplay 是否有檔案 有的話需要改成 inline
        /// </summary>
        public string filetypedisplay { get; set; } = "none";

        public string weblogopath { get; set; } = "~/assets/img/icon_dept4-2-1.svg";

        public string webvideokey { get; set; }

        /// <summary>
        /// filetypedisplay 檔案副檔名
        /// </summary>
        public string filetype { get; set; }
        /// <summary>
        /// syscategoriesdisplay 是否有tag 有的話需要改成 inline
        /// </summary>
        public string syscategoriesdisplay { get; set; } = "none";

        /// <summary>
        /// only AccordionList
        /// </summary>
        public string contenttext { get; set; }

        /// <summary>
        /// tag
        /// </summary>
        public List<WEBNewsTagModel2> tags { get; set; } = new List<WEBNewsTagModel2>();

        public string crosslinkdisplay { get; set; } = "none";
        /// <summary>
        /// 首長行程
        /// </summary>
        public Schedule schedule { get; set; }
        /// <summary>
        /// 相關(檔案)
        /// </summary>
        public List<webfile> relatedFile { get; set; } = null;
        /// <summary>
        /// 相關(圖片)
        /// </summary>
        public List<webfile> relatedImg { get; set; } = null;
        /// <summary>
        /// 相關連結
        /// </summary>
        public List<webnewsextend> relatedlink { get; set; } = null;
        /// <summary>
        /// 相關影片
        /// </summary>
        public List<webnewsextend> relatedvideo { get; set; } = null;
        /// <summary>
        /// 相關法規
        /// </summary>
        public List<webnewsextend> relatedmoj { get; set; } = null;
    }

    public class WEBNewsTagModel2
    {
        public string tag { get; set; }
    }

    public class Schedule 
    {
        /// <summary>
        /// 行程日期
        /// </summary>
        public string scheduledate { get; set; }

        /// <summary>
        /// 行程時間
        /// </summary>
        public string scheduletime { get; set; }

        /// <summary>
        /// 行程相關新聞 - 是否顯示
        /// </summary>
        public string schedulenewsdisplay { get; set; } = "none";
        /// <summary>
        /// 行程相關新聞
        /// </summary>
        public List<ScheduleNews> schedulenews { get; set; }
        /// <summary>
        /// 行程相關檔案 - 是否顯示
        /// </summary>
        public string schedulefiledisplay { get; set; } = "none";
        /// <summary>
        /// 行程相關檔案
        /// </summary>
        public List<webfile> schedulefile { get; set; } = new List<webfile>();
        /// <summary>
        /// 行程相關連結 - 是否顯示
        /// </summary>
        public string schedulelinkdisplay { get; set; } = "none";
        /// <summary>
        /// 行程相關連結
        /// </summary>
        public List<webnewsextend> schedulelink { get; set; } = new List<webnewsextend>();
    }


    public class ScheduleNews
    {
        public string newstitle { get; set; }

        public string newsurl { get; set; }

        public string newscontext { get; set; }

        public string imagedisplay { get; set; }

        public List<webfile> newsimage { get; set; } = new List<webfile>();

        public string videodisplay { get; set; }

        public List<webnewsextend> newsvideo { get; set; } = new List<webnewsextend>();
    }

    public class webfile 
    {
        public string title { get; set; }

        public string filename { get; set; }

        public string filetype { get; set; }

        public string url  { get; set; }
    }

    /// <summary>
    /// 相關連結、相關影片共用
    /// </summary>
    public class webnewsextend 
    {
        public string column_1 { get; set; }

        public string column_2 { get; set; }

        //站內or站外連結
        public bool isLocal { get; set; }
    }
}
