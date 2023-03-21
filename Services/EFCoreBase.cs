using Microsoft.EntityFrameworkCore;
using NPOI.SS.Formula.Functions;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Dynamic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Services
{
    public class EFCoreBase 
    {
        /// <summary>
        /// 動態撈取想要的資料格式
        /// </summary>
        /// <param name="sql"></param>
        /// <returns></returns>
        public static List<dynamic> GetRawSqlModel(string sql)
        {
            List<dynamic> list = new List<dynamic>();
            using (var context = new MODAContext())
            {
                using (var command = context.Database.GetDbConnection().CreateCommand())
                {
                    command.CommandText = sql;
                    command.CommandType = CommandType.Text;
                    context.Database.OpenConnection();
                    using (var result = command.ExecuteReader())
                    {
                        while (result.Read())
                        {
                            IDictionary<String, Object> MyDynamic = new ExpandoObject() as IDictionary<string, Object>;
                            for (int i = 0; i < result.FieldCount; i++) // 透過FieldCount 取得該列資料中的所有欄位數目
                            {
                                MyDynamic.Add(result.GetName(i), result[i]); //動態將SQL存取到的欄位以及Value 放入MyDynamic中
                            }
                            list.Add(MyDynamic);
                        }
                        return list;
                    }
                }
            }
        }
    }
}
