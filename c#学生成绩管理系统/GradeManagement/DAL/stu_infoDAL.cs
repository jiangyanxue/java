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
    public class stu_infoDAL
    {
        string conString = sqlDbHelper.connectionString;
        public List<stu_info> GetStudent()
        {
            using (SqlConnection con = new SqlConnection(conString))
            {
                string sql = "select * from stu_info";
                SqlDataAdapter da = new SqlDataAdapter(sql, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                List<stu_info> list = new List<stu_info>();
                foreach (DataRow row in dt.Rows)
                {
                    stu_info si = new stu_info();
                    si.sid = row["sid"].ToString();
                    si.sname = row["sname"].ToString();
                    si.gender = row["gender"].ToString();
                    si.telephone = row["telephone"].ToString();

                    list.Add(si);
                }
                return list;
            }
        }
        public void addStudent(stu_info si)
        {
            using (SqlConnection conn = new SqlConnection(conString))
            {
                string sql = string.Format("insert into stu_info(sid,sname,gender,telephone) values ('{0}','{1}','{2}','{3}')", si.sid, si.sname, si.gender, si.telephone);
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }
        public void updateStudent(stu_info si)
        {
            using (SqlConnection conn = new SqlConnection(conString))
            {
                string sql = string.Format("update stu_info set sname = '{1}',gender = '{2}',telephone = '{3}' where sid = '{0}'", si.sid, si.sname, si.gender, si.telephone);
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }
        public void deleteStudent(string id)
        {
            using (SqlConnection conn = new SqlConnection(conString))
            {
                string sql = string.Format("delete from stu_info where sid='{0}'", id);
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }

    }
}
