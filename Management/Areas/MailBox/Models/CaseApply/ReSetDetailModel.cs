using DBModel;
using Services.Models.ModaMailBox;
using System.Collections.Generic;
using static Utility.Files;

namespace Management.Areas.MailBox.Models.CaseApply
{
    public class ReSetDetailModel
    {
        public DBModel.CaseApply caseApply { get; set; }

        public List<CaseApplySpeedApiLogModel> ReturnLog { get; set; }

        /// <summary>
        /// 民眾附件
        /// </summary>
        public List<DBModel.WEBFile> wEBFiles { get; set; }
        public List<CasesModel>  casesModels { get; set; }
        public CasesModel casesModel { get; set; }
    }

    public class CaseApplySpeedApiLogModel
    { 
        public int speedApiLogSn { get; set; }
        public string returnCaseNo { get; set; }
    
        public string returnMessage { get; set; }

        public string closedat { get; set; }

    }
}
