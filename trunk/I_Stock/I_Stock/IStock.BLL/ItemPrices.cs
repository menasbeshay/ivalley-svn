
// Generated by MyGeneration Version # (1.3.0.3)

using System;
using IStock.DAL;
using System.Collections.Specialized;
using System.Data.SqlClient;
using System.Data;
namespace IStock.BLL
{
	public class ItemPrices : _ItemPrices
	{
		public ItemPrices()
		{
		
		}

        public virtual bool GetPricesByItemID(int ItemID)
        {
            ListDictionary parameters = new ListDictionary();

            parameters.Add(new SqlParameter("@ItemID", SqlDbType.Int, 0), ItemID);

            return LoadFromSql("GetPricesByItemID", parameters);

        }
	}
}