using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI.Admin
{
    public partial class updateAdmin : System.Web.UI.Page
    {
        private Model.admin adm = new Model.admin();
        private adminBLL bll = new adminBLL();
        protected void Page_Load(object sender, EventArgs e)
        {


            adm.aid = Request["aid"];
            adm.aUsername = Request["aUsername"];
            adm.IsSelect = Request["IsSelect"];
            adm.IsDelete = Request["IsDelete"];
            adm.IsEdit = Request["IsEdit"];
            adm.a_identity = Request["a_identity"];
            bll.updateAdmin(adm);
        }
    }
}