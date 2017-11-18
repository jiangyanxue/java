using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI.Student
{
    public partial class deleteStudent : System.Web.UI.Page
    {
        private stu_infoBLL bll = new stu_infoBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request["id"];
            bll.deleteStudent(id);
        }
    }
}