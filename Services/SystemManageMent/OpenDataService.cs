using DBModel;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using Newtonsoft.Json.Linq;
using Services.Authorization;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Xml.Linq;
using Utility;
using static Utility.Files;

namespace Services.SystemManageMent
{
    public class OpenDataService
    {
        public static List<WEBOpenDataMain> GetOpenData(string keyword, string websiteid, ref DefaultPager pager)
        {
            try
            {
                using (var db = new MODAContext())
                {
                    var Data = db.WEBOpenDataMain.Where(x => 1 == 1);

                    Data = Data.Where(x => x.WebSiteID == websiteid);

                    if (!string.IsNullOrWhiteSpace(keyword))
                    {
                        Data = Data.Where(x => x.Title.Contains(keyword) || x.SubTitle.Contains(keyword));
                    }

                    Data = Data.Where(x => x.IsEnable != ((int)Utility.SysConst.IsEnable.Code.Del).ToString());

                    var allData = Data.Count();
                    pager.TotalCount = allData;
                    pager.PageIndex = pager.p - 1;

                    var searchData = Data.OrderBy(x => x.SortOrder).Skip((pager.p - 1) * pager.DisplayCount).Take(pager.DisplayCount).ToList();
                    return searchData;
                }
            }
            catch { }
            return null;

        }
        public static List<WEBOpenDataMain> GetOpenDataSort(string websiteid)
        {
            try
            {
                using (var db = new MODAContext())
                {
                    var Data = db.WEBOpenDataMain.Where(x => x.IsEnable != "-99" && x.WebSiteID == websiteid).OrderBy(x => x.SortOrder).ToList();
                    return Data;
                }
            }
            catch { }
            return null;
        }

        public static List<KeyValuePair<int, string>> FileUrl(List<WEBOpenDataMain> wEBOpenDataMains, string WEBSiteUrl)
        {
            List<KeyValuePair<int, string>> Files = new List<KeyValuePair<int, string>>();
            foreach (var dt in wEBOpenDataMains)
            {
                switch (dt.ModuleType)
                {
                    case 1:
                    case 3:
                        if (dt.IsXML == 1)
                        {
                            Files.Add(new KeyValuePair<int, string>(dt.WEBOpenDataMainSN, WEBSiteUrl + "/" + "xml/" + dt.WEBOpenDataMainSN));
                        }

                        if (dt.IsJSON == 2)
                        {
                            Files.Add(new KeyValuePair<int, string>(dt.WEBOpenDataMainSN, WEBSiteUrl + "/" + "json/" + dt.WEBOpenDataMainSN));
                        }

                        if (dt.IsCSV == 3)
                        {
                            Files.Add(new KeyValuePair<int, string>(dt.WEBOpenDataMainSN, WEBSiteUrl + "/" + "csv/" + dt.WEBOpenDataMainSN));
                        }
                        break;
                    case 2:
                        Files.Add(new KeyValuePair<int, string>(dt.WEBOpenDataMainSN, WEBSiteUrl + "/" + "File/" + dt.WEBOpenDataMainSN));
                        break;
                }
            }
            return Files;
        }

        public static List<string> GetTableNames()
        {
            var tableNames = new List<string>();

            using (var db = new MODAContext())
            {
                using (var connection = db.Database.GetDbConnection())
                {
                    connection.Open();
                    using (var command = connection.CreateCommand())
                    {
                        command.CommandText = "SELECT TABLE_NAME from INFORMATION_SCHEMA.TABLES order by TABLE_NAME";
                        using (var reader = command.ExecuteReader())
                        {
                            if (reader.HasRows)
                            {
                                while (reader.Read())
                                {
                                    tableNames.Add(reader.GetString(0));
                                }
                            }
                            reader.Close();
                        }
                    }
                    connection.Close();
                }
            }
            return tableNames;
        }

        public static WEBFile GetOpneDataFile(int key)
        {
            using (var db = new MODAContext())
            {
                var OpenDataFile = (from o in db.WEBOpenDataMain.Where(x => x.WEBOpenDataMainSN == key)
                                    join r in db.RelWebFileContent.Where(x => x.SourceTable == "WEBOpenDataMain") on o.WEBOpenDataMainSN equals r.SourceSN
                                    join f in db.WEBFile on r.WEBFileSN equals f.WEBFileSN
                                    where o.IsEnable == "1" && f.IsEnable == "1"
                                    orderby r.SortOrder
                                    select f).FirstOrDefault();

                return OpenDataFile;
            }
        }

        public static DataTable GetTableAndColumn()
        {
            var tableNames = new DataTable();

            using (var db = new MODAContext())
            {
                using (var connection = db.Database.GetDbConnection())
                {
                    connection.Open();
                    using (var command = connection.CreateCommand())
                    {
                        command.CommandText = "SELECT TABLE_NAME,COLUMN_NAME  FROM INFORMATION_SCHEMA.COLUMNS ";
                        using (var reader = command.ExecuteReader())
                        {
                            tableNames.Load(reader);
                            reader.Close();
                        }
                    }
                    connection.Close();
                }
            }
            return tableNames;
        }

