using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI.Teacher
{
    public partial class addTeacher : System.Web.UI.Page
    {
        private Model.teacher_info ti = new Model.teacher_info();
        private teacher_infoBLL bll = new teacher_infoBLL();
        protected void Page_Load(object sender, EventArgs e)
        {


            ti.tid = Request["tid"];
            ti.tname = Request["tname"];
            ti.gender = Request["gender"];
            ti.telephone = Request["telephone"];
            ti.tcourse = Request["tcourse"];
            bll.addTeacher(ti);
        }
    }
}