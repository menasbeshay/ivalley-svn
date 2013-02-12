
// Generated by MyGeneration Version # (1.3.0.3)

using System;
using Flight_DAL;// We should use the namespace of Data access layer generated form business entity
using System.Collections.Specialized;
using System.Data.SqlClient;
using System.Data;

namespace Flight_BLL
{
	public class Sector : _Sector
	{
		public Sector()
		{
		
		}

        public virtual bool GetSectorsByFlightID(int FlightID)
        {
            ListDictionary parameters = new ListDictionary();

            parameters.Add(new SqlParameter("@ReportID", SqlDbType.Int, 0), FlightID);

            return LoadFromSql("GetSectorsByReportID", parameters);

        }
	}
}
