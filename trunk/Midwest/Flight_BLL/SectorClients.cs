
// Generated by MyGeneration Version # (1.3.0.3)

using System;
using Flight_DAL;
using System.Collections.Specialized;
using System.Data.SqlClient;
using System.Data;

namespace Flight_BLL
{
	public class SectorClients : _SectorClients
	{
		public SectorClients()
		{
		
		}

        public virtual bool SearchSectorClients(string filterText)
        {
            ListDictionary parameters = new ListDictionary();

            parameters.Add(new SqlParameter("@filterText", SqlDbType.NVarChar, 200), filterText);
            return LoadFromSql("SearchSectorClients", parameters);

        }
	}
}