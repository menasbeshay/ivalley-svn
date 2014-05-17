
// Generated by MyGeneration Version # (1.3.0.3)

using System;
using DAL;
namespace BLL
{
	public class RoomType : _RoomType
	{
		public RoomType()
		{
		
		}

        public bool LoadByRoomID(int roomID)
        {
            Query.FlushWhereParameters();
            Where.RoomID.Value = roomID;
            if (!Query.Load())
            {
                AddNew();
                this.RoomID = roomID;
                this.StartDate = DateTime.Now;
                this.RoomTypeSpecDurationID = Helper.Defaults.RoomTypeSpecDurationID;
            }
            else
            {
                if (!String.IsNullOrEmpty(this.s_EndDate))
                {
                    if (this.EndDate < DateTime.Now)
                    {
                        this.RoomTypeSpecDurationID = Helper.Defaults.RoomTypeSpecDurationID;
                        this.SetColumnNull(RoomType.ColumnNames.EndDate);
                    }
                }
            }
            return true;
        }

        private RoomTypeSpecDuration roomTypeSpecDuration;
        public RoomTypeSpecDuration RoomTypeSpecDuration
        {
            get
            {
                if (roomTypeSpecDuration == null)
                {
                    roomTypeSpecDuration = new RoomTypeSpecDuration();
                    roomTypeSpecDuration.LoadByPrimaryKey(this.RoomTypeSpecDurationID);
                }
                if (roomTypeSpecDuration.ID != this.RoomTypeSpecDurationID)
                {
                    roomTypeSpecDuration.LoadByPrimaryKey(this.RoomTypeSpecDurationID);
                }

                return roomTypeSpecDuration;
            }
        }
    }
}
