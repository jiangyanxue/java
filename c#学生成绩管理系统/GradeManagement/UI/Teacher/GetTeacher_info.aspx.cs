using BLL;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI.Teacher
{
    public partial class GetTeacher_info : System.Web.UI.Page
    {
        private teacher_infoBLL bll = new teacher_infoBLL();
        protected void Page_Load(object sender, EventArgs e)
        {


            int totalCount = 0;
            var list = bll.GetTeacher();
            var data = new { total = totalCount, rows = list };
            var result = JsonConvert.SerializeObject(data);     //将data 转化为 json

            Response.Write(result);
            Response.End();
        }
    }
}