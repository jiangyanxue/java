using BLL;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI.Grade
{
    public partial class queryGrade : System.Web.UI.Page
    {
        private queryBLL bll = new queryBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            string sid = Request["sid"];
            string sname = Request["sname"];
            int totalCount = 0;
            var list = bll.getGrade(sid, sname);
            var data = new { total = totalCount, rows = list };
            var result = JsonConvert.SerializeObject(data);     //将data 转化为 json

            Response.Write(result);
            Response.End();
        }
    }
}