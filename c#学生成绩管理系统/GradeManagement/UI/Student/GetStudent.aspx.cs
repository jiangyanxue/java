using BLL;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI.Student
{
    public partial class GetStudent : System.Web.UI.Page
    {
        private stu_infoBLL bll = new stu_infoBLL();
        protected void Page_Load(object sender, EventArgs e)
        {


            int totalCount = 0;
            var list = bll.GetStudent();
            var data = new { total = totalCount, rows = list };
            var result = JsonConvert.SerializeObject(data);     //将data 转化为 json

            Response.Write(result);
            Response.End();
        }
    }
}