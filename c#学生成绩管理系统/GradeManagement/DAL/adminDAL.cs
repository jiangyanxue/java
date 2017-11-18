using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DBUnity;
using Model;
using System.Data.SqlClient;
using System.Data;

namespace DAL
{
   public class adminDAL
    {
       string conString = sqlDbHelper.connectionString;
       public List<admin> GetAdmin() { 
         using (SqlConnection con= new SqlConnection(conString)){
             string sql = "select * from admin";
             SqlDataAdapter da = new SqlDataAdapter(sql, con);
             DataTable dt = new DataTable();
             da.Fill(dt);
             List<admin> list = new List<admin>();
             foreach(DataRow row in dt.Rows){
               admin adm = new admin();
               adm.aid = row["aid"].ToString();
               adm.aUsername = row["aUsername"].ToString();
               adm.IsSelect = row["IsSelect"].ToString();
               adm.IsDelete = row["IsDelete"].ToString();
               adm.IsEdit = row["IsEdit"].ToString();
               adm.a_identity = row["a_identity"].ToString();
               list.Add(adm);
         }
             return list;
       } 
    }
       public void addAdmin(admin adm) {
           using (SqlConnection conn = new SqlConnection(conString)) {
               string sql = string.Format("insert into admin(aid,aUsername,IsSelect,IsDelete,IsEdit,a_identity) values ('{0}','{1}','{2}','{3}','{4}','{5}')",adm.aid,adm.aUsername,adm.IsSelect,adm.IsDelete,adm.IsEdit,adm.a_identity);
               conn.Open();
               SqlCommand cmd = new SqlCommand(sql,conn);
               cmd.ExecuteNonQuery();
               conn.Close();
               }
      }
       public void updateAdmin(admin adm) {
           using (SqlConnection conn = new SqlConnection(conString)) {
               string sql = string.Format("update admin set aUsername = '{1}',IsSelect = '{2}',IsDelete = '{3}',IsEdit = '{4}',a_identity = '{5}' where aid = '{0}'",adm.aid,adm.aUsername,adm.IsSelect,adm.IsDelete,adm.IsEdit,adm.a_identity);
               conn.Open();
               SqlCommand cmd = new SqlCommand(sql, conn);
               cmd.ExecuteNonQuery();
               conn.Close();
           }
       }
       public void deleteAdmin(string id) {
           using (SqlConnection conn = new SqlConnection(conString))
           {
               string sql = string.Format("delete from admin where aid='{0}' ", id);
               conn.Open();
               SqlCommand cmd = new SqlCommand(sql,conn);
               cmd.ExecuteNonQuery();
               conn.Close();
           }
       }
  }
}
