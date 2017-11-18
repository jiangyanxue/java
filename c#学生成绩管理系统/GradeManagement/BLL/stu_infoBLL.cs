using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model;
namespace BLL
{
    public class stu_infoBLL
    {
        private stu_infoDAL sid = new stu_infoDAL();
        public List<stu_info> GetStudent()
        {
            return sid.GetStudent();
        }
        public void addStudent(stu_info si)
        {
            sid.addStudent(si);
        }
        public void updateStudent(stu_info si)
        {
            sid.updateStudent(si);
        }
        public void deleteStudent(string id)
        {
            sid.deleteStudent(id);
        }
    }
}
