
# 開發環境
* 開發軟體 : Visual Studio 2022
* 開發框架 : NET 6
* 啓動環境 : IIS or Docker

# 專案說明
* ConsoleApp    - 排程器
* DBModel       - 資料庫模型
* FileServices  - 下載 / 上傳檔案
* Management    - 管理系統
* ModaMailBox   - 民意信箱
* Services  - 資料庫邏輯
* Utility   - 共用元件
* WebAPI    - API
* WebSite   - 動態頁面（預覽使用）

# 前置作業

* 匯入資料庫

* 設定各專案相關參數（appsettings.json）
```
{
  "Logging": {
    "LogLevel": {
      "Default": "Information",
      "Microsoft": "Warning",
      "Microsoft.Hosting.Lifetime": "Information"
    }
  },
  "AllowedHosts": "*",
  "ConnectionStrings": {
     "MODA": "連線字串"
  },
 "AESKey": "測試key為test，必填加密Key ",
 "needEncryption": "連線字串是否加密 (1:是  0:否)", 
 "MainWebSiteID": "主要站台代號",
  "Mail": {
    "sysAdmin": "預設系統管理人信箱",
    "IsOfficialMail": "是否是正式環境(true : 是 false : 否 )", 
    "Default": {
      "Type": "Default",
      "Server": "Mail Server",
      "UserName": "Mail UserName",
      "Password": "Mail Password",
      "From": "Mail From",
      "DisplayName": "mail 寄信者名稱",
      "Port": "Mail Port",
      "SSL": "(Mail SSL true : 是 false : 否 )",
      "IsAccountPWD": "(是否需要帳密  true : 是 false : 否 )"
    }
  },
  "GitPush": "本地產生靜態化位置",
  "FileServiceApi": "FileServiceApi 網址",
  "WEBAPI": "WEBAPI 網址/File/Get/",
  "DemoDNS": "動態頁面網址",
  "LocalUrl": "管理系統網址",
  "WebSiteUrl": "前台呈現靜態網址",
  "MailBoxUrl": "民意信箱網指",
  "ClientID": "客製化需求",
  "ClientSecret": "客製化需求",
  "speedAPI": "客製化需求",
  "OpenAzureAD": "管理系統登入 0:一般帳密登入 1:Azure AD 登入",
  "Azure_tanentid": "Azure AD 登入使用 Azure_tanentid",
  "Azure_clientid": "Azure AD 登入使用 Azure_clientid",
  "Azure_secret": "Azure AD 登入使用 Azure_secret",
  "Azure_callback_url": "Azure AD 登入使用 Azure_callback_url",
  "DataProtectionKey": {
    "applicationName": "客製化需求",
    "confirmKey": "客製化需求",
    "surveyKey": "客製化需求"
  }
}

```

# 專案建置

## 更新專案套件

* Visual Studio 工具

	- 工具 -> nuget 套件管理員 -> 套件管理員主控台

	- 指令 : Update-Package -reinstall

* 非 Visual Studio  工具

	- 可參考 https://learn.microsoft.com/en-us/nuget/reference/nuget-exe-cli-reference 做更新

## 專案相依性

可知目前專案對方案中各專案的相依性，以及確認目前專案是否都抓到套件，如有問題需做調整。

## 注意事項

Management 登入機制有與 Azure AD 串接，假如無需串接的話請調整 appsettings.json / OpenAzureAD 參數調整為0 

###  若需Azure AD登入機制參考
> https://learn.microsoft.com/zh-tw/azure/active-directory/fundamentals/active-directory-whatis

需設定(appsettings.json 的參數 Azure_tanentid/ Azure_clientid / Azure_secret / Azure_callback_url)

# 啟動架設站台 (IIS or Docker )

## IIS    

安裝  IIS

安裝  ASP.NET Core Hosting Bundle 

> https://dotnet.microsoft.com/en-us/download/dotnet/6.0

IIS 指定發布站台，並將應用程式集區，CLR 版本改為 "沒有受控(Managed)" 程式碼

## Docker

### 可使用專案裡的 Dockerfile 將專案建成 Image 發布在 Docker

# 管理系統測試登入資訊

帳號 : test
密碼 : test

---



docker build -t management -f Management/Dockerfile .
