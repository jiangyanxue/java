using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI.Grade
{
    public partial class deleteGrade : System.Web.UI.Page
    {
        private gradeBLL bll = new gradeBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request["id"];
            bll.deleteGrade(id);

        }
    }
}