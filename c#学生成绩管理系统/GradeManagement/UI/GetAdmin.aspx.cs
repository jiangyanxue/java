using BLL;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI
{
    public partial class GetAdmin : System.Web.UI.Page
    {
        private adminBLL adb = new adminBLL();
        protected void Page_Load(object sender, EventArgs e)
        {
         
          
            int totalCount = 0;
            var list = adb.GetAdmin();
            var data = new { total = totalCount, rows = list };
            var result = JsonConvert.SerializeObject(data);     //将data 转化为 json

            Response.Write(result);
            Response.End();
        }
    }
}