        public static bool SaveOpenData(ref WEBOpenDataMain wEBOpenDataMain, List<WEBOpenDataDetail> wEBOpenDataDetail, List<WEBOpenDataSchema> wEBOpenDataSchema, WEBNewsExtend wEBNewsExtend, List<CommonFileModel> commonFileModels, ref string state)
        {
            try
            {
                int MainSN = wEBOpenDataMain.WEBOpenDataMainSN;
                using (var db = new MODAContext())
                {
                    if (wEBOpenDataMain.WEBOpenDataMainSN == 0)
                    {
                        var mainSort = db.WEBOpenDataMain.OrderByDescending(x => x.SortOrder).FirstOrDefault();
                        wEBOpenDataMain.SortOrder = mainSort is null ? 1 : mainSort.SortOrder + 1;
                        db.WEBOpenDataMain.Add(wEBOpenDataMain);
                        db.SaveChanges();

                        if (wEBOpenDataDetail.Count > 0)
                        {
                            int i = 1;
                            foreach (var data in wEBOpenDataDetail)
                            {
                                data.OpenDataMainSN = wEBOpenDataMain.WEBOpenDataMainSN;
                                data.ProcessDate = DateTime.Now;
                                data.DateCreated = DateTime.Now;
                                data.SortOrder = i;
                                i++;

                                db.WEBOpenDataDetail.Add(data);
                                db.SaveChanges();
                            }
                        }

                        if (wEBOpenDataSchema.Count > 0)
                        {
                            int i = 1;
                            MainSN = wEBOpenDataMain.WEBOpenDataMainSN;
                            foreach (var data in wEBOpenDataSchema)
                            {
                                var detail = db.WEBOpenDataDetail.Where(x => x.OpenDataMainSN == MainSN).ToList();
                                data.OpenDataMainSN = wEBOpenDataMain.WEBOpenDataMainSN;
                                data.OpenDataDetailSN = detail.Count > 0 ? detail.Where(x => x.Code == data.TableName).FirstOrDefault() != null ? detail.Where(x => x.Code == data.TableName).FirstOrDefault().OpenDataDetailSN : 0 : 0;
                                data.TableName = detail.Count > 0 ? detail.Where(x => x.Code == data.TableName).FirstOrDefault() != null ? detail.Where(x => x.Code == data.TableName).FirstOrDefault().TableName : data.TableName : data.TableName;
                                data.SortOrder = i;
                                i++;
                                db.WEBOpenDataSchema.Add(data);
                                db.SaveChanges();
                            }
                        }

                        if (commonFileModels != null)
                        {
                            foreach (var file in commonFileModels)
                            {
                                var FileData = db.WEBFile.First(x => x.FileName == file.fileNewName);

                                var RelWebFileContentData = new RelWebFileContent()
                                {
                                    WEBFileSN = FileData.WEBFileSN,
                                    SourceTable = "WEBOpenDataMain",
                                    SourceSN = wEBOpenDataMain.WEBOpenDataMainSN,
                                    GroupID = file.GroupID.ToString(),
                                    CreatedUserID = wEBOpenDataMain.ProcessUserID,
                                    CreatedDate = DateTime.Now,
                                    SortOrder = file.FileSort,
                                };

                                FileData.IsEnable = "1";
                                FileData.FileTitle = file.fileTitle;
                                db.WEBFile.Update(FileData);
                                db.RelWebFileContent.Add(RelWebFileContentData);
                                db.SaveChanges();
                            }
                        }

                        if (wEBNewsExtend != null && wEBOpenDataMain.ModuleType == 1)
                        {
                            var Extend = new WEBNewsExtend()
                            {
                                WEBNewsSN = 0,
                                Column_1 = wEBOpenDataMain.WEBOpenDataMainSN.ToString(),//OpenDataMainSN
                                Column_2 = wEBNewsExtend.Column_2,//TEXT
                                Column_3 = wEBNewsExtend.Column_3,//WEBLevelSN
                            };
                            db.WEBNewsExtend.Add(Extend);
                            db.SaveChanges();
                        }

                        state = "新增成功";
                    }
                    else
                    {
                        MainSN = wEBOpenDataMain.WEBOpenDataMainSN;
                        var oldData = db.WEBOpenDataMain.Where(x => x.WEBOpenDataMainSN == MainSN).FirstOrDefault();

                        #region WEBOpenDataMain
                        if (oldData != null)
                        {
                            oldData.Title = wEBOpenDataMain.Title;
                            oldData.SubTitle = wEBOpenDataMain.SubTitle;
                            oldData.Lang = wEBOpenDataMain.Lang;
                            oldData.Description = wEBOpenDataMain.Description;
                            oldData.ContentText = wEBOpenDataMain.ContentText;
                            oldData.ModuleType = wEBOpenDataMain.ModuleType;
                            oldData.ContactInfo = wEBOpenDataMain.ContactInfo;
                            oldData.ContacPerson = wEBOpenDataMain.ContacPerson;
                            oldData.TableName = wEBOpenDataMain.TableName;
                            oldData.SQLParameter = wEBOpenDataMain.SQLParameter;
                            oldData.Count = wEBOpenDataMain.Count;
                            oldData.IsXML = wEBOpenDataMain.IsXML;
                            oldData.IsJSON = wEBOpenDataMain.IsJSON;
                            oldData.IsCSV = wEBOpenDataMain.IsCSV;
                            oldData.IsRemoveTag = wEBOpenDataMain.IsRemoveTag;
                            oldData.URL = wEBOpenDataMain.URL;
                            oldData.Refresh = wEBOpenDataMain.Refresh;
                            oldData.EncodingType = wEBOpenDataMain.EncodingType;
                            oldData.ChargeType = wEBOpenDataMain.ChargeType;
                            oldData.AuthType = wEBOpenDataMain.AuthType;
                            oldData.StartDate = wEBOpenDataMain.StartDate;
                            oldData.EndDate = wEBOpenDataMain.EndDate;
                            oldData.ProcessDate = DateTime.Now;
                            oldData.IsEnable = wEBOpenDataMain.IsEnable;
                            oldData.DepartmentID = wEBOpenDataMain.DepartmentID;
                            db.WEBOpenDataMain.Update(oldData);
                            db.SaveChanges();
                        }
                        #endregion

                        #region WEBOpenDataDetail
                        if (wEBOpenDataDetail.Count > 0)
                        {
                            var oldlist = db.WEBOpenDataDetail.Where(x => x.OpenDataMainSN == oldData.WEBOpenDataMainSN).ToLookup(x => x.OpenDataDetailSN).ToDictionary(x => x.Key);//已存在資料
                            var Newlist = wEBOpenDataDetail.ToLookup(x => x.OpenDataDetailSN).ToDictionary(x => x.Key);//新資料
                            var Cancel = oldlist.Where(x => !Newlist.ContainsKey(x.Key)).ToList();//比對差異資料

                            if (Cancel.Count > 0)
                            {
                                foreach (var del in Cancel)
                                {
                                    System.FormattableString SQL = $@"DELETE WEBOpenDataDetail
                                                                     WHERE OpenDataDetailSN = @OpenDataDetailSN";

                                    List<SqlParameter> sqlParams = new List<SqlParameter>();

                                    sqlParams.Add(new SqlParameter("@OpenDataDetailSN", del.Key));
                                    db.Database.ExecuteSqlRaw(SQL.ToString(), sqlParams.ToArray());
                                }
                            }

                            var NewDetail = wEBOpenDataDetail.Where(x => x.OpenDataDetailSN == 0).ToList();

                            if (NewDetail.Count > 0)
                            {
                                var mainSort = db.WEBOpenDataDetail.Where(x => x.OpenDataMainSN == oldData.WEBOpenDataMainSN).OrderByDescending(x => x.SortOrder).FirstOrDefault();
                                foreach (var data in NewDetail)
                                {
                                    data.OpenDataMainSN = wEBOpenDataMain.WEBOpenDataMainSN;
                                    data.ProcessDate = DateTime.Now;
                                    data.DateCreated = DateTime.Now;
                                    data.SortOrder = mainSort is null ? 1 : mainSort.SortOrder + 1;
                                    db.WEBOpenDataDetail.Add(data);
                                    db.SaveChanges();
                                }
                            }

                            foreach (var data in wEBOpenDataDetail)
                            {
                                var Detail = db.WEBOpenDataDetail.Where(x => x.OpenDataDetailSN == data.OpenDataDetailSN).FirstOrDefault();

                                if (Detail != null)
                                {
                                    Detail.Join = data.Join;
                                    Detail.Code = data.Code;
                                    Detail.TableName = data.TableName;
                                    Detail.SQLParameter = data.SQLParameter;
                                    Detail.ProcessDate = DateTime.Now;

                                    db.WEBOpenDataDetail.Update(Detail);
                                    db.SaveChanges();
                                }
                            }
                        }
                        else
                        {
                            var oldDetail = db.WEBOpenDataDetail.Where(x => x.OpenDataMainSN == oldData.WEBOpenDataMainSN).ToList();
                            db.WEBOpenDataDetail.RemoveRange(oldDetail);
                            db.SaveChanges();
                        }
                        #endregion

                        #region WEBOpenDataSchema
                        if (wEBOpenDataSchema.Count > 0)
                        {
                            var oldlist = db.WEBOpenDataSchema.Where(x => x.OpenDataMainSN == oldData.WEBOpenDataMainSN).ToLookup(x => x.OpenDataSchemaSN).ToDictionary(x => x.Key);
                            var Newlist = wEBOpenDataSchema.ToLookup(x => x.OpenDataSchemaSN).ToDictionary(x => x.Key);

                            var Cancel = oldlist.Where(x => !Newlist.ContainsKey(x.Key)).ToList();//比對差異資料

                            if (Cancel.Count > 0)
                            {
                                foreach (var del in Cancel)
                                {
                                    System.FormattableString SQL = $@"DELETE WEBOpenDataSchema
                                                                     WHERE OpenDataSchemaSN = @OpenDataSchemaSN";

                                    List<SqlParameter> sqlParams = new List<SqlParameter>();

                                    sqlParams.Add(new SqlParameter("@OpenDataSchemaSN", del.Key));
                                    db.Database.ExecuteSqlRaw(SQL.ToString(), sqlParams.ToArray());
                                }
                            }

                            var NewSchema = wEBOpenDataSchema.Where(x => x.OpenDataSchemaSN == 0).ToList();

                            if (NewSchema.Count > 0)
                            {
                                var mainSort = db.WEBOpenDataSchema.Where(x => x.OpenDataMainSN == oldData.WEBOpenDataMainSN).OrderByDescending(x => x.SortOrder).FirstOrDefault();
                                foreach (var data in NewSchema)
                                {
                                    var detail = db.WEBOpenDataDetail.Where(x => x.OpenDataMainSN == MainSN).ToList();
                                    data.OpenDataMainSN = wEBOpenDataMain.WEBOpenDataMainSN;
                                    data.OpenDataDetailSN = detail.Count > 0 ? detail.Where(x => x.Code == data.TableName).FirstOrDefault() != null ? detail.Where(x => x.Code == data.TableName).First().OpenDataDetailSN : 0 : 0;
                                    data.SortOrder = mainSort is null ? 1 : mainSort.SortOrder + 1;
                                    db.WEBOpenDataSchema.Add(data);
                                    db.SaveChanges();
                                }
                            }

                            foreach (var data in wEBOpenDataSchema)
                            {

                                var Schema = db.WEBOpenDataSchema.Where(x => x.OpenDataSchemaSN == data.OpenDataSchemaSN).FirstOrDefault();
                                var Detail = db.WEBOpenDataDetail.Where(x => x.OpenDataMainSN == oldData.WEBOpenDataMainSN && x.Code == data.TableName).FirstOrDefault();

                                if (Schema != null)
                                {
                                    Schema.OpenDataDetailSN = Detail != null ? Detail.OpenDataDetailSN : 0;
                                    Schema.TableName = Detail != null ? Detail.Code == data.TableName ? Detail.TableName : data.TableName : data.TableName;
                                    Schema.isRequired = data.isRequired;
                                    Schema.Column = data.Column;
                                    Schema.Name = data.Name;
                                    Schema.DataType = data.DataType;

                                    db.WEBOpenDataSchema.Update(Schema);
                                    db.SaveChanges();
                                }
                            }
                        }
                        else
                        {
                            var oldSchema = db.WEBOpenDataSchema.Where(x => x.OpenDataMainSN == oldData.WEBOpenDataMainSN).ToList();
                            db.WEBOpenDataSchema.RemoveRange(oldSchema);
                            db.SaveChanges();
                        }
                        #endregion

                        if (commonFileModels != null)
                        {
                            if (commonFileModels.Count() > 0)
                            {
                                var nowNewsFileName = commonFileModels.Select(x => x.fileNewName).ToList();

                                var DBAllFile = (from a in db.RelWebFileContent
                                                 join b in db.WEBFile on a.WEBFileSN equals b.WEBFileSN
                                                 where a.SourceTable == "WEBOpenDataMain" && b.IsEnable == "1" &&
                                                       a.SourceSN == oldData.WEBOpenDataMainSN
                                                 select b).ToList();

                                var DBFileName = DBAllFile.Select(y => y.FileName).ToList();
                                //刪除的檔案
                                var NeedDeleteFiles = DBAllFile.Where(x => !nowNewsFileName.Contains(x.FileName)).ToList();
                                //新的檔案
                                var NewFiles = commonFileModels.Where(x => !DBFileName.Contains(x.fileNewName)).ToList();
                                // 刪除 先壓狀態
                                if (NeedDeleteFiles != null)
                                {
                                    foreach (var file in NeedDeleteFiles)
                                    {
                                        file.IsEnable = "0";
                                        var RelWebFileContentData = db.RelWebFileContent.First(x => x.WEBFileSN == file.WEBFileSN);
                                        db.WEBFile.Update(file);
                                        db.RelWebFileContent.Remove(RelWebFileContentData);
                                        db.SaveChanges();
                                    }
                                }

                                //新增
                                if (NewFiles != null)
                                {
                                    foreach (var file in NewFiles)
                                    {
                                        var FileData = db.WEBFile.First(x => x.FileName == file.fileNewName);
                                        var RelWebFileContentData = new RelWebFileContent()
                                        {
                                            WEBFileSN = FileData.WEBFileSN,
                                            SourceTable = "WEBOpenDataMain",
                                            SourceSN = oldData.WEBOpenDataMainSN,
                                            GroupID = file.GroupID.ToString(),
                                            CreatedUserID = wEBOpenDataMain.ProcessUserID,
                                            CreatedDate = DateTime.Now,
                                            SortOrder = file.FileSort,
                                        };
                                        FileData.IsEnable = "1";
                                        db.WEBFile.Update(FileData);
                                        db.RelWebFileContent.Add(RelWebFileContentData);
                                        db.SaveChanges();

                                    }
                                }
                                //修改fileTitle
                                foreach (var file in commonFileModels)
                                {
                                    var filedata = db.WEBFile.First(x => x.FileName == file.fileNewName);
                                    filedata.FileTitle = file.fileTitle;
                                    var RelWebFileContent = db.RelWebFileContent.FirstOrDefault(x => x.WEBFileSN == filedata.WEBFileSN);
                                    RelWebFileContent.SortOrder = file.FileSort;

                                    db.WEBFile.Update(filedata);
                                    db.RelWebFileContent.Update(RelWebFileContent);
                                    db.SaveChanges();

                                }
                            }
                        }

                        if (wEBNewsExtend != null && wEBOpenDataMain.ModuleType == 1)
                        {
                            var deExtend = db.WEBNewsExtend.FirstOrDefault(x => x.Column_1 == wEBNewsExtend.Column_1);
                            if (deExtend.Column_3 != wEBNewsExtend.Column_3)
                            {
                                db.WEBNewsExtend.Remove(deExtend);
                                db.SaveChanges();

                                var Extend = new WEBNewsExtend()
                                {
                                    WEBNewsSN = 0,
                                    Column_1 = wEBOpenDataMain.WEBOpenDataMainSN.ToString(),//OpenDataMainSN
                                    Column_2 = wEBNewsExtend.Column_2,//TEXT
                                    Column_3 = wEBNewsExtend.Column_3,//WEBLevelSN
                                };
                                db.WEBNewsExtend.Add(Extend);
                                db.SaveChanges();
                            }
                        }

                        state = "更新成功";
                    }

                }
                return true;
            }
            catch (Exception ex)
            {
                Utility.Mail.Error(ex.ToString());
                LogService.CreateLogAction(new LogAction()
                {
                    Status = "0",
                    MessageResult = ex.ToString(),
                    ProcessIPAddress = "",
                    UserID = "",
                    WebSiteID = "",
                    WebPath = "",
                    ActionType = "1",
                    Action2 = "Insert",
                    SourceTable = "WEBOpenDataMain",
                    Action = "Save",
                    Controller = "OpenDataService",
                    SourceSN = wEBOpenDataMain.WEBOpenDataMainSN,
                    CreatedDate = DateTime.Now
                });

                state = "新增/更新失敗";
                return false;
            }
        }

