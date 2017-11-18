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
    public class teacher_infoDAL
    {
        string conString = sqlDbHelper.connectionString;
        public List<teacher_info> GetTeacher()
        {
            using (SqlConnection con = new SqlConnection(conString))
            {
                string sql = "select * from teacher_info";
                SqlDataAdapter da = new SqlDataAdapter(sql, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                List<teacher_info> list = new List<teacher_info>();
                foreach (DataRow row in dt.Rows)
                {
                    teacher_info ti = new teacher_info();
                    ti.tid = row["tid"].ToString();
                    ti.tname = row["tname"].ToString();
                    ti.gender = row["gender"].ToString();
                    ti.telephone = row["telephone"].ToString();
                    ti.tcourse = row["tcourse"].ToString();
                    list.Add(ti);
                }
                return list;
            }
        }
        public void addTeacher(teacher_info ti)
        {
            using (SqlConnection conn = new SqlConnection(conString))
            {
                string sql = string.Format("insert into teacher_info(tid,tname,gender,telephone,tcourse) values ('{0}','{1}','{2}','{3}','{4}')",ti.tid,ti.tname,ti.gender,ti.telephone,ti.tcourse);
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }
        public void updateTeacher(teacher_info ti)
        {
            using (SqlConnection conn = new SqlConnection(conString))
            {
                string sql = string.Format("update teacher_info set tname = '{1}',gender = '{2}',telephone = '{3}',tcourse = '{4}' where tid = '{0}'", ti.tid,ti.tname,ti.gender,ti.telephone,ti.tcourse);
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }
        public void deleteTeacher(string id)
        {
            using (SqlConnection conn = new SqlConnection(conString))
            {
                string sql = string.Format("delete from teacher_info where tid='{0}'", id);
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }
    }
}
