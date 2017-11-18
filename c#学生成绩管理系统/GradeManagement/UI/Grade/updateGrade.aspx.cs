using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI.Grade
{
    public partial class updateGrade : System.Web.UI.Page
    {
        private Model.grade g = new Model.grade();
        private gradeBLL bll = new gradeBLL();
        protected void Page_Load(object sender, EventArgs e)
        {


            g.sid = Request["sid"];
            g.sname = Request["sname"];
            g.cid = Request["cid"];
            g.cname = Request["cname"];
            g.score = Request["score"];
            bll.updateGrade(g);
        }
    }
}