        public static WEBOpenDataMain GetOpendataMain(string key)
        {
            using (var db = new MODAContext())
            {
                var WEBOpenDataMains = db.WEBOpenDataMain.Where(x => x.WEBOpenDataMainSN == int.Parse(key)).FirstOrDefault();

                return WEBOpenDataMains;
            }
        }

        public static List<WEBOpenDataDetail> GetOpendataDetail(string key)
        {
            using (var db = new MODAContext())
            {
                var WEBOpenDataDetail = db.WEBOpenDataDetail.Where(x => x.OpenDataMainSN == int.Parse(key)).OrderBy(x => x.SortOrder).ToList();

                return WEBOpenDataDetail;
            }
        }

        public static List<WEBOpenDataSchema> GetOpendataSchema(string key)
        {
            using (var db = new MODAContext())
            {
                var DataSchema = db.WEBOpenDataSchema.Where(x => x.OpenDataMainSN == int.Parse(key)).OrderBy(x => x.SortOrder).ToList();
                return DataSchema;
            }
        }
        public static DataTable GetSchemasObject(string key)
        {
            var data = new DataTable();

            using (var db = new MODAContext())
            {
                using (var connection = db.Database.GetDbConnection())
                {
                    connection.Open();
                    using (var command = connection.CreateCommand())
                    {
                        command.CommandText = @"SELECT MA.WEBOpenDataMainSN,0 AS 'OpenDataDetailSN',NULL AS 'Code',SC.TABLE_NAME,SC.COLUMN_NAME, REPLACE(MA.SortOrder,MA.SortOrder,'0') AS SortOrder FROM INFORMATION_SCHEMA.COLUMNS AS SC JOIN WEBOpenDataMain AS MA ON SC.TABLE_NAME = MA.TableName 
                                               WHERE MA.IsEnable != '-99' AND WEBOpenDataMainSN = @OpenMainSn
                                               UNION ALL
                                               SELECT DE.OpenDataMainSN,DE.OpenDataDetailSN,DE.Code,SC.TABLE_NAME,SC.COLUMN_NAME,DE.SortOrder FROM INFORMATION_SCHEMA.COLUMNS AS SC
                                               JOIN WEBOpenDataDetail AS DE ON SC.TABLE_NAME = DE.TableName
                                               WHERE DE.OpenDataMainSN = @OpenMainSn";

                        command.CommandType = CommandType.Text;
                        command.Parameters.Add(new SqlParameter("@OpenMainSn", key));
                        using (var reader = command.ExecuteReader())
                        {
                            data.Load(reader);
                            reader.Close();
                        }
                    }
                    connection.Close();
                }
            }
            return data;
        }

