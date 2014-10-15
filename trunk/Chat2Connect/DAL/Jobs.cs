using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Collections.Specialized;

using MyGeneration.dOOdads;

namespace DAL
{
    public class Jobs : SqlClientEntity
    {
        public int DeleteExpiredTypes()
        {
            return LoadFromSqlNoExec("proc_TypesValidate");
        }
    }
}
