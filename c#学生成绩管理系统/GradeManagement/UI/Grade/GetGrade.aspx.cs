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
    public partial class getGrade : System.Web.UI.Page
    {
        private Model.grade g = new Model.grade();
        private gradeBLL bll = new gradeBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
            int totalCount = 0;
            var list = bll.GetGrade();
            var data = new { total = totalCount, rows = list };
            var result = JsonConvert.SerializeObject(data);     //将data 转化为 json

            Response.Write(result);
            Response.End();
        }
    }
}