        public static bool DeleteOpenData(string key, string ProcessIP)
        {
            try
            {
                using (var db = new MODAContext())
                {
                    var OpenData = db.WEBOpenDataMain.Where(x => x.WEBOpenDataMainSN == int.Parse(key)).FirstOrDefault();

                    if (OpenData != null)
                    {
                        OpenData.IsEnable = "-99";
                        OpenData.ProcessDate = DateTime.Now;
                        OpenData.ProcessUserID = ProcessIP;
                    }
                    db.WEBOpenDataMain.Update(OpenData);
                    db.SaveChanges();
                }
                return true;
            }
            catch (Exception ex)
            {
                Utility.Mail.Error(ex.ToString());
                LogService.CreateLogAction(new LogAction()
                {
                    Status = "0",
                    MessageResult = ex.ToString(),
                    ProcessIPAddress = "",
                    UserID = "",
                    WebSiteID = "",
                    WebPath = "",
                    ActionType = "1",
                    Action2 = "Delete",
                    SourceTable = "WEBOpenDataMain",
                    Action = "DeleteOpenData",
                    Controller = "OpenDataService",
                    SourceSN = 0,
                    CreatedDate = DateTime.Now
                });

                return false;
            }
        }

        public static void CreateFile(WEBOpenDataMain wEBOpenDataMain, string Urls)
        {
            using (var db = new MODAContext())
            {
                var wEBOpenDataDetails = db.WEBOpenDataDetail.Where(x => x.OpenDataMainSN == wEBOpenDataMain.WEBOpenDataMainSN).ToList();
                var wEBOpenDataSchemas = db.WEBOpenDataSchema.Where(x => x.OpenDataMainSN == wEBOpenDataMain.WEBOpenDataMainSN).ToList();

                if (wEBOpenDataMain.IsXML == 1)
                {
                    CreateXml(wEBOpenDataMain, wEBOpenDataDetails, wEBOpenDataSchemas, Urls);
                }

                if (wEBOpenDataMain.IsJSON == 2)
                {
                    CreateJson(wEBOpenDataMain, wEBOpenDataDetails, wEBOpenDataSchemas, Urls);

                }

                if (wEBOpenDataMain.IsCSV == 3)
                {
                    CreateCsv(wEBOpenDataMain, wEBOpenDataDetails, wEBOpenDataSchemas, Urls);
                }
            }

        }

        public static JArray CreateJson(WEBOpenDataMain wEBOpenDataMain, List<WEBOpenDataDetail> wEBOpenDataDetails, List<WEBOpenDataSchema> wEBOpenDataSchemas, string Urls)
        {
            JArray array = new JArray();
            var dt = GetOpneData(wEBOpenDataMain, wEBOpenDataDetails, wEBOpenDataSchemas).AsEnumerable().GroupBy(x => new { SN = x[0], Lang = x["Lang"] }).Select(y => new { SN = y.Key.SN, Lang = y.Key.Lang, list = y.ToList() }).ToList();
            var MainField = GetField(wEBOpenDataMain.TableName);

            foreach (var dr in dt)
            {
                JObject Subobj = new JObject();
                List<KeyValuePair<string, string>> list = new List<KeyValuePair<string, string>>();

                foreach (var dr1 in dt.SelectMany(x => x.list.Where(y => y[0].Equals(dr.SN))).ToList())
                {
                    foreach (var schemas in wEBOpenDataSchemas.Where(x => !x.Column.Contains("Rel")))
                    {

                        if (dr1[schemas.Name].ToString().IndexOf(".html") > 0)
                        {
                            if (dr1[schemas.Name].ToString().IndexOf("http") < 0)
                            {
                                list.Add(new KeyValuePair<string, string>(schemas.Name, (Urls + dr1[schemas.Name].ToString())));
                            }
                            else
                            {
                                list.Add(new KeyValuePair<string, string>(schemas.Name, dr1[schemas.Name].ToString()));
                            }
                        }
                        else if (DateTime.TryParse(dr1[schemas.Name].ToString(),out DateTime date) == true)
                        {
                            list.Add(new KeyValuePair<string, string>(schemas.Name, DateTime.Parse(dr1[schemas.Name].ToString()).ToString("yyyy-MM-dd HH:MM:ss")));
                        }
                        else
                        {
                            list.Add(new KeyValuePair<string, string>(schemas.Name, (wEBOpenDataMain.IsRemoveTag == 1 ? SetRemoveTag(dr1[schemas.Name].ToString()) : dr1[schemas.Name].ToString())));
                        }
                    }
                }

                foreach (var data in list.GroupBy(x => new { x.Key }).Select(y => new { y.Key, value = string.Join(',', y.Select(g => g.Value).Distinct()) }).ToList())
                {
                    Subobj.Add(new JProperty(data.Key.Key, data.value.ToString()));
                }


                foreach (var item in wEBOpenDataSchemas.Where(x => x.Column.ToLower().Contains("rel")))
                {
                    switch (item.Column.ToString().ToLower())
                    {
                        case "relfile": //相關檔案
                            SetJsonRelFile(wEBOpenDataMain.TableName, dr.SN.ToString(), dr.Lang.ToString(), Urls, item.Name, ref Subobj);
                            break;
                        case "relpic":// 相關圖片
                            SetJsonRelPic(wEBOpenDataMain.TableName, dr.SN.ToString(), dr.Lang.ToString(), Urls, item.Name, ref Subobj);
                            break;
                        case "rellink":// 相關連結
                            SetJsonRelLink(wEBOpenDataMain.TableName, dr.SN.ToString(), Urls, item.Name, ref Subobj);
                            break;
                        case "relvideo":// 相關影片
                            SetJsonRelVideo(dr.SN.ToString(), item.Name, ref Subobj);
                            break;
                        case "relwebnews"://首長行程相關新聞
                            SetJsonRelSchedule(dr.SN.ToString(), dr.Lang.ToString(), Urls, item.Name, ref Subobj);
                            break;
                    }
                }
                array.Add(Subobj);
            }

            return array;
        }

