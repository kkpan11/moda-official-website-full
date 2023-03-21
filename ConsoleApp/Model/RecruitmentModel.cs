using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp.Model
{
    public class RecruitmentModel
    {
        // 注意: 產生的程式碼可能至少需要 .NET Framework 4.5 或 .NET Core/Standard 2.0。
        /// <remarks/>
        [System.SerializableAttribute()]
        [System.ComponentModel.DesignerCategoryAttribute("code")]
        [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
        [System.Xml.Serialization.XmlRootAttribute(Namespace = "", IsNullable = false)]
        public partial class ROOT
        {

            private uint aNNOUNCE_DATEField;

            private ROOTROW[] rOWField;

            /// <remarks/>
            public uint ANNOUNCE_DATE
            {
                get
                {
                    return this.aNNOUNCE_DATEField;
                }
                set
                {
                    this.aNNOUNCE_DATEField = value;
                }
            }

            /// <remarks/>
            [System.Xml.Serialization.XmlElementAttribute("ROW")]
            public ROOTROW[] ROW
            {
                get
                {
                    return this.rOWField;
                }
                set
                {
                    this.rOWField = value;
                }
            }
        }

        /// <remarks/>
        [System.SerializableAttribute()]
        [System.ComponentModel.DesignerCategoryAttribute("code")]
        [System.Xml.Serialization.XmlTypeAttribute(AnonymousType = true)]
        public partial class ROOTROW
        {

            private string oRG_IDField;

            private string oRG_NAMEField;

            private string pERSON_KINDField;

            private string rANKField;

            private string tITLEField;

            private string sYSNAMField;

            private string nUMBER_OFField;

            private string gENDER_TYPEField;

            private string wORK_PLACE_TYPEField;

            private uint dATE_FROMField;

            private uint dATE_TOField;

            private string iS_HANDICAPField;

            private string iS_ORIGINALField;

            private string iS_LOCAL_ORIGINALField;

            private string iS_TRANINGField;

            private string tYPEField;

            private string vITAE_EMAILField;

            private string wORK_QUALITYField;

            private string wORK_ITEMField;

            private string wORK_ADDRESSField;

            private string cONTACT_METHODField;

            private object uRL_LINKField;

            private string vIEW_URLField;

            private string work_TypeField;

            /// <remarks/>
            public string ORG_ID
            {
                get
                {
                    return this.oRG_IDField;
                }
                set
                {
                    this.oRG_IDField = value;
                }
            }

            /// <remarks/>
            public string ORG_NAME
            {
                get
                {
                    return this.oRG_NAMEField;
                }
                set
                {
                    this.oRG_NAMEField = value;
                }
            }

            /// <remarks/>
            public string PERSON_KIND
            {
                get
                {
                    return this.pERSON_KINDField;
                }
                set
                {
                    this.pERSON_KINDField = value;
                }
            }

            /// <remarks/>
            public string RANK
            {
                get
                {
                    return this.rANKField;
                }
                set
                {
                    this.rANKField = value;
                }
            }

            /// <remarks/>
            public string TITLE
            {
                get
                {
                    return this.tITLEField;
                }
                set
                {
                    this.tITLEField = value;
                }
            }

            /// <remarks/>
            public string SYSNAM
            {
                get
                {
                    return this.sYSNAMField;
                }
                set
                {
                    this.sYSNAMField = value;
                }
            }

            /// <remarks/>
            public string NUMBER_OF
            {
                get
                {
                    return this.nUMBER_OFField;
                }
                set
                {
                    this.nUMBER_OFField = value;
                }
            }

            /// <remarks/>
            public string GENDER_TYPE
            {
                get
                {
                    return this.gENDER_TYPEField;
                }
                set
                {
                    this.gENDER_TYPEField = value;
                }
            }

            /// <remarks/>
            public string WORK_PLACE_TYPE
            {
                get
                {
                    return this.wORK_PLACE_TYPEField;
                }
                set
                {
                    this.wORK_PLACE_TYPEField = value;
                }
            }

            /// <remarks/>
            public uint DATE_FROM
            {
                get
                {
                    return this.dATE_FROMField;
                }
                set
                {
                    this.dATE_FROMField = value;
                }
            }

            /// <remarks/>
            public uint DATE_TO
            {
                get
                {
                    return this.dATE_TOField;
                }
                set
                {
                    this.dATE_TOField = value;
                }
            }

            /// <remarks/>
            public string IS_HANDICAP
            {
                get
                {
                    return this.iS_HANDICAPField;
                }
                set
                {
                    this.iS_HANDICAPField = value;
                }
            }

            /// <remarks/>
            public string IS_ORIGINAL
            {
                get
                {
                    return this.iS_ORIGINALField;
                }
                set
                {
                    this.iS_ORIGINALField = value;
                }
            }

            /// <remarks/>
            public string IS_LOCAL_ORIGINAL
            {
                get
                {
                    return this.iS_LOCAL_ORIGINALField;
                }
                set
                {
                    this.iS_LOCAL_ORIGINALField = value;
                }
            }

            /// <remarks/>
            public string IS_TRANING
            {
                get
                {
                    return this.iS_TRANINGField;
                }
                set
                {
                    this.iS_TRANINGField = value;
                }
            }

            /// <remarks/>
            public string TYPE
            {
                get
                {
                    return this.tYPEField;
                }
                set
                {
                    this.tYPEField = value;
                }
            }

            /// <remarks/>
            public string VITAE_EMAIL
            {
                get
                {
                    return this.vITAE_EMAILField;
                }
                set
                {
                    this.vITAE_EMAILField = value;
                }
            }

            /// <remarks/>
            public string WORK_QUALITY
            {
                get
                {
                    return this.wORK_QUALITYField;
                }
                set
                {
                    this.wORK_QUALITYField = value;
                }
            }

            /// <remarks/>
            public string WORK_ITEM
            {
                get
                {
                    return this.wORK_ITEMField;
                }
                set
                {
                    this.wORK_ITEMField = value;
                }
            }

            /// <remarks/>
            public string WORK_ADDRESS
            {
                get
                {
                    return this.wORK_ADDRESSField;
                }
                set
                {
                    this.wORK_ADDRESSField = value;
                }
            }

            /// <remarks/>
            public string CONTACT_METHOD
            {
                get
                {
                    return this.cONTACT_METHODField;
                }
                set
                {
                    this.cONTACT_METHODField = value;
                }
            }

            /// <remarks/>
            public object URL_LINK
            {
                get
                {
                    return this.uRL_LINKField;
                }
                set
                {
                    this.uRL_LINKField = value;
                }
            }

            /// <remarks/>
            public string VIEW_URL
            {
                get
                {
                    return this.vIEW_URLField;
                }
                set
                {
                    this.vIEW_URLField = value;
                }
            }

            /// <remarks/>
            public string Work_Type
            {
                get
                {
                    return this.work_TypeField;
                }
                set
                {
                    this.work_TypeField = value;
                }
            }
        }
    }
}
