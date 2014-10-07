
// Generated by MyGeneration Version # (1.3.0.3)

using System;
using ITravel.DAL;
using System.Collections.Specialized;
using System.Data.SqlClient;
using System.Data;
namespace ITravel.BLL
{
	public class Passenger : _Passenger
	{
		public Passenger()
		{
		
		}

        public virtual bool SearchCustomers(string FilterText)
        {
            ListDictionary parameters = new ListDictionary();

            parameters.Add(new SqlParameter("@FilterText", SqlDbType.NVarChar, 200), FilterText);

            return LoadFromSql("SearchCustomers", parameters);

        }
	}
}