        public static XDocument CreateXml(WEBOpenDataMain wEBOpenDataMain, List<WEBOpenDataDetail> wEBOpenDataDetails, List<WEBOpenDataSchema> wEBOpenDataSchemas, string Urls)
        {
            string XmlElementName = "Item";
            XDocument XmlDoc = CreateXmlDocument("Xml");
            var dt = GetOpneData(wEBOpenDataMain, wEBOpenDataDetails, wEBOpenDataSchemas).AsEnumerable().GroupBy(x => new { SN = x[0], Lang = x["Lang"] }).Select(y => new { SN = y.Key.SN, Lang = y.Key.Lang, list = y.ToList() }).ToList();
            var MainField = GetField(wEBOpenDataMain.TableName);

            foreach (var dr in dt)
            {
                XElement XmlElement = new XElement(XmlElementName);
                List<KeyValuePair<string, string>> list = new List<KeyValuePair<string, string>>();

                foreach (var dr1 in dt.SelectMany(x => x.list.Where(y => y[0].Equals(dr.SN))).ToList())
                {
                    foreach (var schemas in wEBOpenDataSchemas.Where(x => !x.Column.Contains("Rel")))
                    {
                        if (dr1[schemas.Name].ToString().IndexOf(".html") > 0)
                        {
                            if (dr1[schemas.Name].ToString().IndexOf("http") < 0)
                            {
                                list.Add(new KeyValuePair<string, string>(schemas.Name, (Urls + dr1[schemas.Name].ToString())));
                            }
                            else
                            {
                                list.Add(new KeyValuePair<string, string>(schemas.Name, dr1[schemas.Name].ToString()));
                            }

                        }
                        else if (DateTime.TryParse(dr1[schemas.Name].ToString(), out DateTime date) == true)
                        {
                            list.Add(new KeyValuePair<string, string>(schemas.Name, DateTime.Parse(dr1[schemas.Name].ToString()).ToString("yyyy-MM-dd HH:MM:ss")));
                        }
                        else
                        {
                            list.Add(new KeyValuePair<string, string>(schemas.Name, (wEBOpenDataMain.IsRemoveTag == 1 ? SetRemoveTag(dr1[schemas.Name].ToString()) : dr1[schemas.Name].ToString())));
                        }

                    }
                }

                foreach (var data in list.GroupBy(x => new { x.Key }).Select(y => new { y.Key, value = string.Join(',', y.Select(g => g.Value).Distinct()) }).ToList())
                {
                    XmlElement.Add(CreateNode(data.Key.Key, data.value.ToString()));
                }

                foreach (var item in wEBOpenDataSchemas.Where(x => x.Column.ToLower().Contains("rel")))
                {
                    switch (item.Column.ToString().ToLower())
                    {
                        case "relfile":   //相關檔案
                            SetXmlRelFile(wEBOpenDataMain.TableName, dr.SN.ToString(), dr.Lang.ToString(), Urls, item.Name, ref XmlElement);
                            break;
                        case "relpic":    // 相關圖片
                            SetXmlRelPic(wEBOpenDataMain.TableName, dr.SN.ToString(), dr.Lang.ToString(), Urls, item.Name, ref XmlElement);
                            break;
                        case "rellink": //相關連結
                            SetXmlRelLink(wEBOpenDataMain.TableName, dr.SN.ToString(), Urls, item.Name, ref XmlElement);
                            break;
                        case "relvideo":   //相關影片
                            SetXmlRelLink(wEBOpenDataMain.TableName, dr.SN.ToString(), Urls, item.Name, ref XmlElement);
                            break;
                        case "relwebnews":  //首長行程相關新聞
                            SetXmlRelSchedule(dr.SN.ToString(), dr.Lang.ToString(), Urls, item.Name, ref XmlElement);
                            break;
                    }
                }
                XmlDoc.Root.Add(XmlElement);
            }

            return XmlDoc;
        }

        public static System.Text.StringBuilder CreateCsv(WEBOpenDataMain wEBOpenDataMain, List<WEBOpenDataDetail> wEBOpenDataDetails, List<WEBOpenDataSchema> wEBOpenDataSchemas, string Urls)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            System.Text.Encoding utf8WithoutBom = new System.Text.UTF8Encoding(true);
            var dt = GetOpneData(wEBOpenDataMain, wEBOpenDataDetails, wEBOpenDataSchemas).AsEnumerable().GroupBy(x => new { SN = x[0], Lang = x["Lang"] }).Select(y => new { SN = y.Key.SN, Lang = y.Key.Lang, list = y.ToList() }).ToList();
            var MainField = GetField(wEBOpenDataMain.TableName);


            foreach (var schemas in wEBOpenDataSchemas.Where(x => !x.Column.Contains("Rel")))
            {
                sb.Append($"\"{schemas.Name}\",");
            }
            foreach (var schemas in wEBOpenDataSchemas.Where(x => x.Column.Contains("Rel")))
            {
                sb.Append($"\"{schemas.Name}\",");
            }
            sb.Append("\r\n");
            foreach (var dr in dt)
            {
                List<KeyValuePair<string, string>> list = new List<KeyValuePair<string, string>>();

                foreach (var dr1 in dt.SelectMany(x => x.list.Where(y => y[0].Equals(dr.SN))).ToList())
                {
                    foreach (var schemas in wEBOpenDataSchemas.Where(x => !x.Column.Contains("Rel")))
                    {
                        if (dr1[schemas.Name].ToString().IndexOf(".html") > 0)
                        {
                            if (dr1[schemas.Name].ToString().IndexOf("http") < 0)
                            {
                                list.Add(new KeyValuePair<string, string>(schemas.Name, (Urls + dr1[schemas.Name].ToString())));
                            }
                            else
                            {
                                list.Add(new KeyValuePair<string, string>(schemas.Name, dr1[schemas.Name].ToString()));
                            }
                        }
                        else if (DateTime.TryParse(dr1[schemas.Name].ToString(), out DateTime date) == true)
                        {
                            list.Add(new KeyValuePair<string, string>(schemas.Name, DateTime.Parse(dr1[schemas.Name].ToString()).ToString("yyyy-MM-dd HH:MM:ss")));
                        }
                        else
                        {
                            list.Add(new KeyValuePair<string, string>(schemas.Name, (wEBOpenDataMain.IsRemoveTag == 1 ? SetRemoveTag(dr1[schemas.Name].ToString()) : dr1[schemas.Name].ToString())));
                        }
                    }
                }

                foreach (var data in list.GroupBy(x => new { x.Key }).Select(y => new { y.Key, value = string.Join(',', y.Select(g => g.Value).Distinct()) }).ToList())
                {
                    sb.Append($"\"{(data.value.ToString())}\",");
                }

                if (wEBOpenDataSchemas.Where(x => x.Column.ToLower().Contains("rel")).Any())
                {
                    foreach (var item in wEBOpenDataSchemas.Where(x => x.Column.ToLower().Contains("rel")))
                    {
                        switch (item.Column.ToString().ToLower())
                        {
                            case "relfile":    //相關檔案
                                SetCsvRelFile(wEBOpenDataMain.TableName, dr.SN.ToString(), dr.Lang.ToString(), Urls, ref sb);
                                break;
                            case "relpic":  // 相關圖片
                                SetCsvRelPic(wEBOpenDataMain.TableName, dr.SN.ToString(), dr.Lang.ToString(), Urls, ref sb);
                                break;
                            case "rellink": // 相關連結
                                SetCsvRelLink(wEBOpenDataMain.TableName, dr.SN.ToString(), Urls, ref sb);
                                break;
                            case "relvideo":  //相關影片
                                SetCsvRelVideo(dr.SN.ToString(), ref sb);
                                break;
                            case "relwebnews":   //首長行程相關新聞
                                SetCsvRelSchedule(dr.SN.ToString(), dr.Lang.ToString(), Urls, item.Name, ref sb);
                                break;
                        }                      
                    }                
                }
                sb.Append("\r\n");
                //每筆最後一欄不需要逗號
                sb.Replace(",\r\n", "\r\n");
            }

            return sb;
        }

