using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model;
using DAL;
namespace BLL
{
    public  class teacher_infoBLL
    {
        private teacher_infoDAL tid = new teacher_infoDAL();
        public List<teacher_info> GetTeacher()
        {
            return tid.GetTeacher();
        }
        public void addTeacher(teacher_info ti)
        {
           tid.addTeacher(ti);
        }
        public void updateTeacher(teacher_info ti)
        {
            tid.updateTeacher(ti);
        }
        public void deleteTeacher(string id)
        {
            tid.deleteTeacher(id);
        }
    }
}
