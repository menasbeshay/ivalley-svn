
// Generated by MyGeneration Version # (1.3.0.3)

using System;
using IStock.DAL;
using System.Collections.Specialized;
using System.Data.SqlClient;
using System.Data;
namespace IStock.BLL
{
	public class ItemGroups : _ItemGroups
	{
		public ItemGroups()
		{
		
		}

        public virtual bool GetItemGroupsByCategoryID(int CategoryID)
        {
            ListDictionary parameters = new ListDictionary();

            parameters.Add(new SqlParameter("@CategoryID", SqlDbType.Int, 0), CategoryID);

            return LoadFromSql("GetItemGroupsByCategoryID", parameters);

        }
	}
}