USE [master]
GO
/****** Object:  Database [MODA_WWW]    Script Date: 2023/3/21 上午 08:26:22 ******/
CREATE DATABASE [MODA_WWW]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MODA', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MODA.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MODA_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\MODA_log.ldf' , SIZE = 8064960KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MODA_WWW] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MODA_WWW].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MODA_WWW] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MODA_WWW] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MODA_WWW] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MODA_WWW] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MODA_WWW] SET ARITHABORT OFF 
GO
ALTER DATABASE [MODA_WWW] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MODA_WWW] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MODA_WWW] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MODA_WWW] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MODA_WWW] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MODA_WWW] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MODA_WWW] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MODA_WWW] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MODA_WWW] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MODA_WWW] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MODA_WWW] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MODA_WWW] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MODA_WWW] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MODA_WWW] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MODA_WWW] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MODA_WWW] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MODA_WWW] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MODA_WWW] SET RECOVERY FULL 
GO
ALTER DATABASE [MODA_WWW] SET  MULTI_USER 
GO
ALTER DATABASE [MODA_WWW] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MODA_WWW] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MODA_WWW] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MODA_WWW] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MODA_WWW] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MODA_WWW', N'ON'
GO
ALTER DATABASE [MODA_WWW] SET QUERY_STORE = OFF
GO
USE [MODA_WWW]
GO
/****** Object:  User [test]    Script Date: 2023/3/21 上午 08:26:22 ******/
CREATE USER [test] FOR LOGIN [test] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [test]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [test]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [test]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [test]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [test]
GO
ALTER ROLE [db_datareader] ADD MEMBER [test]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [test]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [test]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [test]
GO
/****** Object:  Table [dbo].[WebLevel]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebLevel](
	[WebLevelSN] [int] IDENTITY(1,1) NOT NULL,
	[WebLevelKey] [varchar](50) NULL,
	[ParentSN] [int] NOT NULL,
	[WebSiteID] [varchar](30) NOT NULL,
	[Lang] [varchar](10) NULL,
	[WeblevelType] [varchar](2) NOT NULL,
	[Module] [varchar](50) NULL,
	[Parameter] [nvarchar](max) NULL,
	[Title] [nvarchar](200) NOT NULL,
	[ContentText] [nvarchar](1024) NULL,
	[FatFooterShow] [char](1) NULL,
	[MainMenuShow] [char](1) NULL,
	[SubMemuShow] [char](1) NULL,
	[LeftMenuShow] [char](1) NULL,
	[RSSShow] [char](1) NULL,
	[PageView] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[ContentHeader] [nvarchar](max) NULL,
	[ContentFooter] [nvarchar](max) NULL,
	[ListType] [varchar](50) NULL,
	[SortMethod] [char](1) NULL,
	[IsEnable] [varchar](3) NULL,
	[ProcessUserID] [varchar](30) NULL,
	[ProcessDate] [datetime] NULL,
	[ProcessIPAddress] [varchar](50) NULL,
	[CreatedUserID] [varchar](30) NULL,
	[CreatedDate] [datetime] NULL,
	[SortOrder] [int] NULL,
	[MainSN] [int] NULL,
	[StatesUrl] [nvarchar](max) NULL,
	[TemplateValue] [char](2) NULL,
	[Description] [nvarchar](1024) NULL,
	[Condition] [nvarchar](150) NULL,
	[SEODescription] [nvarchar](1024) NULL,
	[SEOKeywords] [nvarchar](1024) NULL,
	[DepartmentID] [varchar](64) NULL,
 CONSTRAINT [PK_WebLevel] PRIMARY KEY CLUSTERED 
(
	[WebLevelSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_WebLevelTree]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_WebLevelTree]
AS
WITH CTE AS (SELECT          WebLevelSN, ParentSN, Title, CONVERT(nvarchar(200), Title) AS Path
                               FROM               dbo.WebLevel AS T1
                               WHERE           (ParentSN = 0)
                               UNION ALL
                               SELECT          T1.WebLevelSN, T1.ParentSN, T1.Title, CONVERT(nvarchar(200), T2.Path + '/' + T1.Title) AS Path
                               FROM              dbo.WebLevel AS T1 INNER JOIN
                                                           CTE AS T2 ON T1.ParentSN = T2.WebLevelSN)
    SELECT          WebLevelSN, ParentSN, Title, Path
     FROM               CTE AS CTE_1
GO
/****** Object:  Table [dbo].[WEBNews]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WEBNews](
	[WEBNewsSN] [int] IDENTITY(1,1) NOT NULL,
	[WebSiteID] [varchar](30) NOT NULL,
	[WebLevelSN] [int] NOT NULL,
	[Lang] [varchar](10) NOT NULL,
	[Module] [varchar](50) NOT NULL,
	[ArticleType] [varchar](2) NULL,
	[Title] [nvarchar](1024) NULL,
	[SubTitle] [nvarchar](1024) NULL,
	[Description] [nvarchar](1024) NULL,
	[PublishDate] [datetime] NULL,
	[ContentText] [nvarchar](max) NULL,
	[URL] [nvarchar](500) NULL,
	[target] [varchar](50) NULL,
	[YoutubeID] [varchar](50) NULL,
	[IsTop] [char](1) NULL,
	[DepartmentID] [varchar](64) NULL,
	[PageView] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[IsEnable] [varchar](3) NULL,
	[ProcessUserID] [varchar](30) NOT NULL,
	[ProcessDate] [datetime] NOT NULL,
	[ProcessIPAddress] [varchar](50) NOT NULL,
	[CreatedUserID] [varchar](30) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[SortOrder] [int] NULL,
	[MainSN] [int] NULL,
	[PageViewType] [varchar](50) NULL,
	[Tag] [nvarchar](max) NULL,
	[CustomizeTagSN] [int] NULL,
	[ZipCodeSN] [int] NULL,
	[KeyWord] [nvarchar](max) NULL,
	[Performance] [int] NULL,
	[EProject] [int] NULL,
	[ServiceObject] [nvarchar](max) NULL,
	[OtherLangerUrl] [nvarchar](max) NULL,
	[StatesUrl] [nvarchar](max) NULL,
	[SEODescription] [nvarchar](1024) NULL,
	[SEOKeywords] [nvarchar](1024) NULL,
 CONSTRAINT [PK_WEBNews] PRIMARY KEY CLUSTERED 
(
	[WEBNewsSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebLink]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebLink](
	[WebLinkSN] [int] IDENTITY(1,1) NOT NULL,
	[WebSiteID] [varchar](30) NOT NULL,
	[Lang] [varchar](10) NOT NULL,
	[Title] [nvarchar](200) NULL,
	[URL] [nvarchar](1000) NULL,
	[SourceTable] [varchar](50) NOT NULL,
	[SourceSN] [int] NOT NULL,
	[GroupID] [varchar](10) NOT NULL,
	[PageView] [int] NULL,
	[IsEnable] [varchar](3) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[ProcessUserID] [varchar](30) NULL,
	[ProcessDate] [datetime] NULL,
	[ProcessIPAddress] [varchar](50) NULL,
	[CreatedUserID] [varchar](30) NULL,
	[CreatedDate] [datetime] NULL,
	[SortOrder] [int] NULL,
 CONSTRAINT [PK_WebLink] PRIMARY KEY CLUSTERED 
(
	[WebLinkSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebCntLink]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebCntLink](
	[SourceTable] [varchar](50) NOT NULL,
	[SourceSN] [int] NOT NULL,
	[URL] [nvarchar](400) NOT NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_WebCntLink_1] PRIMARY KEY CLUSTERED 
(
	[SourceTable] ASC,
	[SourceSN] ASC,
	[URL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_AllLink]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_AllLink]
AS
/*相關 webNews 本身連結Url*/ SELECT c.Path, n.Title, N .URL
FROM              vw_WebLevelTree C INNER JOIN
                            WebLevel d ON c.WebLevelSN = d .WebLevelSN INNER JOIN
                            WebLevel d2 ON c.ParentSN = d2.WebLevelSN INNER JOIN
                            WEBNews N ON c.WebLevelSN = n.WebLevelSN INNER JOIN
                            WebLevel m ON m.WebLevelSN = d .WebLevelSN AND m.Module IN ('NEWS', 'CP')
WHERE          1 = 1 AND d .IsEnable = 1 /*主要的資料 */ AND d2.IsEnable = 1 /*父層*/ AND N .IsEnable = 1 AND 
                            (d .StartDate IS NULL OR
                            d .StartDate <= GETDATE()) AND (d .EndDate IS NULL OR
                            d .EndDate >= GETDATE()) AND (d2.StartDate IS NULL OR
                            d2.StartDate <= GETDATE()) AND (d2.EndDate IS NULL OR
                            d2.EndDate >= GETDATE()) AND (N .StartDate IS NULL OR
                            N .StartDate <= GETDATE()) AND (N .EndDate IS NULL OR
                            N .EndDate >= GETDATE()) AND LEN(N .URL) > 5
UNION
/*相關連結*/ SELECT c.Path, n.Title + '-相關連結' AS Title, l.URL
FROM              vw_WebLevelTree C INNER JOIN
                            WebLevel d ON c.WebLevelSN = d .WebLevelSN INNER JOIN
                            WebLevel d2 ON c.ParentSN = d2.WebLevelSN INNER JOIN
                            WEBNews N ON c.WebLevelSN = n.WebLevelSN INNER JOIN
                            [dbo].[WebLink] l ON n.WEBNewsSN = l.SourceSN AND SourceTable = 'WEBNews'
WHERE          1 = 1 AND d .IsEnable = 1 /*主要的資料 */ AND d2.IsEnable = 1 /*父層*/ AND N .IsEnable = 1 AND 
                            (d .StartDate IS NULL OR
                            d .StartDate <= GETDATE()) AND (d .EndDate IS NULL OR
                            d .EndDate >= GETDATE()) AND (d2.StartDate IS NULL OR
                            d2.StartDate <= GETDATE()) AND (d2.EndDate IS NULL OR
                            d2.EndDate >= GETDATE()) AND (N .StartDate IS NULL OR
                            N .StartDate <= GETDATE()) AND (N .EndDate IS NULL OR
                            N .EndDate >= GETDATE())
UNION
/*webLeveld  ckitor*/ SELECT c.Path, c.Title + '/ckitor' AS Title, l.URL
FROM              vw_WebLevelTree c INNER JOIN
                            WebLevel d ON c.WebLevelSN = d .WebLevelSN INNER JOIN
                            WebLevel d2 ON c.ParentSN = d2.WebLevelSN INNER JOIN
                            [dbo].[WebCntLink] l ON l.SourceSN = c.WebLevelSN AND l.SourceTable = 'webLevelD' AND 
                            d .IsEnable = 1 /*主要的資料 */ AND d2.IsEnable = 1 /*父層*/ AND (d .StartDate IS NULL OR
                            d .StartDate <= GETDATE()) AND (d .EndDate IS NULL OR
                            d .EndDate >= GETDATE()) AND (d2.StartDate IS NULL OR
                            d2.StartDate <= GETDATE())
UNION
/*webNEWS*/ SELECT c.Path, c.Title + '/ckitor' AS title, l.URL
FROM              vw_WebLevelTree c INNER JOIN
                            WebLevel d ON c.WebLevelSN = d .WebLevelSN INNER JOIN
                            WebLevel d2 ON c.ParentSN = d2.WebLevelSN INNER JOIN
                            WEBNews N ON c.WebLevelSN = n.WebLevelSN INNER JOIN
                            [dbo].[WebCntLink] l ON l.SourceSN = N .WEBNewsSN AND l.SourceTable = 'WEBNews' AND 
                            d .IsEnable = 1 /*主要的資料 */ AND d2.IsEnable = 1 /*父層*/ AND n.IsEnable = 1 AND (d .StartDate IS NULL OR
                            d .StartDate <= GETDATE()) AND (d .EndDate IS NULL OR
                            d .EndDate >= GETDATE()) AND (d2.StartDate IS NULL OR
                            d2.StartDate <= GETDATE()) AND (N .StartDate IS NULL OR
                            N .StartDate <= GETDATE()) AND (N .EndDate IS NULL OR
                            N .EndDate >= GETDATE())
