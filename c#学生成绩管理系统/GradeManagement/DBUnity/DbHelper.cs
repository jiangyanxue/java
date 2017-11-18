using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Configuration;
namespace DBUnity
{
    public class DbHelper
    {
        public static string Strsqlconnection = System.Configuration.ConfigurationManager.ConnectionStrings["connectionString"].ConnectionString;
        public static SqlConnection CreateConnection()
        {
            SqlConnection conn = new SqlConnection(Strsqlconnection);
            return conn;
        }
    }
}
