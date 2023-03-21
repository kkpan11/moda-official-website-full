﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace DBModel
{
    public partial class StaticLink
    {
        /// <summary>
        /// 流水碼
        /// </summary>
        public int StaticLinkSN { get; set; }
        /// <summary>
        /// 網站編號
        /// </summary>
        public string WebSiteID { get; set; }
        /// <summary>
        /// 語言：TW、EN
        /// </summary>
        public string Lang { get; set; }
        /// <summary>
        /// 來源資料Table
        /// </summary>
        public string SourseTable { get; set; }
        /// <summary>
        /// 來源資料SN
        /// </summary>
        public int? SourseSN { get; set; }

        /// <summary>
        /// 多語系共通SN
        /// </summary>
        public int? MainSN { get; set; }

        /// <summary>
        /// 讀取資料連結
        /// </summary>
        public string Link { get; set; }
        /// <summary>
        /// 客製靜態網址
        /// </summary>
        public string StaticUrl { get; set; }
        /// <summary>
        /// 開始時間
        /// </summary>
        public DateTime? StartDate { get; set; }
        /// <summary>
        /// 結束時間
        /// </summary>
        public DateTime? EndDate { get; set; }
        /// <summary>
        /// 是否發布：0 不公開，1 發布、2草稿
        /// </summary>
        public string IsEnable { get; set; }
        /// <summary>
        /// 建立時間
        /// </summary>
        public DateTime? CreatedDate { get; set; }
        /// <summary>
        /// 建立人員
        /// </summary>
        public string CreatedUserID { get; set; }
        /// <summary>
        /// 處理時間
        /// </summary>
        public DateTime? ProcessDate { get; set; }
        /// <summary>
        /// 處理人員
        /// </summary>
        public string ProcessUserID { get; set; }
        /// <summary>
        /// 處理人員IP
        /// </summary>
        public string ProcessIPAddress { get; set; }

        /// <summary>
        /// 0: 未生成/首頁/刪除   1 : 已生成
        /// </summary>
        public string IsLive { get; set; }

        /// <summary>
        /// 靜態化時間
        /// </summary>
        public DateTime? staticDate { get; set; }

    }
}