        public static DataTable GetOpneData(WEBOpenDataMain wEBOpenDataMain, List<WEBOpenDataDetail> wEBOpenDataDetails, List<WEBOpenDataSchema> wEBOpenDataSchemas)
        {
            DataTable Query = new DataTable();
            string Column = "";
            string sql = "";
            int Count = wEBOpenDataMain.Count != null ? (int)wEBOpenDataMain.Count : 500;

            using (var db = new MODAContext())
            {
                using (var connection = db.Database.GetDbConnection())
                {
                    connection.Open();
                    using (var command = connection.CreateCommand())
                    {
                        var dtSchems = wEBOpenDataSchemas.Where(x => !x.Column.Contains("Rel")).ToList();

                        Column += wEBOpenDataMain.TableName + ".*,";

                        for (var i = 0; i < dtSchems.Count; i++)
                        {
                            var dtCode = db.WEBOpenDataDetail.Where(x => x.OpenDataDetailSN == dtSchems[i].OpenDataDetailSN && x.OpenDataMainSN == dtSchems[i].OpenDataMainSN).FirstOrDefault();
                            Column += (dtCode != null ? dtCode.Code : dtSchems[i].TableName) + "." + dtSchems[i].Column + " AS " + dtSchems[i].Name + ",";
                        }

                        //var GroupTableName = wEBOpenDataSchemas.GroupBy(x => new { x.TableName,x.OpenDataDetailSN}).ToList();

                        //for(var i = 0; i < GroupTableName.Count; i ++)
                        //{
                        //    if (GroupTableName[i].Key.TableName != null)
                        //    {
                        //        var dtCode = db.WEBOpenDataDetail.Where(x => x.OpenDataDetailSN == GroupTableName[i].Key.OpenDataDetailSN).FirstOrDefault();
                        //        Column += (dtCode == null ? GroupTableName[i].Key.TableName : dtCode.Code) + ".*" + ",";
                        //    }
                        //}

                        if (Column.Length > 0)
                        {
                            Column = Column.Substring(0, Column.Length - 1);

                            sql = "select top " + Count + " " + Column;

                            sql += " from " + wEBOpenDataMain.TableName;
                        }

                        //sql = "select top " + Count + " * " + " from " + wEBOpenDataMain.TableName; ;

                        if (wEBOpenDataDetails.Count > 0)
                        {
                            for (var i = 0; i < wEBOpenDataDetails.Count; i++)
                            {

                                sql += " " + Utility.OpenDataType.GetJoin().Where(x => x.value == wEBOpenDataDetails[i].Join.ToString()).First().title + " " + wEBOpenDataDetails[i].TableName + " AS " + wEBOpenDataDetails[i].Code + " ON " + wEBOpenDataDetails[i].SQLParameter + " ";
                            }
                        }

                        sql += " WHERE 1 = 1";


                        if (!string.IsNullOrEmpty(wEBOpenDataMain.EndDate.ToString()))
                        {
                            sql += $" AND isnull({wEBOpenDataMain.TableName}.EndDate,convert(datetime, '{Convert.ToDateTime(wEBOpenDataMain.EndDate).ToString("yyyy/MM/dd HH:mm:ss")}', 120)) >= getdate()";
                        }
                        else
                        {
                            sql += $" AND isnull({wEBOpenDataMain.TableName}.EndDate,convert(datetime, '2050-12-31 23:59:59', 120)) >= getdate()";
                        }

                        if (!string.IsNullOrEmpty(wEBOpenDataMain.StartDate.ToString()))
                        {
                            sql += $" AND isnull({wEBOpenDataMain.TableName}.StartDate,convert(datetime, '{Convert.ToDateTime(wEBOpenDataMain.StartDate).ToString("yyyy/MM/dd HH:mm:ss")}', 120)) <= getdate()";
                        }
                        else
                        {
                            sql += $" AND isnull({wEBOpenDataMain.TableName}.StartDate,convert(datetime, '2050-12-31 23:59:59', 120)) <= getdate()";
                        }

                        sql += " " + SetRemoveTag(wEBOpenDataMain.SQLParameter).ToUpper().Replace("WHERE", "AND");

                        if (wEBOpenDataMain.SQLParameter.ToLower().IndexOf("order") < 0)
                        {
                            sql += " order by " + wEBOpenDataMain.TableName + ".SortOrder";
                        }

                        command.CommandText = sql;
                        command.CommandType = CommandType.Text;
                        using (var reader = command.ExecuteReader())
                        {
                            Query.Load(reader);
                            reader.Close();
                        }

                    }
                    connection.Close();
                }
            }
            return Query;
        }

        #region 移除HTML
        protected static string SetRemoveTag(string Str)
        {
            Regex regex = new Regex(@"<(.|\n)+?>");
            return regex.Replace(Str, "").Replace("\"", "\"\"").Replace("&nbsp;", "").Replace("\n", "").Replace("\r", "").Replace("\t","");
        }
        #endregion

        protected static DataTable GetField(string TABLE_NAME)
        {
            DataTable Query = new DataTable();

            using (var db = new MODAContext())
            {
                using (var connection = db.Database.GetDbConnection())
                {
                    connection.Open();
                    using (var command = connection.CreateCommand())
                    {
                        command.CommandText = "SELECT COLUMN_NAME  FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME =@TABLE_NAME";

                        var parameter = command.CreateParameter();
                        parameter.ParameterName = "@TABLE_NAME";
                        parameter.Value = TABLE_NAME;
                        command.Parameters.Add(parameter);

                        using (var reader = command.ExecuteReader())
                        {
                            Query.Load(reader);
                            reader.Close();
                        }
                    }
                    connection.Close();
                }
            }

            return Query;
        }

        #region JSON
        protected static void SetJsonRelFile(string TableName, string SN, string lan, string urls, string Name, ref JObject Subobj)
        {
            var files = WebLevelManagementService.GetWEBFiles(SN, TableName);
            string sFile = string.Empty;
            List<string> rFile = new List<string>();

            if (files.Count() > 0)
            {
                var sessionFile = files.Select(x => new CommonFileModel()
                {
                    fileExt = x.FileType,
                    fileNewName = x.FileName,
                    fileOriginName = x.OriginalFileName,
                    FileSort = x.SortOrder,
                    filePath = x.FilePath,
                    fileTitle = x.FileTitle,
                    fileSize = x.FileSize.Value,
                    GroupID = x.GroupID,
                    webFileID = x.WEBFileID,
                    lan = lan,

                }).ToList();

                if (sessionFile.Where(x => (x.GroupID == "NWMF" || x.GroupID == "NWSF") && x.lan == lan).Count() > 0)
                {
                    foreach (var file in sessionFile.Where(x => (x.GroupID == "NWMF" || x.GroupID == "NWSF") && x.lan == lan).OrderBy(x => x.FileSort))
                    {
                        string url = "";
                        if (file.filePath.IndexOf("http") < 0)
                        {
                            url = urls;
                        }
                        rFile.Add((url + file.filePath));
                    }
                }

                if (rFile.Count > 0)
                {
                    sFile = string.Join(",", rFile.ToArray());
                }

                Subobj.Add(new JProperty(Name, sFile));
            }
            else
            {
                Subobj.Add(new JProperty(Name, sFile));
            }
        }

        protected static void SetJsonRelPic(string TableName, string SN, string lan, string urls, string Name, ref JObject Subobj)
        {
            var files = WebLevelManagementService.GetWEBFiles(SN, TableName);
            string sImg = string.Empty;
            List<string> rImg = new List<string>();

            if (files?.Count() > 0)
            {
                var sessionFile = files.Select(x => new CommonFileModel()
                {
                    fileExt = x.FileType,
                    fileNewName = x.FileName,
                    fileOriginName = x.OriginalFileName,
                    FileSort = x.SortOrder,
                    filePath = x.FilePath,
                    fileTitle = x.FileTitle,
                    fileSize = x.FileSize.Value,
                    GroupID = x.GroupID,
                    webFileID = x.WEBFileID,
                    lan = lan,

                }).ToList();

                if (sessionFile.Where(x => (x.GroupID == "NWMI" || x.GroupID == "NWMII") && x.lan == lan).Count() > 0)
                {
                    foreach (var file in sessionFile.Where(x => (x.GroupID == "NWMI" || x.GroupID == "NWMII") && x.lan == lan).OrderBy(x => x.FileSort))
                    {
                        string url = "";
                        if (file.filePath.IndexOf("http") < 0)
                        {
                            url = urls;
                        }
                        rImg.Add((url + file.filePath));
                    }
                }

                if (rImg.Count > 0)
                {
                    sImg = string.Join(",", rImg.ToArray());
                }

                Subobj.Add(new JProperty(Name, sImg));
            }
            else
            {
                Subobj.Add(new JProperty(Name, sImg));
            }
        }

