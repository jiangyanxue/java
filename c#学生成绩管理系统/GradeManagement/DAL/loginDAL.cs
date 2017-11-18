using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model;
using DBUnity;
using System.Data.SqlClient;
using System.Data;
namespace DAL
{
    public class loginDAL
    {
       static string conString = sqlDbHelper.connectionString;


       public static bool getLogin(string name,string password,string ident)
        {
            string sql = string.Format("select * from user_info where Uname ='{0}'and pwd='{1}' and u_identity='{2}'", name, password, ident);
            return sqlDbHelper.ExcuteReader(sql);
        }
    }
}
