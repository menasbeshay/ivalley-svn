
// Generated by MyGeneration Version # (1.3.0.3)

using System;
using Flight_DAL;
namespace Flight_BLL
{
	public class Announcement : _Announcement
	{
		public Announcement()
		{
		
		}

        public virtual bool GetAllAnnouncements()
        {
            this.Query.AddOrderBy(ColumnNames.CreatedDate, MyGeneration.dOOdads.WhereParameter.Dir.DESC);
            return this.Query.Load();
        }
	}
}
