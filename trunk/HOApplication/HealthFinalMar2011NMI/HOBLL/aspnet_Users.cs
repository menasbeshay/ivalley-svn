using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MHO.DAL;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Specialized;

namespace MHO.BLL
{
   public class aspnet_Users : _aspnet_Users
    {
       public aspnet_Users()
       {
       }
       public Guid GetUserByName(string name)
       {
           this.Where.UserName.Value = name;
           if (this.Query.Load())
           {
               return this.UserId;
           }
           else
           {
               return Guid.Empty;
           }

       }
       public DataTable GetUserData(Guid userId)
       {
           SqlDataReader searchResult = null;
           ListDictionary parm = new ListDictionary();
           parm.Add("@userId", userId);
          
           searchResult = LoadFromSqlReader("GetUserData", parm) as SqlDataReader;
           DataTable ResultTable = new DataTable();
           newAdapter da = new newAdapter();
           if (searchResult != null && searchResult.HasRows)
           {
               da.FillFromReader(ResultTable, searchResult);
           }

           return ResultTable;
       }
    }
}
