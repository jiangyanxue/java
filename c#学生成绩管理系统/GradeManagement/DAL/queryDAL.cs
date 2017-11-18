using DBUnity;
using Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;

namespace DAL
{
     public class queryDAL
    {
         string conString = sqlDbHelper.connectionString;
        private string SearchString(string sid, string sname)
        {
            string sql = "";
            if (!string.IsNullOrEmpty(sid))
                sql += string.Format(" and sid= '{0}'", sid);
            if (!string.IsNullOrEmpty(sname))
                sql += string.Format(" and sname like '%{0}%'", sname);
            return sql;
        }

        public List<grade> getGrade(string sid, string sname)
        {
            using (SqlConnection con = new SqlConnection(conString))
            {
                string sqlTotal = string.Format("select * from grade where 1=1");
                sqlTotal += SearchString(sid, sname);
                SqlDataAdapter daTotal = new SqlDataAdapter(sqlTotal, con);
                DataTable dtTotal = new DataTable();
                daTotal.Fill(dtTotal);
                List<grade> list = new List<grade>();
                foreach (DataRow row in dtTotal.Rows)
                {
                    grade g1 = new grade();
                    g1.sid = row["sid"].ToString();
                    g1.sname = row["sname"].ToString();
                    g1.cid = row["cid"].ToString();
                    g1.cname = row["cname"].ToString();
                    g1.score = row["score"].ToString();
                    list.Add(g1);
                }
                return list;
            }
        }
    }
}
