﻿using DBModel;
using System;
using System.Collections.Generic;
using System.Text;

namespace Services.Models.Authorization
{
    public class GroupSectionByGroupModel 
    {
        /// <summary>
        /// 流水號，起始值1，遞增值1
        /// </summary>
        public int SysSectionSN { get; set; }
        /// <summary>
        /// 上層功能流水號[SysSection]
        /// </summary>
        public int? ParentSN { get; set; }
        public string Path { get; set; }
        /// <summary>
        /// controller\function
        /// </summary>
        public string ActionPath { get; set; }
        /// <summary>
        /// 功能名稱
        /// </summary>
        public string Title { get; set; }
        /// <summary>
        /// 功能說明
        /// </summary>
        public string Description { get; set; }
        /// <summary>
        /// 參數
        /// </summary>
        public string Parameter { get; set; }
        public string Icon { get; set; }
        /// <summary>
        /// 是否啟用：1 啟用、0 停用
        /// </summary>
        public string IsEnable { get; set; }
        /// <summary>
        /// 處理人員
        /// </summary>
        public string ProcessUserID { get; set; }
        /// <summary>
        /// 處理時間
        /// </summary>
        public DateTime? ProcessDate { get; set; }
        /// <summary>
        /// 處理人員IP
        /// </summary>
        public string ProcessIPAddress { get; set; }
        public string CreatedUserID { get; set; }
        /// <summary>
        /// 建立日期
        /// </summary>
        public DateTime? CreatedDate { get; set; }
        /// <summary>
        /// 排序
        /// </summary>
        public int? SortOrder { get; set; }
        /// <summary>
        /// 是否有權限
        /// </summary>
        public bool haveAuthorization { get; set; }
        /// <summary>
        /// 站台代碼
        /// </summary>
        public string WebSiteID { get; set; }

    }
}
