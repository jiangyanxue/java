using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL
{
    public class queryBLL
    {
        queryDAL dal = new queryDAL();
        public List<grade> getGrade( string sid, string sname)
        {
            return dal.getGrade(sid, sname);
        }
    }
}
