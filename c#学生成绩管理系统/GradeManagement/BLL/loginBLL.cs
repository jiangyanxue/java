﻿using DAL;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL
{
     public class loginBLL
     {
        
        
         public static bool getLogin(string name, string password,string ident)
         {

             return loginDAL.getLogin(name,password,ident);
             
         }
    }
}
