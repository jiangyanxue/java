using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI.Student
{
    public partial class updateStudent : System.Web.UI.Page
    {
        private Model.stu_info si = new Model.stu_info();
        private stu_infoBLL bll = new stu_infoBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            si.sid = Request["sid"];
            si.sname = Request["sname"];
            si.gender = Request["gender"];
            si.telephone = Request["telephone"];
            bll.updateStudent(si);
        }
    }
}