using ConsoleApp;
using ConsoleApp.Models;
using DBModel;
using Microsoft.Extensions.Configuration;
using Services;
using System.Linq.Expressions;
using System.Reflection;
using Utility;

#region  appsetting
IConfiguration config = new ConfigurationBuilder()
.AddJsonFile("appsettings.json", optional: true, reloadOnChange: true)
.Build();
string start = config["start"];

#region Mail
var MailTypeList = new List<string>() { "Default", "MailBox" };
var MailItems = new List<string>() {
"Mail:xxx:Type",
"Mail:xxx:Server",
"Mail:xxx:UserName",
"Mail:xxx:Password",
"Mail:xxx:From",
"Mail:xxx:DisplayName",
"Mail:xxx:Port",
"Mail:xxx:SSL",
"Mail:xxx:IsAccountPWD",
};
var MailSettingData = new List<DefaultMailSettingModel>();
foreach (var t in MailTypeList)
{
    var mailSettingModel = new DefaultMailSettingModel();
    
    foreach (var item in MailItems)
    {
        var itemName = item.Split(":")[item.Split(":").Length - 1];
        var itemValue = config[item.Replace("xxx", t)];
        var propertyInfo = mailSettingModel.GetType().GetProperty(itemName);
        var _item = Convert.ChangeType(itemValue, propertyInfo.PropertyType);
        mailSettingModel.GetType().GetProperty(itemName).SetValue(mailSettingModel, _item);
    }
    MailSettingData.Add(mailSettingModel);
}
Utility.Mail.MailSetting = MailSettingData;
Utility.Mail.sysAdmin = config["Mail:sysAdmin"];
Utility.Mail.MailSSL = bool.Parse(config["MailSSL"] ?? "true");

#endregion
#region DB
string needEncryption = config["needEncryption"];
string AESKey = config["AESKey"];
string DB_ConnectionString = config.GetConnectionString("MODA");
var _SqlDecrypt = "";
if (needEncryption == "1") { _SqlDecrypt = Utility.AES.AesDecrypt(DB_ConnectionString, AESKey); }
else { _SqlDecrypt = DB_ConnectionString; }
Services.MODAContext.DB_ConnectionString = _SqlDecrypt;
#endregion
#region StaticHelper
ConsoleApp.StaticHelper.gitPush = config["git:push"];//本地路徑
ConsoleApp.StaticHelper.DemoDNS = config["DemoDNS"];//本地路徑
ConsoleApp.StaticHelper.ResetHours = config["ResetHours"];//本地路徑 
#endregion
#region ReadData
ReadData.IsFirstTimeRead = config["isFirstTimeRead"];
ReadData.GetPdfDataMinsAgo = int.Parse(config["getPdfDataMinsAgo"]);
ReadData.TempFolder = config["tempFolder"];
#endregion
#region SendApi
SendApi.SpeedAPIMore = config["SpeedAPIMore"];
SendApi.ManagementUrl = config["ManagementUrl"];
Utility.MailBox.Api.Url = config["SpeedAPI"];
Utility.MailBox.Api.MailBoxUrl = config["MailBoxUrl"];
Utility.MailBox.Api.FileServiceUrl = config["FileServiceApi"];
Services.CommonService.WebAPIUrl = config["WEBAPI"];
Services.ModaMailBox.MailBoxSendMail.MailBoxUrl = config["MailBoxUrl"];
var ClientID = config["ClientID"];
var ClientSecret = config["ClientSecret"];
Utility.MailBox.Api.toekenClass = new Utility.MailBox.Api.ToekenModel() { ClientId = ClientID, ClientSecret = ClientSecret };
#endregion
#endregion
var strDate = DateTime.Now;

switch (start.ToLower())
{
    case "static": StaticHelper.Start(); break;
    case "readdata": ReadData.Start(); break;
    case "mailbox": SendApi.MailBoxApi(); break;
    default: break;
}
var endDate = DateTime.Now;
var UseTime = @$"開始時間 :{strDate} 執行時間共花費:{CommFun.DateDiff(strDate, endDate) }";
DownloadFile.Log(UseTime);

var WEBScheduleServiceData = new WEBSchedule()
{
    Name = start.ToLower().Trim(),
    UseTime = UseTime,
    ProcessDate = strDate
};
WEBScheduleService.Update(WEBScheduleServiceData);
Environment.Exit(0);






