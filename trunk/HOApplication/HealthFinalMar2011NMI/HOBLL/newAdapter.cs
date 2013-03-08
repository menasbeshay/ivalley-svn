using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Common;
using System.Data;


namespace MHO.BLL
{
   public class newAdapter : DbDataAdapter
    {
       public int FillFromReader(DataTable dt, IDataReader reder)
       {
           return this.Fill(dt, reder);
       }

    }
}
