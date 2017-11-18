using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;
using System.Data.SqlClient;
namespace DBUnity
{
     public class sqlDbHelper
    {
         public static string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        
           public static bool ExcuteReader(string sql)                            //判断查询数据库中是否有该数据
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                SqlCommand command = new SqlCommand(sql);
                command.Connection = conn;
                bool result = command.ExecuteReader().HasRows;
                return result;
            }
        }
    }
}
