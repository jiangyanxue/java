using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL
{
    public class gradeBLL
    {
        private gradeDAL gdl = new gradeDAL();
        public List<grade> GetGrade()
        {
            return gdl.GetGrade();
        }
        public void updateGrade(grade g)
        {
            gdl.updateGrade(g);
        }
        public void deleteGrade(string id)
        {
            gdl.deleteGrade(id);
        }
    }
}