        protected static void SetJsonRelLink(string TableName, string SN, string urls, string Name, ref JObject Subobj)
        {
            var Link = WebLevelManagementService.GetWEBNewsExtends(int.Parse(SN)).Where(x => x.GroupID == "relatedlink").ToList();
            string sLink = string.Empty;
            List<string> rLink = new List<string>();

            if (Link.Count > 0)
            {
                foreach (var link in Link)
                {
                    string url = "";

                    if (link.Column_1.IndexOf("http") < 0)
                    {
                        url = urls;
                    }
                    rLink.Add((url + link.Column_1));

                }

                if (rLink.Count > 0)
                {
                    sLink = string.Join(",", rLink.ToArray());
                }

                Subobj.Add(new JProperty(Name, sLink));
            }
            else
            {
                Subobj.Add(new JProperty(Name, sLink));
            }
        }

        protected static void SetJsonRelVideo(string SN, string Name, ref JObject Subobj)
        {
            var Video = WebLevelManagementService.GetWEBNewsExtends(int.Parse(SN)).Where(x => x.GroupID == "relatedvideo").ToList();
            string sVideo = string.Empty;
            List<string> rVideo = new List<string>();

            if (Video.Count > 0)
            {
                foreach (var video in Video)
                {
                    string url = "";

                    if (video.Column_1.IndexOf("/") < 0)
                    {
                        url = $"https://youtu.be/{video.Column_1}";
                    }
                    rVideo.Add(url);
                }

                if (rVideo.Count > 0)
                {
                    sVideo = string.Join(",", rVideo.ToArray());
                }
                Subobj.Add(new JProperty(Name, sVideo));
            }
            else
            {
                Subobj.Add(new JProperty(Name, sVideo));
            }
        }

        protected static void SetJsonRelSchedule(string SN, string lan, string urls, string Name, ref JObject Subobj)
        {
            var Schedule = WebLevelManagementService.GetScheduleByWEBNews(int.Parse(SN)).Where(x => x.Lang == lan).ToList();
            string sSchedule = string.Empty;
            List<string> rSchedule = new List<string>();

            if (Schedule.Count > 0)
            {
                foreach (var schedule in Schedule)
                {
                    string url = "";

                    if (schedule.StatesUrl.IndexOf("http") < 0)
                    {
                        url = urls;
                    }
                    rSchedule.Add(schedule.Title + "(" + (url + schedule.StatesUrl) + ")");
                }

                if (rSchedule.Count > 0)
                {
                    sSchedule = string.Join(",", rSchedule.ToArray());
                }

                Subobj.Add(new JProperty(Name, sSchedule));
            }
            else
            {
                Subobj.Add(new JProperty(Name, sSchedule));
            }


        }

        #endregion

        #region XML
        protected static void SetXmlRelFile(string TableName, string SN, string lan, string urls, string Name, ref XElement XmlElement)
        {
            var files = WebLevelManagementService.GetWEBFiles(SN, TableName);
            string sFile = string.Empty;
            List<string> rFile = new List<string>();

            if (files?.Count() > 0)
            {
                var sessionFile = files.Select(x => new CommonFileModel()
                {
                    fileExt = x.FileType,
                    fileNewName = x.FileName,
                    fileOriginName = x.OriginalFileName,
                    FileSort = x.SortOrder,
                    filePath = x.FilePath,
                    fileTitle = x.FileTitle,
                    fileSize = x.FileSize.Value,
                    GroupID = x.GroupID,
                    webFileID = x.WEBFileID,
                    lan = lan,

                }).ToList();

                if (sessionFile.Where(x => (x.GroupID == "NWMF" || x.GroupID == "NWSF") && x.lan == lan).Count() > 0)
                {
                    foreach (var file in sessionFile.Where(x => (x.GroupID == "NWMF" || x.GroupID == "NWSF") && x.lan == lan).OrderBy(x => x.FileSort))
                    {
                        string url = "";
                        if (file.filePath.IndexOf("http") < 0)
                        {
                            url = urls;
                        }
                        rFile.Add((url + file.filePath));
                    }
                }

                if (rFile.Count > 0)
                {
                    sFile = string.Join(",", rFile.ToArray());
                }

                XmlElement.Add(CreateNode(Name, sFile));
            }
            else
            {
                XmlElement.Add(CreateNode(Name, sFile));
            }
        }

        protected static void SetXmlRelPic(string TableName, string SN, string lan, string urls, string Name, ref XElement XmlElement)
        {
            var files = WebLevelManagementService.GetWEBFiles(SN, TableName);
            string sImg = string.Empty;
            List<string> rImg = new List<string>();

            if (files.Count() > 0)
            {
                var sessionFile = files.Select(x => new CommonFileModel()
                {
                    fileExt = x.FileType,
                    fileNewName = x.FileName,
                    fileOriginName = x.OriginalFileName,
                    FileSort = x.SortOrder,
                    filePath = x.FilePath,
                    fileTitle = x.FileTitle,
                    fileSize = x.FileSize.Value,
                    GroupID = x.GroupID,
                    webFileID = x.WEBFileID,
                    lan = lan,

                }).ToList();

                if (sessionFile.Where(x => (x.GroupID == "NWMI" || x.GroupID == "NWMII") && x.lan == lan).Count() > 0)
                {
                    foreach (var file in sessionFile.Where(x => (x.GroupID == "NWMI" || x.GroupID == "NWMII") && x.lan == lan).OrderBy(x => x.FileSort))
                    {
                        string url = "";
                        if (file.filePath.IndexOf("http") < 0)
                        {
                            url = urls;
                        }
                        rImg.Add((url + file.filePath));
                    }
                }

                if (rImg.Count > 0)
                {
                    sImg = string.Join(",", rImg.ToArray());
                }

                XmlElement.Add(CreateNode(Name, sImg));
            }
            else
            {
                XmlElement.Add(CreateNode(Name, sImg));
            }
        }

        protected static void SetXmlRelLink(string TableName, string SN, string urls, string Name, ref XElement XmlElement)
        {
            var Link = WebLevelManagementService.GetWEBNewsExtends(int.Parse(SN)).Where(x => x.GroupID == "relatedlink").ToList();
            string sLink = string.Empty;
            List<string> rLink = new List<string>();

            if (Link.Count > 0)
            {
                foreach (var link in Link)
                {
                    string url = "";

                    if (link.Column_1.IndexOf("http") < 0)
                    {
                        url = urls;
                    }
                    rLink.Add((url + link.Column_1));

                }

                if (rLink.Count > 0)
                {
                    sLink = string.Join(",", rLink.ToArray());
                }

                XmlElement.Add(CreateNode(Name, sLink));
            }
            else
            {
                XmlElement.Add(CreateNode(Name, sLink));
            }
        }

        protected static void SetXmlRelVideo(string SN, string Name, ref XElement XmlElement)
        {
            var Video = WebLevelManagementService.GetWEBNewsExtends(int.Parse(SN)).Where(x => x.GroupID == "relatedvideo").ToList();
            string sVideo = string.Empty;
            List<string> rVideo = new List<string>();

            if (Video.Count > 0)
            {
                foreach (var video in Video)
                {
                    string url = "";

                    if (video.Column_1.IndexOf("/") < 0)
                    {
                        url = $"https://youtu.be/{video.Column_1}";
                    }
                    rVideo.Add(url);
                }

                if (rVideo.Count > 0)
                {
                    sVideo = string.Join(",", rVideo.ToArray());
                }
                XmlElement.Add(CreateNode(Name, sVideo));
            }
            else
            {
                XmlElement.Add(CreateNode(Name, sVideo));
            }
        }

        protected static void SetXmlRelSchedule(string SN, string lan, string urls, string Name, ref XElement XmlElement)
        {
            var Schedule = WebLevelManagementService.GetScheduleByWEBNews(int.Parse(SN)).Where(x => x.Lang == lan).ToList();
            string sSchedule = string.Empty;
            List<string> rSchedule = new List<string>();

            if (Schedule.Count > 0)
            {
                foreach (var schedule in Schedule)
                {
                    string url = "";

                    if (schedule.StatesUrl.IndexOf("http") < 0)
                    {
                        url = urls;
                    }
                    rSchedule.Add(schedule.Title + "(" + (url + schedule.StatesUrl) + ")");
                }

                if (rSchedule.Count > 0)
                {
                    sSchedule = string.Join(",", rSchedule.ToArray());
                }

                XmlElement.Add(CreateNode(Name, sSchedule));
            }
            else
            {
                XmlElement.Add(CreateNode(Name, sSchedule));
            }


        }
        #endregion

