using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Collections.Specialized;

using MyGeneration.dOOdads;

namespace DAL
{
    public class StatsReport : SqlClientEntity
    {
        public virtual IDataReader Load(DateTime startDate, DateTime endDate)
        {
            ListDictionary parameters = new ListDictionary();

            parameters.Add(new SqlParameter("@StartDate", SqlDbType.DateTime, 0), startDate);
            parameters.Add(new SqlParameter("@EndDate", SqlDbType.DateTime, 0), endDate);

            return LoadFromSqlReader("proc_StatsReport", parameters);
        }
    }
}
