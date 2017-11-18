using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI.Teacher
{
    public partial class deleteTeacher : System.Web.UI.Page
    {
        private teacher_infoBLL bll = new teacher_infoBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request["id"];
            bll.deleteTeacher(id);
        }
    }
}