        #region CSV
        protected static void SetCsvRelFile(string TableName, string SN, string lan, string urls, ref System.Text.StringBuilder str)
        {
            var files = WebLevelManagementService.GetWEBFiles(SN, TableName);
            List<string> rFile = new List<string>();

            if (files.Count() > 0)
            {
                var sessionFile = files.Select(x => new CommonFileModel()
                {
                    fileExt = x.FileType,
                    fileNewName = x.FileName,
                    fileOriginName = x.OriginalFileName,
                    FileSort = x.SortOrder,
                    filePath = x.FilePath,
                    fileTitle = x.FileTitle,
                    fileSize = x.FileSize.Value,
                    GroupID = x.GroupID,
                    webFileID = x.WEBFileID,
                    lan = lan,

                }).ToList();

                if (sessionFile.Where(x => (x.GroupID == "NWMF" || x.GroupID == "NWSF") && x.lan == lan).Count() > 0)
                {
                    foreach (var file in sessionFile.Where(x => (x.GroupID == "NWMF" || x.GroupID == "NWSF") && x.lan == lan).OrderBy(x => x.FileSort))
                    {
                        string url = "";
                        if (file.filePath.IndexOf("http") < 0)
                        {
                            url = urls;
                        }
                        rFile.Add((url + file.filePath));
                    }
                }
                else
                {
                    str.Append("\"\",");
                }

                if (rFile.Count > 0)
                {
                    str.Append("\"" + string.Join("|", rFile.ToArray()) + "\"" + ",");
                }
            }
            else
            {
                str.Append("\"\",");
            }
        }

        protected static void SetCsvRelPic(string TableName, string SN, string lan, string urls, ref System.Text.StringBuilder str)
        {
            var files = WebLevelManagementService.GetWEBFiles(SN, TableName);
            List<string> rImg = new List<string>();

            if (files.Count() > 0)
            {
                var sessionFile = files.Select(x => new CommonFileModel()
                {
                    fileExt = x.FileType,
                    fileNewName = x.FileName,
                    fileOriginName = x.OriginalFileName,
                    FileSort = x.SortOrder,
                    filePath = x.FilePath,
                    fileTitle = x.FileTitle,
                    fileSize = x.FileSize.Value,
                    GroupID = x.GroupID,
                    webFileID = x.WEBFileID,
                    lan = lan,

                }).ToList();

                if (sessionFile.Where(x => (x.GroupID == "NWMI" || x.GroupID == "NWMII") && x.lan == lan).Count() > 0)
                {
                    foreach (var file in sessionFile.Where(x => (x.GroupID == "NWMI" || x.GroupID == "NWMII") && x.lan == lan).OrderBy(x => x.FileSort))
                    {
                        string url = "";
                        if (file.filePath.IndexOf("http") < 0)
                        {
                            url = urls;
                        }
                        rImg.Add((url + file.filePath));
                    }
                }
                else
                {
                    str.Append("\"\",");
                }

                if (rImg.Count > 0)
                {
                    str.Append("\"" + string.Join("|", rImg.ToArray()) + "\"" + ",");
                }
            }
            else
            {
                str.Append("\"\",");
            }
        }

        protected static void SetCsvRelLink(string TableName, string SN, string urls, ref System.Text.StringBuilder str)
        {
            var Link = WebLevelManagementService.GetWEBNewsExtends(int.Parse(SN)).Where(x => x.GroupID == "relatedlink").ToList();
            List<string> rLink = new List<string>();

            if (Link.Count > 0)
            {
                foreach (var link in Link)
                {
                    string url = "";

                    if (link.Column_1.IndexOf("http") < 0)
                    {
                        url = urls;
                    }
                    rLink.Add((url + link.Column_1));

                }

                if (rLink.Count > 0)
                {
                    str.Append("\"" + string.Join("|", rLink.ToArray()) + "\"" + ",");
                }
            }
            else
            {
                str.Append("\"\",");
            }
        }

        protected static void SetCsvRelVideo(string SN, ref System.Text.StringBuilder str)
        {
            var Video = WebLevelManagementService.GetWEBNewsExtends(int.Parse(SN)).Where(x => x.GroupID == "relatedvideo").ToList();
            List<string> rVideo = new List<string>();

            if (Video.Count > 0)
            {
                foreach (var video in Video)
                {
                    string url = "";

                    if (video.Column_1.IndexOf("/") < 0)
                    {
                        url = $"https://youtu.be/{video.Column_1}";
                    }
                    rVideo.Add(url);

                }

                if (rVideo.Count > 0)
                {
                    str.Append("\"" + string.Join("|", rVideo.ToArray()) + "\"" + ",");
                }
            }
            else
            {
                str.Append("\"\",");
            }
        }

        protected static void SetCsvRelSchedule(string SN, string lan, string urls, string Name, ref System.Text.StringBuilder str)
        {
            var Schedule = WebLevelManagementService.GetScheduleByWEBNews(int.Parse(SN)).Where(x => x.Lang == lan).ToList();
            List<string> rSchedule = new List<string>();

            if (Schedule.Count > 0)
            {
                foreach (var schedule in Schedule)
                {
                    string url = "";

                    if (schedule.StatesUrl.IndexOf("http") < 0)
                    {
                        url = urls;
                    }
                    rSchedule.Add(schedule.Title + "(" + (url + schedule.StatesUrl) + ")");
                }

                if (rSchedule.Count > 0)
                {
                    str.Append("\"" + string.Join("|", rSchedule.ToArray()) + "\"" + ",");
                }
            }
            else
            {
                str.Append("\"\",");
            }


        }


        #endregion

        /// <summary>
        /// Create Xml Document
        /// </summary>
        /// <param name="XmlName"></param>
        /// <returns></returns>
        protected static XDocument CreateXmlDocument(string XmlName)
        {
            return new XDocument(new XDeclaration("1.0", "UTF-8", "yes"),
                new XElement($"{XmlName}"));
        }

        protected static XElement CreateNode(string childname, string childValue, bool isAttTag = false, string XmlElementName = "", string attName = "", string attValue = "")
        {
            return new XElement(childname, childValue);
        }

        public static void DeleteFile(string key, string sPath)
        {
            System.IO.DirectoryInfo di = new DirectoryInfo(System.IO.Path.Combine(sPath, key));
            if (Directory.Exists(sPath))
            {
                foreach (DirectoryInfo file in di.EnumerateDirectories())
                {
                    file.Delete(true);
                }
                di.Delete();
            }
        }

        public static void NewsReArrangeByChild(int key, int sort,string websiteid, string ProcessUserID)
        {
            using (var db = new MODAContext())
            {
                try
                {
                    //向上找出父節點的所有子節點
                    var Tree = (from m in db.WEBOpenDataMain.Where(m => m.WebSiteID == websiteid && m.IsEnable != "-99")
                               select m).OrderBy(x => x.SortOrder).ToList();
                    //找出當前節點的SortOrder
                    int originalSort = (from t in Tree
                                        where t.WEBOpenDataMainSN == key
                                        select t.SortOrder).FirstOrDefault() ?? 0;
                    //插入新序號
                    foreach (var item in Tree)
                    {
                        if (sort < originalSort)
                        {
                            if (item.SortOrder >= sort)
                                item.SortOrder += 1;
                            if (item.WEBOpenDataMainSN == key)
                                item.SortOrder = sort;
                        }
                        else
                        {
                            if (item.SortOrder > sort)
                                item.SortOrder += 1;
                            if (item.WEBOpenDataMainSN == key)
                                item.SortOrder = sort + 1;
                        }
                    }
                    //重新排序
                    int i = 1;
                    var timeNow = DateTime.Now;
                    foreach (var item in Tree.AsEnumerable().OrderBy(x => x.SortOrder))
                    {
                        item.SortOrder = i;
                        i++;
                    }
                    db.SaveChanges();
                }
                catch (Exception)
                {

                }
            }
        }
    }
}
