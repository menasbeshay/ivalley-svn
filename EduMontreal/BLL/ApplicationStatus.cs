
// Generated by MyGeneration Version # (1.3.0.3)

using System;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;
using EDU.DAL;
namespace EDU.BLL
{
	public class ApplicationStatus : _ApplicationStatus
	{
		public ApplicationStatus()
		{
		
		}

        public virtual bool GetNextApplicationStatusApplicationDataID(int AppDataID)
        {
            ListDictionary parameters = new ListDictionary();
            parameters.Add(new SqlParameter("@AppDataID", SqlDbType.Int, 0), AppDataID);
            return LoadFromSql("GetNextApplicationStatusApplicationDataID", parameters);
        }
	}
}
