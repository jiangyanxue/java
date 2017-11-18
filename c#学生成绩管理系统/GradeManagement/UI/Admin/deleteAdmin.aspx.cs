using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI.Admin
{
    public partial class deleteAdmin : System.Web.UI.Page
    {
        private adminBLL bll = new adminBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request["id"];
            bll.deleteAdmin(id);
     
        }
    }
}