using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Model;
using DAL;
namespace BLL
{
    public class adminBLL
    {
        private adminDAL adl = new adminDAL();
        public List<admin> GetAdmin() 
        {
            return adl.GetAdmin();
        }
        public void addAdmin(admin adm) {
            adl.addAdmin(adm);
        }
        public void updateAdmin(admin adm)
        {
            adl.updateAdmin(adm);
        }
        public void deleteAdmin(string id) {
            adl.deleteAdmin(id);
        }
    }
}
