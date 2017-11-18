using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using BLL;
namespace UI
{
    public partial class Login : System.Web.UI.Page
    {


        [WebMethod]
        public static int GetValueAjax(string username, string pwd, string valid, string identity)
        {
            
            string code = (string)HttpContext.Current.Session["CheckCode"];
            string vali = valid;
            string name = username;
            string password = pwd;
            string ident = identity;
            if (loginBLL.getLogin(name, password, ident))
            {
                if (ident == "管理员")
                    if (vali == code)
                        return 1;
                    else
                        return 0;

                else if (ident == "教师")
                    if (vali == code) return 2;
                    else return 0;

                else
                    if (vali == code) return 3;
                    else return 0;
            }
            else {
                return 4;
            }

            
        }





        protected void Page_Load(object sender, EventArgs e)
        {
            Image1.ImageUrl = "ValidateCode.aspx";

        }
    }
}
