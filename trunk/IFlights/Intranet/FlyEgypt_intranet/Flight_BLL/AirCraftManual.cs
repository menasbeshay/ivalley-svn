
// Generated by MyGeneration Version # (1.3.0.3)

using System;
using Flight_DAL;

namespace Flight_BLL
{
	public class AirCraftManual : _AirCraftManual
	{
		public AirCraftManual()
		{
		
		}

        public virtual bool GetManualsByCatID(int CatID)
        {
            return LoadFromRawSql(@"select * from AircraftManual where ManualCategoryID = {0} order by CreatedDate desc", CatID);
        }

	}
}
