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
    public class gradeDAL
    {
        string conString = sqlDbHelper.connectionString;
        public List<grade> GetGrade()
        {
            using (SqlConnection con = new SqlConnection(conString))
            {
                string sql = "select * from grade";
                SqlDataAdapter da = new SqlDataAdapter(sql, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                List<grade> list = new List<grade>();
                foreach (DataRow row in dt.Rows)
                {
                    grade g = new grade(); 
                    g.sid = row["sid"].ToString();
                    g.sname = row["sname"].ToString();
                    g.cid = row["cid"].ToString();
                    g.cname = row["cname"].ToString();
                    g.score = row["score"].ToString();
                    list.Add(g);
                }
                return list;
            }
        }
        public void updateGrade(grade g)
        {
            using (SqlConnection conn = new SqlConnection(conString))
            {
                string sql = string.Format("update grade set sname = '{1}',cid = '{2}',cname = '{3}',score='{4}' where sid = '{0}'", g.sid, g.sname, g.cid, g.cname,g.score);
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }
        public void deleteGrade(string id)
        {
            using (SqlConnection conn = new SqlConnection(conString))
            {
                string sql = string.Format("delete from grade where sid='{0}'", id);
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }
    }
}
