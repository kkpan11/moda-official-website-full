﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace DBModel
{
    public partial class WEBNewsTranscript
    {
        /// <summary>
        /// 逐字稿流水碼
        /// </summary>
        public int WEBNewsTranscriptSN { get; set; }
        /// <summary>
        /// WebNews流水碼
        /// </summary>
        public int WEBNewsSN { get; set; }
        /// <summary>
        /// 標號
        /// </summary>
        public int Item { get; set; }
        /// <summary>
        /// 發言人
        /// </summary>
        public string TranscriptForm { get; set; }
        /// <summary>
        /// 內文
        /// </summary>
        public string TranscriptContent { get; set; }
    }
}