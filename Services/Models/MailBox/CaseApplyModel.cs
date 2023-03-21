using DBModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Services.Models.MailBox
{
    public class CaseApplyModel 
    {
        public string CaseNo { get; set; }

        public string CaseName { get; set; }

        public string Subject { get; set; }
        public string ContactEmail { get; set; }
        public DateTime? AcceptDate { get; set; }
        public string depName { get; set; }
        public string stateName { get; set; }

        public string Status { get; set; }

        public int CaseApplySN { get; set; }

        public int CaseApplyClassSN { get; set; }

        public string ReplySource { get; set; }

        public DateTime? ReplyDate { get; set; }
        
        public DateTime? CreateDate { get; set; }
        public DateTime? EffectiveDate { get; set; }
    }
}