GO
/****** Object:  Table [dbo].[SysDepartment]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysDepartment](
	[SysDepartmentSN] [int] IDENTITY(1,1) NOT NULL,
	[WebSiteID] [varchar](30) NULL,
	[Lang] [varchar](10) NULL,
	[DepartmentID] [nvarchar](64) NULL,
	[ParentID] [int] NULL,
	[DepartmentName] [nvarchar](100) NULL,
	[ShortName] [nvarchar](256) NULL,
	[Description] [nvarchar](500) NULL,
	[IsEnable] [varchar](3) NULL,
	[ProcessUserID] [varchar](30) NOT NULL,
	[ProcessDate] [datetime] NOT NULL,
	[ProcessIPAddress] [varchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedUserID] [varchar](30) NOT NULL,
	[SortOrder] [int] NOT NULL,
	[MainSN] [int] NULL,
 CONSTRAINT [PK_SysDepartment] PRIMARY KEY CLUSTERED 
(
	[SysDepartmentSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SysUser]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysUser](
	[SysUserSN] [int] IDENTITY(10,1) NOT NULL,
	[EmpID] [nvarchar](64) NULL,
	[UserID] [varchar](30) NOT NULL,
	[ADUserID] [varchar](50) NULL,
	[UserName] [nvarchar](128) NULL,
	[EngName] [nvarchar](128) NULL,
	[NickName] [nvarchar](50) NULL,
	[Gender] [nvarchar](1) NULL,
	[Password] [nvarchar](128) NULL,
	[UserSatus] [nvarchar](3) NULL,
	[Tel] [nvarchar](16) NULL,
	[Mobile] [nvarchar](16) NULL,
	[Email] [nvarchar](128) NULL,
	[DisableDate] [datetime] NULL,
	[LastLoginDate] [datetime] NULL,
	[PwdLastUpdate] [datetime] NULL,
	[ErrLoginnum] [int] NULL,
	[JobTitle] [nvarchar](64) NULL,
	[OfficePhone] [nvarchar](64) NULL,
	[Photo] [nvarchar](128) NULL,
	[DepartmentID] [nvarchar](64) NULL,
	[ProcessUserID] [varchar](30) NULL,
	[ProcessDate] [datetime] NULL,
	[ProcessIPAddress] [varchar](50) NULL,
	[DateCreated] [datetime] NULL,
	[SortOrder] [int] NULL,
 CONSTRAINT [PK_SYSUser] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_UserLeftDep]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_UserLeftDep]
AS
SELECT          ROW_NUMBER() OVER (ORDER BY DateCreated) AS ROWID, u.UserID, u.UserName, u.EngName, u.NickName, 
u.Gender, u.Password, u.UserSatus, u.Tel, u.Mobile, u.Email, u.DisableDate, u.LastLoginDate, u.PwdLastUpdate, u.ErrLoginnum, 
u.EmpID, u.JobTitle, u.OfficePhone, u.Photo, u.DepartmentID, u.ProcessUserID, u.ProcessDate, u.ProcessIPAddress, 
u.DateCreated, u.SortOrder, d .SysDepartmentSN, d .DepartmentID AS Expr1, d .ParentID, d .DepartmentName, d .ShortName, 
d .Description, d .IsEnable, d .ProcessUserID AS Expr2, d .ProcessDate AS Expr3, d .ProcessIPAddress AS Expr4, d .CreatedDate, 
d .CreatedUserID, d .SortOrder AS Expr5
FROM              dbo.SysUser AS u LEFT OUTER JOIN
                            dbo.SysDepartment AS d ON u.DepartmentID = d .DepartmentID
WHERE          d .Lang = 'zh-tw' or d.Lang  IS NULL
GO
/****** Object:  Table [dbo].[SysSection]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysSection](
	[SysSectionSN] [int] IDENTITY(1,1) NOT NULL,
	[ParentSN] [int] NULL,
	[Path] [varchar](50) NOT NULL,
	[ActionPath] [nvarchar](1024) NULL,
	[Title] [nvarchar](128) NULL,
	[Description] [nvarchar](256) NULL,
	[Parameter] [nvarchar](max) NULL,
	[Icon] [nvarchar](512) NULL,
	[IsEnable] [nvarchar](1) NULL,
	[ProcessUserID] [varchar](30) NULL,
	[ProcessDate] [datetime] NULL,
	[ProcessIPAddress] [varchar](50) NULL,
	[CreatedUserID] [varchar](30) NULL,
	[CreatedDate] [datetime] NULL,
	[SortOrder] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[vw_SysSection]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_SysSection]
AS
SELECT          C.SysSectionSN, C.ParentSN, C.ActionPath, C.Title, C.Icon, C.IsEnable AS IsEnableC, C.SortOrder AS SortOrderC, 
                            P.ParentSN AS ParentSNP, P.ActionPath AS ActionPathP, P.Title AS TitleP, P.Icon AS IconP, P.IsEnable AS IsEnableP, 
                            P.SortOrder AS SortOrderP
FROM              dbo.SysSection AS C LEFT OUTER JOIN
                            dbo.SysSection AS P ON C.ParentSN = P.SysSectionSN
GO
/****** Object:  View [dbo].[vw_WebLevel]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_WebLevel]
AS
SELECT          D.WebLevelDSN, M.WebLevelMSN, M.ParentSN, M.WebSiteID, D.Lang, M.HierarchyID, M.WeblevelType, M.Module, 
                            M.Parameter AS ParameterM, D.Title, D.FatFooterShow, D.MainMenuShow, D.SubMemuShow, D.RSSShow, 
                            D.PageView, D.StartDate, D.EndDate, D.Parameter AS ParameterD, D.IsEnable, D.ProcessUserID, D.ProcessDate, 
                            D.ProcessIPAddress, D.CreatedUserID, D.CreatedDate
FROM              dbo.WebLevelD AS D INNER JOIN
                            dbo.WebLevelM AS M ON D.WebLevelMSN = M.WebLevelMSN
GO
/****** Object:  Table [dbo].[AuthSysGroupSysSection]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuthSysGroupSysSection](
	[AuthSysGroupSysSectionSN] [int] IDENTITY(1,1) NOT NULL,
	[WebSiteID] [varchar](50) NULL,
	[SysSectionSN] [int] NOT NULL,
	[SysGroupSN] [int] NOT NULL,
	[CreatedUserID] [varchar](30) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_AuthSysGroupSysSection] PRIMARY KEY CLUSTERED 
(
	[AuthSysGroupSysSectionSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuthSysGroupWebLevel]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuthSysGroupWebLevel](
	[AuthSysGroupWebLevelSN] [int] IDENTITY(1,1) NOT NULL,
	[WebSiteID] [varchar](50) NOT NULL,
	[WebLevelSN] [int] NOT NULL,
	[Lang] [varchar](10) NULL,
	[AuthType] [varchar](50) NOT NULL,
	[SysGroupSN] [int] NOT NULL,
	[CreatedUserID] [nvarchar](256) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_AuthSysGroupWebLevelM] PRIMARY KEY CLUSTERED 
(
	[AuthSysGroupWebLevelSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AuthSysUserWebLevel]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuthSysUserWebLevel](
	[AuthSysUserWebLevelSN] [int] IDENTITY(1,1) NOT NULL,
	[WebSiteID] [varchar](30) NOT NULL,
	[WebLevelSN] [int] NOT NULL,
	[Lang] [varchar](10) NOT NULL,
	[AuthType] [varchar](50) NOT NULL,
	[UserID] [varchar](30) NOT NULL,
	[CreatedUserID] [varchar](30) NOT NULL,
	[CreatedDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CaseApply]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CaseApply](
	[CaseApplySN] [int] IDENTITY(1,1) NOT NULL,
	[CaseValidateSN] [int] NOT NULL,
	[Subject] [nvarchar](250) NOT NULL,
	[CaseContent] [nvarchar](4000) NOT NULL,
	[CaseApplyClassSN] [int] NOT NULL,
	[CaseCategoryL2] [nvarchar](20) NULL,
	[ApplyUser] [nvarchar](80) NOT NULL,
	[ContactEmail] [nvarchar](128) NOT NULL,
	[TelAreacode] [varchar](50) NULL,
	[Tel] [varchar](12) NULL,
	[TelExtension] [varchar](10) NULL,
	[Mobile] [varchar](20) NULL,
	[CaseNo] [varchar](20) NULL,
	[CasePwd] [nvarchar](250) NULL,
	[EffectiveDate] [datetime] NULL,
	[AcceptDate] [datetime] NULL,
	[ResendDate] [datetime] NULL,
	[ResendNum] [int] NULL,
	[ReplyContent] [nvarchar](4000) NULL,
	[ReplyCaseNo] [varchar](20) NULL,
	[ReplyCasePwd] [nvarchar](250) NULL,
	[ReplySource] [varchar](3) NULL,
	[ReplyDate] [datetime] NULL,
	[ReplyApiDate] [datetime] NULL,
	[ReplySource2] [nvarchar](4000) NULL,
	[ReplySource2Date] [datetime] NULL,
	[Status] [varchar](2) NULL,
	[CreateDate] [datetime] NOT NULL,
	[CreateUser] [varchar](30) NOT NULL,
	[ProcessDate] [datetime] NOT NULL,
	[ProcessUser] [varchar](30) NOT NULL,
	[ProcessIPAddress] [varchar](50) NOT NULL,
	[WebSiteId] [nchar](10) NULL,
	[DocDept] [varchar](50) NULL,
	[DocNo] [varchar](50) NULL,
 CONSTRAINT [PK_CaseApply] PRIMARY KEY CLUSTERED 
(
	[CaseApplySN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CaseApplyClass]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CaseApplyClass](
	[CaseApplyClassSN] [int] IDENTITY(1,1) NOT NULL,
	[WebSiteID] [varchar](30) NULL,
	[ParentSN] [int] NULL,
	[CaseName] [nvarchar](200) NULL,
	[CaseNameEN] [nvarchar](200) NULL,
	[SysDepartmentSN] [int] NULL,
	[CaseNo] [varchar](30) NULL,
	[CaseType] [nvarchar](10) NULL,
	[HandleDate] [int] NULL,
	[info] [nvarchar](200) NULL,
	[IsEnable] [varchar](3) NULL,
	[ProcessUserID] [varchar](30) NOT NULL,
	[ProcessDate] [datetime] NOT NULL,
	[ProcessIPAddress] [varchar](50) NOT NULL,
	[CreatedUserID] [varchar](30) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[SortOrder] [int] NOT NULL,
	[SysCategoryKey] [varchar](200) NULL,
 CONSTRAINT [PK_CaseApplyCase] PRIMARY KEY CLUSTERED 
(
	[CaseApplyClassSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CaseApplyClassTo]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CaseApplyClassTo](
	[CaseApplyClassToSN] [int] IDENTITY(1,1) NOT NULL,
	[CaseApplyClassSN] [int] NULL,
	[SysDepartmentSN] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Email] [varchar](100) NULL,
	[IsEnable] [varchar](3) NULL,
	[CreatedUserID] [varchar](30) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ProcessUserID] [varchar](30) NOT NULL,
	[ProcessDate] [datetime] NOT NULL,
	[ProcessIPAddress] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CaseApplyClassTo] PRIMARY KEY CLUSTERED 
(
	[CaseApplyClassToSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CaseApplySpeedApiLog]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CaseApplySpeedApiLog](
	[SpeedApiLogSN] [int] IDENTITY(1,1) NOT NULL,
	[CaseApplySN] [int] NOT NULL,
	[Action] [varchar](30) NOT NULL,
	[StatusCode] [varchar](20) NULL,
	[Message] [nvarchar](max) NULL,
	[ApiStatus] [nvarchar](1) NULL,
	[ApiMessage] [nvarchar](40) NULL,
	[CreatedUserID] [varchar](30) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SpeedApiLog] PRIMARY KEY CLUSTERED 
(
	[SpeedApiLogSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CaseApplySurvey]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CaseApplySurvey](
	[CaseApplySurveySN] [int] IDENTITY(1,1) NOT NULL,
	[CaseApplySN] [int] NULL,
	[CaseSatisfy] [int] NULL,
	[CaseSolved] [varchar](1) NULL,
	[CaseDefect] [varchar](30) NULL,
	[CaseProposal] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_CaseApplySurvey] PRIMARY KEY CLUSTERED 
(
	[CaseApplySurveySN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CaseApplyValidate]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CaseApplyValidate](
	[CaseValidateSN] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](128) NOT NULL,
	[Token] [varchar](128) NOT NULL,
	[EffectiveDate] [datetime] NOT NULL,
	[StatementCheckDate] [datetime] NULL,
	[Status] [varchar](50) NOT NULL,
	[BowserInfo] [nvarchar](128) NULL,
	[ProcessIPAddress] [nvarchar](128) NULL,
	[CreateDate] [datetime] NOT NULL,
	[ProcessDate] [datetime] NOT NULL,
 CONSTRAINT [PK_CaseApplyValidate] PRIMARY KEY CLUSTERED 
(
	[CaseValidateSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CaseApplyWeb]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CaseApplyWeb](
	[CaseApplyWebSN] [int] IDENTITY(1,1) NOT NULL,
	[WebSiteID] [varchar](30) NOT NULL,
	[Title] [nvarchar](500) NOT NULL,
	[SEODescription] [nvarchar](500) NOT NULL,
	[SEOKeywords] [nvarchar](500) NOT NULL,
	[GACode] [nvarchar](max) NOT NULL,
	[Satisfaction] [bit] NOT NULL,
	[Footer] [nvarchar](max) NOT NULL,
	[IsEnable] [varchar](3) NOT NULL,
	[CreatedUserID] [varchar](30) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ProcessUserID] [varchar](30) NOT NULL,
	[ProcessDate] [datetime] NOT NULL,
	[ProcessIPAddress] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CaseApplyWeb] PRIMARY KEY CLUSTERED 
(
	[CaseApplyWebSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogAction]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogAction](
	[LogActionSN] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [varchar](30) NULL,
	[WebSiteID] [varchar](30) NULL,
	[Controller] [nvarchar](128) NULL,
	[Action] [nvarchar](128) NULL,
	[ActionType] [char](1) NULL,
	[Status] [char](1) NULL,
	[SourceTable] [varchar](50) NULL,
	[SourceSN] [int] NULL,
	[Action2] [varchar](50) NULL,
	[MessageInput] [nvarchar](max) NULL,
	[MessageResult] [nvarchar](max) NULL,
	[WebPath] [nvarchar](max) NULL,
	[DepartmentID] [varchar](64) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ProcessIPAddress] [varchar](50) NOT NULL,
 CONSTRAINT [PK_LogAction] PRIMARY KEY CLUSTERED 
(
	[LogActionSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LogWebSite]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogWebSite](
	[LogWebSiteSN] [int] IDENTITY(1,1) NOT NULL,
	[WebLevelSN] [int] NULL,
	[WebNewsSN] [int] NULL,
	[WebFileSN] [int] NULL,
	[GroupId] [varchar](10) NULL,
	[Ip] [varchar](15) NULL,
	[CreateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_LogWebSite] PRIMARY KEY CLUSTERED 
(
	[LogWebSiteSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RelSysUserGroup]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RelSysUserGroup](
	[RelSysGroupUserSN] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](64) NULL,
	[SysGroupSN] [int] NULL,
	[CreatedIPAddress] [varchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedUserID] [varchar](30) NOT NULL,
	[SortOrder] [int] NOT NULL,
 CONSTRAINT [PK_SysUserGroup] PRIMARY KEY CLUSTERED 
(
	[RelSysGroupUserSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RelWebFileContent]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RelWebFileContent](
	[RelWebFileContentSN] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[WEBFileSN] [int] NOT NULL,
	[SourceTable] [varchar](50) NOT NULL,
	[SourceSN] [int] NOT NULL,
	[GroupID] [varchar](10) NOT NULL,
	[PageView] [int] NULL,
	[CreatedUserID] [varchar](30) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[SortOrder] [int] NULL,
 CONSTRAINT [PK_RelWEBFileContent] PRIMARY KEY CLUSTERED 
(
	[RelWebFileContentSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StaticLink]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaticLink](
	[StaticLinkSN] [int] IDENTITY(1,1) NOT NULL,
	[WebSiteID] [varchar](30) NULL,
	[Lang] [varchar](10) NULL,
	[SourseTable] [varchar](50) NULL,
	[SourseSN] [int] NULL,
	[MainSN] [int] NULL,
	[Link] [varchar](100) NULL,
	[StaticUrl] [varchar](100) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[IsEnable] [varchar](3) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedUserID] [varchar](50) NULL,
	[ProcessDate] [datetime] NULL,
	[ProcessUserID] [varchar](50) NULL,
	[ProcessIPAddress] [varchar](50) NULL,
	[IsLive] [varchar](3) NULL,
	[staticDate] [datetime] NULL,
 CONSTRAINT [PK_StaticLink] PRIMARY KEY CLUSTERED 
(
	[StaticLinkSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SysBlocklist]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysBlocklist](
	[SysBlocklistSN] [int] IDENTITY(1,1) NOT NULL,
	[WebType] [char](1) NULL,
	[BlockType] [char](1) NULL,
	[BlockedIPAddress] [varchar](50) NULL,
	[IsEnable] [char](3) NULL,
	[ProcessUserID] [varchar](30) NULL,
	[ProcessDate] [datetime] NULL,
	[ProcessIPAddress] [varchar](50) NULL,
	[CreatedUserID] [varchar](30) NULL,
	[CreatedDate] [datetime] NULL,
 CONSTRAINT [PK_SysBlocklist] PRIMARY KEY CLUSTERED 
(
	[SysBlocklistSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SysCategory]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysCategory](
	[SysCategorySN] [int] IDENTITY(1,1) NOT NULL,
	[SysCategoryKey] [varchar](100) NOT NULL,
	[ParentKey] [varchar](100) NOT NULL,
	[WebSiteID] [varchar](30) NOT NULL,
	[Lang] [varchar](10) NOT NULL,
	[Value] [nvarchar](500) NULL,
	[Description] [nvarchar](500) NULL,
	[ProcessUserID] [varchar](30) NULL,
	[ProcessDate] [datetime] NULL,
	[ProcessIPAddress] [varchar](50) NULL,
	[CreatedUserID] [varchar](30) NULL,
	[CreatedDate] [datetime] NULL,
	[SortOrder] [int] NULL,
	[IsEnable] [nvarchar](3) NULL,
	[MainSN] [int] NULL,
 CONSTRAINT [PK_SysCategory] PRIMARY KEY CLUSTERED 
(
	[SysCategoryKey] ASC,
	[ParentKey] ASC,
	[WebSiteID] ASC,
	[Lang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SysGroup]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysGroup](
	[SysGroupSN] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](200) NULL,
	[Description] [nvarchar](500) NULL,
	[IsEnable] [varchar](3) NULL,
	[CanDelete] [nvarchar](1) NULL,
	[ProcessUserID] [varchar](30) NULL,
	[ProcessDate] [datetime] NULL,
	[ProcessIPAddress] [varchar](50) NULL,
	[CreatedUserID] [varchar](30) NULL,
	[CreatedDate] [datetime] NULL,
	[SortOrder] [int] NULL,
	[IsGroup] [int] NULL,
 CONSTRAINT [PK_SysGroup] PRIMARY KEY CLUSTERED 
(
	[SysGroupSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SysPwdHistory]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysPwdHistory](
	[SysPwdHistorySN] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [varchar](30) NULL,
	[Password] [nvarchar](128) NULL,
	[CreateUserID] [varchar](30) NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_PwdHistory] PRIMARY KEY CLUSTERED 
(
	[SysPwdHistorySN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SysUserLogin]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysUserLogin](
	[SysUserLoginSN] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [varchar](30) NULL,
	[WebSiteID] [varchar](30) NULL,
	[Status] [varchar](1) NOT NULL,
	[Message] [varchar](512) NOT NULL,
	[ProcessIPAddress] [varchar](50) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_SysUserLogin] PRIMARY KEY CLUSTERED 
(
	[SysUserLoginSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SysWebSite]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysWebSite](
	[SysWebSiteSN] [int] IDENTITY(1,1) NOT NULL,
	[WebSiteID] [varchar](30) NULL,
	[Lang] [varchar](10) NULL,
	[Title] [nvarchar](200) NULL,
	[DNS] [nvarchar](100) NULL,
	[Description] [nvarchar](500) NULL,
	[GACode] [nvarchar](max) NULL,
	[IsEnable] [varchar](3) NULL,
	[ProcessUserID] [varchar](30) NULL,
	[ProcessDate] [datetime] NULL,
	[ProcessIPAddress] [varchar](50) NULL,
	[CreatedUserID] [varchar](30) NULL,
	[CreatedDate] [datetime] NULL,
	[SortOrder] [int] NULL,
	[CheckLinksDate] [datetime] NULL,
 CONSTRAINT [PK_SysWebSite] PRIMARY KEY CLUSTERED 
(
	[SysWebSiteSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SysWebSiteLang]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysWebSiteLang](
	[SysWebSiteLangSN] [int] IDENTITY(1,1) NOT NULL,
	[WebSiteID] [nvarchar](50) NOT NULL,
	[Lang] [varchar](10) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[GACode] [nvarchar](max) NULL,
	[ProcessIPAddress] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedUserID] [nvarchar](256) NULL,
	[ProcessDate] [datetime] NULL,
	[ProcessUserID] [varchar](30) NULL,
	[IsEnable] [varchar](3) NULL,
	[SortOrder] [int] NULL,
	[Description] [nvarchar](500) NULL,
	[GoogleSearchKey] [nchar](50) NULL,
 CONSTRAINT [PK_SysWebSiteLang] PRIMARY KEY CLUSTERED 
(
	[SysWebSiteLangSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SysZipCode]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SysZipCode](
	[ZipCodeSN] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[ParentSN] [int] NULL,
	[ZipCode] [varchar](10) NULL,
	[SortOrder] [int] NULL,
	[IsEnable] [varchar](3) NULL,
 CONSTRAINT [PK_SysZipCode] PRIMARY KEY CLUSTERED 
(
	[ZipCodeSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WEBFile]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WEBFile](
	[WEBFileSN] [int] IDENTITY(1,1) NOT NULL,
	[WEBFileID] [nvarchar](20) NOT NULL,
	[OriginalFileName] [nvarchar](512) NULL,
	[FileName] [nvarchar](512) NULL,
	[FileTitle] [nvarchar](1024) NULL,
	[FilePath] [nvarchar](512) NULL,
	[FileSize] [int] NULL,
	[FileType] [nvarchar](128) NULL,
	[IsEnable] [char](1) NULL,
	[ProcessUserID] [varchar](30) NULL,
	[ProcessDate] [datetime] NULL,
	[ProcessIPAddress] [varchar](50) NULL,
	[CreatedUserID] [varchar](30) NULL,
	[CreatedDate] [datetime] NULL,
	[FileApiPath] [nvarchar](1024) NULL,
 CONSTRAINT [PK_WEBFile] PRIMARY KEY CLUSTERED 
(
	[WEBFileSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebFileDownLoads]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebFileDownLoads](
	[FileSN] [int] IDENTITY(1,1) NOT NULL,
	[RelWebFileContentSN] [int] NOT NULL,
	[WEBFileSN] [int] NOT NULL,
	[DownLoads] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_WebFileDownLoads] PRIMARY KEY CLUSTERED 
(
	[FileSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebFileExtend]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebFileExtend](
	[WebFileExtendSN] [int] NOT NULL,
	[FileContentText] [nvarchar](max) NULL,
	[IsProtect] [bit] NULL,
 CONSTRAINT [PK_WebFileExtend] PRIMARY KEY CLUSTERED 
(
	[WebFileExtendSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebHrefSource]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebHrefSource](
	[SN] [int] IDENTITY(1,1) NOT NULL,
	[ParentSN] [int] NULL,
	[WebSiteID] [varchar](30) NULL,
	[Source] [varchar](100) NULL,
	[SourceSN] [int] NULL,
	[SourceSNParent] [int] NULL,
	[Href] [nvarchar](100) NULL,
	[StardDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[IsEnable] [int] NULL,
	[ProcessDate] [datetime] NULL,
	[Info] [varchar](50) NULL,
 CONSTRAINT [PK_WebHrefSource] PRIMARY KEY CLUSTERED 
(
	[SN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebLevelCustomizeTag]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebLevelCustomizeTag](
	[WebLevelCustomizeTagSN] [int] IDENTITY(1,1) NOT NULL,
	[WebLevelSN] [int] NOT NULL,
	[TagName] [nvarchar](200) NOT NULL,
	[SortOrder] [int] NOT NULL,
	[IsEnable] [char](3) NOT NULL,
	[CreatedUserID] [varchar](30) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ProcessUserID] [varchar](30) NOT NULL,
	[ProcessDate] [datetime] NOT NULL,
	[ProcessIPAddress] [varchar](50) NOT NULL,
 CONSTRAINT [PK_WebLevelCustomizeTag] PRIMARY KEY CLUSTERED 
(
	[WebLevelCustomizeTagSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebLevelSortLog]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebLevelSortLog](
	[WebLevelSortLogSN] [int] IDENTITY(1,1) NOT NULL,
	[WebSiteID] [varchar](30) NOT NULL,
	[Lang] [varchar](10) NOT NULL,
	[WebLevelParentSN] [int] NOT NULL,
	[CreatedUserID] [varchar](30) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[BeforeSortType] [varchar](2) NOT NULL,
	[AfterSortType] [varchar](2) NOT NULL,
	[SortMethod] [varchar](2) NOT NULL,
 CONSTRAINT [PK_WebLevelSortLog] PRIMARY KEY CLUSTERED 
(
	[WebLevelSortLogSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WEBNewsExtend]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WEBNewsExtend](
	[WEBNewsExtendSN] [int] IDENTITY(1,1) NOT NULL,
	[WEBNewsSN] [int] NULL,
	[SysCategoryKey] [varchar](100) NULL,
	[GroupID] [varchar](50) NULL,
	[Column_1] [nvarchar](max) NULL,
	[Column_2] [nvarchar](max) NULL,
	[Column_3] [int] NULL,
 CONSTRAINT [PK_WEBNewsExtend] PRIMARY KEY CLUSTERED 
(
	[WEBNewsExtendSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebNewsSchedule]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebNewsSchedule](
	[WebNewsScheduleSN] [int] IDENTITY(1,1) NOT NULL,
	[ToWebNewsSN] [int] NULL,
	[FromWebNewsSN] [int] NULL,
 CONSTRAINT [PK_WebNewsSchedule] PRIMARY KEY CLUSTERED 
(
	[WebNewsScheduleSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WEBNewsTranscript]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WEBNewsTranscript](
	[WEBNewsTranscriptSN] [int] IDENTITY(1,1) NOT NULL,
	[WEBNewsSN] [int] NOT NULL,
	[Item] [int] NOT NULL,
	[TranscriptForm] [nvarchar](max) NOT NULL,
	[TranscriptContent] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_WEBNewsTranscript] PRIMARY KEY CLUSTERED 
(
	[WEBNewsTranscriptSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WEBOpenDataDetail]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WEBOpenDataDetail](
	[OpenDataDetailSN] [int] IDENTITY(1,1) NOT NULL,
	[OpenDataMainSN] [int] NOT NULL,
	[Join] [int] NULL,
	[Code] [nvarchar](10) NULL,
	[SQLParameter] [nvarchar](max) NULL,
	[TableName] [nvarchar](100) NULL,
	[ProcessDate] [datetime] NULL,
	[DateCreated] [datetime] NULL,
	[SortOrder] [int] NULL,
 CONSTRAINT [PK_OpenDataDetail] PRIMARY KEY CLUSTERED 
(
	[OpenDataDetailSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WEBOpenDataMain]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WEBOpenDataMain](
	[WEBOpenDataMainSN] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[SubTitle] [nvarchar](50) NULL,
	[WebSiteID] [varchar](30) NULL,
	[SySGroupID] [nchar](10) NULL,
	[Lang] [varchar](10) NULL,
	[Description] [nvarchar](150) NULL,
	[ContentText] [nvarchar](150) NULL,
	[TableName] [nvarchar](100) NULL,
	[SQLParameter] [nvarchar](max) NULL,
	[ModuleType] [int] NULL,
	[ContactInfo] [nvarchar](25) NULL,
	[ContacPerson] [nvarchar](20) NULL,
	[Count] [int] NULL,
	[IsXML] [int] NULL,
	[IsJSON] [int] NULL,
	[IsCSV] [int] NULL,
	[IsRemoveTag] [int] NULL,
	[URL] [nvarchar](4000) NULL,
	[Refresh] [nvarchar](100) NULL,
	[EncodingType] [nvarchar](10) NULL,
	[ChargeType] [nvarchar](50) NULL,
	[AuthType] [nvarchar](50) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[DateCreated] [datetime] NULL,
	[ProcessDate] [datetime] NULL,
	[ProcessUserID] [nvarchar](10) NULL,
	[SortOrder] [int] NULL,
	[IsEnable] [varchar](3) NULL,
	[DepartmentID] [varchar](64) NULL,
 CONSTRAINT [PK_WEBOpenDataMain] PRIMARY KEY CLUSTERED 
(
	[WEBOpenDataMainSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WEBOpenDataSchema]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WEBOpenDataSchema](
	[OpenDataSchemaSN] [int] IDENTITY(1,1) NOT NULL,
	[OpenDataMainSN] [int] NOT NULL,
	[OpenDataDetailSN] [int] NOT NULL,
	[TableName] [nvarchar](100) NULL,
	[isRequired] [nvarchar](2) NULL,
	[Column] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[DataType] [nvarchar](50) NULL,
	[SortOrder] [int] NULL,
 CONSTRAINT [PK_WEBOpenDataSchema] PRIMARY KEY CLUSTERED 
(
	[OpenDataSchemaSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WEBSchedule]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WEBSchedule](
	[ScheduleSN] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Frequency] [int] NULL,
	[UseTime] [nvarchar](50) NULL,
	[InEnable] [int] NULL,
	[ProcessDate] [datetime] NULL,
	[Info] [nvarchar](500) NULL,
 CONSTRAINT [PK_Schedule] PRIMARY KEY CLUSTERED 
(
	[ScheduleSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WebSiteExtend]    Script Date: 2023/3/21 上午 08:26:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebSiteExtend](
	[WebSiteExtendSN] [int] IDENTITY(1,1) NOT NULL,
	[WebSiteID] [varchar](30) NULL,
	[Url] [nvarchar](100) NULL,
	[Title] [nchar](20) NULL,
	[Class] [nchar](20) NULL,
	[IsEnable] [varchar](3) NULL,
	[Sort] [int] NULL,
 CONSTRAINT [PK_WebSiteExtend] PRIMARY KEY CLUSTERED 
(
	[WebSiteExtendSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AuthSysGroupSysSection] ON 

INSERT [dbo].[AuthSysGroupSysSection] ([AuthSysGroupSysSectionSN], [WebSiteID], [SysSectionSN], [SysGroupSN], [CreatedUserID], [CreatedDate]) VALUES (173, N'TestDemo', 6, 1, N'test', CAST(N'2023-03-13T15:50:46.790' AS DateTime))
INSERT [dbo].[AuthSysGroupSysSection] ([AuthSysGroupSysSectionSN], [WebSiteID], [SysSectionSN], [SysGroupSN], [CreatedUserID], [CreatedDate]) VALUES (174, N'TestDemo', 7, 1, N'test', CAST(N'2023-03-13T15:50:46.793' AS DateTime))
INSERT [dbo].[AuthSysGroupSysSection] ([AuthSysGroupSysSectionSN], [WebSiteID], [SysSectionSN], [SysGroupSN], [CreatedUserID], [CreatedDate]) VALUES (175, N'TestDemo', 19, 1, N'test', CAST(N'2023-03-13T15:50:46.793' AS DateTime))
INSERT [dbo].[AuthSysGroupSysSection] ([AuthSysGroupSysSectionSN], [WebSiteID], [SysSectionSN], [SysGroupSN], [CreatedUserID], [CreatedDate]) VALUES (176, NULL, 8, 1, N'test', CAST(N'2023-03-13T15:50:46.793' AS DateTime))
INSERT [dbo].[AuthSysGroupSysSection] ([AuthSysGroupSysSectionSN], [WebSiteID], [SysSectionSN], [SysGroupSN], [CreatedUserID], [CreatedDate]) VALUES (177, NULL, 9, 1, N'test', CAST(N'2023-03-13T15:50:46.793' AS DateTime))
INSERT [dbo].[AuthSysGroupSysSection] ([AuthSysGroupSysSectionSN], [WebSiteID], [SysSectionSN], [SysGroupSN], [CreatedUserID], [CreatedDate]) VALUES (178, NULL, 10, 1, N'test', CAST(N'2023-03-13T15:50:46.793' AS DateTime))
INSERT [dbo].[AuthSysGroupSysSection] ([AuthSysGroupSysSectionSN], [WebSiteID], [SysSectionSN], [SysGroupSN], [CreatedUserID], [CreatedDate]) VALUES (179, NULL, 11, 1, N'test', CAST(N'2023-03-13T15:50:46.793' AS DateTime))
INSERT [dbo].[AuthSysGroupSysSection] ([AuthSysGroupSysSectionSN], [WebSiteID], [SysSectionSN], [SysGroupSN], [CreatedUserID], [CreatedDate]) VALUES (180, NULL, 15, 1, N'test', CAST(N'2023-03-13T15:50:46.793' AS DateTime))
INSERT [dbo].[AuthSysGroupSysSection] ([AuthSysGroupSysSectionSN], [WebSiteID], [SysSectionSN], [SysGroupSN], [CreatedUserID], [CreatedDate]) VALUES (181, NULL, 21, 1, N'test', CAST(N'2023-03-13T15:50:46.793' AS DateTime))
INSERT [dbo].[AuthSysGroupSysSection] ([AuthSysGroupSysSectionSN], [WebSiteID], [SysSectionSN], [SysGroupSN], [CreatedUserID], [CreatedDate]) VALUES (182, NULL, 16, 1, N'test', CAST(N'2023-03-13T15:50:46.793' AS DateTime))
INSERT [dbo].[AuthSysGroupSysSection] ([AuthSysGroupSysSectionSN], [WebSiteID], [SysSectionSN], [SysGroupSN], [CreatedUserID], [CreatedDate]) VALUES (183, NULL, 17, 1, N'test', CAST(N'2023-03-13T15:50:46.793' AS DateTime))
INSERT [dbo].[AuthSysGroupSysSection] ([AuthSysGroupSysSectionSN], [WebSiteID], [SysSectionSN], [SysGroupSN], [CreatedUserID], [CreatedDate]) VALUES (184, NULL, 18, 1, N'test', CAST(N'2023-03-13T15:50:46.793' AS DateTime))
INSERT [dbo].[AuthSysGroupSysSection] ([AuthSysGroupSysSectionSN], [WebSiteID], [SysSectionSN], [SysGroupSN], [CreatedUserID], [CreatedDate]) VALUES (185, NULL, 14, 1, N'test', CAST(N'2023-03-13T15:50:46.793' AS DateTime))
INSERT [dbo].[AuthSysGroupSysSection] ([AuthSysGroupSysSectionSN], [WebSiteID], [SysSectionSN], [SysGroupSN], [CreatedUserID], [CreatedDate]) VALUES (186, NULL, 13, 1, N'test', CAST(N'2023-03-13T15:50:46.793' AS DateTime))
INSERT [dbo].[AuthSysGroupSysSection] ([AuthSysGroupSysSectionSN], [WebSiteID], [SysSectionSN], [SysGroupSN], [CreatedUserID], [CreatedDate]) VALUES (187, NULL, 23, 1, N'test', CAST(N'2023-03-13T15:50:46.793' AS DateTime))
INSERT [dbo].[AuthSysGroupSysSection] ([AuthSysGroupSysSectionSN], [WebSiteID], [SysSectionSN], [SysGroupSN], [CreatedUserID], [CreatedDate]) VALUES (188, NULL, 24, 1, N'test', CAST(N'2023-03-13T15:50:46.793' AS DateTime))
INSERT [dbo].[AuthSysGroupSysSection] ([AuthSysGroupSysSectionSN], [WebSiteID], [SysSectionSN], [SysGroupSN], [CreatedUserID], [CreatedDate]) VALUES (189, N'TestDemo', 6, 35, N'test', CAST(N'2023-03-13T15:51:41.600' AS DateTime))
INSERT [dbo].[AuthSysGroupSysSection] ([AuthSysGroupSysSectionSN], [WebSiteID], [SysSectionSN], [SysGroupSN], [CreatedUserID], [CreatedDate]) VALUES (190, N'TestDemo', 7, 35, N'test', CAST(N'2023-03-13T15:51:41.600' AS DateTime))
INSERT [dbo].[AuthSysGroupSysSection] ([AuthSysGroupSysSectionSN], [WebSiteID], [SysSectionSN], [SysGroupSN], [CreatedUserID], [CreatedDate]) VALUES (191, N'TestDemo', 19, 35, N'test', CAST(N'2023-03-13T15:51:41.600' AS DateTime))
INSERT [dbo].[AuthSysGroupSysSection] ([AuthSysGroupSysSectionSN], [WebSiteID], [SysSectionSN], [SysGroupSN], [CreatedUserID], [CreatedDate]) VALUES (192, NULL, 8, 35, N'test', CAST(N'2023-03-13T15:51:41.600' AS DateTime))
INSERT [dbo].[AuthSysGroupSysSection] ([AuthSysGroupSysSectionSN], [WebSiteID], [SysSectionSN], [SysGroupSN], [CreatedUserID], [CreatedDate]) VALUES (193, NULL, 9, 35, N'test', CAST(N'2023-03-13T15:51:41.600' AS DateTime))
INSERT [dbo].[AuthSysGroupSysSection] ([AuthSysGroupSysSectionSN], [WebSiteID], [SysSectionSN], [SysGroupSN], [CreatedUserID], [CreatedDate]) VALUES (194, NULL, 10, 35, N'test', CAST(N'2023-03-13T15:51:41.600' AS DateTime))
INSERT [dbo].[AuthSysGroupSysSection] ([AuthSysGroupSysSectionSN], [WebSiteID], [SysSectionSN], [SysGroupSN], [CreatedUserID], [CreatedDate]) VALUES (195, NULL, 11, 35, N'test', CAST(N'2023-03-13T15:51:41.600' AS DateTime))
INSERT [dbo].[AuthSysGroupSysSection] ([AuthSysGroupSysSectionSN], [WebSiteID], [SysSectionSN], [SysGroupSN], [CreatedUserID], [CreatedDate]) VALUES (196, NULL, 15, 35, N'test', CAST(N'2023-03-13T15:51:41.600' AS DateTime))
INSERT [dbo].[AuthSysGroupSysSection] ([AuthSysGroupSysSectionSN], [WebSiteID], [SysSectionSN], [SysGroupSN], [CreatedUserID], [CreatedDate]) VALUES (197, NULL, 21, 35, N'test', CAST(N'2023-03-13T15:51:41.600' AS DateTime))
INSERT [dbo].[AuthSysGroupSysSection] ([AuthSysGroupSysSectionSN], [WebSiteID], [SysSectionSN], [SysGroupSN], [CreatedUserID], [CreatedDate]) VALUES (198, NULL, 16, 35, N'test', CAST(N'2023-03-13T15:51:41.600' AS DateTime))
INSERT [dbo].[AuthSysGroupSysSection] ([AuthSysGroupSysSectionSN], [WebSiteID], [SysSectionSN], [SysGroupSN], [CreatedUserID], [CreatedDate]) VALUES (199, NULL, 17, 35, N'test', CAST(N'2023-03-13T15:51:41.600' AS DateTime))
INSERT [dbo].[AuthSysGroupSysSection] ([AuthSysGroupSysSectionSN], [WebSiteID], [SysSectionSN], [SysGroupSN], [CreatedUserID], [CreatedDate]) VALUES (200, NULL, 18, 35, N'test', CAST(N'2023-03-13T15:51:41.600' AS DateTime))
INSERT [dbo].[AuthSysGroupSysSection] ([AuthSysGroupSysSectionSN], [WebSiteID], [SysSectionSN], [SysGroupSN], [CreatedUserID], [CreatedDate]) VALUES (201, NULL, 14, 35, N'test', CAST(N'2023-03-13T15:51:41.600' AS DateTime))
INSERT [dbo].[AuthSysGroupSysSection] ([AuthSysGroupSysSectionSN], [WebSiteID], [SysSectionSN], [SysGroupSN], [CreatedUserID], [CreatedDate]) VALUES (202, NULL, 13, 35, N'test', CAST(N'2023-03-13T15:51:41.600' AS DateTime))
INSERT [dbo].[AuthSysGroupSysSection] ([AuthSysGroupSysSectionSN], [WebSiteID], [SysSectionSN], [SysGroupSN], [CreatedUserID], [CreatedDate]) VALUES (203, NULL, 23, 35, N'test', CAST(N'2023-03-13T15:51:41.600' AS DateTime))
INSERT [dbo].[AuthSysGroupSysSection] ([AuthSysGroupSysSectionSN], [WebSiteID], [SysSectionSN], [SysGroupSN], [CreatedUserID], [CreatedDate]) VALUES (204, NULL, 24, 35, N'test', CAST(N'2023-03-13T15:51:41.600' AS DateTime))
SET IDENTITY_INSERT [dbo].[AuthSysGroupSysSection] OFF
SET IDENTITY_INSERT [dbo].[AuthSysGroupWebLevel] ON 

INSERT [dbo].[AuthSysGroupWebLevel] ([AuthSysGroupWebLevelSN], [WebSiteID], [WebLevelSN], [Lang], [AuthType], [SysGroupSN], [CreatedUserID], [CreatedDate]) VALUES (69, N'TestDemo', 1, N'', N'Module', 35, N'test', CAST(N'2023-03-13T15:51:55.127' AS DateTime))
INSERT [dbo].[AuthSysGroupWebLevel] ([AuthSysGroupWebLevelSN], [WebSiteID], [WebLevelSN], [Lang], [AuthType], [SysGroupSN], [CreatedUserID], [CreatedDate]) VALUES (70, N'TestDemo', 1, N'', N'Article', 35, N'test', CAST(N'2023-03-13T15:51:57.027' AS DateTime))
INSERT [dbo].[AuthSysGroupWebLevel] ([AuthSysGroupWebLevelSN], [WebSiteID], [WebLevelSN], [Lang], [AuthType], [SysGroupSN], [CreatedUserID], [CreatedDate]) VALUES (71, N'TestDemo', 1, N'', N'Reviewer', 35, N'test', CAST(N'2023-03-13T15:51:59.550' AS DateTime))
INSERT [dbo].[AuthSysGroupWebLevel] ([AuthSysGroupWebLevelSN], [WebSiteID], [WebLevelSN], [Lang], [AuthType], [SysGroupSN], [CreatedUserID], [CreatedDate]) VALUES (72, N'TestDemo', 1, N'', N'Auth', 35, N'test', CAST(N'2023-03-13T15:52:01.513' AS DateTime))
INSERT [dbo].[AuthSysGroupWebLevel] ([AuthSysGroupWebLevelSN], [WebSiteID], [WebLevelSN], [Lang], [AuthType], [SysGroupSN], [CreatedUserID], [CreatedDate]) VALUES (73, N'TestDemo', 348, N'', N'Module', 35, N'test', CAST(N'2023-03-13T15:52:05.137' AS DateTime))
INSERT [dbo].[AuthSysGroupWebLevel] ([AuthSysGroupWebLevelSN], [WebSiteID], [WebLevelSN], [Lang], [AuthType], [SysGroupSN], [CreatedUserID], [CreatedDate]) VALUES (74, N'TestDemo', 348, N'', N'Article', 35, N'test', CAST(N'2023-03-13T15:52:06.997' AS DateTime))
INSERT [dbo].[AuthSysGroupWebLevel] ([AuthSysGroupWebLevelSN], [WebSiteID], [WebLevelSN], [Lang], [AuthType], [SysGroupSN], [CreatedUserID], [CreatedDate]) VALUES (75, N'TestDemo', 348, N'', N'Reviewer', 35, N'test', CAST(N'2023-03-13T15:52:09.437' AS DateTime))
INSERT [dbo].[AuthSysGroupWebLevel] ([AuthSysGroupWebLevelSN], [WebSiteID], [WebLevelSN], [Lang], [AuthType], [SysGroupSN], [CreatedUserID], [CreatedDate]) VALUES (76, N'TestDemo', 348, N'', N'Auth', 35, N'test', CAST(N'2023-03-13T15:52:11.460' AS DateTime))
SET IDENTITY_INSERT [dbo].[AuthSysGroupWebLevel] OFF
SET IDENTITY_INSERT [dbo].[RelSysUserGroup] ON 

INSERT [dbo].[RelSysUserGroup] ([RelSysGroupUserSN], [UserID], [SysGroupSN], [CreatedIPAddress], [CreatedDate], [CreatedUserID], [SortOrder]) VALUES (40, N'test', 1, N'::1', CAST(N'2022-11-11T15:58:39.377' AS DateTime), N'test', 1)
INSERT [dbo].[RelSysUserGroup] ([RelSysGroupUserSN], [UserID], [SysGroupSN], [CreatedIPAddress], [CreatedDate], [CreatedUserID], [SortOrder]) VALUES (46, N'test', 19, N'::1', CAST(N'2022-12-30T14:52:25.490' AS DateTime), N'test', 1)
INSERT [dbo].[RelSysUserGroup] ([RelSysGroupUserSN], [UserID], [SysGroupSN], [CreatedIPAddress], [CreatedDate], [CreatedUserID], [SortOrder]) VALUES (49, N'test', 35, N'::1', CAST(N'2023-03-13T15:51:48.377' AS DateTime), N'test', 1)
SET IDENTITY_INSERT [dbo].[RelSysUserGroup] OFF
SET IDENTITY_INSERT [dbo].[SysCategory] ON 

INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (3, N'TestDemo', N'', N'TestDemo', N'', N'(測試)MODA', N'(測試)MODA參數管理', N'testmoda', CAST(N'2022-05-11T15:37:28.457' AS DateTime), N'::1', N'testmoda', CAST(N'2022-03-18T00:00:00.000' AS DateTime), 1, N'1', 0)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (76, N'TestDemo-1', N'TestDemo', N'TestDemo', N'en', N'(測試)相關', N'(測試)相關', N'testmoda', CAST(N'2022-09-06T17:05:00.233' AS DateTime), N'192.168.151.161', N'testmoda', CAST(N'2022-05-27T09:23:43.783' AS DateTime), 2, N'1', 75)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (75, N'TestDemo-1', N'TestDemo', N'TestDemo', N'zh-tw', N'(測試)相關', N'(測試)相關', N'testmoda', CAST(N'2022-11-03T15:46:49.833' AS DateTime), N'::1', N'testmoda', CAST(N'2022-05-27T09:23:43.783' AS DateTime), 4, N'1', 75)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1929, N'TestDemo-10', N'TestDemo', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2022-11-21T14:25:44.447' AS DateTime), N'::1', N'testmoda', CAST(N'2022-11-21T14:25:44.447' AS DateTime), 34, N'1', 1928)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1928, N'TestDemo-10', N'TestDemo', N'TestDemo', N'zh-tw', N'(測試)民意信箱分類', N'(測試)民意信箱分類', N'testmoda', CAST(N'2022-11-21T14:27:06.050' AS DateTime), N'::1', N'testmoda', CAST(N'2022-11-21T14:25:44.447' AS DateTime), 34, N'1', 1928)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (2009, N'TestDemo-10-1', N'TestDemo-10', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2022-12-26T14:35:17.650' AS DateTime), N'192.168.151.136', N'testmoda', CAST(N'2022-12-26T14:35:17.650' AS DateTime), 1, N'1', 2008)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (2008, N'TestDemo-10-1', N'TestDemo-10', N'TestDemo', N'zh-tw', N'(測試)1', N'(測試)大分類開關', N'testmoda', CAST(N'2023-02-14T13:55:48.260' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-12-26T14:35:17.650' AS DateTime), 1, N'1', 2008)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (2011, N'TestDemo-10-2', N'TestDemo-10', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2022-12-26T14:35:26.420' AS DateTime), N'192.168.151.136', N'testmoda', CAST(N'2022-12-26T14:35:26.420' AS DateTime), 2, N'1', 2010)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (2010, N'TestDemo-10-2', N'TestDemo-10', N'TestDemo', N'zh-tw', N'(測試)網頁意見-大分類', N'(測試)網頁意見-大分類', N'testmoda', CAST(N'2023-02-13T10:55:46.850' AS DateTime), N'::1', N'testmoda', CAST(N'2022-12-26T14:35:26.420' AS DateTime), 2, N'1', 2010)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1939, N'TestDemo-10-2-1', N'TestDemo-10-2', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2022-11-21T14:31:30.890' AS DateTime), N'::1', N'testmoda', CAST(N'2022-11-21T14:31:30.890' AS DateTime), 2, N'1', 1938)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1938, N'TestDemo-10-2-1', N'TestDemo-10-2', N'TestDemo', N'zh-tw', N'(測試)施政規劃/計畫管理', N'(測試)施政規劃/計畫管理', N'testmoda', CAST(N'2023-01-07T14:42:00.503' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-11-21T14:31:30.890' AS DateTime), 4, N'1', 1938)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1957, N'TestDemo-10-2-10', N'TestDemo-10-2', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2022-11-21T14:33:15.260' AS DateTime), N'::1', N'testmoda', CAST(N'2022-11-21T14:33:15.260' AS DateTime), 46, N'1', 1956)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1956, N'TestDemo-10-2-10', N'TestDemo-10-2', N'TestDemo', N'zh-tw', N'(測試)其他類', N'(測試)其他類', N'testmoda', CAST(N'2022-11-21T14:33:15.260' AS DateTime), N'::1', N'testmoda', CAST(N'2022-11-21T14:33:15.260' AS DateTime), 48, N'1', 1956)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (2023, N'TestDemo-10-2-11', N'TestDemo-10-2', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2023-01-07T14:43:01.737' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2023-01-07T14:43:01.737' AS DateTime), 38, N'1', 2022)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (2022, N'TestDemo-10-2-11', N'TestDemo-10-2', N'TestDemo', N'zh-tw', N'(測試)電子商務/行動支付/線上遊戲爭議', N'(測試)電子商務/行動支付/線上遊戲爭議', N'testmoda', CAST(N'2023-01-07T14:43:01.737' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2023-01-07T14:43:01.737' AS DateTime), 40, N'1', 2022)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (2025, N'TestDemo-10-2-12', N'TestDemo-10-2', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2023-01-07T14:43:10.003' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2023-01-07T14:43:10.003' AS DateTime), 42, N'1', 2024)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (2024, N'TestDemo-10-2-12', N'TestDemo-10-2', N'TestDemo', N'zh-tw', N'(測試)資安事件處理', N'(測試)資安事件處理', N'testmoda', CAST(N'2023-01-07T14:43:10.003' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2023-01-07T14:43:10.003' AS DateTime), 44, N'1', 2024)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1941, N'TestDemo-10-2-2', N'TestDemo-10-2', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2022-11-21T14:31:42.407' AS DateTime), N'::1', N'testmoda', CAST(N'2022-11-21T14:31:42.407' AS DateTime), 6, N'1', 1940)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1940, N'TestDemo-10-2-2', N'TestDemo-10-2', N'TestDemo', N'zh-tw', N'(測試)媒體採訪/調查分析', N'(測試)媒體採訪/調查分析', N'testmoda', CAST(N'2023-01-07T14:42:07.553' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-11-21T14:31:42.407' AS DateTime), 8, N'1', 1940)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1943, N'TestDemo-10-2-3', N'TestDemo-10-2', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2022-11-21T14:31:53.320' AS DateTime), N'::1', N'testmoda', CAST(N'2022-11-21T14:31:53.320' AS DateTime), 10, N'1', 1942)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1942, N'TestDemo-10-2-3', N'TestDemo-10-2', N'TestDemo', N'zh-tw', N'(測試)通訊傳播基礎設施/網路品質等', N'(測試)通訊傳播基礎設施/網路品質等', N'testmoda', CAST(N'2023-01-07T14:42:15.537' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-11-21T14:31:53.320' AS DateTime), 12, N'1', 1942)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1945, N'TestDemo-10-2-4', N'TestDemo-10-2', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2022-11-21T14:32:03.480' AS DateTime), N'::1', N'testmoda', CAST(N'2022-11-21T14:32:03.480' AS DateTime), 14, N'1', 1944)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1944, N'TestDemo-10-2-4', N'TestDemo-10-2', N'TestDemo', N'zh-tw', N'(測試)無線電/頻率/號碼等', N'(測試)無線電/頻率/號碼等', N'testmoda', CAST(N'2023-01-07T14:42:23.500' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-11-21T14:32:03.480' AS DateTime), 16, N'1', 1944)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1947, N'TestDemo-10-2-5', N'TestDemo-10-2', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2022-11-21T14:32:19.357' AS DateTime), N'::1', N'testmoda', CAST(N'2022-11-21T14:32:19.357' AS DateTime), 18, N'1', 1946)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1946, N'TestDemo-10-2-5', N'TestDemo-10-2', N'TestDemo', N'zh-tw', N'(測試)政府機關之資訊應用服務等', N'(測試)政府機關之資訊應用服務等', N'testmoda', CAST(N'2023-01-07T14:42:31.883' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-11-21T14:32:19.357' AS DateTime), 20, N'1', 1946)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1949, N'TestDemo-10-2-6', N'TestDemo-10-2', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2022-11-21T14:32:31.270' AS DateTime), N'::1', N'testmoda', CAST(N'2022-11-21T14:32:31.270' AS DateTime), 22, N'1', 1948)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1948, N'TestDemo-10-2-6', N'TestDemo-10-2', N'TestDemo', N'zh-tw', N'(測試)數位國際合作/開放原始碼等', N'(測試)數位國際合作/開放原始碼等', N'testmoda', CAST(N'2023-01-07T14:42:39.523' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-11-21T14:32:31.270' AS DateTime), 24, N'1', 1948)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1951, N'TestDemo-10-2-7', N'TestDemo-10-2', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2022-11-21T14:32:41.883' AS DateTime), N'::1', N'testmoda', CAST(N'2022-11-21T14:32:41.883' AS DateTime), 26, N'1', 1950)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1950, N'TestDemo-10-2-7', N'TestDemo-10-2', N'TestDemo', N'zh-tw', N'(測試)政府資料開放/My Data/數據公益等', N'(測試)政府資料開放/My Data/數據公益等', N'testmoda', CAST(N'2023-01-07T14:42:48.247' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-11-21T14:32:41.883' AS DateTime), 28, N'1', 1950)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1953, N'TestDemo-10-2-8', N'TestDemo-10-2', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2022-11-21T14:32:55.697' AS DateTime), N'::1', N'testmoda', CAST(N'2022-11-21T14:32:55.697' AS DateTime), 30, N'1', 1952)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1952, N'TestDemo-10-2-8', N'TestDemo-10-2', N'TestDemo', N'zh-tw', N'(測試)機關徵才', N'(測試)機關徵才', N'testmoda', CAST(N'2022-11-21T14:32:55.697' AS DateTime), N'::1', N'testmoda', CAST(N'2022-11-21T14:32:55.697' AS DateTime), 32, N'1', 1952)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1955, N'TestDemo-10-2-9', N'TestDemo-10-2', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2022-11-21T14:33:06.643' AS DateTime), N'::1', N'testmoda', CAST(N'2022-11-21T14:33:06.643' AS DateTime), 34, N'1', 1954)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1954, N'TestDemo-10-2-9', N'TestDemo-10-2', N'TestDemo', N'zh-tw', N'(測試)機關預算', N'(測試)機關預算', N'testmoda', CAST(N'2022-11-21T14:33:06.643' AS DateTime), N'::1', N'testmoda', CAST(N'2022-11-21T14:33:06.643' AS DateTime), 36, N'1', 1954)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1959, N'TestDemo-11', N'TestDemo', N'TestDemo', N'en', N'(測試)首頁-徵才公告預設網址', N'(測試)首頁-徵才公告預設網址', N'testmoda', CAST(N'2022-12-12T08:23:09.313' AS DateTime), N'192.168.151.136', N'testmoda', CAST(N'2022-12-09T12:25:02.683' AS DateTime), 35, N'1', 1958)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1958, N'TestDemo-11', N'TestDemo', N'TestDemo', N'zh-tw', N'(測試)首頁-徵才公告預設網址', N'(測試)首頁-徵才公告預設網址', N'testmoda', CAST(N'2022-12-12T08:23:20.203' AS DateTime), N'192.168.151.136', N'testmoda', CAST(N'2022-12-09T12:25:02.683' AS DateTime), 35, N'1', 1958)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (78, N'TestDemo-1-1', N'TestDemo-1', N'TestDemo', N'en', N'(測試)Relevant Link(s)', N'(測試)Relevant Link(s)', N'testmoda', CAST(N'2022-08-22T16:44:26.620' AS DateTime), N'192.168.151.142', N'testmoda', CAST(N'2022-05-27T09:24:19.867' AS DateTime), 1, N'1', 77)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (77, N'TestDemo-1-1', N'TestDemo-1', N'TestDemo', N'zh-tw', N'(測試)相關連結', N'(測試)相關連結', N'testmoda', CAST(N'2022-11-03T15:29:14.327' AS DateTime), N'::1', N'testmoda', CAST(N'2022-05-27T09:24:19.867' AS DateTime), 1, N'1', 77)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1118, N'TestDemo-1-10', N'TestDemo-1', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2023-01-31T11:59:53.280' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-10T18:08:42.580' AS DateTime), 10, N'-99', 1117)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1117, N'TestDemo-1-10', N'TestDemo-1', N'TestDemo', N'zh-tw', N'(測試)測試3', N'(測試)測試3', N'testmoda', CAST(N'2023-01-31T11:59:53.280' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-10T18:08:42.580' AS DateTime), 10, N'-99', 1117)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1120, N'TestDemo-1-11', N'TestDemo-1', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2023-01-31T11:59:38.637' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-10T18:08:52.737' AS DateTime), 11, N'-99', 1119)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1119, N'TestDemo-1-11', N'TestDemo-1', N'TestDemo', N'zh-tw', N'(測試)測試4', N'(測試)測試4', N'testmoda', CAST(N'2023-01-31T11:59:38.637' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-10T18:08:52.737' AS DateTime), 11, N'-99', 1119)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1961, N'TestDemo-11-1', N'TestDemo-11', N'TestDemo', N'en', N'(測試)google', N'(測試)網站名稱', N'testmoda', CAST(N'2022-12-12T08:14:33.457' AS DateTime), N'192.168.151.136', N'testmoda', CAST(N'2022-12-12T08:13:52.920' AS DateTime), 1, N'1', 1960)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1960, N'TestDemo-11-1', N'TestDemo-11', N'TestDemo', N'zh-tw', N'(測試)google', N'(測試)網站名稱', N'testmoda', CAST(N'2022-12-12T08:13:52.913' AS DateTime), N'192.168.151.136', N'testmoda', CAST(N'2022-12-12T08:13:52.920' AS DateTime), 1, N'1', 1960)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1963, N'TestDemo-11-2', N'TestDemo-11', N'TestDemo', N'en', N'(測試)https://www.google.com.tw/', N'(測試)網站網址', N'testmoda', CAST(N'2022-12-12T08:14:50.510' AS DateTime), N'192.168.151.136', N'testmoda', CAST(N'2022-12-12T08:14:15.087' AS DateTime), 2, N'1', 1962)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1962, N'TestDemo-11-2', N'TestDemo-11', N'TestDemo', N'zh-tw', N'(測試)https://www.google.com.tw/', N'(測試)網站網址', N'testmoda', CAST(N'2022-12-12T08:14:15.087' AS DateTime), N'192.168.151.136', N'testmoda', CAST(N'2022-12-12T08:14:15.087' AS DateTime), 2, N'1', 1962)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (80, N'TestDemo-1-2', N'TestDemo-1', N'TestDemo', N'en', N'(測試)Relevant Video(s)', N'(測試)Relevant Video(s)', N'testmoda', CAST(N'2022-08-22T16:44:33.443' AS DateTime), N'192.168.151.142', N'testmoda', CAST(N'2022-05-27T09:24:28.160' AS DateTime), 2, N'1', 79)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (79, N'TestDemo-1-2', N'TestDemo-1', N'TestDemo', N'zh-tw', N'(測試)相關影片', N'(測試)相關影片', N'testmoda', CAST(N'2022-05-27T09:24:28.160' AS DateTime), N'::1', N'testmoda', CAST(N'2022-05-27T09:24:28.160' AS DateTime), 2, N'1', 79)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (82, N'TestDemo-1-3', N'TestDemo-1', N'TestDemo', N'en', N'(測試)Relevant Regulation(s)', N'(測試)Relevant Regulation(s)', N'testmoda', CAST(N'2022-08-22T16:44:40.107' AS DateTime), N'192.168.151.142', N'testmoda', CAST(N'2022-05-27T09:24:37.080' AS DateTime), 3, N'1', 81)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (81, N'TestDemo-1-3', N'TestDemo-1', N'TestDemo', N'zh-tw', N'(測試)相關法規', N'(測試)相關法規', N'testmoda', CAST(N'2022-05-27T09:24:37.080' AS DateTime), N'::1', N'testmoda', CAST(N'2022-05-27T09:24:37.080' AS DateTime), 3, N'1', 81)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (84, N'TestDemo-1-4', N'TestDemo-1', N'TestDemo', N'en', N'(測試)Relevant Organization(s)', N'(測試)Relevant Organization(s)', N'testmoda', CAST(N'2022-08-22T16:45:18.480' AS DateTime), N'192.168.151.142', N'testmoda', CAST(N'2022-05-27T09:24:46.283' AS DateTime), 4, N'1', 83)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (83, N'TestDemo-1-4', N'TestDemo-1', N'TestDemo', N'zh-tw', N'(測試)相關單位', N'(測試)相關單位', N'testmoda', CAST(N'2022-05-27T09:24:46.283' AS DateTime), N'::1', N'testmoda', CAST(N'2022-05-27T09:24:46.283' AS DateTime), 4, N'1', 83)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1086, N'TestDemo-1-5', N'TestDemo-1', N'TestDemo', N'en', N'(測試)Relevant File(s)', N'(測試)Relevant File(s)', N'testmoda', CAST(N'2022-08-22T16:44:46.583' AS DateTime), N'192.168.151.142', N'testmoda', CAST(N'2022-06-09T15:33:33.103' AS DateTime), 5, N'1', 1085)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1085, N'TestDemo-1-5', N'TestDemo-1', N'TestDemo', N'zh-tw', N'(測試)相關檔案', N'(測試)相關檔案', N'testmoda', CAST(N'2022-06-09T15:34:02.457' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-09T15:33:33.103' AS DateTime), 5, N'1', 1085)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1088, N'TestDemo-1-6', N'TestDemo-1', N'TestDemo', N'en', N'(測試)Relevant Image(s)', N'(測試)Relevant Image(s)', N'testmoda', CAST(N'2022-08-22T16:44:52.823' AS DateTime), N'192.168.151.142', N'testmoda', CAST(N'2022-06-09T15:34:21.800' AS DateTime), 6, N'1', 1087)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1087, N'TestDemo-1-6', N'TestDemo-1', N'TestDemo', N'zh-tw', N'(測試)相關圖片', N'(測試)相關圖片', N'testmoda', CAST(N'2022-06-09T15:34:21.800' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-09T15:34:21.800' AS DateTime), 6, N'1', 1087)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1090, N'TestDemo-1-7', N'TestDemo-1', N'TestDemo', N'en', N'(測試)Keyword(s)', N'(測試)Keyword(s)', N'testmoda', CAST(N'2022-08-22T16:34:45.777' AS DateTime), N'192.168.151.142', N'testmoda', CAST(N'2022-06-09T15:45:22.857' AS DateTime), 7, N'1', 1089)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1089, N'TestDemo-1-7', N'TestDemo-1', N'TestDemo', N'zh-tw', N'(測試)關鍵字', N'(測試)關鍵字', N'testmoda', CAST(N'2022-06-09T15:45:22.857' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-09T15:45:22.857' AS DateTime), 7, N'1', 1089)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1092, N'TestDemo-1-8', N'TestDemo-1', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2023-01-31T12:06:49.740' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-10T15:24:57.867' AS DateTime), 8, N'-99', 1091)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1091, N'TestDemo-1-8', N'TestDemo-1', N'TestDemo', N'zh-tw', N'(測試)相關資料', N'(測試)相關資料', N'testmoda', CAST(N'2023-01-31T12:06:49.740' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-10T15:24:57.867' AS DateTime), 8, N'-99', 1091)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1116, N'TestDemo-1-9', N'TestDemo-1', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2023-01-31T12:01:50.927' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-10T18:08:29.087' AS DateTime), 9, N'-99', 1115)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1115, N'TestDemo-1-9', N'TestDemo-1', N'TestDemo', N'zh-tw', N'(測試)測試', N'(測試)測試', N'testmoda', CAST(N'2023-01-31T12:01:50.927' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-10T18:08:29.087' AS DateTime), 9, N'-99', 1115)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (86, N'TestDemo-2', N'TestDemo', N'TestDemo', N'en', N'(測試)Tags', N'(測試)Tags', N'testmoda', CAST(N'2022-09-06T17:05:00.233' AS DateTime), N'192.168.151.161', N'testmoda', CAST(N'2022-05-30T10:50:29.747' AS DateTime), 6, N'1', 85)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (85, N'TestDemo-2', N'TestDemo', N'TestDemo', N'zh-tw', N'(測試)主題標籤', N'(測試)主題標籤', N'testmoda', CAST(N'2022-09-06T17:05:00.233' AS DateTime), N'192.168.151.161', N'testmoda', CAST(N'2022-05-30T10:50:29.747' AS DateTime), 8, N'1', 85)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (88, N'TestDemo-2-1', N'TestDemo-2', N'TestDemo', N'en', N'(測試)Digital government', N'(測試)Digital government', N'testmoda', CAST(N'2022-07-28T15:03:16.843' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-05-30T10:51:09.763' AS DateTime), 1, N'1', 87)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (87, N'TestDemo-2-1', N'TestDemo-2', N'TestDemo', N'zh-tw', N'(測試)數位政府', N'(測試)數位政府', N'testmoda', CAST(N'2022-05-30T10:51:09.763' AS DateTime), N'::1', N'testmoda', CAST(N'2022-05-30T10:51:09.763' AS DateTime), 1, N'1', 87)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1154, N'TestDemo-2-10', N'TestDemo-2', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2022-06-16T09:54:30.133' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-16T09:54:30.133' AS DateTime), 10, N'1', 1153)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1153, N'TestDemo-2-10', N'TestDemo-2', N'TestDemo', N'zh-tw', N'(測試)通訊網路建設規劃', N'(測試)通訊網路建設規劃', N'testmoda', CAST(N'2022-06-16T09:54:30.133' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-16T09:54:30.133' AS DateTime), 10, N'1', 1153)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1158, N'TestDemo-2-11', N'TestDemo-2', N'TestDemo', N'en', N'(測試)Telecommunications infrastructure protection planning', N'(測試)Telecommunications infrastructure protection planning', N'testmoda', CAST(N'2022-08-11T14:33:20.420' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-16T09:57:53.477' AS DateTime), 11, N'1', 1157)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1157, N'TestDemo-2-11', N'TestDemo-2', N'TestDemo', N'zh-tw', N'(測試)通訊傳播事業基礎設施防護之規劃', N'(測試)通訊傳播事業基礎設施防護之規劃', N'testmoda', CAST(N'2022-06-16T09:57:53.477' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-16T09:57:53.477' AS DateTime), 11, N'1', 1157)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1160, N'TestDemo-2-12', N'TestDemo-2', N'TestDemo', N'en', N'(測試)supervision, and management', N'(測試)supervision, and management', N'testmoda', CAST(N'2022-08-11T14:34:05.487' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-16T09:58:02.893' AS DateTime), 12, N'1', 1159)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1159, N'TestDemo-2-12', N'TestDemo-2', N'TestDemo', N'zh-tw', N'(測試)監督管理作業', N'(測試)監督管理作業', N'testmoda', CAST(N'2022-06-16T09:58:02.893' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-16T09:58:02.893' AS DateTime), 12, N'1', 1159)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1162, N'TestDemo-2-13', N'TestDemo-2', N'TestDemo', N'en', N'(測試)Affairs relating to the mobilization of telecommunications', N'(測試)Affairs relating to the mobilization of telecommunications', N'testmoda', CAST(N'2022-08-11T14:44:16.690' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-16T14:13:50.980' AS DateTime), 13, N'1', 1161)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1161, N'TestDemo-2-13', N'TestDemo-2', N'TestDemo', N'zh-tw', N'(測試)配合資通訊動員涉本部之相關作業', N'(測試)配合資通訊動員涉本部之相關作業', N'testmoda', CAST(N'2022-06-16T14:13:50.980' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-16T14:13:50.980' AS DateTime), 13, N'1', 1161)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1164, N'TestDemo-2-14', N'TestDemo-2', N'TestDemo', N'en', N'(測試)Telecommunications network technology research', N'(測試)Telecommunications network technology research', N'testmoda', CAST(N'2022-08-11T15:21:00.097' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-16T14:19:41.843' AS DateTime), 14, N'1', 1163)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1163, N'TestDemo-2-14', N'TestDemo-2', N'TestDemo', N'zh-tw', N'(測試)通訊網路技術研發', N'(測試)通訊網路技術研發', N'testmoda', CAST(N'2022-06-16T14:19:41.843' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-16T14:19:41.843' AS DateTime), 14, N'1', 1163)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1168, N'TestDemo-2-15', N'TestDemo-2', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2022-06-16T14:30:46.373' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-16T14:30:46.373' AS DateTime), 15, N'1', 1167)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1167, N'TestDemo-2-15', N'TestDemo-2', N'TestDemo', N'zh-tw', N'(測試)通訊網路資安審驗', N'(測試)通訊網路資安審驗', N'testmoda', CAST(N'2022-06-16T14:30:46.373' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-16T14:30:46.373' AS DateTime), 15, N'1', 1167)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1172, N'TestDemo-2-16', N'TestDemo-2', N'TestDemo', N'en', N'(測試)Main operations', N'(測試)Main operations', N'testmoda', CAST(N'2022-08-11T16:05:57.903' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-16T14:39:47.787' AS DateTime), 16, N'1', 1171)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1171, N'TestDemo-2-16', N'TestDemo-2', N'TestDemo', N'zh-tw', N'(測試)主要業務簡介', N'(測試)主要業務簡介', N'testmoda', CAST(N'2022-06-16T14:39:47.787' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-16T14:39:47.787' AS DateTime), 16, N'1', 1171)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1176, N'TestDemo-2-17', N'TestDemo-2', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2022-06-16T14:57:17.153' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-16T14:57:17.153' AS DateTime), 17, N'1', 1175)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1175, N'TestDemo-2-17', N'TestDemo-2', N'TestDemo', N'zh-tw', N'(測試)關鍵電信基礎設施資通設備資通安全檢測技術規範', N'(測試)關鍵電信基礎設施資通設備資通安全檢測技術規範', N'testmoda', CAST(N'2022-06-16T14:57:17.153' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-16T14:57:17.153' AS DateTime), 17, N'1', 1175)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1180, N'TestDemo-2-18', N'TestDemo-2', N'TestDemo', N'en', N'(測試)Regulations Governing Testing and Certification Bodies of Information and Communications Equipment Used by Critical Telecommunications Infrastructure', N'(測試)Regulations Governing Testing and Certification Bodies of Information and Communications Equipment Used by Critical Telecommunications Infrastructure', N'testmoda', CAST(N'2022-08-11T17:00:30.897' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-16T14:57:53.790' AS DateTime), 18, N'1', 1179)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1179, N'TestDemo-2-18', N'TestDemo-2', N'TestDemo', N'zh-tw', N'(測試)關鍵電信基礎設施資通設備測試機構及驗證機構管理辦法', N'(測試)關鍵電信基礎設施資通設備測試機構及驗證機構管理辦法', N'testmoda', CAST(N'2022-06-16T14:57:53.790' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-16T14:57:53.790' AS DateTime), 18, N'1', 1179)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1184, N'TestDemo-2-19', N'TestDemo-2', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2022-06-16T16:37:42.997' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-16T16:37:42.997' AS DateTime), 19, N'1', 1183)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1183, N'TestDemo-2-19', N'TestDemo-2', N'TestDemo', N'zh-tw', N'(測試)資安服務推廣', N'(測試)資安服務推廣', N'testmoda', CAST(N'2022-06-16T16:37:42.997' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-16T16:37:42.997' AS DateTime), 19, N'1', 1183)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (90, N'TestDemo-2-2', N'TestDemo-2', N'TestDemo', N'en', N'(測試)資安通報(en)', N'(測試)資安通報(en)', N'testmoda', CAST(N'2022-05-30T16:15:06.230' AS DateTime), N'::1', N'testmoda', CAST(N'2022-05-30T10:51:29.933' AS DateTime), 2, N'1', 89)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (89, N'TestDemo-2-2', N'TestDemo-2', N'TestDemo', N'zh-tw', N'(測試)資安通報', N'(測試)資安通報', N'testmoda', CAST(N'2022-05-30T10:51:29.933' AS DateTime), N'::1', N'testmoda', CAST(N'2022-05-30T10:51:29.933' AS DateTime), 2, N'1', 89)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1190, N'TestDemo-2-20', N'TestDemo-2', N'TestDemo', N'en', N'(測試)Cybersecurity testing of mobile phones', N'(測試)Cybersecurity testing of mobile phones', N'testmoda', CAST(N'2022-08-11T17:28:24.413' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-17T09:11:43.863' AS DateTime), 20, N'1', 1189)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1189, N'TestDemo-2-20', N'TestDemo-2', N'TestDemo', N'zh-tw', N'(測試)手機資安檢測', N'(測試)手機資安檢測', N'testmoda', CAST(N'2022-06-17T09:11:43.863' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-17T09:11:43.863' AS DateTime), 20, N'1', 1189)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1196, N'TestDemo-2-21', N'TestDemo-2', N'TestDemo', N'en', N'(測試)Smartphone System Embedded Software Security (ESS) Certification and Verification', N'(測試)Smartphone System Embedded Software Security (ESS) Certification and Verification', N'testmoda', CAST(N'2022-08-11T21:57:59.913' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-17T13:47:39.240' AS DateTime), 21, N'1', 1195)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1195, N'TestDemo-2-21', N'TestDemo-2', N'TestDemo', N'zh-tw', N'(測試)智慧型手機系統內建軟體資安（ESS）認驗', N'(測試)智慧型手機系統內建軟體資安（ESS）認驗', N'testmoda', CAST(N'2022-06-17T13:47:39.240' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-17T13:47:39.240' AS DateTime), 21, N'1', 1195)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1198, N'TestDemo-2-22', N'TestDemo-2', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2022-06-17T15:18:30.807' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-17T15:18:30.807' AS DateTime), 22, N'1', 1197)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1197, N'TestDemo-2-22', N'TestDemo-2', N'TestDemo', N'zh-tw', N'(測試)智慧型手機所面臨之資安風險', N'(測試)智慧型手機所面臨之資安風險', N'testmoda', CAST(N'2022-06-17T15:18:30.807' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-17T15:18:30.807' AS DateTime), 22, N'1', 1197)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1200, N'TestDemo-2-23', N'TestDemo-2', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2022-06-17T16:16:40.097' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-17T16:16:40.097' AS DateTime), 23, N'1', 1199)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1199, N'TestDemo-2-23', N'TestDemo-2', N'TestDemo', N'zh-tw', N'(測試)資安服務推廣 --濫發商業電子郵件跨國合作防制', N'(測試)資安服務推廣 --濫發商業電子郵件跨國合作防制', N'testmoda', CAST(N'2022-06-17T16:16:40.097' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-17T16:16:40.097' AS DateTime), 23, N'1', 1199)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1208, N'TestDemo-2-24', N'TestDemo-2', N'TestDemo', N'en', N'(測試)Management of eEqual access service and number portability management', N'(測試)Management of eEqual access service and number portability management', N'testmoda', CAST(N'2022-08-12T00:30:59.723' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-18T10:25:38.533' AS DateTime), 24, N'1', 1207)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1207, N'TestDemo-2-24', N'TestDemo-2', N'TestDemo', N'zh-tw', N'(測試)平等接取及號碼可攜管理事項', N'(測試)平等接取及號碼可攜管理事項', N'testmoda', CAST(N'2022-06-18T10:25:38.533' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-18T10:25:38.533' AS DateTime), 24, N'1', 1207)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1214, N'TestDemo-2-25', N'TestDemo-2', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2022-06-18T10:29:01.693' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-18T10:29:01.693' AS DateTime), 25, N'1', 1213)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1213, N'TestDemo-2-25', N'TestDemo-2', N'TestDemo', N'zh-tw', N'(測試)強化電信普及服務', N'(測試)強化電信普及服務', N'testmoda', CAST(N'2022-06-18T10:35:41.787' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-18T10:29:01.693' AS DateTime), 25, N'1', 1213)
GO
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1216, N'TestDemo-2-26', N'TestDemo-2', N'TestDemo', N'en', N'(測試)Telecom Technology Center supervision', N'(測試)Telecom Technology Center supervision', N'testmoda', CAST(N'2022-08-12T00:47:22.240' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-18T10:29:10.180' AS DateTime), 26, N'1', 1215)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1215, N'TestDemo-2-26', N'TestDemo-2', N'TestDemo', N'zh-tw', N'(測試)財團法人電信技術中心之管理事宜', N'(測試)財團法人電信技術中心之管理事宜', N'testmoda', CAST(N'2022-06-18T11:05:18.527' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-18T10:29:10.180' AS DateTime), 26, N'1', 1215)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1224, N'TestDemo-2-27', N'TestDemo-2', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2022-06-18T11:28:19.177' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-18T11:28:19.177' AS DateTime), 27, N'1', 1223)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1223, N'TestDemo-2-27', N'TestDemo-2', N'TestDemo', N'zh-tw', N'(測試)服務列表', N'(測試)服務列表', N'testmoda', CAST(N'2022-06-18T11:28:19.177' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-18T11:28:19.177' AS DateTime), 27, N'1', 1223)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1236, N'TestDemo-2-28', N'TestDemo-2', N'TestDemo', N'en', N'(測試)5G Network Construction Subsidy Plan', N'(測試)5G Network Construction Subsidy Plan', N'testmoda', CAST(N'2022-08-12T00:05:18.453' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-18T21:24:13.413' AS DateTime), 28, N'1', 1235)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1235, N'TestDemo-2-28', N'TestDemo-2', N'TestDemo', N'zh-tw', N'(測試)補助5G網路建設計畫', N'(測試)補助5G網路建設計畫', N'testmoda', CAST(N'2022-06-18T21:24:13.413' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-18T21:24:13.413' AS DateTime), 28, N'1', 1235)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1244, N'TestDemo-2-29', N'TestDemo-2', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2022-06-18T21:26:58.987' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-18T21:26:58.987' AS DateTime), 29, N'1', 1243)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1243, N'TestDemo-2-29', N'TestDemo-2', N'TestDemo', N'zh-tw', N'(測試)改善山林區域（含國家公園）行動通信訊號涵蓋', N'(測試)改善山林區域（含國家公園）行動通信訊號涵蓋', N'testmoda', CAST(N'2022-06-18T21:26:58.987' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-18T21:26:58.987' AS DateTime), 29, N'1', 1243)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1122, N'TestDemo-2-3', N'TestDemo-2', N'TestDemo', N'en', N'(測試)Department of Digital Service', N'(測試)Department of Digital Service', N'testmoda', CAST(N'2022-07-28T14:04:03.190' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-11T15:22:40.760' AS DateTime), 3, N'1', 1121)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1121, N'TestDemo-2-3', N'TestDemo-2', N'TestDemo', N'zh-tw', N'(測試)數位政府司', N'(測試)數位政府司', N'testmoda', CAST(N'2022-06-11T15:24:30.053' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-11T15:22:40.760' AS DateTime), 3, N'1', 1121)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1702, N'TestDemo-2-30', N'TestDemo-2', N'TestDemo', N'zh-tw', N'(測試)公告指定中華電信股份有限公司於特定村里提供112年度數據通信接取普及服務', N'(測試)公告指定中華電信股份有限公司於特定村里提供112年度數據通信接取普及服務', N'testmoda', CAST(N'2022-07-01T14:33:59.653' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-07-01T14:33:59.653' AS DateTime), 30, N'1', 1702)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1706, N'TestDemo-2-31', N'TestDemo-2', N'TestDemo', N'zh-tw', N'(測試)公告中華電信股份有限公司及台灣固網股份有限公司111年度電信普及服務實施計畫', N'(測試)公告中華電信股份有限公司及台灣固網股份有限公司111年度電信普及服務實施計畫', N'testmoda', CAST(N'2022-07-01T15:09:54.487' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-07-01T14:54:09.547' AS DateTime), 31, N'1', 1706)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1708, N'TestDemo-2-32', N'TestDemo-2', N'TestDemo', N'en', N'(測試)111年「電信事業普及服務管理辦法規定之偏遠地區定義及範圍」及「全國各縣市偏遠地區87個鄉（鎮、市、區）及779個村里詳表」', N'(測試)111年「電信事業普及服務管理辦法規定之偏遠地區定義及範圍」及「全國各縣市偏遠地區87個鄉（鎮、市、區）及779個村里詳表」', N'testmoda', CAST(N'2023-01-19T12:13:22.523' AS DateTime), N'192.168.151.136', N'testmoda', CAST(N'2022-07-01T15:00:19.383' AS DateTime), 32, N'1', 1707)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1707, N'TestDemo-2-32', N'TestDemo-2', N'TestDemo', N'zh-tw', N'(測試)111年「電信事業普及服務管理辦法規定之偏遠地區定義及範圍」及「全國各縣市偏遠地區87個鄉（鎮、市、區）及779個村里詳表」', N'(測試)111年「電信事業普及服務管理辦法規定之偏遠地區定義及範圍」及「全國各縣市偏遠地區87個鄉（鎮、市、區）及779個村里詳表」', N'testmoda', CAST(N'2023-01-19T12:12:23.003' AS DateTime), N'192.168.151.136', N'testmoda', CAST(N'2022-07-01T15:00:19.383' AS DateTime), 32, N'1', 1707)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1710, N'TestDemo-2-33', N'TestDemo-2', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2022-07-01T15:07:30.170' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-07-01T15:07:30.170' AS DateTime), 33, N'1', 1709)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1709, N'TestDemo-2-33', N'TestDemo-2', N'TestDemo', N'zh-tw', N'(測試)公告111年度電信普及服務提供者、實施計畫及相關事項', N'(測試)公告111年度電信普及服務提供者、實施計畫及相關事項', N'testmoda', CAST(N'2022-07-01T15:07:30.170' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-07-01T15:07:30.170' AS DateTime), 33, N'1', 1709)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1712, N'TestDemo-2-34', N'TestDemo-2', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2022-07-01T15:44:26.863' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-07-01T15:44:26.863' AS DateTime), 34, N'1', 1711)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1711, N'TestDemo-2-34', N'TestDemo-2', N'TestDemo', N'zh-tw', N'(測試)公告指定中華電信股份有限公司於特定村里提供111年度數據通信接取普及服務', N'(測試)公告指定中華電信股份有限公司於特定村里提供111年度數據通信接取普及服務', N'testmoda', CAST(N'2022-07-01T15:44:26.863' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-07-01T15:44:26.863' AS DateTime), 34, N'1', 1711)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1714, N'TestDemo-2-35', N'TestDemo-2', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2022-07-01T16:13:24.437' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-07-01T16:13:24.437' AS DateTime), 35, N'1', 1713)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1713, N'TestDemo-2-35', N'TestDemo-2', N'TestDemo', N'zh-tw', N'(測試)電信管理法_電信普及服務分攤者營業額申報表', N'(測試)電信管理法_電信普及服務分攤者營業額申報表', N'testmoda', CAST(N'2022-07-01T16:13:24.437' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-07-01T16:13:24.437' AS DateTime), 35, N'1', 1713)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1716, N'TestDemo-2-36', N'TestDemo-2', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2022-07-01T16:28:29.547' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-07-01T16:28:29.547' AS DateTime), 36, N'1', 1715)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1715, N'TestDemo-2-36', N'TestDemo-2', N'TestDemo', N'zh-tw', N'(測試)電信法_第二類電信事業普及服務分攤者營業額申報表', N'(測試)電信法_第二類電信事業普及服務分攤者營業額申報表', N'testmoda', CAST(N'2022-07-01T16:28:29.547' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-07-01T16:28:29.547' AS DateTime), 36, N'1', 1715)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1718, N'TestDemo-2-37', N'TestDemo-2', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2022-07-01T16:42:59.083' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-07-01T16:42:59.083' AS DateTime), 37, N'1', 1717)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1717, N'TestDemo-2-37', N'TestDemo-2', N'TestDemo', N'zh-tw', N'(測試)電信管理法_電信普及服務分攤者營業額申報表', N'(測試)電信管理法_電信普及服務分攤者營業額申報表', N'testmoda', CAST(N'2022-07-01T16:42:59.083' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-07-01T16:42:59.083' AS DateTime), 37, N'1', 1717)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1720, N'TestDemo-2-38', N'TestDemo-2', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2022-07-01T16:46:59.960' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-07-01T16:46:59.960' AS DateTime), 38, N'1', 1719)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1719, N'TestDemo-2-38', N'TestDemo-2', N'TestDemo', N'zh-tw', N'(測試)電信普及服務提供者補助申請書', N'(測試)電信普及服務提供者補助申請書', N'testmoda', CAST(N'2022-07-01T16:46:59.960' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-07-01T16:46:59.960' AS DateTime), 38, N'1', 1719)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1722, N'TestDemo-2-39', N'TestDemo-2', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2022-07-01T16:50:17.183' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-07-01T16:50:17.183' AS DateTime), 39, N'1', 1721)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1721, N'TestDemo-2-39', N'TestDemo-2', N'TestDemo', N'zh-tw', N'(測試)電信普及服務提供者提供語音通信普及服務申請書', N'(測試)電信普及服務提供者提供語音通信普及服務申請書', N'testmoda', CAST(N'2022-07-01T16:50:17.183' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-07-01T16:50:17.183' AS DateTime), 39, N'1', 1721)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1124, N'TestDemo-2-4', N'TestDemo-2', N'TestDemo', N'en', N'(測試)Department of Plural Innovations', N'(測試)Department of Plural Innovations', N'testmoda', CAST(N'2022-07-28T11:34:50.350' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-11T15:22:48.143' AS DateTime), 4, N'1', 1123)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1123, N'TestDemo-2-4', N'TestDemo-2', N'TestDemo', N'zh-tw', N'(測試)多元創新司', N'(測試)多元創新司', N'testmoda', CAST(N'2022-06-11T15:24:37.757' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-11T15:22:48.143' AS DateTime), 4, N'1', 1123)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1841, N'TestDemo-2-40', N'TestDemo-2', N'TestDemo', N'en', N'(測試)international collaboration', N'(測試)international collaboration', N'testmoda', CAST(N'2022-08-24T12:25:14.860' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-08-22T10:27:51.617' AS DateTime), 40, N'1', 1840)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1840, N'TestDemo-2-40', N'TestDemo-2', N'TestDemo', N'zh-tw', N'(測試)國際合作', N'(測試)國際合作', N'testmoda', CAST(N'2022-08-22T10:27:51.617' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-08-22T10:27:51.617' AS DateTime), 40, N'1', 1840)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1851, N'TestDemo-2-41', N'TestDemo-2', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2022-09-01T08:38:24.563' AS DateTime), N'192.168.151.142', N'testmoda', CAST(N'2022-09-01T08:38:24.563' AS DateTime), 41, N'1', 1850)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1850, N'TestDemo-2-41', N'TestDemo-2', N'TestDemo', N'zh-tw', N'(測試)記者會問答', N'(測試)記者會問答', N'testmoda', CAST(N'2022-09-01T08:38:24.563' AS DateTime), N'192.168.151.142', N'testmoda', CAST(N'2022-09-01T08:38:24.563' AS DateTime), 41, N'1', 1850)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1230, N'TestDemo-2-4-1', N'TestDemo-2-4', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2023-01-31T12:04:28.300' AS DateTime), N'192.168.151.142', N'testmoda', CAST(N'2022-06-18T13:08:44.727' AS DateTime), 1, N'-99', 1229)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1229, N'TestDemo-2-4-1', N'TestDemo-2-4', N'TestDemo', N'zh-tw', N'(測試) 資料治理 ', N'(測試) 資料治理 ', N'testmoda', CAST(N'2023-01-31T12:04:28.300' AS DateTime), N'192.168.151.142', N'testmoda', CAST(N'2022-06-18T13:08:44.727' AS DateTime), 1, N'-99', 1229)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1853, N'TestDemo-2-42', N'TestDemo-2', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2022-09-01T08:38:32.633' AS DateTime), N'192.168.151.142', N'testmoda', CAST(N'2022-09-01T08:38:32.633' AS DateTime), 42, N'1', 1852)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1852, N'TestDemo-2-42', N'TestDemo-2', N'TestDemo', N'zh-tw', N'(測試)逐字稿', N'(測試)逐字稿', N'testmoda', CAST(N'2022-09-01T08:38:32.633' AS DateTime), N'192.168.151.142', N'testmoda', CAST(N'2022-09-01T08:38:32.633' AS DateTime), 42, N'1', 1852)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1232, N'TestDemo-2-4-2', N'TestDemo-2-4', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2023-01-31T12:04:17.023' AS DateTime), N'192.168.151.142', N'testmoda', CAST(N'2022-06-18T13:08:51.010' AS DateTime), 2, N'-99', 1231)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1231, N'TestDemo-2-4-2', N'TestDemo-2-4', N'TestDemo', N'zh-tw', N'(測試) OPEN DATA ', N'(測試) OPEN DATA ', N'testmoda', CAST(N'2023-01-31T12:04:17.023' AS DateTime), N'192.168.151.142', N'testmoda', CAST(N'2022-06-18T13:08:51.010' AS DateTime), 2, N'-99', 1231)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1234, N'TestDemo-2-4-3', N'TestDemo-2-4', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2023-01-31T12:03:59.253' AS DateTime), N'192.168.151.142', N'testmoda', CAST(N'2022-06-18T13:09:00.773' AS DateTime), 3, N'-99', 1233)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1233, N'TestDemo-2-4-3', N'TestDemo-2-4', N'TestDemo', N'zh-tw', N'(測試) 數據公益 ', N'(測試) 數據公益 ', N'testmoda', CAST(N'2023-01-31T12:03:59.253' AS DateTime), N'192.168.151.142', N'testmoda', CAST(N'2022-06-18T13:09:00.773' AS DateTime), 3, N'-99', 1233)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1130, N'TestDemo-2-5', N'TestDemo-2', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2022-06-15T14:29:05.437' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-15T14:29:05.437' AS DateTime), 5, N'1', 1129)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1129, N'TestDemo-2-5', N'TestDemo-2', N'TestDemo', N'zh-tw', N'(測試)資料治理', N'(測試)資料治理', N'testmoda', CAST(N'2022-06-15T14:29:05.437' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-15T14:29:05.437' AS DateTime), 5, N'1', 1129)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1134, N'TestDemo-2-6', N'TestDemo-2', N'TestDemo', N'en', N'(測試)OPEN DATA', N'(測試)OPEN DATA', N'testmoda', CAST(N'2022-08-22T09:27:00.523' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-15T15:04:16.597' AS DateTime), 6, N'1', 1133)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1133, N'TestDemo-2-6', N'TestDemo-2', N'TestDemo', N'zh-tw', N'(測試)OPEN DATA', N'(測試)OPEN DATA', N'testmoda', CAST(N'2022-06-15T15:04:16.597' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-15T15:04:16.597' AS DateTime), 6, N'1', 1133)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1142, N'TestDemo-2-7', N'TestDemo-2', N'TestDemo', N'en', N'(測試)Data altruism', N'(測試)Data altruism', N'testmoda', CAST(N'2022-08-24T14:18:58.603' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-15T15:48:19.437' AS DateTime), 7, N'1', 1141)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1141, N'TestDemo-2-7', N'TestDemo-2', N'TestDemo', N'zh-tw', N'(測試)數據公益', N'(測試)數據公益', N'testmoda', CAST(N'2022-06-15T15:48:19.437' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-15T15:48:19.437' AS DateTime), 7, N'1', 1141)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1144, N'TestDemo-2-8', N'TestDemo-2', N'TestDemo', N'en', N'(測試)resource management', N'(測試)resource management', N'testmoda', CAST(N'2022-08-05T10:18:24.497' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-15T16:47:06.577' AS DateTime), 8, N'1', 1143)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1143, N'TestDemo-2-8', N'TestDemo-2', N'TestDemo', N'zh-tw', N'(測試)資源管理', N'(測試)資源管理', N'testmoda', CAST(N'2022-06-15T16:47:06.577' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-15T16:47:06.577' AS DateTime), 8, N'1', 1143)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1152, N'TestDemo-2-9', N'TestDemo-2', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2022-06-16T09:37:14.507' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-16T09:37:14.507' AS DateTime), 9, N'1', 1151)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1151, N'TestDemo-2-9', N'TestDemo-2', N'TestDemo', N'zh-tw', N'(測試)先進網路之整備規劃', N'(測試)先進網路之整備規劃', N'testmoda', CAST(N'2022-06-16T09:37:14.507' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-16T09:37:14.507' AS DateTime), 9, N'1', 1151)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (92, N'TestDemo-3', N'TestDemo', N'TestDemo', N'en', N'(測試)Overall Performance', N'(測試)Overall Performance', N'testmoda', CAST(N'2022-09-06T17:05:00.233' AS DateTime), N'192.168.151.161', N'testmoda', CAST(N'2022-05-30T11:03:53.140' AS DateTime), 10, N'1', 91)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (91, N'TestDemo-3', N'TestDemo', N'TestDemo', N'zh-tw', N'(測試)整體績效', N'(測試)整體績效', N'testmoda', CAST(N'2022-09-06T17:05:00.233' AS DateTime), N'192.168.151.161', N'testmoda', CAST(N'2022-05-30T11:03:53.140' AS DateTime), 12, N'1', 91)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (100, N'TestDemo-3-1', N'TestDemo-3', N'TestDemo', N'en', N'(測試)smart government', N'(測試)smart government', N'testmoda', CAST(N'2022-07-28T14:28:24.057' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-05-30T11:05:12.783' AS DateTime), 1, N'1', 99)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (99, N'TestDemo-3-1', N'TestDemo-3', N'TestDemo', N'zh-tw', N'(測試)智慧政府', N'(測試)智慧政府', N'testmoda', CAST(N'2022-06-11T15:22:59.033' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-05-30T11:05:12.783' AS DateTime), 1, N'1', 99)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (102, N'TestDemo-3-2', N'TestDemo-3', N'TestDemo', N'en', N'(測試)Open government', N'(測試)Open government', N'testmoda', CAST(N'2022-08-22T09:27:15.470' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-05-30T11:05:21.367' AS DateTime), 2, N'1', 101)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (101, N'TestDemo-3-2', N'TestDemo-3', N'TestDemo', N'zh-tw', N'(測試)開放政府', N'(測試)開放政府', N'testmoda', CAST(N'2022-06-15T15:05:45.547' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-05-30T11:05:21.367' AS DateTime), 2, N'1', 101)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1146, N'TestDemo-3-3', N'TestDemo-3', N'TestDemo', N'en', N'(測試)resource management', N'(測試)resource management', N'testmoda', CAST(N'2022-08-05T10:18:39.220' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-15T16:47:22.193' AS DateTime), 3, N'1', 1145)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1145, N'TestDemo-3-3', N'TestDemo-3', N'TestDemo', N'zh-tw', N'(測試)資源管理', N'(測試)資源管理', N'testmoda', CAST(N'2022-06-15T16:47:22.193' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-15T16:47:22.193' AS DateTime), 3, N'1', 1145)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1238, N'TestDemo-3-4', N'TestDemo-3', N'TestDemo', N'en', N'(測試)Increase coverage rate in non-rural areas', N'(測試)Increase coverage rate in non-rural areas', N'testmoda', CAST(N'2022-08-12T00:03:57.763' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-18T21:24:25.860' AS DateTime), 4, N'1', 1237)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1237, N'TestDemo-3-4', N'TestDemo-3', N'TestDemo', N'zh-tw', N'(測試)提升非偏鄉人口涵蓋率', N'(測試)提升非偏鄉人口涵蓋率', N'testmoda', CAST(N'2022-06-18T21:24:25.860' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-18T21:24:25.860' AS DateTime), 4, N'1', 1237)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (94, N'TestDemo-4', N'TestDemo', N'TestDemo', N'en', N'(測試)Policies', N'(測試)Policies', N'testmoda', CAST(N'2022-09-06T17:05:00.233' AS DateTime), N'192.168.151.161', N'testmoda', CAST(N'2022-05-30T11:04:08.113' AS DateTime), 14, N'1', 93)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (93, N'TestDemo-4', N'TestDemo', N'TestDemo', N'zh-tw', N'(測試)政策計畫', N'(測試)政策計畫', N'testmoda', CAST(N'2022-09-06T17:05:00.233' AS DateTime), N'192.168.151.161', N'testmoda', CAST(N'2022-05-30T11:04:08.113' AS DateTime), 16, N'1', 93)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (104, N'TestDemo-4-1', N'TestDemo-4', N'TestDemo', N'en', N'(測試)Digital Government Program 2.0 of Taiwan (2021-2025)', N'(測試)Digital Government Program 2.0 of Taiwan (2021-2025)', N'testmoda', CAST(N'2022-07-28T11:33:52.253' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-05-30T11:11:42.200' AS DateTime), 1, N'1', 103)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (103, N'TestDemo-4-1', N'TestDemo-4', N'TestDemo', N'zh-tw', N'(測試)服務型智慧政府2.0推動計畫（110年-114年）', N'(測試)服務型智慧政府2.0推動計畫（110年-114年）', N'testmoda', CAST(N'2022-07-01T11:11:25.433' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-05-30T11:11:42.200' AS DateTime), 1, N'1', 103)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (106, N'TestDemo-4-2', N'TestDemo-4', N'TestDemo', N'en', N'(測試)Smart Taiwan Program (2021-2025)', N'(測試)Smart Taiwan Program (2021-2025)', N'testmoda', CAST(N'2022-07-28T11:34:07.367' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-05-30T11:11:53.250' AS DateTime), 2, N'1', 105)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (105, N'TestDemo-4-2', N'TestDemo-4', N'TestDemo', N'zh-tw', N'(測試)智慧國家方案（2021-2025 年）', N'(測試)智慧國家方案（2021-2025 年）', N'testmoda', CAST(N'2022-07-01T11:11:42.283' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-05-30T11:11:53.250' AS DateTime), 2, N'1', 105)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1126, N'TestDemo-4-3', N'TestDemo-4', N'TestDemo', N'en', N'(測試)Forward-looking Program – Digital Infrastructure –Cloud Infrastructure for Public Network Services and Computing Strengthening Plan (2021-2025)', N'(測試)Forward-looking Program – Digital Infrastructure –Cloud Infrastructure for Public Network Services and Computing Strengthening Plan (2021-2025)', N'testmoda', CAST(N'2022-07-28T15:19:45.200' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-11T15:44:50.087' AS DateTime), 3, N'1', 1125)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1125, N'TestDemo-4-3', N'TestDemo-4', N'TestDemo', N'zh-tw', N'(測試)前瞻計畫-數位建設-強化公部門網路服務與運算雲端基礎設施計畫（110-114年）', N'(測試)前瞻計畫-數位建設-強化公部門網路服務與運算雲端基礎設施計畫（110-114年）', N'testmoda', CAST(N'2022-07-01T11:12:06.350' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-11T15:44:50.087' AS DateTime), 3, N'1', 1125)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1128, N'TestDemo-4-4', N'TestDemo-4', N'TestDemo', N'en', N'(測試)Service-oriented Smart Government Launch Plan (2017-2020)', N'(測試)Service-oriented Smart Government Launch Plan (2017-2020)', N'testmoda', CAST(N'2022-08-18T15:02:51.553' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-15T13:59:06.127' AS DateTime), 4, N'1', 1127)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1127, N'TestDemo-4-4', N'TestDemo-4', N'TestDemo', N'zh-tw', N'(測試)服務型智慧政府推動計畫（106年-109年）', N'(測試)服務型智慧政府推動計畫（106年-109年）', N'testmoda', CAST(N'2022-07-01T11:12:25.213' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-15T13:59:06.127' AS DateTime), 4, N'1', 1127)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1148, N'TestDemo-4-5', N'TestDemo-4', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2022-06-15T16:48:07.493' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-15T16:48:07.493' AS DateTime), 5, N'1', 1147)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1147, N'TestDemo-4-5', N'TestDemo-4', N'TestDemo', N'zh-tw', N'(測試)5G/B5G電信資源整備及通訊網路發展研究計畫（110-113年）', N'(測試)5G/B5G電信資源整備及通訊網路發展研究計畫（110-113年）', N'testmoda', CAST(N'2022-06-15T16:48:07.493' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-15T16:48:07.493' AS DateTime), 5, N'1', 1147)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1240, N'TestDemo-4-6', N'TestDemo-4', N'TestDemo', N'en', N'(測試)Forward-looking Infrastructure Development Program', N'(測試)Forward-looking Infrastructure Development Program', N'testmoda', CAST(N'2022-08-12T00:04:13.707' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-18T21:24:38.353' AS DateTime), 6, N'1', 1239)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1239, N'TestDemo-4-6', N'TestDemo-4', N'TestDemo', N'zh-tw', N'(測試)前瞻基礎建設計畫', N'(測試)前瞻基礎建設計畫', N'testmoda', CAST(N'2022-06-18T21:24:38.353' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-18T21:24:38.353' AS DateTime), 6, N'1', 1239)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1839, N'TestDemo-4-7', N'TestDemo-4', N'TestDemo', N'en', N'(測試)Service-oriented Smart Government 2.0 Launch Plan (2021-2025)', N'(測試)Service-oriented Smart Government 2.0 Launch Plan (2021-2025)', N'testmoda', CAST(N'2022-08-22T09:31:00.553' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-08-22T09:30:49.173' AS DateTime), 7, N'1', 1838)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1838, N'TestDemo-4-7', N'TestDemo-4', N'TestDemo', N'zh-tw', N'(測試)服務型智慧政府2.0推動計畫(110年-114年)', N'(測試)服務型智慧政府2.0推動計畫(110年-114年)', N'testmoda', CAST(N'2022-08-22T09:30:49.173' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-08-22T09:30:49.173' AS DateTime), 7, N'1', 1838)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (96, N'TestDemo-5', N'TestDemo', N'TestDemo', N'en', N'(測試)Function', N'(測試)Function', N'testmoda', CAST(N'2022-09-06T17:05:00.233' AS DateTime), N'192.168.151.161', N'testmoda', CAST(N'2022-05-30T11:04:30.087' AS DateTime), 18, N'1', 95)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (95, N'TestDemo-5', N'TestDemo', N'TestDemo', N'zh-tw', N'(測試)業務分類', N'(測試)業務分類', N'testmoda', CAST(N'2022-09-06T17:05:00.233' AS DateTime), N'192.168.151.161', N'testmoda', CAST(N'2022-05-30T11:04:30.087' AS DateTime), 20, N'1', 95)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (108, N'TestDemo-5-1', N'TestDemo-5', N'TestDemo', N'en', N'(測試)Digital government', N'(測試)Digital government', N'testmoda', CAST(N'2022-07-28T14:31:35.347' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-05-30T11:12:41.873' AS DateTime), 1, N'1', 107)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (107, N'TestDemo-5-1', N'TestDemo-5', N'TestDemo', N'zh-tw', N'(測試)數位政府', N'(測試)數位政府', N'testmoda', CAST(N'2022-06-11T15:23:30.990' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-05-30T11:12:41.873' AS DateTime), 1, N'1', 107)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1170, N'TestDemo-5-10', N'TestDemo-5', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2022-06-16T14:30:52.187' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-16T14:30:52.187' AS DateTime), 10, N'1', 1169)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1169, N'TestDemo-5-10', N'TestDemo-5', N'TestDemo', N'zh-tw', N'(測試)通訊網路資安審驗', N'(測試)通訊網路資安審驗', N'testmoda', CAST(N'2022-06-16T14:30:52.187' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-16T14:30:52.187' AS DateTime), 10, N'1', 1169)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1174, N'TestDemo-5-11', N'TestDemo-5', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2022-06-16T14:40:06.017' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-16T14:40:06.017' AS DateTime), 11, N'1', 1173)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1173, N'TestDemo-5-11', N'TestDemo-5', N'TestDemo', N'zh-tw', N'(測試)通傳事業資安管理', N'(測試)通傳事業資安管理', N'testmoda', CAST(N'2022-06-16T14:40:06.017' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-16T14:40:06.017' AS DateTime), 11, N'1', 1173)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1178, N'TestDemo-5-12', N'TestDemo-5', N'TestDemo', N'en', N'(測試)Critical telecommunicationss infrastructure and information communications equipment', N'(測試)Critical telecommunicationss infrastructure and information communications equipment', N'testmoda', CAST(N'2022-08-11T16:23:18.873' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-16T14:57:27.793' AS DateTime), 12, N'1', 1177)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1177, N'TestDemo-5-12', N'TestDemo-5', N'TestDemo', N'zh-tw', N'(測試)關鍵電信基礎設施資通設備', N'(測試)關鍵電信基礎設施資通設備', N'testmoda', CAST(N'2022-06-16T14:57:27.793' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-16T14:57:27.793' AS DateTime), 12, N'1', 1177)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1182, N'TestDemo-5-13', N'TestDemo-5', N'TestDemo', N'en', N'(測試)Information and communications equipment certification', N'(測試)Information and communications equipment certification', N'testmoda', CAST(N'2022-08-11T16:59:09.767' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-16T14:58:13.277' AS DateTime), 13, N'1', 1181)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1181, N'TestDemo-5-13', N'TestDemo-5', N'TestDemo', N'zh-tw', N'(測試)通傳資通設備驗證', N'(測試)通傳資通設備驗證', N'testmoda', CAST(N'2022-06-16T14:58:13.277' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-16T14:58:13.277' AS DateTime), 13, N'1', 1181)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1186, N'TestDemo-5-14', N'TestDemo-5', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2022-06-16T16:37:53.093' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-16T16:37:53.093' AS DateTime), 14, N'1', 1185)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1185, N'TestDemo-5-14', N'TestDemo-5', N'TestDemo', N'zh-tw', N'(測試)資安服務推廣--資通設備安全驗證', N'(測試)資安服務推廣--資通設備安全驗證', N'testmoda', CAST(N'2022-06-16T16:37:53.093' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-16T16:37:53.093' AS DateTime), 14, N'1', 1185)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1188, N'TestDemo-5-15', N'TestDemo-5', N'TestDemo', N'en', N'(測試)cybersecurity joint defense of telecommunications networks ', N'(測試)cybersecurity joint defense of telecommunications networks ', N'testmoda', CAST(N'2022-08-12T00:12:30.130' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-16T16:51:06.843' AS DateTime), 15, N'1', 1187)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1187, N'TestDemo-5-15', N'TestDemo-5', N'TestDemo', N'zh-tw', N'(測試)通傳網路資安聯防', N'(測試)通傳網路資安聯防', N'testmoda', CAST(N'2022-06-16T16:51:06.843' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-16T16:51:06.843' AS DateTime), 15, N'1', 1187)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1192, N'TestDemo-5-16', N'TestDemo-5', N'TestDemo', N'en', N'(測試)inspections of the embedded software of mobile phones', N'(測試)inspections of the embedded software of mobile phones', N'testmoda', CAST(N'2022-08-11T17:27:59.257' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-17T09:11:54.867' AS DateTime), 16, N'1', 1191)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1191, N'TestDemo-5-16', N'TestDemo-5', N'TestDemo', N'zh-tw', N'(測試)手機內建軟體抽測', N'(測試)手機內建軟體抽測', N'testmoda', CAST(N'2022-06-17T09:11:54.867' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-17T09:11:54.867' AS DateTime), 16, N'1', 1191)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1194, N'TestDemo-5-17', N'TestDemo-5', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2022-06-17T10:40:54.157' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-17T10:40:54.160' AS DateTime), 17, N'1', 1193)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1193, N'TestDemo-5-17', N'TestDemo-5', N'TestDemo', N'zh-tw', N'(測試)手機內建軟體規範', N'(測試)手機內建軟體規範', N'testmoda', CAST(N'2022-06-17T10:40:54.157' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-17T10:40:54.160' AS DateTime), 17, N'1', 1193)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1202, N'TestDemo-5-18', N'TestDemo-5', N'TestDemo', N'en', N'(測試)Cyber security service promotion—information and communication equipment security certification', N'(測試)Cyber security service promotion—information and communication equipment security certification', N'testmoda', CAST(N'2022-08-11T17:05:38.617' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-17T16:20:00.807' AS DateTime), 18, N'1', 1201)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1201, N'TestDemo-5-18', N'TestDemo-5', N'TestDemo', N'zh-tw', N'(測試)資安服務推廣 --濫發商業電子郵件跨國合作防制', N'(測試)資安服務推廣 --濫發商業電子郵件跨國合作防制', N'testmoda', CAST(N'2022-06-17T16:20:00.807' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-17T16:20:00.807' AS DateTime), 18, N'1', 1201)
GO
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1206, N'TestDemo-5-19', N'TestDemo-5', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2022-06-18T09:54:17.087' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-18T09:54:17.090' AS DateTime), 19, N'1', 1205)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1205, N'TestDemo-5-19', N'TestDemo-5', N'TestDemo', N'zh-tw', N'(測試)垃圾郵件防制', N'(測試)垃圾郵件防制', N'testmoda', CAST(N'2022-06-18T09:54:17.087' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-18T09:54:17.090' AS DateTime), 19, N'1', 1205)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (110, N'TestDemo-5-2', N'TestDemo-5', N'TestDemo', N'en', N'(測試)Basic Service', N'(測試)Basic Service', N'testmoda', CAST(N'2022-08-05T15:50:36.510' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-05-30T11:12:52.363' AS DateTime), 2, N'1', 109)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (109, N'TestDemo-5-2', N'TestDemo-5', N'TestDemo', N'zh-tw', N'(測試)基礎服務', N'(測試)基礎服務', N'testmoda', CAST(N'2022-06-14T11:30:09.677' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-05-30T11:12:52.363' AS DateTime), 2, N'1', 109)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1210, N'TestDemo-5-20', N'TestDemo-5', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2022-06-18T10:26:07.100' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-18T10:26:07.100' AS DateTime), 20, N'1', 1209)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1209, N'TestDemo-5-20', N'TestDemo-5', N'TestDemo', N'zh-tw', N'(測試)平等接取服務', N'(測試)平等接取服務', N'testmoda', CAST(N'2022-06-18T10:26:07.100' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-18T10:26:07.100' AS DateTime), 20, N'1', 1209)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1212, N'TestDemo-5-21', N'TestDemo-5', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2022-06-18T10:26:18.640' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-18T10:26:18.640' AS DateTime), 21, N'1', 1211)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1211, N'TestDemo-5-21', N'TestDemo-5', N'TestDemo', N'zh-tw', N'(測試)號碼可攜服務', N'(測試)號碼可攜服務', N'testmoda', CAST(N'2022-06-18T10:26:18.640' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-18T10:26:18.640' AS DateTime), 21, N'1', 1211)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1218, N'TestDemo-5-22', N'TestDemo-5', N'TestDemo', N'en', N'(測試)Telecommunications policy, technology think tank, industry development research', N'(測試)Telecommunications policy, technology think tank, industry development research', N'testmoda', CAST(N'2022-08-12T00:47:58.107' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-18T11:05:30.353' AS DateTime), 22, N'1', 1217)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1217, N'TestDemo-5-22', N'TestDemo-5', N'TestDemo', N'zh-tw', N'(測試)通傳政策及技術智庫及產業發展研究', N'(測試)通傳政策及技術智庫及產業發展研究', N'testmoda', CAST(N'2022-06-18T11:05:30.353' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-18T11:05:30.353' AS DateTime), 22, N'1', 1217)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1220, N'TestDemo-5-23', N'TestDemo-5', N'TestDemo', N'en', N'(測試)Telecommunications equipment certification service', N'(測試)Telecommunications equipment certification service', N'testmoda', CAST(N'2022-08-12T00:48:08.823' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-18T11:05:37.743' AS DateTime), 23, N'1', 1219)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1219, N'TestDemo-5-23', N'TestDemo-5', N'TestDemo', N'zh-tw', N'(測試)電信設備審驗認證服務', N'(測試)電信設備審驗認證服務', N'testmoda', CAST(N'2022-06-18T11:05:37.743' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-18T11:05:37.743' AS DateTime), 23, N'1', 1219)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1222, N'TestDemo-5-24', N'TestDemo-5', N'TestDemo', N'en', N'(測試)Third-party NP platform management service', N'(測試)Third-party NP platform management service', N'testmoda', CAST(N'2022-08-12T00:48:28.420' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-18T11:05:46.030' AS DateTime), 24, N'1', 1221)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1221, N'TestDemo-5-24', N'TestDemo-5', N'TestDemo', N'zh-tw', N'(測試)第三方NP平台管理服務', N'(測試)第三方NP平台管理服務', N'testmoda', CAST(N'2022-06-18T11:05:46.030' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-18T11:05:46.030' AS DateTime), 24, N'1', 1221)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1226, N'TestDemo-5-25', N'TestDemo-5', N'TestDemo', N'en', N'(測試)cybersecurity of telecommunications operators', N'(測試)cybersecurity of telecommunications operators', N'testmoda', CAST(N'2022-08-12T00:22:11.093' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-18T11:28:28.767' AS DateTime), 25, N'1', 1225)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1225, N'TestDemo-5-25', N'TestDemo-5', N'TestDemo', N'zh-tw', N'(測試)通傳事業資通安全', N'(測試)通傳事業資通安全', N'testmoda', CAST(N'2022-06-18T11:28:28.767' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-18T11:28:28.767' AS DateTime), 25, N'1', 1225)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1228, N'TestDemo-5-26', N'TestDemo-5', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2022-06-18T11:44:04.050' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-18T11:44:04.050' AS DateTime), 26, N'1', 1227)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1227, N'TestDemo-5-26', N'TestDemo-5', N'TestDemo', N'zh-tw', N'(測試)通傳網路資安聯防', N'(測試)通傳網路資安聯防', N'testmoda', CAST(N'2022-06-18T11:44:04.050' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-18T11:44:04.050' AS DateTime), 26, N'1', 1227)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1242, N'TestDemo-5-27', N'TestDemo-5', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2022-06-18T21:24:48.987' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-18T21:24:48.987' AS DateTime), 27, N'1', 1241)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1241, N'TestDemo-5-27', N'TestDemo-5', N'TestDemo', N'zh-tw', N'(測試)通訊網路建設規劃', N'(測試)通訊網路建設規劃', N'testmoda', CAST(N'2022-06-18T21:24:48.987' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-18T21:24:48.987' AS DateTime), 27, N'1', 1241)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1843, N'TestDemo-5-28', N'TestDemo-5', N'TestDemo', N'en', N'(測試)international collaboration', N'(測試)international collaboration', N'testmoda', CAST(N'2022-08-24T12:25:24.167' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-08-22T10:27:59.030' AS DateTime), 28, N'1', 1842)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1842, N'TestDemo-5-28', N'TestDemo-5', N'TestDemo', N'zh-tw', N'(測試)國際合作', N'(測試)國際合作', N'testmoda', CAST(N'2022-08-22T10:27:59.030' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-08-22T10:27:59.030' AS DateTime), 28, N'1', 1842)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1132, N'TestDemo-5-3', N'TestDemo-5', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2022-06-15T14:29:22.130' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-15T14:29:22.130' AS DateTime), 3, N'1', 1131)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1131, N'TestDemo-5-3', N'TestDemo-5', N'TestDemo', N'zh-tw', N'(測試)資料治理', N'(測試)資料治理', N'testmoda', CAST(N'2022-06-15T14:29:22.130' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-15T14:29:22.130' AS DateTime), 3, N'1', 1131)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1136, N'TestDemo-5-4', N'TestDemo-5', N'TestDemo', N'en', N'(測試)Main Operations', N'(測試)Main Operations', N'testmoda', CAST(N'2022-08-22T09:28:00.697' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-15T15:06:17.437' AS DateTime), 4, N'1', 1135)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1135, N'TestDemo-5-4', N'TestDemo-5', N'TestDemo', N'zh-tw', N'(測試)主要業務', N'(測試)主要業務', N'testmoda', CAST(N'2022-06-15T15:06:17.437' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-15T15:06:17.437' AS DateTime), 4, N'1', 1135)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1138, N'TestDemo-5-5', N'TestDemo-5', N'TestDemo', N'en', N'(測試)Digital Development Planning', N'(測試)Digital Development Planning', N'testmoda', CAST(N'2022-08-22T09:28:09.343' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-15T15:06:28.220' AS DateTime), 5, N'1', 1137)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1137, N'TestDemo-5-5', N'TestDemo-5', N'TestDemo', N'zh-tw', N'(測試)數位發展規劃', N'(測試)數位發展規劃', N'testmoda', CAST(N'2022-06-15T15:06:28.220' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-15T15:06:28.220' AS DateTime), 5, N'1', 1137)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1140, N'TestDemo-5-6', N'TestDemo-5', N'TestDemo', N'en', N'(測試)Government Open Data', N'(測試)Government Open Data', N'testmoda', CAST(N'2022-08-22T09:28:19.133' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-15T15:06:35.890' AS DateTime), 6, N'1', 1139)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1139, N'TestDemo-5-6', N'TestDemo-5', N'TestDemo', N'zh-tw', N'(測試)政府資料開放', N'(測試)政府資料開放', N'testmoda', CAST(N'2022-06-15T15:06:35.890' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-15T15:06:35.890' AS DateTime), 6, N'1', 1139)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1150, N'TestDemo-5-7', N'TestDemo-5', N'TestDemo', N'en', N'(測試)resource management', N'(測試)resource management', N'testmoda', CAST(N'2022-08-05T10:18:52.093' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-15T16:55:18.310' AS DateTime), 7, N'1', 1149)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1149, N'TestDemo-5-7', N'TestDemo-5', N'TestDemo', N'zh-tw', N'(測試)資源管理', N'(測試)資源管理', N'testmoda', CAST(N'2022-06-15T16:55:18.310' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-15T16:55:18.310' AS DateTime), 7, N'1', 1149)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1156, N'TestDemo-5-8', N'TestDemo-5', N'TestDemo', N'en', N'(測試)Planning of the constructions of communications networks', N'(測試)Planning of the constructions of communications networks', N'testmoda', CAST(N'2022-08-12T00:04:37.580' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-16T09:54:42.780' AS DateTime), 8, N'1', 1155)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1155, N'TestDemo-5-8', N'TestDemo-5', N'TestDemo', N'zh-tw', N'(測試)通訊網路建設規劃', N'(測試)通訊網路建設規劃', N'testmoda', CAST(N'2022-06-16T09:54:42.780' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-16T09:54:42.780' AS DateTime), 8, N'1', 1155)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1166, N'TestDemo-5-9', N'TestDemo-5', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2022-06-16T14:19:54.493' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-16T14:19:54.493' AS DateTime), 9, N'1', 1165)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1165, N'TestDemo-5-9', N'TestDemo-5', N'TestDemo', N'zh-tw', N'(測試)通訊網路技術研發', N'(測試)通訊網路技術研發', N'testmoda', CAST(N'2022-06-16T14:19:54.493' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-16T14:19:54.493' AS DateTime), 9, N'1', 1165)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (98, N'TestDemo-6', N'TestDemo', N'TestDemo', N'en', N'(測試)Audience', N'(測試)Audience', N'testmoda', CAST(N'2022-09-06T17:05:00.233' AS DateTime), N'192.168.151.161', N'testmoda', CAST(N'2022-05-30T11:04:41.650' AS DateTime), 26, N'1', 97)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (97, N'TestDemo-6', N'TestDemo', N'TestDemo', N'zh-tw', N'(測試)服務對象', N'(測試)服務對象', N'testmoda', CAST(N'2022-09-06T17:05:00.233' AS DateTime), N'192.168.151.161', N'testmoda', CAST(N'2022-05-30T11:04:41.650' AS DateTime), 28, N'1', 97)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (112, N'TestDemo-6-1', N'TestDemo-6', N'TestDemo', N'en', N'(測試)Public', N'(測試)Public', N'testmoda', CAST(N'2022-08-05T10:06:14.483' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-05-30T11:13:18.453' AS DateTime), 1, N'1', 111)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (111, N'TestDemo-6-1', N'TestDemo-6', N'TestDemo', N'zh-tw', N'(測試)民眾', N'(測試)民眾', N'testmoda', CAST(N'2022-05-30T11:13:18.453' AS DateTime), N'127.0.0.1', N'testmoda', CAST(N'2022-05-30T11:13:18.453' AS DateTime), 1, N'1', 111)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (114, N'TestDemo-6-2', N'TestDemo-6', N'TestDemo', N'en', N'(測試)Businesses/non-government organizations', N'(測試)Businesses/non-government organizations', N'testmoda', CAST(N'2022-08-05T10:06:28.427' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-05-30T11:13:31.650' AS DateTime), 2, N'1', 113)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (113, N'TestDemo-6-2', N'TestDemo-6', N'TestDemo', N'zh-tw', N'(測試)企業/民間團體', N'(測試)企業/民間團體', N'testmoda', CAST(N'2022-05-30T11:13:31.650' AS DateTime), N'127.0.0.1', N'testmoda', CAST(N'2022-05-30T11:13:31.650' AS DateTime), 2, N'1', 113)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (116, N'TestDemo-6-3', N'TestDemo-6', N'TestDemo', N'en', N'(測試)Government agencies', N'(測試)Government agencies', N'testmoda', CAST(N'2022-08-05T10:06:37.980' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-05-30T11:13:40.670' AS DateTime), 3, N'1', 115)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (115, N'TestDemo-6-3', N'TestDemo-6', N'TestDemo', N'zh-tw', N'(測試)政府機關', N'(測試)政府機關', N'testmoda', CAST(N'2022-05-30T11:13:40.670' AS DateTime), N'127.0.0.1', N'testmoda', CAST(N'2022-05-30T11:13:40.670' AS DateTime), 3, N'1', 115)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1094, N'TestDemo-7', N'TestDemo', N'TestDemo', N'en', N'(測試)前台UI', N'(測試)前台UI文字', N'testmoda', CAST(N'2022-09-06T17:05:00.233' AS DateTime), N'192.168.151.161', N'testmoda', CAST(N'2022-06-10T15:35:57.397' AS DateTime), 30, N'1', 1093)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1093, N'TestDemo-7', N'TestDemo', N'TestDemo', N'zh-tw', N'(測試)前台UI 文字', N'(測試)前台UI', N'testmoda', CAST(N'2022-09-06T17:05:00.233' AS DateTime), N'192.168.151.161', N'testmoda', CAST(N'2022-06-10T15:35:57.397' AS DateTime), 32, N'1', 1093)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1096, N'TestDemo-7-1', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Enter KeyWords', N'(測試)請輸入關鍵字', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-10T15:36:19.640' AS DateTime), 1, N'1', 1095)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1095, N'TestDemo-7-1', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)請輸入關鍵字', N'(測試)單元查詢框內的文字', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-10T15:36:19.640' AS DateTime), 1, N'1', 1095)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1114, N'TestDemo-7-10', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Search KeyWords', N'(測試)送出關鍵字查詢', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-10T16:40:08.340' AS DateTime), 10, N'1', 1113)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1113, N'TestDemo-7-10', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)送出關鍵字查詢', N'(測試)送出關鍵字查詢', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-10T16:40:08.340' AS DateTime), 10, N'1', 1113)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1204, N'TestDemo-7-11', N'TestDemo-7', N'TestDemo', N'en', N'(測試)No results', N'(測試)查無任何資訊', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-18T08:33:24.603' AS DateTime), 11, N'1', 1203)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1203, N'TestDemo-7-11', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)查無任何資訊', N'(測試)查無任何資訊', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-18T08:33:24.603' AS DateTime), 11, N'1', 1203)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1377, N'TestDemo-7-12', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Search', N'(測試)網站搜尋', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-22T15:23:40.307' AS DateTime), 12, N'1', 1376)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1376, N'TestDemo-7-12', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)網站搜尋', N'(測試)Google 站內搜尋', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-22T15:23:40.307' AS DateTime), 12, N'1', 1376)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1379, N'TestDemo-7-13', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Opinion Box', N'(測試)擴充01', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-22T15:23:47.340' AS DateTime), 13, N'1', 1378)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1378, N'TestDemo-7-13', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)擴充01', N'(測試)擴充01', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-22T15:23:47.340' AS DateTime), 13, N'1', 1378)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1381, N'TestDemo-7-14', N'TestDemo-7', N'TestDemo', N'en', N'(測試)中文版', N'(測試)中文版', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-22T15:23:54.487' AS DateTime), 14, N'1', 1380)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1380, N'TestDemo-7-14', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)English', N'(測試)英文版', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-22T15:23:54.487' AS DateTime), 14, N'1', 1380)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1383, N'TestDemo-7-15', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Large', N'(測試)大字級', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-22T15:24:09.913' AS DateTime), 15, N'1', 1382)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1382, N'TestDemo-7-15', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)大字級', N'(測試)大字級', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-22T15:24:09.913' AS DateTime), 15, N'1', 1382)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1385, N'TestDemo-7-16', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Medium', N'(測試)中字級', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-22T15:24:23.140' AS DateTime), 16, N'1', 1384)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1384, N'TestDemo-7-16', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)中字級', N'(測試)中字級', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-22T15:24:23.140' AS DateTime), 16, N'1', 1384)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1387, N'TestDemo-7-17', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Small', N'(測試)小字級', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-22T15:24:32.923' AS DateTime), 17, N'1', 1386)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1386, N'TestDemo-7-17', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)小字級', N'(測試)小字級', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-22T15:24:32.923' AS DateTime), 17, N'1', 1386)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1389, N'TestDemo-7-18', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Advanced Search (open in new window)', N'(測試)進階搜尋(另開新視窗)', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-22T15:25:13.150' AS DateTime), 18, N'1', 1388)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1388, N'TestDemo-7-18', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)進階搜尋（另開新視窗）', N'(測試)進階搜尋（另開新視窗）', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-22T15:25:13.150' AS DateTime), 18, N'1', 1388)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1391, N'TestDemo-7-19', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Advanced Search', N'(測試)進階搜尋', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-22T15:25:20.260' AS DateTime), 19, N'1', 1390)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1390, N'TestDemo-7-19', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)進階搜尋', N'(測試)進階搜尋', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-22T15:25:20.260' AS DateTime), 19, N'1', 1390)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1098, N'TestDemo-7-2', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Search', N'(測試)查詢', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-10T15:36:30.977' AS DateTime), 2, N'1', 1097)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1097, N'TestDemo-7-2', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)查詢', N'(測試)確認送出查詢的按鈕', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-10T15:36:30.977' AS DateTime), 2, N'1', 1097)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1393, N'TestDemo-7-20', N'TestDemo-7', N'TestDemo', N'en', N'(測試)moda', N'(測試)數位發展部', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-22T15:25:39.570' AS DateTime), 20, N'1', 1392)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1392, N'TestDemo-7-20', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)數位發展部', N'(測試)數位發展部', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-22T15:25:39.570' AS DateTime), 20, N'1', 1392)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1395, N'TestDemo-7-21', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Ministry of Digital Affairs', N'(測試)數位發展部 : 回首頁', N'testmoda', CAST(N'2022-09-16T08:59:25.337' AS DateTime), N'192.168.151.82', N'testmoda', CAST(N'2022-06-22T15:25:50.460' AS DateTime), 21, N'1', 1394)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1394, N'TestDemo-7-21', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)數位發展部', N'(測試)數位發展部:回首頁', N'testmoda', CAST(N'2022-09-16T08:58:00.407' AS DateTime), N'192.168.151.82', N'testmoda', CAST(N'2022-06-22T15:25:50.460' AS DateTime), 21, N'1', 1394)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1397, N'TestDemo-7-22', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Expand Menu', N'(測試)展開選單', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-22T15:26:02.760' AS DateTime), 22, N'1', 1396)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1396, N'TestDemo-7-22', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)展開選單', N'(測試)展開選單', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-22T15:26:02.760' AS DateTime), 22, N'1', 1396)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1399, N'TestDemo-7-23', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Go Top', N'(測試)頁面頂端按鈕', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T11:46:13.343' AS DateTime), 23, N'1', 1398)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1398, N'TestDemo-7-23', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)頁面頂端功能區塊[快捷鍵Alt+U]', N'(測試)頁面頂端按鈕', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T11:46:13.343' AS DateTime), 23, N'1', 1398)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1401, N'TestDemo-7-24', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Search', N'(測試)展開關鍵字搜尋', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T11:47:56.927' AS DateTime), 24, N'1', 1400)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1400, N'TestDemo-7-24', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)展開關鍵字搜尋', N'(測試)展開關鍵字搜尋', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T11:47:56.927' AS DateTime), 24, N'1', 1400)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1403, N'TestDemo-7-25', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Enter KeyWords', N'(測試)關鍵字搜尋', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T11:50:57.437' AS DateTime), 25, N'1', 1402)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1402, N'TestDemo-7-25', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)關鍵字搜尋', N'(測試)關鍵字搜尋', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T11:50:57.437' AS DateTime), 25, N'1', 1402)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1405, N'TestDemo-7-26', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Collapse Search', N'(測試)關閉搜尋', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T11:51:26.797' AS DateTime), 26, N'1', 1404)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1404, N'TestDemo-7-26', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)關閉搜尋', N'(測試)關閉搜尋', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T11:51:26.797' AS DateTime), 26, N'1', 1404)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1407, N'TestDemo-7-27', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Collapse Menu', N'(測試)關閉選單', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T12:05:00.277' AS DateTime), 27, N'1', 1406)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1406, N'TestDemo-7-27', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)關閉選單', N'(測試)關閉選單', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T12:05:00.277' AS DateTime), 27, N'1', 1406)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1409, N'TestDemo-7-28', N'TestDemo-7', N'TestDemo', N'en', N'(測試)previous', N'(測試)上一則主題', N'testmoda', CAST(N'2022-10-01T08:45:00.690' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-24T14:30:13.993' AS DateTime), 28, N'1', 1408)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1408, N'TestDemo-7-28', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)上一則主題', N'(測試)上一則主題', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T14:30:13.993' AS DateTime), 28, N'1', 1408)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1411, N'TestDemo-7-29', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Next', N'(測試)下一則主題', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T14:30:21.427' AS DateTime), 29, N'1', 1410)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1410, N'TestDemo-7-29', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)下一則主題', N'(測試)下一則主題', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T14:30:21.427' AS DateTime), 29, N'1', 1410)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1100, N'TestDemo-7-3', N'TestDemo-7', N'TestDemo', N'en', N'(測試)OK', N'(測試)確定', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-10T15:36:50.337' AS DateTime), 4, N'1', 1099)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1099, N'TestDemo-7-3', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)確定', N'(測試)確定', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-10T15:36:50.337' AS DateTime), 4, N'1', 1099)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1413, N'TestDemo-7-30', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Alt+C: Content Area', N'(測試)中央內容區塊[快捷鍵Alt+C]', N'testmoda', CAST(N'2022-08-23T20:05:38.687' AS DateTime), N'192.168.151.142', N'testmoda', CAST(N'2022-06-24T14:35:22.790' AS DateTime), 30, N'1', 1412)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1412, N'TestDemo-7-30', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)中央內容區塊[快捷鍵Alt+C]', N'(測試)中央內容區塊[快捷鍵Alt+C]', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T14:35:22.790' AS DateTime), 30, N'1', 1412)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1415, N'TestDemo-7-31', N'TestDemo-7', N'TestDemo', N'en', N'(測試)previous', N'(測試)上一組相關連結', N'testmoda', CAST(N'2022-10-01T08:45:13.453' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-24T14:36:04.327' AS DateTime), 31, N'1', 1414)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1414, N'TestDemo-7-31', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)上一組相關連結', N'(測試)上一組相關連結', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T14:36:04.327' AS DateTime), 31, N'1', 1414)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1417, N'TestDemo-7-32', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Next', N'(測試)下一組相關連結', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T14:36:14.853' AS DateTime), 32, N'1', 1416)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1416, N'TestDemo-7-32', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)下一組相關連結', N'(測試)下一組相關連結', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T14:36:14.853' AS DateTime), 32, N'1', 1416)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1419, N'TestDemo-7-33', N'TestDemo-7', N'TestDemo', N'en', N'(測試)(open in new window)', N'(測試)(另開新視窗)', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T14:36:28.413' AS DateTime), 33, N'1', 1418)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1418, N'TestDemo-7-33', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)（另開新視窗）', N'(測試)（另開新視窗）', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T14:36:28.413' AS DateTime), 33, N'1', 1418)
GO
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1421, N'TestDemo-7-34', N'TestDemo-7', N'TestDemo', N'en', N'(測試)previous', N'(測試)上一組影音', N'testmoda', CAST(N'2022-10-01T08:45:20.190' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-24T14:37:39.463' AS DateTime), 34, N'1', 1420)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1420, N'TestDemo-7-34', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)上一組影音', N'(測試)上一組影音', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T14:37:39.463' AS DateTime), 34, N'1', 1420)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1423, N'TestDemo-7-35', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Next', N'(測試)下一組影音', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T14:37:47.173' AS DateTime), 35, N'1', 1422)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1422, N'TestDemo-7-35', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)下一組影音', N'(測試)下一組影音', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T14:37:47.173' AS DateTime), 35, N'1', 1422)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1425, N'TestDemo-7-36', N'TestDemo-7', N'TestDemo', N'en', N'(測試)More', N'(測試)更多訊息', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T14:39:04.440' AS DateTime), 36, N'1', 1424)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1424, N'TestDemo-7-36', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)更多訊息', N'(測試)更多訊息', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T14:39:04.440' AS DateTime), 36, N'1', 1424)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1427, N'TestDemo-7-37', N'TestDemo-7', N'TestDemo', N'en', N'(測試)previous', N'(測試)上一組主要議題', N'testmoda', CAST(N'2022-10-01T08:45:28.077' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-24T14:42:49.130' AS DateTime), 37, N'1', 1426)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1426, N'TestDemo-7-37', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)上一組主要議題', N'(測試)上一組主要議題', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T14:42:49.130' AS DateTime), 37, N'1', 1426)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1429, N'TestDemo-7-38', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Next', N'(測試)下一組主要議題', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T14:42:57.053' AS DateTime), 38, N'1', 1428)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1428, N'TestDemo-7-38', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)下一組主要議題', N'(測試)下一組主要議題', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T14:42:57.053' AS DateTime), 38, N'1', 1428)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1431, N'TestDemo-7-39', N'TestDemo-7', N'TestDemo', N'en', N'(測試)All', N'(測試)總覽', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T14:44:19.273' AS DateTime), 39, N'1', 1430)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1430, N'TestDemo-7-39', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)總覽', N'(測試)總覽', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T14:44:19.273' AS DateTime), 39, N'1', 1430)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1102, N'TestDemo-7-4', N'TestDemo-7', N'TestDemo', N'en', N'(測試)extension', N'(測試)extension1', N'testmoda', CAST(N'2022-08-15T10:07:38.857' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-10T15:39:11.287' AS DateTime), 3, N'1', 1101)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1101, N'TestDemo-7-4', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)擴充物件', N'(測試)擴充物件', N'testmoda', CAST(N'2022-08-15T10:06:28.773' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-10T15:39:11.287' AS DateTime), 3, N'1', 1101)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1433, N'TestDemo-7-40', N'TestDemo-7', N'TestDemo', N'en', N'(測試)previous', N'(測試)上一組政策計畫', N'testmoda', CAST(N'2022-10-01T08:45:39.893' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-06-24T14:44:29.833' AS DateTime), 40, N'1', 1432)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1432, N'TestDemo-7-40', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)上一組政策計畫', N'(測試)上一組政策計畫', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T14:44:29.833' AS DateTime), 40, N'1', 1432)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1435, N'TestDemo-7-41', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Next', N'(測試)下一組政策計畫', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T14:44:35.763' AS DateTime), 41, N'1', 1434)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1434, N'TestDemo-7-41', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)下一組政策計畫', N'(測試)下一組政策計畫', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T14:44:35.763' AS DateTime), 41, N'1', 1434)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1437, N'TestDemo-7-42', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Alt+Z: Bottom Area', N'(測試)頁面尾端功能區塊[快捷鍵Alt+Z]', N'testmoda', CAST(N'2022-08-23T20:05:44.877' AS DateTime), N'192.168.151.142', N'testmoda', CAST(N'2022-06-24T14:46:48.763' AS DateTime), 42, N'1', 1436)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1436, N'TestDemo-7-42', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)頁面尾端功能區塊[快捷鍵Alt+Z]', N'(測試)頁面尾端功能區塊[快捷鍵Alt+Z]', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T14:46:48.763' AS DateTime), 42, N'1', 1436)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1439, N'TestDemo-7-43', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Expand Menu', N'(測試)展開子選單', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T14:47:42.130' AS DateTime), 43, N'1', 1438)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1438, N'TestDemo-7-43', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)展開子選單', N'(測試)展開子選單', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T14:47:42.130' AS DateTime), 43, N'1', 1438)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1441, N'TestDemo-7-44', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Collapse Menu', N'(測試)收合子選單', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T14:47:48.493' AS DateTime), 44, N'1', 1440)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1440, N'TestDemo-7-44', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)收合子選單', N'(測試)收合子選單', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T14:47:48.493' AS DateTime), 44, N'1', 1440)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1443, N'TestDemo-7-45', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Accessible website (open in new window)', N'(測試)無障礙網站（另開新視窗）', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T14:49:37.220' AS DateTime), 45, N'1', 1442)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1442, N'TestDemo-7-45', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)無障礙網站（另開新視窗）', N'(測試)無障礙網站（另開新視窗）', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T14:49:37.220' AS DateTime), 45, N'1', 1442)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1445, N'TestDemo-7-46', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Pass the AA Test Level Accessibility Test', N'(測試)通過AA檢測等級無障礙網頁檢測', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T14:49:49.337' AS DateTime), 46, N'1', 1444)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1444, N'TestDemo-7-46', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)通過AA檢測等級無障礙網頁檢測', N'(測試)通過AA檢測等級無障礙網頁檢測', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T14:49:49.337' AS DateTime), 46, N'1', 1444)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1447, N'TestDemo-7-47', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Update Date: ', N'(測試)更新日期', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T14:50:39.057' AS DateTime), 47, N'1', 1446)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1446, N'TestDemo-7-47', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)更新日期：', N'(測試)更新日期：', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T14:50:39.057' AS DateTime), 47, N'1', 1446)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1449, N'TestDemo-7-48', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Browser not support JavaScript', N'(測試)瀏覽器不支援JavaScript功能', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T14:59:50.557' AS DateTime), 48, N'1', 1448)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1448, N'TestDemo-7-48', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)Your browser does not support JavaScript! 您的瀏覽器不支援JavaScript功能，若網頁功能無法正常使用時，請開啟瀏覽器JavaScript狀態。', N'(測試)瀏覽器不支援JavaScript功能', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T14:59:50.557' AS DateTime), 48, N'1', 1448)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1451, N'TestDemo-7-49', N'TestDemo-7', N'TestDemo', N'en', N'(測試)To the central content area', N'(測試)跳到主要內容', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T15:00:05.387' AS DateTime), 49, N'1', 1450)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1450, N'TestDemo-7-49', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)跳到主要內容', N'(測試)跳到主要內容', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T15:00:05.387' AS DateTime), 49, N'1', 1450)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1104, N'TestDemo-7-5', N'TestDemo-7', N'TestDemo', N'en', N'(測試)MailBox', N'(測試)意見信箱', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-10T15:39:26.223' AS DateTime), 5, N'1', 1103)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1103, N'TestDemo-7-5', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)意見信箱', N'(測試)意見信箱', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-10T15:39:26.223' AS DateTime), 5, N'1', 1103)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1453, N'TestDemo-7-50', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Go Top', N'(測試)返回頁面頂端', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T15:00:12.217' AS DateTime), 50, N'1', 1452)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1452, N'TestDemo-7-50', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)返回頁面頂端', N'(測試)返回頁面頂端', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T15:00:12.217' AS DateTime), 50, N'1', 1452)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1455, N'TestDemo-7-51', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Share', N'(測試)社群分享', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T15:11:18.550' AS DateTime), 51, N'1', 1454)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1454, N'TestDemo-7-51', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)社群分享', N'(測試)社群分享', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T15:11:18.550' AS DateTime), 51, N'1', 1454)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1457, N'TestDemo-7-52', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Share to facebook (open in new window)', N'(測試)分享至facebook(另開新視窗)', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T15:11:33.960' AS DateTime), 52, N'1', 1456)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1456, N'TestDemo-7-52', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)分享至 facebook（另開新視窗）', N'(測試)分享至 facebook（另開新視窗）', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T15:11:33.960' AS DateTime), 52, N'1', 1456)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1459, N'TestDemo-7-53', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Share to twitter (open in new window)', N'(測試)分享到Twitter(另開新視窗)', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T15:11:40.157' AS DateTime), 53, N'1', 1458)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1458, N'TestDemo-7-53', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)分享到 twitter（另開新視窗）', N'(測試)分享到 twitter（另開新視窗）', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T15:11:40.157' AS DateTime), 53, N'1', 1458)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1461, N'TestDemo-7-54', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Share to line (open in new window)', N'(測試)分享到Line(另開新視窗)', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T15:11:46.507' AS DateTime), 54, N'1', 1460)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1460, N'TestDemo-7-54', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)分享到 line（另開新視窗）', N'(測試)分享到 line（另開新視窗）', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T15:11:46.507' AS DateTime), 54, N'1', 1460)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1463, N'TestDemo-7-55', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Print Page Info', N'(測試)列印頁面內容', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T15:11:52.233' AS DateTime), 55, N'1', 1462)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1462, N'TestDemo-7-55', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)列印頁面內容', N'(測試)列印頁面內容', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T15:11:52.233' AS DateTime), 55, N'1', 1462)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1465, N'TestDemo-7-56', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Print', N'(測試)列印', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T15:12:21.153' AS DateTime), 56, N'1', 1464)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1464, N'TestDemo-7-56', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)列印', N'(測試)列印', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T15:12:21.153' AS DateTime), 56, N'1', 1464)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1467, N'TestDemo-7-57', N'TestDemo-7', N'TestDemo', N'en', N'(測試)More', N'(測試)更多', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T15:14:41.490' AS DateTime), 57, N'1', 1466)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1466, N'TestDemo-7-57', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)看更多', N'(測試)更多', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-24T15:14:41.490' AS DateTime), 57, N'1', 1466)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1469, N'TestDemo-7-58', N'TestDemo-7', N'TestDemo', N'en', N'(測試)CC0 No copyright reserved.', N'(測試)版權說明', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-27T15:49:05.483' AS DateTime), 58, N'1', 1468)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1468, N'TestDemo-7-58', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)CC0 No copyright reserved.', N'(測試)版權聲明', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-27T15:49:05.483' AS DateTime), 58, N'1', 1468)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1779, N'TestDemo-7-59', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Data Source: ', N'(測試)發布單位', N'testmoda', CAST(N'2022-08-23T20:06:01.830' AS DateTime), N'192.168.151.142', N'testmoda', CAST(N'2022-07-28T15:18:22.680' AS DateTime), 59, N'1', 1778)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1778, N'TestDemo-7-59', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)發布單位：', N'(測試)發布單位：', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-07-28T15:18:22.680' AS DateTime), 59, N'1', 1778)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1106, N'TestDemo-7-6', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Date', N'(測試)日期', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-10T16:31:23.350' AS DateTime), 6, N'1', 1105)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1105, N'TestDemo-7-6', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)日期', N'(測試)單元搜尋條件的欄位名稱 (查詢日期區間)', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-10T16:31:23.350' AS DateTime), 6, N'1', 1105)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1781, N'TestDemo-7-60', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Create Date: ', N'(測試)上稿日期', N'testmoda', CAST(N'2022-09-15T17:55:28.437' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-07-28T15:18:58.607' AS DateTime), 60, N'1', 1780)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1780, N'TestDemo-7-60', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)建立日期：', N'(測試)建立日期：', N'testmoda', CAST(N'2022-09-15T17:39:10.700' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-07-28T15:18:58.607' AS DateTime), 60, N'1', 1780)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1791, N'TestDemo-7-61', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Alt+L: Left block, containing the links to the major sections and navigation of this site.', N'(測試)Alt+L: Left block, containing the links to the major sections and navigation of this site.', N'testmoda', CAST(N'2022-08-23T20:06:19.923' AS DateTime), N'192.168.151.142', N'testmoda', CAST(N'2022-08-09T16:12:51.973' AS DateTime), 61, N'1', 1790)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1790, N'TestDemo-7-61', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)頁面左方功能區塊[快捷鍵Alt+L]', N'(測試)頁面左方功能區塊[快捷鍵Alt+L]', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-08-09T16:12:51.973' AS DateTime), 61, N'1', 1790)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1803, N'TestDemo-7-62', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Expand Search Bar', N'(測試)Expand Search Bar', N'testmoda', CAST(N'2022-08-16T11:33:09.957' AS DateTime), N'::1', N'testmoda', CAST(N'2022-08-12T14:23:29.437' AS DateTime), 62, N'1', 1802)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1802, N'TestDemo-7-62', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)展開查詢', N'(測試)展開查詢', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-08-12T14:23:29.437' AS DateTime), 62, N'1', 1802)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1805, N'TestDemo-7-63', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Collapse Search Bar', N'(測試)Collapse Search Bar', N'testmoda', CAST(N'2022-08-16T11:28:54.360' AS DateTime), N'::1', N'testmoda', CAST(N'2022-08-12T14:23:48.783' AS DateTime), 63, N'1', 1804)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1804, N'TestDemo-7-63', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)收合查詢', N'(測試)收合查詢', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-08-12T14:23:48.783' AS DateTime), 63, N'1', 1804)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1815, N'TestDemo-7-64', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Please select', N'(測試)Please select', N'testmoda', CAST(N'2022-08-16T11:29:06.773' AS DateTime), N'::1', N'testmoda', CAST(N'2022-08-12T15:01:39.783' AS DateTime), 64, N'1', 1814)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1814, N'TestDemo-7-64', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)請選擇', N'(測試)請選擇', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-08-12T15:01:39.783' AS DateTime), 64, N'1', 1814)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1821, N'TestDemo-7-65', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Site Map', N'(測試)Site Map', N'testmoda', CAST(N'2022-08-16T11:01:13.983' AS DateTime), N'::1', N'testmoda', CAST(N'2022-08-16T10:59:06.227' AS DateTime), 65, N'1', 1820)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1820, N'TestDemo-7-65', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)網站導覽', N'(測試)網站導覽', N'testmoda', CAST(N'2022-08-16T10:59:06.227' AS DateTime), N'::1', N'testmoda', CAST(N'2022-08-16T10:59:06.227' AS DateTime), 65, N'1', 1820)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1827, N'TestDemo-7-66', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Share to instagram (open in new window)', N'(測試)Share to instagram (open in new window)', N'testmoda', CAST(N'2022-08-16T14:25:42.730' AS DateTime), N'192.168.151.161', N'testmoda', CAST(N'2022-08-16T14:24:17.797' AS DateTime), 66, N'1', 1826)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1826, N'TestDemo-7-66', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)分享到 instagram（另開新視窗）', N'(測試)分享到 instagram（另開新視窗）', N'testmoda', CAST(N'2022-08-16T14:24:17.793' AS DateTime), N'192.168.151.161', N'testmoda', CAST(N'2022-08-16T14:24:17.797' AS DateTime), 66, N'1', 1826)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1833, N'TestDemo-7-67', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Collapse Bulletin', N'(測試)關閉公告訊息', N'testmoda', CAST(N'2022-08-16T17:18:21.210' AS DateTime), N'192.168.151.161', N'testmoda', CAST(N'2022-08-16T17:18:21.210' AS DateTime), 67, N'1', 1832)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1832, N'TestDemo-7-67', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)關閉公告訊息', N'(測試)關閉公告訊息', N'testmoda', CAST(N'2022-08-16T17:18:21.210' AS DateTime), N'192.168.151.161', N'testmoda', CAST(N'2022-08-16T17:18:21.210' AS DateTime), 67, N'1', 1832)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1845, N'TestDemo-7-68', N'TestDemo-7', N'TestDemo', N'en', N'(測試)moda', N'(測試)back to moda', N'testmoda', CAST(N'2022-08-22T12:59:17.547' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-08-22T11:37:35.583' AS DateTime), 68, N'1', 1844)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1844, N'TestDemo-7-68', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)數位發展部', N'(測試)回數位發展部', N'testmoda', CAST(N'2022-08-22T12:59:52.817' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-08-22T11:37:35.583' AS DateTime), 68, N'1', 1844)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1855, N'TestDemo-7-69', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Close image preview', N'(測試)Close image preview', N'testmoda', CAST(N'2022-09-07T14:38:53.177' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-09-02T16:02:30.180' AS DateTime), 69, N'1', 1854)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1854, N'TestDemo-7-69', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)關閉瀏覽圖片', N'(測試)關閉瀏覽圖片', N'testmoda', CAST(N'2022-09-02T16:02:30.180' AS DateTime), N'192.168.151.161', N'testmoda', CAST(N'2022-09-02T16:02:30.180' AS DateTime), 69, N'1', 1854)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1108, N'TestDemo-7-7', N'TestDemo-7', N'TestDemo', N'en', N'(測試)StartDate', N'(測試)點擊選擇日期起日', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-10T16:31:34.220' AS DateTime), 7, N'1', 1107)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1107, N'TestDemo-7-7', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)點擊選擇日期起日', N'(測試)點擊選擇日期起日', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-10T16:31:34.220' AS DateTime), 7, N'1', 1107)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1857, N'TestDemo-7-70', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Previous image', N'(測試)Previous image', N'testmoda', CAST(N'2022-09-07T14:38:33.687' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-09-02T16:02:40.357' AS DateTime), 70, N'1', 1856)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1856, N'TestDemo-7-70', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)上一張圖片', N'(測試)上一張圖片', N'testmoda', CAST(N'2022-09-02T16:02:40.357' AS DateTime), N'192.168.151.161', N'testmoda', CAST(N'2022-09-02T16:02:40.357' AS DateTime), 70, N'1', 1856)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1859, N'TestDemo-7-71', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Next image', N'(測試)Next image', N'testmoda', CAST(N'2022-09-07T14:38:16.370' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-09-02T16:02:49.550' AS DateTime), 71, N'1', 1858)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1858, N'TestDemo-7-71', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)下一張圖片', N'(測試)下一張圖片', N'testmoda', CAST(N'2022-09-02T16:02:49.550' AS DateTime), N'192.168.151.161', N'testmoda', CAST(N'2022-09-02T16:02:49.550' AS DateTime), 71, N'1', 1858)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1861, N'TestDemo-7-72', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Current image', N'(測試)Current image', N'testmoda', CAST(N'2022-09-07T14:37:59.957' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-09-02T16:02:55.270' AS DateTime), 72, N'1', 1860)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1860, N'TestDemo-7-72', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)目前張數', N'(測試)目前張數', N'testmoda', CAST(N'2022-09-02T16:02:55.270' AS DateTime), N'192.168.151.161', N'testmoda', CAST(N'2022-09-02T16:02:55.270' AS DateTime), 72, N'1', 1860)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1889, N'TestDemo-7-73', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Read more', N'(測試)Read more', N'testmoda', CAST(N'2022-09-21T15:11:57.183' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-09-15T10:02:13.993' AS DateTime), 73, N'1', 1888)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1888, N'TestDemo-7-73', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)詳全文', N'(測試)詳全文', N'testmoda', CAST(N'2022-09-15T10:02:13.987' AS DateTime), N'192.168.151.161', N'testmoda', CAST(N'2022-09-15T10:02:13.993' AS DateTime), 73, N'1', 1888)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1895, N'TestDemo-7-74', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Location', N'(測試)Location', N'testmoda', CAST(N'2022-09-21T15:12:25.373' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-09-15T16:46:14.977' AS DateTime), 74, N'1', 1894)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1894, N'TestDemo-7-74', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)地點：', N'(測試)地點：', N'testmoda', CAST(N'2022-09-15T16:46:14.977' AS DateTime), N'192.168.151.161', N'testmoda', CAST(N'2022-09-15T16:46:14.977' AS DateTime), 74, N'1', 1894)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1901, N'TestDemo-7-75', N'TestDemo-7', N'TestDemo', N'en', N'(測試)County', N'(測試)County', N'testmoda', CAST(N'2022-09-21T15:08:28.110' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-09-16T09:46:37.733' AS DateTime), 75, N'1', 1900)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1900, N'TestDemo-7-75', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)縣市', N'(測試)縣市', N'testmoda', CAST(N'2022-09-16T09:46:37.733' AS DateTime), N'192.168.151.161', N'testmoda', CAST(N'2022-09-16T09:46:37.733' AS DateTime), 75, N'1', 1900)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1907, N'TestDemo-7-76', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Toggle Dark/Light Mode', N'(測試)Toggle Dark/Light Mode', N'testmoda', CAST(N'2022-09-21T15:31:11.160' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-09-21T14:44:02.930' AS DateTime), 76, N'1', 1906)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1906, N'TestDemo-7-76', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)網站顏色切換', N'(測試)網站顏色切換', N'testmoda', CAST(N'2022-09-21T14:44:02.930' AS DateTime), N'192.168.151.161', N'testmoda', CAST(N'2022-09-21T14:44:02.930' AS DateTime), 76, N'1', 1906)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1909, N'TestDemo-7-77', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Dark Mode', N'(測試)Dark Mode', N'testmoda', CAST(N'2022-09-21T15:07:08.557' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-09-21T14:44:24.543' AS DateTime), 77, N'1', 1908)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1908, N'TestDemo-7-77', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)深色模式', N'(測試)深色模式', N'testmoda', CAST(N'2022-09-21T14:44:24.543' AS DateTime), N'192.168.151.161', N'testmoda', CAST(N'2022-09-21T14:44:24.543' AS DateTime), 77, N'1', 1908)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1911, N'TestDemo-7-78', N'TestDemo-7', N'TestDemo', N'en', N'(測試)Light Mode', N'(測試)Light Mode', N'testmoda', CAST(N'2022-09-21T15:07:48.200' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-09-21T14:44:37.997' AS DateTime), 78, N'1', 1910)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1910, N'TestDemo-7-78', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)淺色模式', N'(測試)淺色模式', N'testmoda', CAST(N'2022-09-21T14:44:37.997' AS DateTime), N'192.168.151.161', N'testmoda', CAST(N'2022-09-21T14:44:37.997' AS DateTime), 78, N'1', 1910)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1110, N'TestDemo-7-8', N'TestDemo-7', N'TestDemo', N'en', N'(測試)To', N'(測試)至', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-10T16:32:58.417' AS DateTime), 8, N'1', 1109)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1109, N'TestDemo-7-8', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)至', N'(測試)單元搜尋條件-日期起迄間的文字', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-10T16:32:58.417' AS DateTime), 8, N'1', 1109)
GO
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1112, N'TestDemo-7-9', N'TestDemo-7', N'TestDemo', N'en', N'(測試)EndDate', N'(測試)點擊選擇日期迄日', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-10T16:33:15.237' AS DateTime), 9, N'1', 1111)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1111, N'TestDemo-7-9', N'TestDemo-7', N'TestDemo', N'zh-tw', N'(測試)點擊選擇日期迄日', N'(測試)點擊選擇日期迄日', N'testmoda', CAST(N'2022-08-15T08:14:58.540' AS DateTime), N'::1', N'testmoda', CAST(N'2022-06-10T16:33:15.237' AS DateTime), 9, N'1', 1111)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1879, N'TestDemo-8', N'TestDemo', N'TestDemo', N'en', N'(測試)Category', N'(測試)Category', N'testmoda', CAST(N'2022-09-07T14:40:49.580' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-09-06T17:04:46.203' AS DateTime), 22, N'1', 1878)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1878, N'TestDemo-8', N'TestDemo', N'TestDemo', N'zh-tw', N'(測試)分類', N'(測試)分類', N'testmoda', CAST(N'2022-09-07T14:40:21.477' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-09-06T17:04:46.203' AS DateTime), 24, N'1', 1878)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1885, N'TestDemo-8-1', N'TestDemo-8', N'TestDemo', N'en', N'(測試) Budget', N'(測試) Budget', N'testmoda', CAST(N'2023-01-31T12:05:51.910' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-09-07T17:32:10.560' AS DateTime), 1, N'-99', 1884)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1884, N'TestDemo-8-1', N'TestDemo-8', N'TestDemo', N'zh-tw', N'(測試)預算書', N'(測試)預算書', N'testmoda', CAST(N'2023-01-31T12:05:51.910' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-09-07T17:32:10.560' AS DateTime), 1, N'-99', 1884)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1887, N'TestDemo-8-2', N'TestDemo-8', N'TestDemo', N'en', N'(測試)Background Information', N'(測試)Background Information', N'testmoda', CAST(N'2023-01-31T12:05:59.857' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-09-07T17:32:22.257' AS DateTime), 2, N'-99', 1886)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1886, N'TestDemo-8-2', N'TestDemo-8', N'TestDemo', N'zh-tw', N'(測試)新聞參考資料', N'(測試)新聞參考資料', N'testmoda', CAST(N'2023-01-31T12:05:59.857' AS DateTime), N'192.168.151.134', N'testmoda', CAST(N'2022-09-07T17:32:22.257' AS DateTime), 2, N'-99', 1886)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1925, N'TestDemo-9', N'TestDemo', N'TestDemo', N'en', N'(測試)', N'(測試)', N'testmoda', CAST(N'2022-11-04T08:22:59.073' AS DateTime), N'192.168.151.136', N'testmoda', CAST(N'2022-11-04T08:22:59.073' AS DateTime), 33, N'1', 1924)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1924, N'TestDemo-9', N'TestDemo', N'TestDemo', N'zh-tw', N'(測試)輪播參數', N'(測試)輪播參數', N'testmoda', CAST(N'2022-11-04T08:22:59.073' AS DateTime), N'192.168.151.136', N'testmoda', CAST(N'2022-11-04T08:22:59.073' AS DateTime), 33, N'1', 1924)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1927, N'TestDemo-9-1', N'TestDemo-9', N'TestDemo', N'en', N'(測試)5', N'(測試)自動輪播(秒數)', N'testmoda', CAST(N'2022-11-04T14:48:59.620' AS DateTime), N'192.168.151.142', N'testmoda', CAST(N'2022-11-04T08:24:21.003' AS DateTime), 1, N'1', 1926)
INSERT [dbo].[SysCategory] ([SysCategorySN], [SysCategoryKey], [ParentKey], [WebSiteID], [Lang], [Value], [Description], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsEnable], [MainSN]) VALUES (1926, N'TestDemo-9-1', N'TestDemo-9', N'TestDemo', N'zh-tw', N'(測試)5', N'(測試)自動輪播(秒數)', N'testmoda', CAST(N'2022-11-04T14:48:19.803' AS DateTime), N'192.168.151.142', N'testmoda', CAST(N'2022-11-04T08:24:21.003' AS DateTime), 1, N'1', 1926)
SET IDENTITY_INSERT [dbo].[SysCategory] OFF
SET IDENTITY_INSERT [dbo].[SysDepartment] ON 

INSERT [dbo].[SysDepartment] ([SysDepartmentSN], [WebSiteID], [Lang], [DepartmentID], [ParentID], [DepartmentName], [ShortName], [Description], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedDate], [CreatedUserID], [SortOrder], [MainSN]) VALUES (1, N'TestDemo', N'zh-tw', N'M', 0, N'(測試)範例部門', NULL, N'(測試)範例部門', N'1', N'test', CAST(N'2022-11-03T14:47:03.367' AS DateTime), N'::1', CAST(N'2022-06-14T00:00:00.000' AS DateTime), N'test', 1, 1)
INSERT [dbo].[SysDepartment] ([SysDepartmentSN], [WebSiteID], [Lang], [DepartmentID], [ParentID], [DepartmentName], [ShortName], [Description], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedDate], [CreatedUserID], [SortOrder], [MainSN]) VALUES (2, N'TestDemo', N'en', N'M', 0, N'(測試)demoDep', NULL, N'(測試)範例部門', N'1', N'test', CAST(N'2022-07-28T14:32:05.537' AS DateTime), N'::1', CAST(N'2022-06-14T00:00:00.000' AS DateTime), N'test', 1, 1)
SET IDENTITY_INSERT [dbo].[SysDepartment] OFF
SET IDENTITY_INSERT [dbo].[SysGroup] ON 

INSERT [dbo].[SysGroup] ([SysGroupSN], [GroupName], [Description], [IsEnable], [CanDelete], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsGroup]) VALUES (1, N'系統管理者', N'系統最高管理權限', N'1', N'0', NULL, CAST(N'2022-11-03T14:20:31.627' AS DateTime), N'::1', N'moda0304', CAST(N'2022-03-04T14:21:39.280' AS DateTime), 2, NULL)
INSERT [dbo].[SysGroup] ([SysGroupSN], [GroupName], [Description], [IsEnable], [CanDelete], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [IsGroup]) VALUES (35, N'範例群組', N'範例群組', N'1', NULL, N'test', CAST(N'2023-03-13T15:51:17.930' AS DateTime), N'::1', N'test', CAST(N'2023-03-13T15:51:17.930' AS DateTime), 3, NULL)
SET IDENTITY_INSERT [dbo].[SysGroup] OFF
SET IDENTITY_INSERT [dbo].[SysSection] ON 

INSERT [dbo].[SysSection] ([SysSectionSN], [ParentSN], [Path], [ActionPath], [Title], [Description], [Parameter], [Icon], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder]) VALUES (1, NULL, N'1', N'#', N'網站維護', N'', N'', N'', N'1', N'test', CAST(N'2022-03-04T14:05:02.710' AS DateTime), N'::1', N'test', CAST(N'2022-03-04T14:05:02.710' AS DateTime), 1)
INSERT [dbo].[SysSection] ([SysSectionSN], [ParentSN], [Path], [ActionPath], [Title], [Description], [Parameter], [Icon], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder]) VALUES (2, NULL, N'2', N'#', N'權限管理', N'', N'', N'', N'1', N'test', CAST(N'2022-03-04T14:05:02.710' AS DateTime), N'::1', N'test', CAST(N'2022-03-04T14:05:02.710' AS DateTime), 2)
INSERT [dbo].[SysSection] ([SysSectionSN], [ParentSN], [Path], [ActionPath], [Title], [Description], [Parameter], [Icon], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder]) VALUES (3, NULL, N'３', N'#', N'網站管理', N'', N'', N'', N'1', N'test', CAST(N'2022-03-04T14:05:02.710' AS DateTime), N'::1', N'test', CAST(N'2022-03-04T14:05:02.710' AS DateTime), 5)
INSERT [dbo].[SysSection] ([SysSectionSN], [ParentSN], [Path], [ActionPath], [Title], [Description], [Parameter], [Icon], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder]) VALUES (4, NULL, N'４', N'#', N'流量統計', N'', N'', N'', N'1', N'test', CAST(N'2022-03-04T14:05:02.710' AS DateTime), N'::1', N'test', CAST(N'2022-03-04T14:05:02.710' AS DateTime), 3)
INSERT [dbo].[SysSection] ([SysSectionSN], [ParentSN], [Path], [ActionPath], [Title], [Description], [Parameter], [Icon], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder]) VALUES (5, NULL, N'５', N'#', N'日誌紀錄', N'', N'', N'', N'1', N'test', CAST(N'2022-03-04T14:05:02.710' AS DateTime), N'::1', N'test', CAST(N'2022-03-04T14:05:02.710' AS DateTime), 4)
INSERT [dbo].[SysSection] ([SysSectionSN], [ParentSN], [Path], [ActionPath], [Title], [Description], [Parameter], [Icon], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder]) VALUES (6, 1, N'1/6', N'~/WebContent/WebLevelManagement/Index', N'網站單元維護', N'', N'', N'', N'1', N'test', CAST(N'2022-03-04T14:05:02.710' AS DateTime), N'::1', N'test', CAST(N'2022-03-04T14:05:02.710' AS DateTime), 1)
INSERT [dbo].[SysSection] ([SysSectionSN], [ParentSN], [Path], [ActionPath], [Title], [Description], [Parameter], [Icon], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder]) VALUES (7, 1, N'1/7', N'~/WebContent/WebLevelManagement/Index?key=EFdR2JaR78pwXpiXKldRgw==', N'首頁區塊維護', N'', N'', N'Z', N'1', N'test', CAST(N'2022-03-04T14:05:02.710' AS DateTime), N'::1', N'test', CAST(N'2022-03-04T14:05:02.710' AS DateTime), 2)
INSERT [dbo].[SysSection] ([SysSectionSN], [ParentSN], [Path], [ActionPath], [Title], [Description], [Parameter], [Icon], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder]) VALUES (8, 2, N'2/8', N'~/Authorization/UserManagement/Index', N'帳號管理', N'', N'', N'3', N'1', N'test', CAST(N'2022-03-04T14:05:02.710' AS DateTime), N'::1', N'test', CAST(N'2022-03-04T14:05:02.710' AS DateTime), 1)
INSERT [dbo].[SysSection] ([SysSectionSN], [ParentSN], [Path], [ActionPath], [Title], [Description], [Parameter], [Icon], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder]) VALUES (9, 2, N'2/9', N'~/Authorization/GroupManagement/Index', N'群組管理', N'', N'', N'O', N'1', N'test', CAST(N'2022-03-04T14:05:02.710' AS DateTime), N'::1', N'test', CAST(N'2022-03-04T14:05:02.710' AS DateTime), 2)
INSERT [dbo].[SysSection] ([SysSectionSN], [ParentSN], [Path], [ActionPath], [Title], [Description], [Parameter], [Icon], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder]) VALUES (10, 2, N'2/10', N'~/Authorization/DepartmentManagement/Index', N'部門管理', N'', N'', N'f', N'1', N'test', CAST(N'2022-03-04T14:05:02.710' AS DateTime), N'::1', N'test', CAST(N'2022-03-04T14:05:02.710' AS DateTime), 3)
INSERT [dbo].[SysSection] ([SysSectionSN], [ParentSN], [Path], [ActionPath], [Title], [Description], [Parameter], [Icon], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder]) VALUES (11, 2, N'2/11', N'~/Authorization/AccessManagment/Index', N'權限查詢', N'', N'', N'9', N'1', N'test', CAST(N'2022-03-04T14:05:02.710' AS DateTime), N'::1', N'test', CAST(N'2022-03-04T14:05:02.710' AS DateTime), 4)
INSERT [dbo].[SysSection] ([SysSectionSN], [ParentSN], [Path], [ActionPath], [Title], [Description], [Parameter], [Icon], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder]) VALUES (12, 3, N'3/12', N'~/SystemManageMent/FuncationManagement/Report', N'功能列表', N'', N'', N'P', N'0', N'test', CAST(N'2022-03-04T14:05:02.710' AS DateTime), N'::1', N'test', CAST(N'2022-03-04T14:05:02.710' AS DateTime), 2)
INSERT [dbo].[SysSection] ([SysSectionSN], [ParentSN], [Path], [ActionPath], [Title], [Description], [Parameter], [Icon], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder]) VALUES (13, 3, N'3/13', N'~/SystemManageMent/CodeManagement/Index', N'代碼管理', N'', N'', N'm', N'1', N'test', CAST(N'2022-03-04T14:05:02.710' AS DateTime), N'::1', N'test', CAST(N'2022-03-04T14:05:02.710' AS DateTime), 3)
INSERT [dbo].[SysSection] ([SysSectionSN], [ParentSN], [Path], [ActionPath], [Title], [Description], [Parameter], [Icon], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder]) VALUES (14, 3, N'3/14', N'~/WebManagement/WebsiteManagement/Index', N'網站列表', N'', N'', N'', N'1', N'test', CAST(N'2022-03-04T14:05:02.710' AS DateTime), N'::1', N'test', CAST(N'2022-03-04T14:05:02.710' AS DateTime), 1)
INSERT [dbo].[SysSection] ([SysSectionSN], [ParentSN], [Path], [ActionPath], [Title], [Description], [Parameter], [Icon], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder]) VALUES (15, 4, N'4/18', N'~/WebManagement/BrowseStatistics/Index', N'網頁瀏覽統計', N'', N'', N'', N'1', N'test', CAST(N'2022-03-04T14:05:02.710' AS DateTime), N'::1', N'test', CAST(N'2022-03-04T14:05:02.710' AS DateTime), 7)
INSERT [dbo].[SysSection] ([SysSectionSN], [ParentSN], [Path], [ActionPath], [Title], [Description], [Parameter], [Icon], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder]) VALUES (16, 5, N'5/19', N'~/LogManagement/ErrorLog/Index', N'系統錯誤紀錄', N'', N'', N'G', N'1', N'test', CAST(N'2022-03-04T14:05:02.710' AS DateTime), N'::1', N'test', CAST(N'2022-03-04T14:05:02.710' AS DateTime), 1)
INSERT [dbo].[SysSection] ([SysSectionSN], [ParentSN], [Path], [ActionPath], [Title], [Description], [Parameter], [Icon], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder]) VALUES (17, 5, N'5/20', N'~/LogManagement/UserOperationLog/Index', N'網站稽核紀錄', N'', N'', N'', N'1', N'test', CAST(N'2022-03-04T14:05:02.710' AS DateTime), N'::1', N'test', CAST(N'2022-03-04T14:05:02.710' AS DateTime), 2)
INSERT [dbo].[SysSection] ([SysSectionSN], [ParentSN], [Path], [ActionPath], [Title], [Description], [Parameter], [Icon], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder]) VALUES (18, 5, N'5/21', N'~/LogManagement/LoginLog/Index', N'帳號登入紀錄', N'', N'', N'', N'1', N'test', CAST(N'2022-03-04T14:05:02.710' AS DateTime), N'::1', N'test', CAST(N'2022-03-04T14:05:02.710' AS DateTime), 3)
INSERT [dbo].[SysSection] ([SysSectionSN], [ParentSN], [Path], [ActionPath], [Title], [Description], [Parameter], [Icon], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder]) VALUES (19, 1, N'1/22', N'~/WebContent/WebLevelManagement/Index?key=AmpGAddVQaZqSxN1tJE1pA==', N'頁首頁底區塊維護', NULL, NULL, N'U', N'1', N'test', CAST(N'2022-03-04T14:05:02.710' AS DateTime), N'::1', N'test', CAST(N'2022-03-04T14:05:02.710' AS DateTime), 3)
INSERT [dbo].[SysSection] ([SysSectionSN], [ParentSN], [Path], [ActionPath], [Title], [Description], [Parameter], [Icon], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder]) VALUES (20, 2, N'1/24', N'~/Authorization/BlocklistManagement/Index', N'黑白名單', N'', N'', N'I', N'0', N'test', CAST(N'2022-03-04T14:05:02.710' AS DateTime), N'::1', N'test', CAST(N'2022-03-04T14:05:02.710' AS DateTime), 5)
INSERT [dbo].[SysSection] ([SysSectionSN], [ParentSN], [Path], [ActionPath], [Title], [Description], [Parameter], [Icon], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder]) VALUES (21, 4, N'4/27', N'~/WebManagement/BrowseStatistics/IndexF', N'檔案下載統計', N'', N'', N'F', N'1', N'test', CAST(N'2022-03-04T14:05:02.710' AS DateTime), N'::1', N'test', CAST(N'2022-03-04T14:05:02.710' AS DateTime), 8)
INSERT [dbo].[SysSection] ([SysSectionSN], [ParentSN], [Path], [ActionPath], [Title], [Description], [Parameter], [Icon], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder]) VALUES (22, 2, N'2/25', N'~/Authorization/FileShareManagement/Index', N'公開檔案下載', NULL, NULL, N'O', N'0', N'test', CAST(N'2022-03-04T14:05:02.710' AS DateTime), N'::1', N'test', CAST(N'2022-03-04T14:05:02.710' AS DateTime), 6)
INSERT [dbo].[SysSection] ([SysSectionSN], [ParentSN], [Path], [ActionPath], [Title], [Description], [Parameter], [Icon], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder]) VALUES (23, 3, N'3/15', N'~/SystemManageMent/OpenData/Index', N'開放資料集', NULL, NULL, N'O', N'1', N'test', CAST(N'2022-07-05T16:57:53.527' AS DateTime), N'::1', N'test', CAST(N'2022-07-05T16:57:53.527' AS DateTime), 3)
INSERT [dbo].[SysSection] ([SysSectionSN], [ParentSN], [Path], [ActionPath], [Title], [Description], [Parameter], [Icon], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder]) VALUES (24, 3, N'3/24', N'~/SystemManageMent/CheckLinks/Index', N'檢測無效連結', N'', N'', N'G', N'1', N'test', CAST(N'2022-10-03T14:11:16.847' AS DateTime), N'::1', N'test', CAST(N'2022-10-03T14:11:16.847' AS DateTime), 4)
INSERT [dbo].[SysSection] ([SysSectionSN], [ParentSN], [Path], [ActionPath], [Title], [Description], [Parameter], [Icon], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder]) VALUES (25, NULL, N'6', N'#', N'民意信箱', N'', N'', N'', N'0', N'test', CAST(N'2022-10-06T00:00:00.000' AS DateTime), N'::1', N'test', CAST(N'2022-10-06T00:00:00.000' AS DateTime), 6)
INSERT [dbo].[SysSection] ([SysSectionSN], [ParentSN], [Path], [ActionPath], [Title], [Description], [Parameter], [Icon], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder]) VALUES (26, 25, N'25/26', N'~/MailBox/WebSite/Index', N'站台維護', N'', N'', N'Z', N'0', N'test', CAST(N'2022-10-06T14:13:35.767' AS DateTime), N'::1', N'test', CAST(N'2022-10-06T14:13:35.767' AS DateTime), 1)
INSERT [dbo].[SysSection] ([SysSectionSN], [ParentSN], [Path], [ActionPath], [Title], [Description], [Parameter], [Icon], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder]) VALUES (27, 25, N'25/27', N'~/MailBox/CaseApplyClass/Index', N'意見分類維護', N'', N'', N'P', N'0', N'test', CAST(N'2022-10-06T14:15:54.647' AS DateTime), N'::1', N'test', CAST(N'2022-10-06T14:15:54.647' AS DateTime), 2)
INSERT [dbo].[SysSection] ([SysSectionSN], [ParentSN], [Path], [ActionPath], [Title], [Description], [Parameter], [Icon], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder]) VALUES (28, 25, N'25/28', N'~/MailBox/CaseApply/Index', N'申辦案件處理', N'', N'', N'y', N'0', N'test', CAST(N'2022-10-16T00:00:00.000' AS DateTime), N'::1', N'test', CAST(N'2022-10-06T00:00:00.000' AS DateTime), 4)
INSERT [dbo].[SysSection] ([SysSectionSN], [ParentSN], [Path], [ActionPath], [Title], [Description], [Parameter], [Icon], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder]) VALUES (29, 25, N'25/29', N'~/MailBox/Report/Index', N'案件統計報表', N'', N'', N'q', N'0', N'test', CAST(N'2022-10-06T00:00:00.000' AS DateTime), N'::1', N'test', CAST(N'2022-10-06T00:00:00.000' AS DateTime), 7)
INSERT [dbo].[SysSection] ([SysSectionSN], [ParentSN], [Path], [ActionPath], [Title], [Description], [Parameter], [Icon], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder]) VALUES (30, 5, N'5/22', NULL, N'資料維護統計', NULL, NULL, N'O', N'0', N'test', CAST(N'2022-11-09T10:10:24.987' AS DateTime), N'::1', N'test', CAST(N'2022-11-09T10:10:24.987' AS DateTime), 5)
INSERT [dbo].[SysSection] ([SysSectionSN], [ParentSN], [Path], [ActionPath], [Title], [Description], [Parameter], [Icon], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder]) VALUES (31, 25, N'25/31', N'~/MailBox/SpeedLog/Index', N'公文介接紀錄', NULL, NULL, N'8', N'0', N'test', CAST(N'2022-11-28T10:41:27.160' AS DateTime), N'::1', N'test', CAST(N'2022-11-28T10:41:27.160' AS DateTime), 6)
INSERT [dbo].[SysSection] ([SysSectionSN], [ParentSN], [Path], [ActionPath], [Title], [Description], [Parameter], [Icon], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder]) VALUES (33, 25, N'25/33', N'~/MailBox/Survey/Index', N'滿意度調查', NULL, NULL, N'', N'0', N'test', CAST(N'2022-12-15T15:11:12.250' AS DateTime), N'::1', N'test', CAST(N'2022-12-15T15:11:12.250' AS DateTime), 8)
INSERT [dbo].[SysSection] ([SysSectionSN], [ParentSN], [Path], [ActionPath], [Title], [Description], [Parameter], [Icon], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder]) VALUES (36, 3, N'3/25', N'~/SystemManageMent/FilePath/Index', N'檔案/圖檔/連結查詢', NULL, NULL, N'O', N'0', N'test', CAST(N'2022-12-23T11:15:33.923' AS DateTime), N'::1', N'test', CAST(N'2022-12-23T11:15:33.923' AS DateTime), 5)
INSERT [dbo].[SysSection] ([SysSectionSN], [ParentSN], [Path], [ActionPath], [Title], [Description], [Parameter], [Icon], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder]) VALUES (37, 25, N'25/37', N'~/MailBox/CaseReconfirm/Index', N'未成案案件查詢', NULL, NULL, N'#', N'0', N'test', CAST(N'2023-01-06T11:33:55.740' AS DateTime), N'::1', N'test', CAST(N'2023-01-06T11:33:55.740' AS DateTime), 3)
INSERT [dbo].[SysSection] ([SysSectionSN], [ParentSN], [Path], [ActionPath], [Title], [Description], [Parameter], [Icon], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder]) VALUES (32, 25, N'25/32', N'~/MailBox/CaseApply/ReSet', N'公文退件待改分', NULL, NULL, N'', N'0', N'test', CAST(N'2022-11-28T00:00:00.000' AS DateTime), N'::1', N'test', CAST(N'2022-11-28T00:00:00.000' AS DateTime), 5)
SET IDENTITY_INSERT [dbo].[SysSection] OFF
SET IDENTITY_INSERT [dbo].[SysUser] ON 

INSERT [dbo].[SysUser] ([SysUserSN], [EmpID], [UserID], [ADUserID], [UserName], [EngName], [NickName], [Gender], [Password], [UserSatus], [Tel], [Mobile], [Email], [DisableDate], [LastLoginDate], [PwdLastUpdate], [ErrLoginnum], [JobTitle], [OfficePhone], [Photo], [DepartmentID], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [DateCreated], [SortOrder]) VALUES (36, NULL, N'test', NULL, N'測試', NULL, NULL, NULL, N'hFaC8AJNgStF7o3EbwYYRA==', N'1', NULL, NULL, N'test@gmail.com', NULL, CAST(N'2023-03-13T15:56:58.883' AS DateTime), NULL, 0, NULL, NULL, NULL, N'M07', N'test', CAST(N'2022-11-11T16:00:12.473' AS DateTime), N'::1', CAST(N'2022-11-11T15:58:24.140' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[SysUser] OFF
SET IDENTITY_INSERT [dbo].[SysWebSite] ON 

INSERT [dbo].[SysWebSite] ([SysWebSiteSN], [WebSiteID], [Lang], [Title], [DNS], [Description], [GACode], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [CheckLinksDate]) VALUES (1, N'TestDemo', N'-', N'範例站台', NULL, N'©版權所有', NULL, N'1', N'test', CAST(N'2022-06-22T17:59:50.227' AS DateTime), N'::1', N'test', CAST(N'2022-03-04T15:18:49.260' AS DateTime), 1, CAST(N'2023-01-11T11:30:26.417' AS DateTime))
SET IDENTITY_INSERT [dbo].[SysWebSite] OFF
SET IDENTITY_INSERT [dbo].[SysWebSiteLang] ON 

INSERT [dbo].[SysWebSiteLang] ([SysWebSiteLangSN], [WebSiteID], [Lang], [Title], [GACode], [ProcessIPAddress], [CreatedDate], [CreatedUserID], [ProcessDate], [ProcessUserID], [IsEnable], [SortOrder], [Description], [GoogleSearchKey]) VALUES (1, N'TestDemo', N'zh-tw', N'TestDemo 示範站台', NULL, N'::1', CAST(N'2022-05-20T00:00:00.000' AS DateTime), N'test', CAST(N'2022-12-20T10:30:05.957' AS DateTime), N'test', N'1', 0, N'示範站台', N'                                                  ')
INSERT [dbo].[SysWebSiteLang] ([SysWebSiteLangSN], [WebSiteID], [Lang], [Title], [GACode], [ProcessIPAddress], [CreatedDate], [CreatedUserID], [ProcessDate], [ProcessUserID], [IsEnable], [SortOrder], [Description], [GoogleSearchKey]) VALUES (2, N'TestDemo', N'en', N'TestDemo 示範站台', NULL, N'::1', CAST(N'2022-05-20T00:00:00.000' AS DateTime), N'test', CAST(N'2022-12-20T10:30:11.700' AS DateTime), N'test', N'1', 0, N'示範站台', N'                                                  ')
SET IDENTITY_INSERT [dbo].[SysWebSiteLang] OFF
SET IDENTITY_INSERT [dbo].[SysZipCode] ON 

INSERT [dbo].[SysZipCode] ([ZipCodeSN], [Title], [ParentSN], [ZipCode], [SortOrder], [IsEnable]) VALUES (1, N'基隆市', 0, N'01', 1, N'1')
INSERT [dbo].[SysZipCode] ([ZipCodeSN], [Title], [ParentSN], [ZipCode], [SortOrder], [IsEnable]) VALUES (2, N'臺北市', 0, N'02', 2, N'1')
INSERT [dbo].[SysZipCode] ([ZipCodeSN], [Title], [ParentSN], [ZipCode], [SortOrder], [IsEnable]) VALUES (3, N'新北市', 0, N'03', 3, N'1')
INSERT [dbo].[SysZipCode] ([ZipCodeSN], [Title], [ParentSN], [ZipCode], [SortOrder], [IsEnable]) VALUES (4, N'桃園市', 0, N'04', 4, N'1')
INSERT [dbo].[SysZipCode] ([ZipCodeSN], [Title], [ParentSN], [ZipCode], [SortOrder], [IsEnable]) VALUES (5, N'新竹市', 0, N'05', 5, N'1')
INSERT [dbo].[SysZipCode] ([ZipCodeSN], [Title], [ParentSN], [ZipCode], [SortOrder], [IsEnable]) VALUES (6, N'新竹縣', 0, N'06', 6, N'1')
INSERT [dbo].[SysZipCode] ([ZipCodeSN], [Title], [ParentSN], [ZipCode], [SortOrder], [IsEnable]) VALUES (7, N'苗栗縣', 0, N'07', 7, N'1')
INSERT [dbo].[SysZipCode] ([ZipCodeSN], [Title], [ParentSN], [ZipCode], [SortOrder], [IsEnable]) VALUES (8, N'臺中市', 0, N'08', 8, N'1')
INSERT [dbo].[SysZipCode] ([ZipCodeSN], [Title], [ParentSN], [ZipCode], [SortOrder], [IsEnable]) VALUES (9, N'彰化縣', 0, N'09', 9, N'1')
INSERT [dbo].[SysZipCode] ([ZipCodeSN], [Title], [ParentSN], [ZipCode], [SortOrder], [IsEnable]) VALUES (10, N'南投縣', 0, N'10', 10, N'1')
INSERT [dbo].[SysZipCode] ([ZipCodeSN], [Title], [ParentSN], [ZipCode], [SortOrder], [IsEnable]) VALUES (11, N'雲林縣', 0, N'11', 11, N'1')
INSERT [dbo].[SysZipCode] ([ZipCodeSN], [Title], [ParentSN], [ZipCode], [SortOrder], [IsEnable]) VALUES (12, N'嘉義市', 0, N'12', 12, N'1')
INSERT [dbo].[SysZipCode] ([ZipCodeSN], [Title], [ParentSN], [ZipCode], [SortOrder], [IsEnable]) VALUES (13, N'嘉義縣', 0, N'13', 13, N'1')
INSERT [dbo].[SysZipCode] ([ZipCodeSN], [Title], [ParentSN], [ZipCode], [SortOrder], [IsEnable]) VALUES (14, N'臺南市', 0, N'14', 14, N'1')
INSERT [dbo].[SysZipCode] ([ZipCodeSN], [Title], [ParentSN], [ZipCode], [SortOrder], [IsEnable]) VALUES (15, N'高雄市', 0, N'15', 15, N'1')
INSERT [dbo].[SysZipCode] ([ZipCodeSN], [Title], [ParentSN], [ZipCode], [SortOrder], [IsEnable]) VALUES (16, N'屏東縣', 0, N'16', 16, N'1')
INSERT [dbo].[SysZipCode] ([ZipCodeSN], [Title], [ParentSN], [ZipCode], [SortOrder], [IsEnable]) VALUES (17, N'台東縣', 0, N'17', 17, N'1')
INSERT [dbo].[SysZipCode] ([ZipCodeSN], [Title], [ParentSN], [ZipCode], [SortOrder], [IsEnable]) VALUES (18, N'花蓮縣', 0, N'18', 18, N'1')
INSERT [dbo].[SysZipCode] ([ZipCodeSN], [Title], [ParentSN], [ZipCode], [SortOrder], [IsEnable]) VALUES (19, N'宜蘭縣', 0, N'19', 19, N'1')
INSERT [dbo].[SysZipCode] ([ZipCodeSN], [Title], [ParentSN], [ZipCode], [SortOrder], [IsEnable]) VALUES (20, N'澎湖縣', 0, N'20', 20, N'1')
INSERT [dbo].[SysZipCode] ([ZipCodeSN], [Title], [ParentSN], [ZipCode], [SortOrder], [IsEnable]) VALUES (21, N'金門縣', 0, N'21', 21, N'1')
INSERT [dbo].[SysZipCode] ([ZipCodeSN], [Title], [ParentSN], [ZipCode], [SortOrder], [IsEnable]) VALUES (22, N'連江縣', 0, N'22', 22, N'1')
INSERT [dbo].[SysZipCode] ([ZipCodeSN], [Title], [ParentSN], [ZipCode], [SortOrder], [IsEnable]) VALUES (23, N'國外', 0, N'23', 23, N'1')
SET IDENTITY_INSERT [dbo].[SysZipCode] OFF
SET IDENTITY_INSERT [dbo].[WebLevel] ON 

INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (1, N'TestDemo1', 0, N'TestDemo', N'zh-tw', N'1', N'PAGELIST', N'0', N'範例節點', NULL, N'1', N'1', N'1', N'1', N'0', 0, CAST(N'2022-03-10T14:33:06.000' AS DateTime), NULL, NULL, NULL, N'ColorBlockList', N'0', N'1', N'test', CAST(N'2023-03-13T15:28:23.787' AS DateTime), N'::1', N'test', CAST(N'2022-03-07T16:12:43.693' AS DateTime), 1, 1, N'/TestDemo/1.html', NULL, NULL, NULL, N'SEO 簡介', N'SEO 關鍵字', N'M')
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (2, N'TestDemo2', 0, N'TestDemo', N'zh-tw', N'2', N'PAGELIST', N'0', N'(範例)首頁區塊維護', NULL, N'1', N'1', N'1', NULL, N'0', 0, CAST(N'2023-03-13T15:46:09.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2023-03-13T15:46:16.483' AS DateTime), N'::1', N'test', CAST(N'2022-03-07T16:12:43.693' AS DateTime), 2, 2, NULL, NULL, NULL, NULL, NULL, NULL, N'M')
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (3, N'TestDemo3', 0, N'TestDemo', N'zh-tw', N'3', N'PAGELIST', N'0', N'(範例)頁首頁底區塊維護', NULL, N'1', N'1', N'1', NULL, N'0', 0, CAST(N'2023-03-13T15:46:24.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2023-03-13T15:46:31.617' AS DateTime), N'::1', N'test', CAST(N'2022-03-07T16:12:43.693' AS DateTime), 3, 3, NULL, NULL, NULL, NULL, NULL, NULL, N'M')
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (334, N'TestDemo_0', 2, N'TestDemo', N'zh-tw', N'2', N'PAGELIST', N'0', N'(範例)主首頁區塊', NULL, NULL, NULL, NULL, NULL, N'0', NULL, CAST(N'2022-06-20T15:24:38.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2023-03-13T15:46:06.917' AS DateTime), N'::1', N'test', CAST(N'2022-06-11T16:38:56.710' AS DateTime), 1, 334, NULL, NULL, NULL, NULL, NULL, NULL, N'M')
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (335, N'TestDemo_0', 2, N'TestDemo', N'en', N'2', N'PAGELIST', N'0', N'首頁大圖', NULL, NULL, NULL, NULL, NULL, N'0', NULL, CAST(N'2022-07-27T09:59:25.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2022-08-08T14:27:32.087' AS DateTime), N'::1', N'test', CAST(N'2022-06-11T16:38:56.710' AS DateTime), 1, 334, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (348, N'digital-affairs', 1, N'TestDemo', N'zh-tw', N'1', N'PAGELIST', N'0', N'核心業務', NULL, N'1', N'1', NULL, N'1', N'0', NULL, CAST(N'2022-06-11T16:55:27.000' AS DateTime), NULL, NULL, NULL, N'IcoList', N'0', N'1', N'test', CAST(N'2023-03-13T15:30:58.363' AS DateTime), N'::1', N'test', CAST(N'2022-06-11T16:50:20.140' AS DateTime), 2, 348, N'/TestDemo/digital-affairs/348.html', NULL, NULL, NULL, N'SEO 測試', N'SEO KEY', N'M')
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (349, N'digital-affairs', 1, N'TestDemo', N'en', N'1', N'PAGELIST', N'0', N'Digital Affairs', NULL, N'1', N'1', NULL, N'1', N'0', NULL, CAST(N'2022-07-04T16:46:25.000' AS DateTime), NULL, NULL, NULL, N'IcoList', N'0', N'1', N'test', CAST(N'2022-09-14T11:26:43.980' AS DateTime), N'::1', N'test', CAST(N'2022-06-11T16:50:20.140' AS DateTime), 5, 348, N'/en/digital-affairs/348.html', NULL, NULL, NULL, N'SEO Description111', N'SEO Keywords111', NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (484, N'priorities', 340, N'TestDemo', N'zh-tw', N'2', N'TAB', N'0', N'具體作為', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-13T16:38:10.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2022-08-25T13:46:50.863' AS DateTime), N'::1', N'test', CAST(N'2022-06-13T16:38:10.060' AS DateTime), 1, 484, NULL, N'1 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (485, N'priorities', 340, N'TestDemo', N'en', N'2', N'TAB', N'0', N'Priorities', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-07-28T11:39:55.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2022-08-25T13:46:50.867' AS DateTime), N'::1', N'test', CAST(N'2022-06-13T16:38:10.060' AS DateTime), 1, 484, NULL, N'1 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (486, N'services', 340, N'TestDemo', N'zh-tw', N'2', N'LINK', N'0', N'業務服務', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-13T16:49:18.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'-99', N'test', CAST(N'2022-06-13T16:50:15.153' AS DateTime), N'::1', N'test', CAST(N'2022-06-13T16:49:18.797' AS DateTime), 3, 486, NULL, N'1 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (487, N'services', 340, N'TestDemo', N'en', N'2', N'LINK', N'0', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'0', N'-99', N'test', CAST(N'2022-06-13T16:50:15.153' AS DateTime), N'::1', N'test', CAST(N'2022-06-13T16:49:18.797' AS DateTime), 3, 486, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (488, N'programs', 340, N'TestDemo', N'zh-tw', N'2', N'TAB', N'0', N'執行計畫', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-13T16:49:56.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2022-06-14T10:53:27.763' AS DateTime), N'::1', N'test', CAST(N'2022-06-13T16:49:56.817' AS DateTime), 4, 488, NULL, N'3 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (489, N'programs', 340, N'TestDemo', N'en', N'2', N'TAB', N'0', N'Programs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-07-28T11:41:08.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2022-07-28T11:41:21.060' AS DateTime), N'::1', N'test', CAST(N'2022-06-13T16:49:56.817' AS DateTime), 4, 488, NULL, N'3 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (490, N'services', 340, N'TestDemo', N'zh-tw', N'2', N'TAB', N'0', N'業務服務', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-13T16:50:33.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2022-06-14T10:53:14.200' AS DateTime), N'::1', N'test', CAST(N'2022-06-13T16:50:33.823' AS DateTime), 2, 490, NULL, N'2 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (491, N'services', 340, N'TestDemo', N'en', N'2', N'TAB', N'0', N'Services', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-07-28T11:40:36.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2022-07-28T11:40:52.510' AS DateTime), N'::1', N'test', CAST(N'2022-06-13T16:50:33.823' AS DateTime), 2, 490, NULL, N'2 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (492, N'sections', 340, N'TestDemo', N'zh-tw', N'2', N'TAB', N'0', N'部門單位', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-13T16:51:03.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2022-06-14T10:57:59.817' AS DateTime), N'::1', N'test', CAST(N'2022-06-13T16:51:03.797' AS DateTime), 7, 492, NULL, N'5 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (493, N'sections', 340, N'TestDemo', N'en', N'2', N'TAB', N'0', N'Sections', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-07-28T11:41:23.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'0', N'test', CAST(N'2022-08-26T10:03:53.213' AS DateTime), N'::1', N'test', CAST(N'2022-06-13T16:51:03.797' AS DateTime), 7, 492, NULL, N'5 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (496, N'priorities', 336, N'TestDemo', N'zh-tw', N'2', N'TAB', N'0', N'具體作為', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-14T08:57:37.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2022-08-25T13:46:26.400' AS DateTime), N'::1', N'test', CAST(N'2022-06-14T08:57:36.727' AS DateTime), 1, 496, NULL, N'1 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (497, N'priorities', 336, N'TestDemo', N'en', N'2', N'TAB', N'0', N'Operations', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-07-08T11:47:03.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2022-08-25T13:46:26.503' AS DateTime), N'::1', N'test', CAST(N'2022-06-14T08:57:36.727' AS DateTime), 1, 496, NULL, N'1 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (498, N'services', 336, N'TestDemo', N'zh-tw', N'2', N'TAB', N'0', N'業務服務', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-14T08:58:30.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'0', N'test', CAST(N'2022-06-14T10:51:59.173' AS DateTime), N'::1', N'test', CAST(N'2022-06-14T08:58:30.587' AS DateTime), 3, 498, NULL, N'2 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (499, N'services', 336, N'TestDemo', N'en', N'2', N'TAB', N'0', N'Services', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-07-08T11:48:39.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'0', N'test', CAST(N'2022-07-08T13:24:58.823' AS DateTime), N'::1', N'test', CAST(N'2022-06-14T08:58:30.587' AS DateTime), 3, 498, NULL, N'2 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (500, N'programs', 336, N'TestDemo', N'zh-tw', N'2', N'TAB', N'0', N'執行計畫', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-14T08:58:55.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'0', N'test', CAST(N'2022-06-14T10:52:20.337' AS DateTime), N'::1', N'test', CAST(N'2022-06-14T08:58:55.430' AS DateTime), 5, 500, NULL, N'3 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (501, N'programs', 336, N'TestDemo', N'en', N'2', N'TAB', N'0', N'Programs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-07-08T11:48:52.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'0', N'test', CAST(N'2022-07-08T13:25:17.587' AS DateTime), N'::1', N'test', CAST(N'2022-06-14T08:58:55.430' AS DateTime), 5, 500, NULL, N'3 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (502, N'sections', 336, N'TestDemo', N'zh-tw', N'2', N'TAB', N'0', N'部門單位', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-14T08:59:16.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2022-06-14T09:05:34.630' AS DateTime), N'::1', N'test', CAST(N'2022-06-14T08:59:16.390' AS DateTime), 7, 502, NULL, N'5 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (503, N'sections', 336, N'TestDemo', N'en', N'2', N'TAB', N'0', N'Sections', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-07-08T11:49:14.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'0', N'test', CAST(N'2022-08-26T10:03:07.783' AS DateTime), N'::1', N'test', CAST(N'2022-06-14T08:59:16.390' AS DateTime), 7, 502, NULL, N'5 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (504, N'priorities', 338, N'TestDemo', N'zh-tw', N'2', N'TAB', N'0', N'具體作為', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-14T09:07:50.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2022-08-25T13:47:06.857' AS DateTime), N'::1', N'test', CAST(N'2022-06-14T09:07:50.437' AS DateTime), 1, 504, NULL, N'1 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (505, N'priorities', 338, N'TestDemo', N'en', N'2', N'TAB', N'0', N'Operations', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-07-28T13:54:34.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2022-08-25T13:47:06.860' AS DateTime), N'::1', N'test', CAST(N'2022-06-14T09:07:50.437' AS DateTime), 1, 504, NULL, N'1 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (506, N'services', 338, N'TestDemo', N'zh-tw', N'2', N'TAB', N'0', N'業務服務', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-14T09:08:36.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2022-06-14T12:07:15.883' AS DateTime), N'::1', N'test', CAST(N'2022-06-14T09:08:36.290' AS DateTime), 3, 506, NULL, N'2 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (507, N'services', 338, N'TestDemo', N'en', N'2', N'TAB', N'0', N'Services', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-07-28T13:54:50.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2022-07-28T13:54:57.480' AS DateTime), N'::1', N'test', CAST(N'2022-06-14T09:08:36.290' AS DateTime), 3, 506, NULL, N'2 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (508, N'programs', 338, N'TestDemo', N'zh-tw', N'2', N'TAB', N'0', N'執行計畫', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-14T09:09:22.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2022-06-14T10:54:35.283' AS DateTime), N'::1', N'test', CAST(N'2022-06-14T09:09:22.333' AS DateTime), 5, 508, NULL, N'3 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (509, N'programs', 338, N'TestDemo', N'en', N'2', N'TAB', N'0', N'Programs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-07-28T13:55:00.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2022-07-28T13:55:10.970' AS DateTime), N'::1', N'test', CAST(N'2022-06-14T09:09:22.333' AS DateTime), 5, 508, NULL, N'3 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (510, N'sections', 338, N'TestDemo', N'zh-tw', N'2', N'TAB', N'0', N'部門單位', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-14T09:09:43.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2022-06-14T09:09:49.810' AS DateTime), N'::1', N'test', CAST(N'2022-06-14T09:09:43.453' AS DateTime), 7, 510, NULL, N'5 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (511, N'sections', 338, N'TestDemo', N'en', N'2', N'TAB', N'0', N'Sections', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-07-28T13:55:13.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'0', N'test', CAST(N'2022-08-26T10:04:23.110' AS DateTime), N'::1', N'test', CAST(N'2022-06-14T09:09:43.453' AS DateTime), 7, 510, NULL, N'5 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (512, N'priorities', 342, N'TestDemo', N'zh-tw', N'2', N'TAB', N'0', N'具體作為', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-14T09:22:34.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2022-08-25T13:46:42.323' AS DateTime), N'::1', N'test', CAST(N'2022-06-14T09:22:34.637' AS DateTime), 1, 512, NULL, N'1 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (513, N'priorities', 342, N'TestDemo', N'en', N'2', N'TAB', N'0', N'Operations', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-08-05T10:45:14.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2022-08-25T13:46:42.327' AS DateTime), N'::1', N'test', CAST(N'2022-06-14T09:22:34.637' AS DateTime), 1, 512, NULL, N'1 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (514, N'services', 342, N'TestDemo', N'zh-tw', N'2', N'TAB', N'0', N'業務服務', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-14T09:22:53.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2022-11-14T13:37:58.500' AS DateTime), N'::1', N'test', CAST(N'2022-06-14T09:22:53.843' AS DateTime), 3, 514, NULL, N'2 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (515, N'services', 342, N'TestDemo', N'en', N'2', N'TAB', N'0', N'Services', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-08-05T10:54:36.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'0', N'test', CAST(N'2022-11-14T13:37:58.507' AS DateTime), N'::1', N'test', CAST(N'2022-06-14T09:22:53.843' AS DateTime), 3, 514, NULL, N'2 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (516, N'programs', 342, N'TestDemo', N'zh-tw', N'2', N'TAB', N'0', N'執行計畫', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-14T09:23:10.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'0', N'test', CAST(N'2022-08-25T14:31:28.717' AS DateTime), N'::1', N'test', CAST(N'2022-06-14T09:23:10.480' AS DateTime), 5, 516, NULL, N'3 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (517, N'programs', 342, N'TestDemo', N'en', N'2', N'TAB', N'0', N'Programs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-08-05T10:54:53.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'0', N'test', CAST(N'2022-08-25T14:31:28.717' AS DateTime), N'::1', N'test', CAST(N'2022-06-14T09:23:10.480' AS DateTime), 5, 516, NULL, N'3 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (518, N'sections', 342, N'TestDemo', N'zh-tw', N'2', N'TAB', N'0', N'部門單位', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-14T09:23:25.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2022-06-14T14:20:15.077' AS DateTime), N'::1', N'test', CAST(N'2022-06-14T09:23:25.087' AS DateTime), 7, 518, NULL, N'5 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (519, N'sections', 342, N'TestDemo', N'en', N'2', N'TAB', N'0', N'Sections', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-08-05T10:55:08.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'0', N'test', CAST(N'2022-08-26T10:03:40.147' AS DateTime), N'::1', N'test', CAST(N'2022-06-14T09:23:25.087' AS DateTime), 7, 518, NULL, N'5 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (520, N'priorities', 344, N'TestDemo', N'zh-tw', N'2', N'TAB', N'0', N'具體作為', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-14T09:36:20.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2022-08-25T13:46:33.537' AS DateTime), N'::1', N'test', CAST(N'2022-06-14T09:36:20.317' AS DateTime), 1, 520, NULL, N'1 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (521, N'priorities', 344, N'TestDemo', N'en', N'2', N'TAB', N'0', N'Operations', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-07-28T13:52:42.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2022-08-25T13:46:33.543' AS DateTime), N'::1', N'test', CAST(N'2022-06-14T09:36:20.317' AS DateTime), 1, 520, NULL, N'1 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (522, N'services', 344, N'TestDemo', N'zh-tw', N'2', N'TAB', N'0', N'業務服務', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-14T09:36:46.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2022-06-14T14:19:21.447' AS DateTime), N'::1', N'test', CAST(N'2022-06-14T09:36:46.247' AS DateTime), 3, 522, NULL, N'2 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (523, N'services', 344, N'TestDemo', N'en', N'2', N'TAB', N'0', N'Services', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-07-28T13:52:59.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2022-07-28T13:53:06.373' AS DateTime), N'::1', N'test', CAST(N'2022-06-14T09:36:46.247' AS DateTime), 3, 522, NULL, N'2 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (524, N'programs', 344, N'TestDemo', N'zh-tw', N'2', N'TAB', N'0', N'執行計畫', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-14T09:37:01.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2022-06-14T14:19:28.053' AS DateTime), N'::1', N'test', CAST(N'2022-06-14T09:37:01.267' AS DateTime), 5, 524, NULL, N'3 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (525, N'programs', 344, N'TestDemo', N'en', N'2', N'TAB', N'0', N'Programs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-07-28T13:53:08.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2022-07-28T13:53:19.390' AS DateTime), N'::1', N'test', CAST(N'2022-06-14T09:37:01.267' AS DateTime), 5, 524, NULL, N'3 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (526, N'sections', 344, N'TestDemo', N'zh-tw', N'2', N'TAB', N'0', N'部門單位', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-14T09:37:13.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2022-06-14T14:19:33.860' AS DateTime), N'::1', N'test', CAST(N'2022-06-14T09:37:13.163' AS DateTime), 7, 526, NULL, N'5 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (527, N'sections', 344, N'TestDemo', N'en', N'2', N'TAB', N'0', N'Sections', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-07-28T13:53:21.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'0', N'test', CAST(N'2022-08-26T10:03:22.033' AS DateTime), N'::1', N'test', CAST(N'2022-06-14T09:37:13.163' AS DateTime), 7, 526, NULL, N'5 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (528, N'priorities', 346, N'TestDemo', N'zh-tw', N'2', N'TAB', N'0', N'具體作為', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-14T09:49:23.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2022-08-25T13:46:59.010' AS DateTime), N'::1', N'test', CAST(N'2022-06-14T09:49:23.597' AS DateTime), 1, 528, NULL, N'1 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (529, N'priorities', 346, N'TestDemo', N'en', N'2', N'TAB', N'0', N'Operations', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-07-28T13:53:46.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2022-08-25T13:46:59.013' AS DateTime), N'::1', N'test', CAST(N'2022-06-14T09:49:23.597' AS DateTime), 1, 528, NULL, N'1 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (530, N'services', 346, N'TestDemo', N'zh-tw', N'2', N'TAB', N'0', N'業務服務', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-14T09:52:42.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'0', N'test', CAST(N'2022-08-08T14:28:46.787' AS DateTime), N'::1', N'test', CAST(N'2022-06-14T09:52:42.297' AS DateTime), 3, 530, NULL, N'2 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (531, N'services', 346, N'TestDemo', N'en', N'2', N'TAB', N'0', N'Services', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-07-28T13:53:58.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'0', N'test', CAST(N'2022-08-08T14:28:46.847' AS DateTime), N'::1', N'test', CAST(N'2022-06-14T09:52:42.297' AS DateTime), 3, 530, NULL, N'2 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (532, N'programs', 346, N'TestDemo', N'zh-tw', N'2', N'TAB', N'0', N'執行計畫', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-14T09:52:55.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'0', N'test', CAST(N'2022-08-08T14:28:57.063' AS DateTime), N'::1', N'test', CAST(N'2022-06-14T09:52:55.313' AS DateTime), 5, 532, NULL, N'3 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (533, N'programs', 346, N'TestDemo', N'en', N'2', N'TAB', N'0', N'Programs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-07-28T13:54:12.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'0', N'test', CAST(N'2022-08-08T14:28:57.073' AS DateTime), N'::1', N'test', CAST(N'2022-06-14T09:52:55.313' AS DateTime), 5, 532, NULL, N'3 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (534, N'sections', 346, N'TestDemo', N'zh-tw', N'2', N'TAB', N'0', N'部門單位', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-14T09:53:15.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2022-06-14T14:19:03.550' AS DateTime), N'::1', N'test', CAST(N'2022-06-14T09:53:15.453' AS DateTime), 7, 534, NULL, N'5 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (535, N'sections', 346, N'TestDemo', N'en', N'2', N'TAB', N'0', N'Sections', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-07-28T13:54:21.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'0', N'test', CAST(N'2022-08-26T10:04:06.340' AS DateTime), N'::1', N'test', CAST(N'2022-06-14T09:53:15.453' AS DateTime), 7, 534, NULL, N'5 ', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (592, N'banner2', 334, N'TestDemo', N'zh-tw', N'2', N'BANNER', N'0', N'(範例)核心業務', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-20T15:26:53.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2023-03-13T15:45:34.063' AS DateTime), N'::1', N'test', CAST(N'2022-06-20T15:26:35.507' AS DateTime), 6, 592, NULL, NULL, NULL, NULL, NULL, NULL, N'M')
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (593, N'banner2', 334, N'TestDemo', N'en', N'2', N'BANNER', N'0', N'Digital Affairs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-07-27T10:00:48.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2022-07-27T10:01:05.870' AS DateTime), N'::1', N'test', CAST(N'2022-06-20T15:26:35.507' AS DateTime), 6, 592, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (594, N'tab3', 334, N'TestDemo', N'zh-tw', N'2', N'TAB', N'0', N'(範例)公告訊息', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-20T15:47:58.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2023-03-13T15:45:13.263' AS DateTime), N'::1', N'test', CAST(N'2022-06-20T15:27:51.657' AS DateTime), 5, 594, NULL, NULL, NULL, NULL, NULL, NULL, N'M')
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (595, N'tab3', 334, N'TestDemo', N'en', N'2', N'TAB', N'0', N'News and Releases', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-07-27T10:01:13.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'0', N'test', CAST(N'2022-08-28T20:52:21.087' AS DateTime), N'::1', N'test', CAST(N'2022-06-20T15:27:51.657' AS DateTime), 5, 594, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (596, N'news4', 334, N'TestDemo', N'zh-tw', N'2', N'TAB', N'0', N'(範例)政策計畫', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-20T15:28:30.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2023-03-13T15:39:38.183' AS DateTime), N'::1', N'test', CAST(N'2022-06-20T15:28:30.920' AS DateTime), 7, 596, NULL, N'1 ', NULL, NULL, NULL, NULL, N'M')
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (597, N'news4', 334, N'TestDemo', N'en', N'2', N'TAB', N'0', N'Programs', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-07-27T10:01:37.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2022-08-23T13:45:52.200' AS DateTime), N'::1', N'test', CAST(N'2022-06-20T15:28:30.920' AS DateTime), 7, 596, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (598, N'tab5', 334, N'TestDemo', N'zh-tw', N'2', N'TAB', N'0', N'(範例)焦點議題', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-20T15:29:17.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'0', N'test', CAST(N'2023-03-13T15:45:44.093' AS DateTime), N'::1', N'test', CAST(N'2022-06-20T15:29:17.833' AS DateTime), 8, 598, NULL, NULL, NULL, NULL, NULL, NULL, N'M')
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (599, N'tab5', 334, N'TestDemo', N'en', N'2', N'TAB', N'0', N'Focus issues', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-07-27T10:02:44.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'0', N'test', CAST(N'2022-08-23T13:46:02.240' AS DateTime), N'::1', N'test', CAST(N'2022-06-20T15:29:17.833' AS DateTime), 8, 598, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (602, N'link7', 334, N'TestDemo', N'zh-tw', N'2', N'LINK', N'0', N'(範例)相關連結', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-20T15:48:12.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2023-03-13T15:45:53.697' AS DateTime), N'::1', N'test', CAST(N'2022-06-20T15:30:29.500' AS DateTime), 9, 602, NULL, NULL, NULL, NULL, NULL, NULL, N'M')
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (603, N'link7', 334, N'TestDemo', N'en', N'2', N'LINK', N'0', N'Links', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-07-27T10:03:29.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2022-07-27T10:03:46.973' AS DateTime), N'::1', N'test', CAST(N'2022-06-20T15:30:29.500' AS DateTime), 9, 602, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (696, N'footer', 3, N'TestDemo', N'zh-tw', N'3', N'PAGELIST', N'0', N'頁尾維護', NULL, NULL, NULL, NULL, NULL, N'0', NULL, CAST(N'2022-06-28T09:55:24.000' AS DateTime), NULL, N'<p class="mb-2 mb-md-3"><a class="fileTypeI ms-0 me-1" href="https://spdx.org/licenses/CC0-1.0" target="_blank" title="Creative Commons Zero (另開新視窗)">CC0</a>No copyright reserved.</p>
', N'<ul class="listAdd list-unstyled list-inline">
	<li>地址：<a class="ftAdd text-decoration-none" href="https://www.google.com.tw/maps/place/臺北市中正區延平南路143號" rel="noreferrer noopener" target="_blank" title="數位發展部地圖位置(另開新視窗)">100057 臺北市中正區延平南路143號</a></li>
	<li class="list-inline-item ms-0 ms-md-2 me-2 me-md-0">服務電話：<a class="text-decoration-none" href="tel:0800-770-707" title="數位發展部聯絡電話">0800-770-707</a></li>
	<li class="list-inline-item ms-0 ms-md-2 me-2 me-md-0">傳真電話：<a class="text-decoration-none" href="tel:02-2380-0791" title="數位發展部傳真電話">02-2380-0791</a></li>
	<li class="list-inline-item ms-0 ms-md-2 me-2 me-md-0">Email：<a class="text-decoration-none" href="mailto:service@moda.gov.tw" title="數位發展部聯絡Email">service@moda.gov.tw</a></li>
</ul>
<a class="d-inline-block" href="https://accessibility.moda.gov.tw/Applications/Detail?category=20220830155044" target="_blank" title="移至無障礙標章網頁（另開新視窗）"><img alt="通過AA檢測等級無障礙網頁檢測" height="45" src="/copyright/MODA/2frg2jm1.f04.svg" width="127" /></a>', NULL, N'0', N'1', N'test', CAST(N'2022-10-04T14:09:58.507' AS DateTime), N'::1', N'test', CAST(N'2022-06-23T12:00:47.007' AS DateTime), 3, 696, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (697, N'footer', 3, N'TestDemo', N'en', N'3', N'PAGELIST', N'0', N'頁尾維護', NULL, NULL, NULL, NULL, NULL, N'0', NULL, CAST(N'2022-07-26T09:51:07.000' AS DateTime), NULL, N'<p class="mb-2 mb-md-3"><a class="fileTypeI ms-0 me-1" href="https://spdx.org/licenses/CC0-1.0" target="_blank" title="Creative Commons Zero (open in new window)">CC0</a>No copyright reserved.</p>
', N'<ul class="listAdd list-unstyled list-inline">
	<li><a class="ftAdd text-decoration-none" href="https://www.google.com.tw/maps/place/臺北市中正區延平南路143號" rel="noreferrer noopener" target="_blank" title="moda MAP(open in new window)">No. 143, Yanping S. Rd., Zhongzheng Dist., Taipei City 100057 , Taiwan (R.O.C.)</a></li>
	<li class="list-inline-item ms-0 ms-md-2 me-2 me-md-0">TEL:&nbsp;<a class="text-decoration-none" href="tel:+886-2-2380-0777" title="moda TEL">+886-2-2380-0777</a></li>
	<li class="list-inline-item ms-0 ms-md-2 me-2 me-md-0">FAX:&nbsp;<a class="text-decoration-none" href="tel:+886-2-2380-0791" title="moda TEL">+886-2-2380-0791</a></li>
	<li class="list-inline-item ms-0 ms-md-2 me-2 me-md-0">Email:&nbsp;<a class="text-decoration-none" href="mailto:service@moda.gov.tw" title="moda Email">service@moda.gov.tw</a></li>
</ul>
<a class="d-inline-block" href="https://accessibility.moda.gov.tw/Applications/Detail?category=20220830155044" target="_blank" title="Government Accessible Web Check(open in new window)"><img alt="" height="45" src="/copyright/MODA/2frg2jm1.f04.svg" width="127" /></a>', NULL, N'0', N'1', N'test', CAST(N'2022-10-04T14:43:01.690' AS DateTime), N'::1', N'test', CAST(N'2022-06-23T12:00:47.007' AS DateTime), 4, 696, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (698, N'announcement', 696, N'TestDemo', N'zh-tw', N'3', N'PAGELIST', N'0', N'網站宣告列', NULL, NULL, NULL, NULL, NULL, N'0', NULL, CAST(N'2022-07-26T10:13:26.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2022-07-26T10:13:30.107' AS DateTime), N'::1', N'test', CAST(N'2022-06-23T12:02:20.350' AS DateTime), 1, 698, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (699, N'announcement', 696, N'TestDemo', N'en', N'3', N'PAGELIST', N'0', N'announcement', NULL, NULL, NULL, NULL, NULL, N'0', NULL, CAST(N'2022-07-26T10:13:34.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2022-07-26T10:13:47.810' AS DateTime), N'::1', N'test', CAST(N'2022-06-23T12:02:20.350' AS DateTime), 2, 698, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (700, N'security', 698, N'TestDemo', N'zh-tw', N'3', N'CP', N'0', N'資訊安全政策', NULL, NULL, NULL, NULL, NULL, N'0', NULL, CAST(N'2022-06-23T14:52:26.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'0', N'test', CAST(N'2022-08-25T17:19:40.600' AS DateTime), N'::1', N'test', CAST(N'2022-06-23T14:24:50.590' AS DateTime), 5, 700, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (701, N'security', 698, N'TestDemo', N'en', N'3', N'CP', N'0', N'Website Security Policy', NULL, NULL, NULL, NULL, NULL, N'0', NULL, CAST(N'2022-07-27T09:21:28.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'0', N'test', CAST(N'2022-08-25T17:19:40.613' AS DateTime), N'::1', N'test', CAST(N'2022-06-23T14:24:50.590' AS DateTime), 6, 700, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (702, N'privacy', 698, N'TestDemo', N'zh-tw', N'3', N'CP', N'0', N'隱私權及網站安全政策', NULL, NULL, NULL, NULL, NULL, N'0', NULL, CAST(N'2022-06-23T14:52:36.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2022-08-25T15:31:58.013' AS DateTime), N'::1', N'test', CAST(N'2022-06-23T14:31:31.857' AS DateTime), 1, 702, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (703, N'privacy', 698, N'TestDemo', N'en', N'3', N'CP', N'0', N'Privacy and Website Security Policy', NULL, NULL, NULL, NULL, NULL, N'0', NULL, CAST(N'2022-07-27T09:21:09.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2022-08-26T14:51:01.467' AS DateTime), N'::1', N'test', CAST(N'2022-06-23T14:31:31.857' AS DateTime), 2, 702, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (704, N'publicdeclare', 698, N'TestDemo', N'zh-tw', N'3', N'CP', N'0', N'政府網站資料開放宣告', NULL, NULL, NULL, NULL, NULL, N'0', NULL, CAST(N'2022-06-23T14:52:43.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2022-08-25T16:15:55.287' AS DateTime), N'::1', N'test', CAST(N'2022-06-23T14:33:03.900' AS DateTime), 3, 704, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (705, N'publicdeclare', 698, N'TestDemo', N'en', N'3', N'CP', N'0', N'Government Website Open Information Announcement', NULL, NULL, NULL, NULL, NULL, N'0', NULL, CAST(N'2022-07-27T09:20:43.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2022-08-26T14:51:09.950' AS DateTime), N'::1', N'test', CAST(N'2022-06-23T14:33:03.900' AS DateTime), 4, 704, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (706, N'contactus', 696, N'TestDemo', N'zh-tw', N'3', N'CP', N'0', N'聯絡資訊', NULL, NULL, NULL, NULL, NULL, N'0', NULL, CAST(N'2022-07-26T10:03:15.000' AS DateTime), NULL, N'<p class="mb-2 mb-md-3">CC0 No copyright reserved.</p>
', N'<ul class="listAdd list-unstyled list-inline">
	<li>地址：<a class="ftAdd text-decoration-none" href="https://www.google.com.tw/maps/place/臺北市中正區忠孝東路1段1號" rel="noreferrer noopener" target="_blank" title="數位發展部地圖位置(另開新視窗)">100009 臺北市中正區忠孝東路1段1號</a></li>
	<li class="list-inline-item">電話：<a class="text-decoration-none" href="tel:02-23566500" title="數位發展部聯絡電話">02-23566500</a></li>
	<li class="list-inline-item ms-md-3">Email:&nbsp;<a class="text-decoration-none" href="mailto:service@mail.moda.gov.tw" title="數位發展部聯絡Email">service@mail.moda.gov.tw</a></li>
</ul>
', NULL, N'0', N'-99', N'test', CAST(N'2022-08-11T17:11:34.627' AS DateTime), N'::1', N'test', CAST(N'2022-06-23T16:47:51.930' AS DateTime), 3, 706, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (707, N'contactus', 696, N'TestDemo', N'en', N'3', N'CP', N'0', N'contactus', NULL, NULL, NULL, NULL, NULL, N'0', NULL, CAST(N'2022-07-26T10:03:23.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'-99', N'test', CAST(N'2022-08-11T17:11:34.627' AS DateTime), N'::1', N'test', CAST(N'2022-06-23T16:47:51.930' AS DateTime), 4, 706, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (722, N'header', 3, N'TestDemo', N'zh-tw', N'3', N'PAGELIST', N'0', N'頁首維護', NULL, NULL, NULL, NULL, NULL, N'0', NULL, CAST(N'2022-06-27T15:32:27.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2022-09-30T15:46:18.797' AS DateTime), N'::1', N'test', CAST(N'2022-06-24T16:12:38.617' AS DateTime), 1, 722, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (723, N'header', 3, N'TestDemo', N'en', N'3', N'PAGELIST', N'0', N'頁首維護', NULL, NULL, NULL, NULL, NULL, N'0', NULL, CAST(N'2022-07-26T09:50:23.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2022-09-30T15:46:18.813' AS DateTime), N'::1', N'test', CAST(N'2022-06-24T16:12:38.617' AS DateTime), 2, 722, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (724, N'popular', 722, N'TestDemo', N'zh-tw', N'3', N'TEXT', N'0', N'熱門關鍵字', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-24T16:13:45.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2022-06-24T16:13:52.543' AS DateTime), N'::1', N'test', CAST(N'2022-06-24T16:13:45.820' AS DateTime), 1, 724, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (725, N'popular', 722, N'TestDemo', N'en', N'3', N'TEXT', N'0', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'0', N'0', N'test', CAST(N'2022-06-24T16:13:52.557' AS DateTime), N'::1', N'test', CAST(N'2022-06-24T16:13:45.820' AS DateTime), 2, 724, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (955, N'hint8', 334, N'TestDemo', N'zh-tw', N'2', N'TEXT', N'0', N'(範例)跑馬燈', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-06-20T15:48:12.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2023-03-13T15:44:48.530' AS DateTime), N'::1', N'test', CAST(N'2022-08-18T09:35:01.147' AS DateTime), 4, 955, NULL, NULL, NULL, NULL, NULL, NULL, N'M')
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (956, N'hint8', 334, N'TestDemo', N'en', N'2', N'TEXT', N'0', N'Bulletin', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-07-27T10:03:29.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2022-08-22T17:05:07.913' AS DateTime), N'::1', N'test', CAST(N'2022-08-18T09:35:01.147' AS DateTime), 4, 955, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (1001, N'community', 696, N'TestDemo', N'zh-tw', N'3', N'LINK', N'0', N'社群', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-08-31T08:28:51.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'-99', N'test', CAST(N'2022-08-31T16:23:15.200' AS DateTime), N'::1', N'test', CAST(N'2022-08-31T08:28:51.787' AS DateTime), 3, 1001, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (1002, N'community', 696, N'TestDemo', N'en', N'3', N'LINK', N'0', N'community', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-08-31T08:33:07.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'-99', N'test', CAST(N'2022-08-31T16:23:15.200' AS DateTime), N'::1', N'test', CAST(N'2022-08-31T08:28:51.787' AS DateTime), 3, 1001, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (1005, N'socialmedia', 696, N'TestDemo', N'zh-tw', N'3', N'LINK', N'0', N'社群分享', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-09-02T10:35:50.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2022-09-02T10:35:56.267' AS DateTime), N'::1', N'test', CAST(N'2022-09-02T10:32:24.753' AS DateTime), 3, 1005, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (1006, N'socialmedia', 696, N'TestDemo', N'en', N'3', N'LINK', N'0', N'', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'0', N'0', N'test', CAST(N'2022-09-02T10:35:56.280' AS DateTime), N'::1', N'test', CAST(N'2022-09-02T10:32:24.753' AS DateTime), 3, 1005, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (1111, N'imgvideo9', 334, N'TestDemo', N'zh-tw', N'2', N'BANNER2', N'0', N'(範例)輪播圖片', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-11-03T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2023-03-13T15:44:37.780' AS DateTime), N'::1', N'test', CAST(N'2022-11-03T00:00:00.000' AS DateTime), 1, 1111, NULL, NULL, NULL, NULL, NULL, NULL, N'M')
INSERT [dbo].[WebLevel] ([WebLevelSN], [WebLevelKey], [ParentSN], [WebSiteID], [Lang], [WeblevelType], [Module], [Parameter], [Title], [ContentText], [FatFooterShow], [MainMenuShow], [SubMemuShow], [LeftMenuShow], [RSSShow], [PageView], [StartDate], [EndDate], [ContentHeader], [ContentFooter], [ListType], [SortMethod], [IsEnable], [ProcessUserID], [ProcessDate], [ProcessIPAddress], [CreatedUserID], [CreatedDate], [SortOrder], [MainSN], [StatesUrl], [TemplateValue], [Description], [Condition], [SEODescription], [SEOKeywords], [DepartmentID]) VALUES (1112, N'imgvideo9', 334, N'TestDemo', N'en', N'2', N'BANNER2', N'0', N'carousel', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-11-03T00:00:00.000' AS DateTime), NULL, NULL, NULL, NULL, N'0', N'1', N'test', CAST(N'2022-11-07T11:56:45.547' AS DateTime), N'::1', N'test', CAST(N'2022-11-03T00:00:00.000' AS DateTime), 1, 1111, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[WebLevel] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AuthSysGroupWebLevelM]    Script Date: 2023/3/21 上午 08:26:23 ******/
ALTER TABLE [dbo].[AuthSysGroupWebLevel] ADD  CONSTRAINT [IX_AuthSysGroupWebLevelM] UNIQUE NONCLUSTERED 
(
	[WebSiteID] ASC,
	[WebLevelSN] ASC,
	[Lang] ASC,
	[AuthType] ASC,
	[SysGroupSN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AuthSysUserWebLevelM]    Script Date: 2023/3/21 上午 08:26:23 ******/
ALTER TABLE [dbo].[AuthSysUserWebLevel] ADD  CONSTRAINT [IX_AuthSysUserWebLevelM] UNIQUE NONCLUSTERED 
(
	[WebSiteID] ASC,
	[WebLevelSN] ASC,
	[Lang] ASC,
	[AuthType] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_WEBFileContent]    Script Date: 2023/3/21 上午 08:26:23 ******/
ALTER TABLE [dbo].[RelWebFileContent] ADD  CONSTRAINT [IX_WEBFileContent] UNIQUE NONCLUSTERED 
(
	[SourceTable] ASC,
	[WEBFileSN] ASC,
	[SourceSN] ASC,
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SysWebSite]    Script Date: 2023/3/21 上午 08:26:23 ******/
ALTER TABLE [dbo].[SysWebSite] ADD  CONSTRAINT [IX_SysWebSite] UNIQUE NONCLUSTERED 
(
	[WebSiteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_SysWebSiteLang]    Script Date: 2023/3/21 上午 08:26:23 ******/
ALTER TABLE [dbo].[SysWebSiteLang] ADD  CONSTRAINT [IX_SysWebSiteLang] UNIQUE NONCLUSTERED 
(
	[WebSiteID] ASC,
	[Lang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_WEBFile]    Script Date: 2023/3/21 上午 08:26:23 ******/
ALTER TABLE [dbo].[WEBFile] ADD  CONSTRAINT [IX_WEBFile] UNIQUE NONCLUSTERED 
(
	[WEBFileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AuthSysGroupSysSection] ADD  CONSTRAINT [DF_SysGroupAccess_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[AuthSysGroupWebLevel] ADD  CONSTRAINT [DF_WebLevelAccessForGroup_WebSiteID]  DEFAULT ('') FOR [WebSiteID]
GO
ALTER TABLE [dbo].[AuthSysGroupWebLevel] ADD  CONSTRAINT [DF_WebLevelAccessForGroup_Lang]  DEFAULT ('') FOR [Lang]
GO
ALTER TABLE [dbo].[AuthSysGroupWebLevel] ADD  CONSTRAINT [DF_WebLevelAccess_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[AuthSysUserWebLevel] ADD  CONSTRAINT [DF_WebLevelAccessForUser_Lang1]  DEFAULT ('') FOR [Lang]
GO
ALTER TABLE [dbo].[AuthSysUserWebLevel] ADD  CONSTRAINT [DF_WebLevelAccessForUser_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[CaseApply] ADD  CONSTRAINT [DF_CaseApply_ResendNum]  DEFAULT ((0)) FOR [ResendNum]
GO
ALTER TABLE [dbo].[CaseApply] ADD  CONSTRAINT [DF_CaseApply_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[CaseApply] ADD  CONSTRAINT [DF_CaseApply_ApplyDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[CaseApplyValidate] ADD  CONSTRAINT [DF_CaseApplyValidate_StatementCheck1]  DEFAULT ((0)) FOR [StatementCheckDate]
GO
ALTER TABLE [dbo].[CaseApplyValidate] ADD  CONSTRAINT [DF_CaseApplyValidate_Status]  DEFAULT ((0)) FOR [Status]
GO
ALTER TABLE [dbo].[CaseApplyValidate] ADD  CONSTRAINT [DF_CaseApplyValidate_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[CaseApplyValidate] ADD  CONSTRAINT [DF_CaseApplyValidate_UpdateDate]  DEFAULT (getdate()) FOR [ProcessDate]
GO
ALTER TABLE [dbo].[LogAction] ADD  CONSTRAINT [DF_LogAction_SourceTable_1]  DEFAULT ('') FOR [SourceTable]
GO
ALTER TABLE [dbo].[LogAction] ADD  CONSTRAINT [DF_LogAction_SourceSN_1]  DEFAULT ((0)) FOR [SourceSN]
GO
ALTER TABLE [dbo].[LogAction] ADD  CONSTRAINT [DF_LogAction_Action2_1]  DEFAULT ('') FOR [Action2]
GO
ALTER TABLE [dbo].[LogAction] ADD  CONSTRAINT [DF_LogAction_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[RelWebFileContent] ADD  CONSTRAINT [DF_WEBFileContent_GroupID]  DEFAULT ((1)) FOR [GroupID]
GO
ALTER TABLE [dbo].[RelWebFileContent] ADD  CONSTRAINT [DF_RelWebFileContent_PageView]  DEFAULT ((0)) FOR [PageView]
GO
ALTER TABLE [dbo].[RelWebFileContent] ADD  CONSTRAINT [DF_WEBFileContent_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[SysCategory] ADD  CONSTRAINT [DF_SysCategory_ProcessDate]  DEFAULT (getdate()) FOR [ProcessDate]
GO
ALTER TABLE [dbo].[SysCategory] ADD  CONSTRAINT [DF_SysCategory_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[SysCategory] ADD  CONSTRAINT [DF_SysCategory_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
ALTER TABLE [dbo].[SysDepartment] ADD  CONSTRAINT [DF_SysDepartment_ProcessDate]  DEFAULT (getdate()) FOR [ProcessDate]
GO
ALTER TABLE [dbo].[SysDepartment] ADD  CONSTRAINT [DF_SysDepartment_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[SysGroup] ADD  CONSTRAINT [DF_SysGroup_ProcessDate]  DEFAULT (getdate()) FOR [ProcessDate]
GO
ALTER TABLE [dbo].[SysGroup] ADD  CONSTRAINT [DF_SysGroup_DateCreated]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[SysPwdHistory] ADD  CONSTRAINT [DF_PwdHistory_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[SysSection] ADD  CONSTRAINT [DF_SysSection_ProcessDate]  DEFAULT (getdate()) FOR [ProcessDate]
GO
ALTER TABLE [dbo].[SysSection] ADD  CONSTRAINT [DF_SysSection_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[SysUser] ADD  CONSTRAINT [DF_SysUser_ErrLoginnum]  DEFAULT ((0)) FOR [ErrLoginnum]
GO
ALTER TABLE [dbo].[SysUser] ADD  CONSTRAINT [DF_SYSUser_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [dbo].[SysUserLogin] ADD  CONSTRAINT [DF_SysUserLogin_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[SysWebSite] ADD  CONSTRAINT [DF_SysWebSite_ProcessDate]  DEFAULT (getdate()) FOR [ProcessDate]
GO
ALTER TABLE [dbo].[SysWebSite] ADD  CONSTRAINT [DF_SysWebSite_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[SysWebSiteLang] ADD  CONSTRAINT [DF_SysWebSiteLang_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[SysWebSiteLang] ADD  CONSTRAINT [DF_SysWebSiteLang_ProcessDate]  DEFAULT (getdate()) FOR [ProcessDate]
GO
ALTER TABLE [dbo].[WEBFile] ADD  CONSTRAINT [DF_WEBFile_ProcessDate]  DEFAULT (getdate()) FOR [ProcessDate]
GO
ALTER TABLE [dbo].[WEBFile] ADD  CONSTRAINT [DF_WEBFile_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[WebLevel] ADD  CONSTRAINT [DF_WebLevel_ParentID]  DEFAULT ((0)) FOR [ParentSN]
GO
ALTER TABLE [dbo].[WebLevel] ADD  CONSTRAINT [DF_WebLevel_ProcessDate]  DEFAULT (getdate()) FOR [ProcessDate]
GO
ALTER TABLE [dbo].[WebLevel] ADD  CONSTRAINT [DF_WebLevel_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[WebLink] ADD  CONSTRAINT [DF_WebLink_GroupID]  DEFAULT ((1)) FOR [GroupID]
GO
ALTER TABLE [dbo].[WebLink] ADD  CONSTRAINT [DF_WebLink_PageView]  DEFAULT ((0)) FOR [PageView]
GO
ALTER TABLE [dbo].[WebLink] ADD  CONSTRAINT [DF_WebLink_ProcessDate]  DEFAULT (getdate()) FOR [ProcessDate]
GO
ALTER TABLE [dbo].[WebLink] ADD  CONSTRAINT [DF_WebLink_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[WebLink] ADD  CONSTRAINT [DF_WebLink_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
ALTER TABLE [dbo].[WEBNews] ADD  CONSTRAINT [DF_WEBNews_ProcessDate]  DEFAULT (getdate()) FOR [ProcessDate]
GO
ALTER TABLE [dbo].[WEBNews] ADD  CONSTRAINT [DF_WEBNews_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[WEBNews] ADD  CONSTRAINT [DF_WEBNews_SortOrder]  DEFAULT ((0)) FOR [SortOrder]
GO
ALTER TABLE [dbo].[CaseApply]  WITH CHECK ADD  CONSTRAINT [FK_CaseApply_CaseApplyClass] FOREIGN KEY([CaseApplyClassSN])
REFERENCES [dbo].[CaseApplyClass] ([CaseApplyClassSN])
GO
ALTER TABLE [dbo].[CaseApply] CHECK CONSTRAINT [FK_CaseApply_CaseApplyClass]
GO
ALTER TABLE [dbo].[CaseApply]  WITH CHECK ADD  CONSTRAINT [FK_CaseApply_CaseApplyValidate] FOREIGN KEY([CaseValidateSN])
REFERENCES [dbo].[CaseApplyValidate] ([CaseValidateSN])
GO
ALTER TABLE [dbo].[CaseApply] CHECK CONSTRAINT [FK_CaseApply_CaseApplyValidate]
GO
ALTER TABLE [dbo].[CaseApplyClassTo]  WITH CHECK ADD  CONSTRAINT [FK_CaseApplyClassTo_CaseApplyClass] FOREIGN KEY([CaseApplyClassSN])
REFERENCES [dbo].[CaseApplyClass] ([CaseApplyClassSN])
GO
ALTER TABLE [dbo].[CaseApplyClassTo] CHECK CONSTRAINT [FK_CaseApplyClassTo_CaseApplyClass]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水號，起始值1，遞增值1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AuthSysGroupSysSection', @level2type=N'COLUMN',@level2name=N'AuthSysGroupSysSectionSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'網站編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AuthSysGroupSysSection', @level2type=N'COLUMN',@level2name=N'WebSiteID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建立日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AuthSysGroupSysSection', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水號，起始值1，遞增值1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AuthSysGroupWebLevel', @level2type=N'COLUMN',@level2name=N'AuthSysGroupWebLevelSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'網站編號(當AuthType=Module時此欄位為空值)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AuthSysGroupWebLevel', @level2type=N'COLUMN',@level2name=N'WebSiteID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'權限類別，代碼如下Module：模組設定、Article：文章維護、Auth：權限設定' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AuthSysGroupWebLevel', @level2type=N'COLUMN',@level2name=N'AuthType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建立日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AuthSysGroupWebLevel', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水號，起始值1，遞增值1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AuthSysUserWebLevel', @level2type=N'COLUMN',@level2name=N'AuthSysUserWebLevelSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'網站編號(當AuthType=Module時此欄位為空值)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AuthSysUserWebLevel', @level2type=N'COLUMN',@level2name=N'WebSiteID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'權限類別，代碼如下Module：模組設定、Article：文章維護、Auth：權限設定' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AuthSysUserWebLevel', @level2type=N'COLUMN',@level2name=N'AuthType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者帳號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AuthSysUserWebLevel', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建立日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'AuthSysUserWebLevel', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApply', @level2type=N'COLUMN',@level2name=N'CaseApplySN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'對應驗證信 流水碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApply', @level2type=N'COLUMN',@level2name=N'CaseValidateSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'標題' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApply', @level2type=N'COLUMN',@level2name=N'Subject'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'內文' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApply', @level2type=N'COLUMN',@level2name=N'CaseContent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'意見分類SN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApply', @level2type=N'COLUMN',@level2name=N'CaseApplyClassSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'意見分類 備用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApply', @level2type=N'COLUMN',@level2name=N'CaseCategoryL2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申請者姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApply', @level2type=N'COLUMN',@level2name=N'ApplyUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申請者信箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApply', @level2type=N'COLUMN',@level2name=N'ContactEmail'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'區域號碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApply', @level2type=N'COLUMN',@level2name=N'TelAreacode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'家裡電話' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApply', @level2type=N'COLUMN',@level2name=N'Tel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分機號碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApply', @level2type=N'COLUMN',@level2name=N'TelExtension'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'手機號碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApply', @level2type=N'COLUMN',@level2name=N'Mobile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'案件編號- yyyyMMDDhhZZZZ (ZZZZ為流水碼)每小時最大可以受理9999' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApply', @level2type=N'COLUMN',@level2name=N'CaseNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'案件驗證碼 隨機碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApply', @level2type=N'COLUMN',@level2name=N'CasePwd'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'案件 接收驗證信 有效期限' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApply', @level2type=N'COLUMN',@level2name=N'EffectiveDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者 確認 案件成立時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApply', @level2type=N'COLUMN',@level2name=N'AcceptDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最後重寄確認信時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApply', @level2type=N'COLUMN',@level2name=N'ResendDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'重寄次數' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApply', @level2type=N'COLUMN',@level2name=N'ResendNum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公文回覆內文' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApply', @level2type=N'COLUMN',@level2name=N'ReplyContent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'對方回傳的' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApply', @level2type=N'COLUMN',@level2name=N'ReplyCaseNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'回覆狀態 :  0 尚未回覆  1 公文系統 2 管理系統回覆' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApply', @level2type=N'COLUMN',@level2name=N'ReplySource'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'對方回傳的回覆時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApply', @level2type=N'COLUMN',@level2name=N'ReplyDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'接收資料的時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApply', @level2type=N'COLUMN',@level2name=N'ReplyApiDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系統回復的訊息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApply', @level2type=N'COLUMN',@level2name=N'ReplySource2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'系統回復的訊息的時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApply', @level2type=N'COLUMN',@level2name=N'ReplySource2Date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0->案件成立 1 寄送確認信 2 寄送確認信失敗  3 完成確認信 4 寄送受理信成功   5 寄送受理信失敗  6 退回 9 結案' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApply', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公文機關' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApply', @level2type=N'COLUMN',@level2name=N'DocDept'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公文文號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApply', @level2type=N'COLUMN',@level2name=N'DocNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplyClass', @level2type=N'COLUMN',@level2name=N'CaseApplyClassSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'網站編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplyClass', @level2type=N'COLUMN',@level2name=N'WebSiteID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'暫時沒用到' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplyClass', @level2type=N'COLUMN',@level2name=N'ParentSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'意見分類' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplyClass', @level2type=N'COLUMN',@level2name=N'CaseName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'意見分類(英文)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplyClass', @level2type=N'COLUMN',@level2name=N'CaseNameEN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部門流水碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplyClass', @level2type=N'COLUMN',@level2name=N'SysDepartmentSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'意見分類代號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplyClass', @level2type=N'COLUMN',@level2name=N'CaseNo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公文子分類' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplyClass', @level2type=N'COLUMN',@level2name=N'CaseType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'辦理天數' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplyClass', @level2type=N'COLUMN',@level2name=N'HandleDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備註200個字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplyClass', @level2type=N'COLUMN',@level2name=N'info'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否啟用：1 啟用、0 停用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplyClass', @level2type=N'COLUMN',@level2name=N'IsEnable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'對應SysCategory' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplyClass', @level2type=N'COLUMN',@level2name=N'SysCategoryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'對應 意見分類 SN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplyClassTo', @level2type=N'COLUMN',@level2name=N'CaseApplyClassSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'意見分類 負責人 部門SN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplyClassTo', @level2type=N'COLUMN',@level2name=N'SysDepartmentSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'意見分類 負責人 姓名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplyClassTo', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'意見分類 負責人 email' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplyClassTo', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否啟用：1 啟用、0 停用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplyClassTo', @level2type=N'COLUMN',@level2name=N'IsEnable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'UploadAttachment、AddNewCase、SearchCase、DownloadAttachment' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplySpeedApiLog', @level2type=N'COLUMN',@level2name=N'Action'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'請求回應' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplySpeedApiLog', @level2type=N'COLUMN',@level2name=N'StatusCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'成功時存入回傳資料 錯誤時存入錯誤訊息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplySpeedApiLog', @level2type=N'COLUMN',@level2name=N'Message'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'API解析資料 狀態 1 : OK 2 : Fail 3 : Error' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplySpeedApiLog', @level2type=N'COLUMN',@level2name=N'ApiStatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'API解析資料 回傳訊息，OK時回傳空字串' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplySpeedApiLog', @level2type=N'COLUMN',@level2name=N'ApiMessage'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'民意信箱 : MailBox 、排程 : Console 、後台UserID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplySpeedApiLog', @level2type=N'COLUMN',@level2name=N'CreatedUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'滿意度1~10分' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplySurvey', @level2type=N'COLUMN',@level2name=N'CaseSatisfy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A:完全解決 B:部份解決 C:沒有解決 D:提出建議' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplySurvey', @level2type=N'COLUMN',@level2name=N'CaseSolved'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A:無 B:未解決 C:態度不佳 D: 時間太慢 E:欠缺誠意 F:引用錯誤 G:推諉責任 H:與實情不符' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplySurvey', @level2type=N'COLUMN',@level2name=N'CaseDefect'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建議事項' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplySurvey', @level2type=N'COLUMN',@level2name=N'CaseProposal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建立日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplySurvey', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'驗證信箱　流水碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplyValidate', @level2type=N'COLUMN',@level2name=N'CaseValidateSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'申請信箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplyValidate', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'驗證key' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplyValidate', @level2type=N'COLUMN',@level2name=N'Token'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'驗證有效時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplyValidate', @level2type=N'COLUMN',@level2name=N'EffectiveDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'驗證有??' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplyValidate', @level2type=N'COLUMN',@level2name=N'StatementCheckDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'驗證狀態 0 : 新增 1 : 已驗證 2: 已到下一階段' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplyValidate', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'用途 ?' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplyValidate', @level2type=N'COLUMN',@level2name=N'BowserInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplyValidate', @level2type=N'COLUMN',@level2name=N'ProcessIPAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建立時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplyValidate', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'修改時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplyValidate', @level2type=N'COLUMN',@level2name=N'ProcessDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'識別碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplyWeb', @level2type=N'COLUMN',@level2name=N'CaseApplyWebSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'站台編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplyWeb', @level2type=N'COLUMN',@level2name=N'WebSiteID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'標題' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplyWeb', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SEODescription' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplyWeb', @level2type=N'COLUMN',@level2name=N'SEODescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SEOKeywords' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplyWeb', @level2type=N'COLUMN',@level2name=N'SEOKeywords'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'GACode' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplyWeb', @level2type=N'COLUMN',@level2name=N'GACode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'滿意度開關' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplyWeb', @level2type=N'COLUMN',@level2name=N'Satisfaction'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'頁尾設定' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplyWeb', @level2type=N'COLUMN',@level2name=N'Footer'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'啟用與否' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplyWeb', @level2type=N'COLUMN',@level2name=N'IsEnable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建立者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplyWeb', @level2type=N'COLUMN',@level2name=N'CreatedUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建立時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplyWeb', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'編輯者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplyWeb', @level2type=N'COLUMN',@level2name=N'ProcessUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'編輯時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplyWeb', @level2type=N'COLUMN',@level2name=N'ProcessDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'編輯者IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CaseApplyWeb', @level2type=N'COLUMN',@level2name=N'ProcessIPAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水號，起始值1，遞增值1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LogAction', @level2type=N'COLUMN',@level2name=N'LogActionSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者帳號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LogAction', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'controller name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LogAction', @level2type=N'COLUMN',@level2name=N'Controller'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'action/function name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LogAction', @level2type=N'COLUMN',@level2name=N'Action'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0:Web, 1:Service, 2:Utility' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LogAction', @level2type=N'COLUMN',@level2name=N'ActionType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'狀態：1:成功、0:失敗' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LogAction', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'資料來源：WEBNEWS、WEBBanner、WebJournal、WebLevelM、WebLevelD、WEBFile 參考Utility.SysConst.SourceTable' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LogAction', @level2type=N'COLUMN',@level2name=N'SourceTable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'執行動作 Add、Del、Edit  參考Utility.SysConst.Action' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LogAction', @level2type=N'COLUMN',@level2name=N'Action2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'輸入資料' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LogAction', @level2type=N'COLUMN',@level2name=N'MessageInput'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'結果訊息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LogAction', @level2type=N'COLUMN',@level2name=N'MessageResult'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'紀錄修訂的網頁路徑
如：系統架構相關/網站管理/網站架構列表/首頁/研究報告查詢/99年委辦計畫一覽表' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LogAction', @level2type=N'COLUMN',@level2name=N'WebPath'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建檔日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LogAction', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登入者的IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LogAction', @level2type=N'COLUMN',@level2name=N'ProcessIPAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LogWebSite', @level2type=N'COLUMN',@level2name=N'LogWebSiteSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'WebLevelMSN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LogWebSite', @level2type=N'COLUMN',@level2name=N'WebLevelSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'WebNewsSN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LogWebSite', @level2type=N'COLUMN',@level2name=N'WebNewsSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'WebFileSN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LogWebSite', @level2type=N'COLUMN',@level2name=N'WebFileSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'GroupId' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LogWebSite', @level2type=N'COLUMN',@level2name=N'GroupId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'CreateDate' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LogWebSite', @level2type=N'COLUMN',@level2name=N'CreateDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水號，起始值1，遞增值1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RelSysUserGroup', @level2type=N'COLUMN',@level2name=N'RelSysGroupUserSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者帳號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RelSysUserGroup', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'群組流水號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RelSysUserGroup', @level2type=N'COLUMN',@level2name=N'SysGroupSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建檔日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RelSysUserGroup', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水號，起始值1，遞增值1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RelWebFileContent', @level2type=N'COLUMN',@level2name=N'RelWebFileContentSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'資料來源：WEBNEWS、WEBBanner' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RelWebFileContent', @level2type=N'COLUMN',@level2name=N'SourceTable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分辨群組檔案' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RelWebFileContent', @level2type=N'COLUMN',@level2name=N'GroupID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'點閱次數' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RelWebFileContent', @level2type=N'COLUMN',@level2name=N'PageView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建立日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RelWebFileContent', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'RelWebFileContent', @level2type=N'COLUMN',@level2name=N'SortOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StaticLink', @level2type=N'COLUMN',@level2name=N'StaticLinkSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'網站編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StaticLink', @level2type=N'COLUMN',@level2name=N'WebSiteID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'語言：TW、EN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StaticLink', @level2type=N'COLUMN',@level2name=N'Lang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'來源資料Table' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StaticLink', @level2type=N'COLUMN',@level2name=N'SourseTable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'來源資料SN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StaticLink', @level2type=N'COLUMN',@level2name=N'SourseSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'多語系共通SN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StaticLink', @level2type=N'COLUMN',@level2name=N'MainSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'讀取資料連結' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StaticLink', @level2type=N'COLUMN',@level2name=N'Link'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'客製靜態網址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StaticLink', @level2type=N'COLUMN',@level2name=N'StaticUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'開始時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StaticLink', @level2type=N'COLUMN',@level2name=N'StartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'結束時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StaticLink', @level2type=N'COLUMN',@level2name=N'EndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否發布：0 不公開，1 發布、2草稿' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StaticLink', @level2type=N'COLUMN',@level2name=N'IsEnable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建立時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StaticLink', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建立人員' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StaticLink', @level2type=N'COLUMN',@level2name=N'CreatedUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'處理時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StaticLink', @level2type=N'COLUMN',@level2name=N'ProcessDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'處理人員' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StaticLink', @level2type=N'COLUMN',@level2name=N'ProcessUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'處理人員IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StaticLink', @level2type=N'COLUMN',@level2name=N'ProcessIPAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0: 未生成/首頁/刪除   1 : 已生成' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StaticLink', @level2type=N'COLUMN',@level2name=N'IsLive'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'靜態化時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'StaticLink', @level2type=N'COLUMN',@level2name=N'staticDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水號，起始值1，遞增值1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysBlocklist', @level2type=N'COLUMN',@level2name=N'SysBlocklistSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'M 後台、W 前台' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysBlocklist', @level2type=N'COLUMN',@level2name=N'WebType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0 不設、1 黑名單、2 白名單' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysBlocklist', @level2type=N'COLUMN',@level2name=N'BlockType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'被阻擋的IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysBlocklist', @level2type=N'COLUMN',@level2name=N'BlockedIPAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否啟用：1 啟用、0 停用、-99 刪除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysBlocklist', @level2type=N'COLUMN',@level2name=N'IsEnable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'處理人員' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysBlocklist', @level2type=N'COLUMN',@level2name=N'ProcessUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'處理時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysBlocklist', @level2type=N'COLUMN',@level2name=N'ProcessDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'處理人員IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysBlocklist', @level2type=N'COLUMN',@level2name=N'ProcessIPAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建立日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysBlocklist', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysCategory', @level2type=N'COLUMN',@level2name=N'SysCategorySN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'參數代碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysCategory', @level2type=N'COLUMN',@level2name=N'SysCategoryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父層代號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysCategory', @level2type=N'COLUMN',@level2name=N'ParentKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'網站代號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysCategory', @level2type=N'COLUMN',@level2name=N'WebSiteID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'語系' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysCategory', @level2type=N'COLUMN',@level2name=N'Lang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'參數值' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysCategory', @level2type=N'COLUMN',@level2name=N'Value'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysCategory', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'處理人員' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysCategory', @level2type=N'COLUMN',@level2name=N'ProcessUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'處理時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysCategory', @level2type=N'COLUMN',@level2name=N'ProcessDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'處理人員IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysCategory', @level2type=N'COLUMN',@level2name=N'ProcessIPAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建立人員' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysCategory', @level2type=N'COLUMN',@level2name=N'CreatedUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建立日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysCategory', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysCategory', @level2type=N'COLUMN',@level2name=N'SortOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'狀態' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysCategory', @level2type=N'COLUMN',@level2name=N'IsEnable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'<同筆資料不同語系有想同的MainSN>可以想像GroupSN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysCategory', @level2type=N'COLUMN',@level2name=N'MainSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水號，起始值1，遞增值1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysDepartment', @level2type=N'COLUMN',@level2name=N'SysDepartmentSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'網站編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysDepartment', @level2type=N'COLUMN',@level2name=N'WebSiteID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'語系' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysDepartment', @level2type=N'COLUMN',@level2name=N'Lang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'單位編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysDepartment', @level2type=N'COLUMN',@level2name=N'DepartmentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父單位流水號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysDepartment', @level2type=N'COLUMN',@level2name=N'ParentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部門名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysDepartment', @level2type=N'COLUMN',@level2name=N'DepartmentName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部門簡稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysDepartment', @level2type=N'COLUMN',@level2name=N'ShortName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部門描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysDepartment', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否啟用：1 啟用、0 停用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysDepartment', @level2type=N'COLUMN',@level2name=N'IsEnable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'處理人員' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysDepartment', @level2type=N'COLUMN',@level2name=N'ProcessUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'處理時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysDepartment', @level2type=N'COLUMN',@level2name=N'ProcessDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'處理IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysDepartment', @level2type=N'COLUMN',@level2name=N'ProcessIPAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建立日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysDepartment', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建立人員' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysDepartment', @level2type=N'COLUMN',@level2name=N'CreatedUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysDepartment', @level2type=N'COLUMN',@level2name=N'SortOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'<同筆資料不同語系有想同的MainSN>可以想像GroupSN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysDepartment', @level2type=N'COLUMN',@level2name=N'MainSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水號，起始值1，遞增值1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysGroup', @level2type=N'COLUMN',@level2name=N'SysGroupSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'群組名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysGroup', @level2type=N'COLUMN',@level2name=N'GroupName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'群組描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysGroup', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否啟用：1 啟用、0 停用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysGroup', @level2type=N'COLUMN',@level2name=N'IsEnable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否可刪除：1 可、0 否，預設一般群組和系統管理群組不可刪除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysGroup', @level2type=N'COLUMN',@level2name=N'CanDelete'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'處理人員' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysGroup', @level2type=N'COLUMN',@level2name=N'ProcessUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'處理時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysGroup', @level2type=N'COLUMN',@level2name=N'ProcessDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'處理人員IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysGroup', @level2type=N'COLUMN',@level2name=N'ProcessIPAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建立人員' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysGroup', @level2type=N'COLUMN',@level2name=N'CreatedUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建立日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysGroup', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysGroup', @level2type=N'COLUMN',@level2name=N'SortOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'null  1 是/ 0 否' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysGroup', @level2type=N'COLUMN',@level2name=N'IsGroup'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysPwdHistory', @level2type=N'COLUMN',@level2name=N'SysPwdHistorySN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者帳號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysPwdHistory', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'加密後儲存' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysPwdHistory', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水號，起始值1，遞增值1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysSection', @level2type=N'COLUMN',@level2name=N'SysSectionSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上層功能流水號[SysSection]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysSection', @level2type=N'COLUMN',@level2name=N'ParentSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'controller\function' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysSection', @level2type=N'COLUMN',@level2name=N'ActionPath'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'功能名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysSection', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'功能說明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysSection', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'參數' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysSection', @level2type=N'COLUMN',@level2name=N'Parameter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否啟用：1 啟用、0 停用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysSection', @level2type=N'COLUMN',@level2name=N'IsEnable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'處理人員' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysSection', @level2type=N'COLUMN',@level2name=N'ProcessUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'處理時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysSection', @level2type=N'COLUMN',@level2name=N'ProcessDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'處理人員IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysSection', @level2type=N'COLUMN',@level2name=N'ProcessIPAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建立人員' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysSection', @level2type=N'COLUMN',@level2name=N'CreatedUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建立日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysSection', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysSection', @level2type=N'COLUMN',@level2name=N'SortOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'員工編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUser', @level2type=N'COLUMN',@level2name=N'EmpID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'帳號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUser', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'AD帳號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUser', @level2type=N'COLUMN',@level2name=N'ADUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUser', @level2type=N'COLUMN',@level2name=N'UserName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'英文名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUser', @level2type=N'COLUMN',@level2name=N'EngName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'暱稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUser', @level2type=N'COLUMN',@level2name=N'NickName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'性別：F，M' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUser', @level2type=N'COLUMN',@level2name=N'Gender'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'密碼 加密後儲存' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUser', @level2type=N'COLUMN',@level2name=N'Password'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者狀態：0 停用，1 啟用 -99 刪除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUser', @level2type=N'COLUMN',@level2name=N'UserSatus'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'連絡電話' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUser', @level2type=N'COLUMN',@level2name=N'Tel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'連絡電話' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUser', @level2type=N'COLUMN',@level2name=N'Mobile'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'聯絡信箱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUser', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'停用日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUser', @level2type=N'COLUMN',@level2name=N'DisableDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最後登入日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUser', @level2type=N'COLUMN',@level2name=N'LastLoginDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'最後修改密碼日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUser', @level2type=N'COLUMN',@level2name=N'PwdLastUpdate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登入失敗次數' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUser', @level2type=N'COLUMN',@level2name=N'ErrLoginnum'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'職稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUser', @level2type=N'COLUMN',@level2name=N'JobTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'辦公室電話' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUser', @level2type=N'COLUMN',@level2name=N'OfficePhone'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'照片' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUser', @level2type=N'COLUMN',@level2name=N'Photo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部門編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUser', @level2type=N'COLUMN',@level2name=N'DepartmentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'處理人員' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUser', @level2type=N'COLUMN',@level2name=N'ProcessUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'處理時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUser', @level2type=N'COLUMN',@level2name=N'ProcessDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'處理人員IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUser', @level2type=N'COLUMN',@level2name=N'ProcessIPAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建立日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUser', @level2type=N'COLUMN',@level2name=N'DateCreated'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUser', @level2type=N'COLUMN',@level2name=N'SortOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUser'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水號，起始值1，遞增值1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUserLogin', @level2type=N'COLUMN',@level2name=N'SysUserLoginSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者帳號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUserLogin', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者登入的網站' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUserLogin', @level2type=N'COLUMN',@level2name=N'WebSiteID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'狀態：1:成功、0:失敗' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUserLogin', @level2type=N'COLUMN',@level2name=N'Status'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登入訊息' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUserLogin', @level2type=N'COLUMN',@level2name=N'Message'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'登入者的IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUserLogin', @level2type=N'COLUMN',@level2name=N'ProcessIPAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建檔日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysUserLogin', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水號，起始值1，遞增值1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSite', @level2type=N'COLUMN',@level2name=N'SysWebSiteSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'網站編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSite', @level2type=N'COLUMN',@level2name=N'WebSiteID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'語言：TW、EN (need delete )' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSite', @level2type=N'COLUMN',@level2name=N'Lang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'標題' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSite', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'網域' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSite', @level2type=N'COLUMN',@level2name=N'DNS'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSite', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(need delete )' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSite', @level2type=N'COLUMN',@level2name=N'GACode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否啟用：1 啟用、0 停用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSite', @level2type=N'COLUMN',@level2name=N'IsEnable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'處理人員' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSite', @level2type=N'COLUMN',@level2name=N'ProcessUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'處理時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSite', @level2type=N'COLUMN',@level2name=N'ProcessDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'處理人員IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSite', @level2type=N'COLUMN',@level2name=N'ProcessIPAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建立人員' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSite', @level2type=N'COLUMN',@level2name=N'CreatedUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建立日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSite', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSite', @level2type=N'COLUMN',@level2name=N'SortOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'掃描失效連結時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSite', @level2type=N'COLUMN',@level2name=N'CheckLinksDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水號，起始值1，遞增值1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSiteLang', @level2type=N'COLUMN',@level2name=N'SysWebSiteLangSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'網站編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSiteLang', @level2type=N'COLUMN',@level2name=N'WebSiteID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'語言：TW、EN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSiteLang', @level2type=N'COLUMN',@level2name=N'Lang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'顯示標題' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSiteLang', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'處理人員IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSiteLang', @level2type=N'COLUMN',@level2name=N'ProcessIPAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建立日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSiteLang', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建立人員IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSiteLang', @level2type=N'COLUMN',@level2name=N'CreatedUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'處理時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSiteLang', @level2type=N'COLUMN',@level2name=N'ProcessDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'處理人員' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSiteLang', @level2type=N'COLUMN',@level2name=N'ProcessUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否啟用：1 啟用、0 停用' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSiteLang', @level2type=N'COLUMN',@level2name=N'IsEnable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSiteLang', @level2type=N'COLUMN',@level2name=N'SortOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSiteLang', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'查詢' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysWebSiteLang', @level2type=N'COLUMN',@level2name=N'GoogleSearchKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'縣市區域代碼表-流水碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysZipCode', @level2type=N'COLUMN',@level2name=N'ZipCodeSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysZipCode', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父層SN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysZipCode', @level2type=N'COLUMN',@level2name=N'ParentSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'代碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysZipCode', @level2type=N'COLUMN',@level2name=N'ZipCode'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysZipCode', @level2type=N'COLUMN',@level2name=N'SortOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否啟用：1 啟用、0 停用     -99刪除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'SysZipCode', @level2type=N'COLUMN',@level2name=N'IsEnable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'資料來源：WEBNEWS、WEBLEVELD' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebCntLink', @level2type=N'COLUMN',@level2name=N'SourceTable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'解析CKEditor裡的連結' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebCntLink', @level2type=N'COLUMN',@level2name=N'URL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水號，起始值1，遞增值1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBFile', @level2type=N'COLUMN',@level2name=N'WEBFileSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'檔案編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBFile', @level2type=N'COLUMN',@level2name=N'WEBFileID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否發布：0 不公開，1 發布' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBFile', @level2type=N'COLUMN',@level2name=N'IsEnable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'處理人員' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBFile', @level2type=N'COLUMN',@level2name=N'ProcessUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'處理時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBFile', @level2type=N'COLUMN',@level2name=N'ProcessDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'處理人員IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBFile', @level2type=N'COLUMN',@level2name=N'ProcessIPAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建立人員' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBFile', @level2type=N'COLUMN',@level2name=N'CreatedUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建立日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBFile', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'FileapI實際存放位置' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBFile', @level2type=N'COLUMN',@level2name=N'FileApiPath'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水號，起始值1，遞增值1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebFileDownLoads', @level2type=N'COLUMN',@level2name=N'FileSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'下載數' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebFileDownLoads', @level2type=N'COLUMN',@level2name=N'DownLoads'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建立日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebFileDownLoads', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'參考WebFile.WebFileSN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebFileExtend', @level2type=N'COLUMN',@level2name=N'WebFileExtendSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'檔案內容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebFileExtend', @level2type=N'COLUMN',@level2name=N'FileContentText'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'使用者保護   0-沒有(false)   1-有(true)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebFileExtend', @level2type=N'COLUMN',@level2name=N'IsProtect'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebHrefSource', @level2type=N'COLUMN',@level2name=N'SN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父層SN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebHrefSource', @level2type=N'COLUMN',@level2name=N'ParentSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'網站編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebHrefSource', @level2type=N'COLUMN',@level2name=N'WebSiteID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'來源table' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebHrefSource', @level2type=N'COLUMN',@level2name=N'Source'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'來源SN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebHrefSource', @level2type=N'COLUMN',@level2name=N'SourceSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'來源父層SN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebHrefSource', @level2type=N'COLUMN',@level2name=N'SourceSNParent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'連結' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebHrefSource', @level2type=N'COLUMN',@level2name=N'Href'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'起始時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebHrefSource', @level2type=N'COLUMN',@level2name=N'StardDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'結束時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebHrefSource', @level2type=N'COLUMN',@level2name=N'EndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'狀態' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebHrefSource', @level2type=N'COLUMN',@level2name=N'IsEnable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'異動時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebHrefSource', @level2type=N'COLUMN',@level2name=N'ProcessDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備註' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebHrefSource', @level2type=N'COLUMN',@level2name=N'Info'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水號，起始值1，遞增值1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevel', @level2type=N'COLUMN',@level2name=N'WebLevelSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自訂節點名稱<同一網站不能一致>' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevel', @level2type=N'COLUMN',@level2name=N'WebLevelKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父層序號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevel', @level2type=N'COLUMN',@level2name=N'ParentSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'網站編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevel', @level2type=N'COLUMN',@level2name=N'WebSiteID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'語系' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevel', @level2type=N'COLUMN',@level2name=N'Lang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1:網站單元、2.首頁區塊、3.標題頁尾區塊' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevel', @level2type=N'COLUMN',@level2name=N'WeblevelType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'單元模組，代碼如下CP:單頁、NEWS：條列式(一般模組)、LINK： 相關連結、Journal：期刊' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevel', @level2type=N'COLUMN',@level2name=N'Module'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'參數、司首頁關聯SN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevel', @level2type=N'COLUMN',@level2name=N'Parameter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'標題' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevel', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'簡介' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevel', @level2type=N'COLUMN',@level2name=N'ContentText'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'顯示於FatFooter：1 顯示、0 不顯示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevel', @level2type=N'COLUMN',@level2name=N'FatFooterShow'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'顯示於主選單：1 顯示、0 不顯示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevel', @level2type=N'COLUMN',@level2name=N'MainMenuShow'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'顯示於子選單：1 顯示、0 不顯示(即環保署左選單)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevel', @level2type=N'COLUMN',@level2name=N'SubMemuShow'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'顯示左側選單:1 顯示、0 不顯示' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevel', @level2type=N'COLUMN',@level2name=N'LeftMenuShow'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否提供RSS' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevel', @level2type=N'COLUMN',@level2name=N'RSSShow'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'瀏覽/點閱數' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevel', @level2type=N'COLUMN',@level2name=N'PageView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上架時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevel', @level2type=N'COLUMN',@level2name=N'StartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'下架時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevel', @level2type=N'COLUMN',@level2name=N'EndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'內容區塊標頭' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevel', @level2type=N'COLUMN',@level2name=N'ContentHeader'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'內容區塊頁尾' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevel', @level2type=N'COLUMN',@level2name=N'ContentFooter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'前台列表樣式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevel', @level2type=N'COLUMN',@level2name=N'ListType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序方式:0 資料排序、1最新消息排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevel', @level2type=N'COLUMN',@level2name=N'SortMethod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否啟用：1 啟用、0 停用  -99 刪除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevel', @level2type=N'COLUMN',@level2name=N'IsEnable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'處理人員' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevel', @level2type=N'COLUMN',@level2name=N'ProcessUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'處理時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevel', @level2type=N'COLUMN',@level2name=N'ProcessDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'處理人員IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevel', @level2type=N'COLUMN',@level2name=N'ProcessIPAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建立人員' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevel', @level2type=N'COLUMN',@level2name=N'CreatedUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建立日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevel', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevel', @level2type=N'COLUMN',@level2name=N'SortOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'<同筆資料不同語系有想同的MainSN>可以想像GroupSN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevel', @level2type=N'COLUMN',@level2name=N'MainSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'靜態化網址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevel', @level2type=N'COLUMN',@level2name=N'StatesUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'版型樣式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevel', @level2type=N'COLUMN',@level2name=N'TemplateValue'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevel', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'查詢條件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevel', @level2type=N'COLUMN',@level2name=N'Condition'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SEODescription' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevel', @level2type=N'COLUMN',@level2name=N'SEODescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SEOKeywords' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevel', @level2type=N'COLUMN',@level2name=N'SEOKeywords'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'發布單位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevel', @level2type=N'COLUMN',@level2name=N'DepartmentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水號，起始值1，遞增值1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevelCustomizeTag', @level2type=N'COLUMN',@level2name=N'WebLevelCustomizeTagSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'單元序號[WebLevel]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevelCustomizeTag', @level2type=N'COLUMN',@level2name=N'WebLevelSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'自訂標籤名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevelCustomizeTag', @level2type=N'COLUMN',@level2name=N'TagName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevelCustomizeTag', @level2type=N'COLUMN',@level2name=N'SortOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否啟用：1 啟用、0 停用     -99刪除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevelCustomizeTag', @level2type=N'COLUMN',@level2name=N'IsEnable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建立人員' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevelCustomizeTag', @level2type=N'COLUMN',@level2name=N'CreatedUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建立日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevelCustomizeTag', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'處理人員' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevelCustomizeTag', @level2type=N'COLUMN',@level2name=N'ProcessUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'處理時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevelCustomizeTag', @level2type=N'COLUMN',@level2name=N'ProcessDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'處理人員IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevelCustomizeTag', @level2type=N'COLUMN',@level2name=N'ProcessIPAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevelSortLog', @level2type=N'COLUMN',@level2name=N'WebLevelSortLogSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'網站編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevelSortLog', @level2type=N'COLUMN',@level2name=N'WebSiteID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'語系' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevelSortLog', @level2type=N'COLUMN',@level2name=N'Lang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'父節點代號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevelSortLog', @level2type=N'COLUMN',@level2name=N'WebLevelParentSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建立者' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevelSortLog', @level2type=N'COLUMN',@level2name=N'CreatedUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建立時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevelSortLog', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序方式:0 系統排序、1最新日期排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevelSortLog', @level2type=N'COLUMN',@level2name=N'BeforeSortType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序方式:0 系統排序、1最新日期排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevelSortLog', @level2type=N'COLUMN',@level2name=N'AfterSortType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'0:更改為系統排序、1:更改為最新日期排序、2:調整資料排序位置' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLevelSortLog', @level2type=N'COLUMN',@level2name=N'SortMethod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'網站編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLink', @level2type=N'COLUMN',@level2name=N'WebSiteID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'語言：TW、EN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLink', @level2type=N'COLUMN',@level2name=N'Lang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'標題e.g' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLink', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'資料來源：WEBNEWS，參考Utility.SysConst.SourceTable' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLink', @level2type=N'COLUMN',@level2name=N'SourceTable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'WEBNEWS流水號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLink', @level2type=N'COLUMN',@level2name=N'SourceSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分辨相關連結群組(目前係通僅1組，為防止以後會有多個相關連結區)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLink', @level2type=N'COLUMN',@level2name=N'GroupID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'瀏覽/點閱數' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLink', @level2type=N'COLUMN',@level2name=N'PageView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否發布：0 不公開，1 發布、2草稿' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLink', @level2type=N'COLUMN',@level2name=N'IsEnable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上架日期時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLink', @level2type=N'COLUMN',@level2name=N'StartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上架日期時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLink', @level2type=N'COLUMN',@level2name=N'EndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'處理人員' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLink', @level2type=N'COLUMN',@level2name=N'ProcessUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'處理時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLink', @level2type=N'COLUMN',@level2name=N'ProcessDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'處理人員IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLink', @level2type=N'COLUMN',@level2name=N'ProcessIPAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建立日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLink', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebLink', @level2type=N'COLUMN',@level2name=N'SortOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水號，起始值1，遞增值1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNews', @level2type=N'COLUMN',@level2name=N'WEBNewsSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'網站編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNews', @level2type=N'COLUMN',@level2name=N'WebSiteID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'單元序號[WebLevel]' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNews', @level2type=N'COLUMN',@level2name=N'WebLevelSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'語言：TW、EN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNews', @level2type=N'COLUMN',@level2name=N'Lang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'單元模組，代碼如下CP:單頁、NEWS：條列式(一般模組)、LINK： 相關連結、Footer：頁尾內容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNews', @level2type=N'COLUMN',@level2name=N'Module'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'文章模式，0：圖文、1：附件、2：連結、3:YoutubeID、4:iframe' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNews', @level2type=N'COLUMN',@level2name=N'ArticleType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主標題' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNews', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'子標題' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNews', @level2type=N'COLUMN',@level2name=N'SubTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'描述' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNews', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公布日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNews', @level2type=N'COLUMN',@level2name=N'PublishDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'內容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNews', @level2type=N'COLUMN',@level2name=N'ContentText'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'相關連結' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNews', @level2type=N'COLUMN',@level2name=N'URL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'另開視窗_blank、_Self' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNews', @level2type=N'COLUMN',@level2name=N'target'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否置頂：1 是、0 否' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNews', @level2type=N'COLUMN',@level2name=N'IsTop'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'發布單位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNews', @level2type=N'COLUMN',@level2name=N'DepartmentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'瀏覽/點閱數' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNews', @level2type=N'COLUMN',@level2name=N'PageView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'上架時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNews', @level2type=N'COLUMN',@level2name=N'StartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'下架時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNews', @level2type=N'COLUMN',@level2name=N'EndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否啟用：1 啟用/審稿確認、0 停用、3送審中、-2 審稿退回、 -99刪除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNews', @level2type=N'COLUMN',@level2name=N'IsEnable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'處理人員' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNews', @level2type=N'COLUMN',@level2name=N'ProcessUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'處理時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNews', @level2type=N'COLUMN',@level2name=N'ProcessDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'處理人員IP' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNews', @level2type=N'COLUMN',@level2name=N'ProcessIPAddress'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建立日期' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNews', @level2type=N'COLUMN',@level2name=N'CreatedDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNews', @level2type=N'COLUMN',@level2name=N'SortOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主Key' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNews', @level2type=N'COLUMN',@level2name=N'MainSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'版面呈現' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNews', @level2type=N'COLUMN',@level2name=N'PageViewType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'主題標籤(會再拉出一張表紀錄-WEBNewsExtend會調整)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNews', @level2type=N'COLUMN',@level2name=N'Tag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'分類(自定標籤)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNews', @level2type=N'COLUMN',@level2name=N'CustomizeTagSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'首長行程縣市' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNews', @level2type=N'COLUMN',@level2name=N'ZipCodeSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'關鍵字' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNews', @level2type=N'COLUMN',@level2name=N'KeyWord'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'整體績效' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNews', @level2type=N'COLUMN',@level2name=N'Performance'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'政策計畫' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNews', @level2type=N'COLUMN',@level2name=N'EProject'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'服務對象(會再拉出一張表紀錄-WEBNewsExtend會調整)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNews', @level2type=N'COLUMN',@level2name=N'ServiceObject'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'其他語系連結' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNews', @level2type=N'COLUMN',@level2name=N'OtherLangerUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'靜態化網址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNews', @level2type=N'COLUMN',@level2name=N'StatesUrl'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SEODescription' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNews', @level2type=N'COLUMN',@level2name=N'SEODescription'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SEOKeywords' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNews', @level2type=N'COLUMN',@level2name=N'SEOKeywords'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'本身流水碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNewsExtend', @level2type=N'COLUMN',@level2name=N'WEBNewsExtendSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'WEBNewsSN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNewsExtend', @level2type=N'COLUMN',@level2name=N'WEBNewsSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SysCategoryKey' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNewsExtend', @level2type=N'COLUMN',@level2name=N'SysCategoryKey'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'GroupID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNewsExtend', @level2type=N'COLUMN',@level2name=N'GroupID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'擴充1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNewsExtend', @level2type=N'COLUMN',@level2name=N'Column_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'擴充2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNewsExtend', @level2type=N'COLUMN',@level2name=N'Column_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'擴充3' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNewsExtend', @level2type=N'COLUMN',@level2name=N'Column_3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'行程關聯表-流水碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebNewsSchedule', @level2type=N'COLUMN',@level2name=N'WebNewsScheduleSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'來源 : webNews (Module 是 Schedule)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebNewsSchedule', @level2type=N'COLUMN',@level2name=N'ToWebNewsSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'關聯-哪些新聞' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebNewsSchedule', @level2type=N'COLUMN',@level2name=N'FromWebNewsSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'逐字稿流水碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNewsTranscript', @level2type=N'COLUMN',@level2name=N'WEBNewsTranscriptSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'WebNews流水碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNewsTranscript', @level2type=N'COLUMN',@level2name=N'WEBNewsSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'標號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNewsTranscript', @level2type=N'COLUMN',@level2name=N'Item'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'發言人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNewsTranscript', @level2type=N'COLUMN',@level2name=N'TranscriptForm'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'內文' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBNewsTranscript', @level2type=N'COLUMN',@level2name=N'TranscriptContent'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataDetail', @level2type=N'COLUMN',@level2name=N'OpenDataDetailSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'外來鍵' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataDetail', @level2type=N'COLUMN',@level2name=N'OpenDataMainSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'關聯：0.innerjoin、1.leftjoin、2.rightjoin' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataDetail', @level2type=N'COLUMN',@level2name=N'Join'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'代號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataDetail', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SQL條件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataDetail', @level2type=N'COLUMN',@level2name=N'SQLParameter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'資料庫名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataDetail', @level2type=N'COLUMN',@level2name=N'TableName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'維護時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataDetail', @level2type=N'COLUMN',@level2name=N'ProcessDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'創建時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataDetail', @level2type=N'COLUMN',@level2name=N'DateCreated'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataDetail', @level2type=N'COLUMN',@level2name=N'SortOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataMain', @level2type=N'COLUMN',@level2name=N'WEBOpenDataMainSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'標題' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataMain', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'副標題' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataMain', @level2type=N'COLUMN',@level2name=N'SubTitle'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'網站編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataMain', @level2type=N'COLUMN',@level2name=N'WebSiteID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'群組編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataMain', @level2type=N'COLUMN',@level2name=N'SySGroupID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'語系' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataMain', @level2type=N'COLUMN',@level2name=N'Lang'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備註' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataMain', @level2type=N'COLUMN',@level2name=N'Description'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'內容' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataMain', @level2type=N'COLUMN',@level2name=N'ContentText'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'資料庫名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataMain', @level2type=N'COLUMN',@level2name=N'TableName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'SQL條件' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataMain', @level2type=N'COLUMN',@level2name=N'SQLParameter'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'類別' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataMain', @level2type=N'COLUMN',@level2name=N'ModuleType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'聯絡方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataMain', @level2type=N'COLUMN',@level2name=N'ContactInfo'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'聯絡人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataMain', @level2type=N'COLUMN',@level2name=N'ContacPerson'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'筆數' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataMain', @level2type=N'COLUMN',@level2name=N'Count'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否需要XML' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataMain', @level2type=N'COLUMN',@level2name=N'IsXML'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否需要JSON' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataMain', @level2type=N'COLUMN',@level2name=N'IsJSON'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否需要CSV' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataMain', @level2type=N'COLUMN',@level2name=N'IsCSV'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否移除標籤' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataMain', @level2type=N'COLUMN',@level2name=N'IsRemoveTag'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'授權說明網址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataMain', @level2type=N'COLUMN',@level2name=N'URL'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新說明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataMain', @level2type=N'COLUMN',@level2name=N'Refresh'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'編碼格式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataMain', @level2type=N'COLUMN',@level2name=N'EncodingType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'計費方式' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataMain', @level2type=N'COLUMN',@level2name=N'ChargeType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'認證類型' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataMain', @level2type=N'COLUMN',@level2name=N'AuthType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'開始時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataMain', @level2type=N'COLUMN',@level2name=N'StartDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'結束時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataMain', @level2type=N'COLUMN',@level2name=N'EndDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'建立時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataMain', @level2type=N'COLUMN',@level2name=N'DateCreated'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'維護時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataMain', @level2type=N'COLUMN',@level2name=N'ProcessDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'維護人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataMain', @level2type=N'COLUMN',@level2name=N'ProcessUserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataMain', @level2type=N'COLUMN',@level2name=N'SortOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'狀態' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataMain', @level2type=N'COLUMN',@level2name=N'IsEnable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'部門ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataMain', @level2type=N'COLUMN',@level2name=N'DepartmentID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataSchema', @level2type=N'COLUMN',@level2name=N'OpenDataSchemaSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'外來鍵' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataSchema', @level2type=N'COLUMN',@level2name=N'OpenDataMainSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'外來鍵' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataSchema', @level2type=N'COLUMN',@level2name=N'OpenDataDetailSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'資料庫名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataSchema', @level2type=N'COLUMN',@level2name=N'TableName'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否必輸' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataSchema', @level2type=N'COLUMN',@level2name=N'isRequired'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'欄位' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataSchema', @level2type=N'COLUMN',@level2name=N'Column'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'欄位名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataSchema', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'資料型別' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataSchema', @level2type=N'COLUMN',@level2name=N'DataType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBOpenDataSchema', @level2type=N'COLUMN',@level2name=N'SortOrder'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBSchedule', @level2type=N'COLUMN',@level2name=N'ScheduleSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排程名稱' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBSchedule', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(預設) 可以控制間隔時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBSchedule', @level2type=N'COLUMN',@level2name=N'Frequency'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'花費的時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBSchedule', @level2type=N'COLUMN',@level2name=N'UseTime'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'(預設)開關' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBSchedule', @level2type=N'COLUMN',@level2name=N'InEnable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'更新時間' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBSchedule', @level2type=N'COLUMN',@level2name=N'ProcessDate'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'備註' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WEBSchedule', @level2type=N'COLUMN',@level2name=N'Info'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'流水碼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebSiteExtend', @level2type=N'COLUMN',@level2name=N'WebSiteExtendSN'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'網站編號' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebSiteExtend', @level2type=N'COLUMN',@level2name=N'WebSiteID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'連結網址' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebSiteExtend', @level2type=N'COLUMN',@level2name=N'Url'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'標題' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebSiteExtend', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否啟用：1 啟用、0 停用     -99刪除' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebSiteExtend', @level2type=N'COLUMN',@level2name=N'IsEnable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'排序' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'WebSiteExtend', @level2type=N'COLUMN',@level2name=N'Sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[14] 4[17] 2[56] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_AllLink'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_AllLink'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "C"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 3
         End
         Begin Table = "P"
            Begin Extent = 
               Top = 6
               Left = 262
               Bottom = 136
               Right = 448
            End
            DisplayFlags = 280
            TopColumn = 3
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 1920
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_SysSection'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_SysSection'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[28] 4[23] 2[31] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2190
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_UserLeftDep'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_UserLeftDep'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[25] 4[36] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "D"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "M"
            Begin Extent = 
               Top = 6
               Left = 262
               Bottom = 136
               Right = 448
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_WebLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_WebLevel'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "CTE_1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_WebLevelTree'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_WebLevelTree'
GO
USE [master]
GO
ALTER DATABASE [MODA_WWW] SET  READ_WRITE 
GO
