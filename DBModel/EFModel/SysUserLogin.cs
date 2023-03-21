﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace DBModel
{
    public partial class SysUserLogin
    {
        /// <summary>
        /// 流水號，起始值1，遞增值1
        /// </summary>
        public int SysUserLoginSN { get; set; }
        /// <summary>
        /// 使用者帳號
        /// </summary>
        public string UserID { get; set; }
        /// <summary>
        /// 使用者登入的網站
        /// </summary>
        public string WebSiteID { get; set; }
        /// <summary>
        /// 狀態：1:成功、0:失敗
        /// </summary>
        public string Status { get; set; }
        /// <summary>
        /// 登入訊息
        /// </summary>
        public string Message { get; set; }
        /// <summary>
        /// 登入者的IP
        /// </summary>
        public string ProcessIPAddress { get; set; }
        /// <summary>
        /// 建檔日期
        /// </summary>
        public DateTime CreatedDate { get; set; }
    }
}