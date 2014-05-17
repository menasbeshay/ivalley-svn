
// Generated by MyGeneration Version # (1.3.0.3)

using System;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;
using DAL;
namespace BLL
{
	public class Room : _Room
	{
		public Room()
		{
		
		}

        public virtual bool GetRoomsByCreatorID(int CreatedBy)
        {
            ListDictionary parameters = new ListDictionary();

            parameters.Add(new SqlParameter("@CreatedBy", SqlDbType.Int, 0), CreatedBy);

            return LoadFromSql("GetChatRoomsByCreatorID", parameters);

        }

        public virtual bool GetPremiumRooms()
        {
            return this.LoadFromRawSql(@"Select * FROM Room
                                        INNER JOIN RoomType ON RoomType.RoomID=Room.RoomID
                                        INNER JOIN RoomTypeSpecDuration ON RoomType.RoomTypeSpecDurationID=RoomTypeSpecDuration.ID
                                        INNER JOIN RoomTypeSpec ON RoomTypeSpec.ID=RoomTypeSpecDuration.RoomTypeSpecID
                                        WHERE RoomTypeSpec.ID=0
                                        ORDER BY CategoryID ASC,SubCategoryID ASC,Room.Name ASC", Helper.Defaults.VIPRoomTypeSpecID);
        }

        public virtual bool GetRoomsByCategoryID(int CategoryID)
        {
            ListDictionary parameters = new ListDictionary();

            parameters.Add(new SqlParameter("@CategoryID", SqlDbType.Int, 0), CategoryID);

            return LoadFromSql("GetChatRoomsByCategoryID", parameters);

        }

        public virtual bool GetRoomsBySubCategoryID(int SubCategoryID)
        {
            ListDictionary parameters = new ListDictionary();

            parameters.Add(new SqlParameter("@SubCategoryID", SqlDbType.Int, 0), SubCategoryID);

            return LoadFromSql("GetChatRoomsBySubCategoryID", parameters);

        }

        public virtual bool GetFavRoomsByCreatorID(int CreatedBy)
        {
            ListDictionary parameters = new ListDictionary();

            parameters.Add(new SqlParameter("@CreatedBy", SqlDbType.Int, 0), CreatedBy);

            return LoadFromSql("GetFavRoomsByCreatorID", parameters);

        }

        public virtual bool GetRoomRateByRoomID(int RoomID)
        {
            ListDictionary parameters = new ListDictionary();

            parameters.Add(new SqlParameter("@RoomID", SqlDbType.Int, 0), RoomID);

            return LoadFromSql("GetRoomRateByRoomID", parameters);
        }

        #region override properties reading
        public override bool EnableCam
        {
            get
            {
                if (this.IsColumnNull(Room.ColumnNames.EnableCam))
                    return false;
                return base.EnableCam;
            }
            set
            {
                base.EnableCam = value;
            }
        }
        public override bool EnableMic
        {
            get
            {
                if (this.IsColumnNull(Room.ColumnNames.EnableMic))
                    return false;
                return base.EnableMic;
            }
            set
            {
                base.EnableMic = value;
            }
        }

        #endregion
        private Member _createdByMember;
        public Member CreatedByMember
        {
            get
            {
                if (_createdByMember == null)
                {
                    _createdByMember = new Member();
                    _createdByMember.LoadByPrimaryKey(this.CreatedBy);
                }
                return _createdByMember;
            }
        }

        private RoomType _RoomType;
        public RoomType RoomType
        {
            get
            {
                if (_RoomType == null)
                {
                    _RoomType = new RoomType();
                    _RoomType.LoadByRoomID(this.RoomID);
                }
                if (_RoomType.RoomID != this.RoomID)
                {
                    _RoomType.LoadByRoomID(this.RoomID);
                }
                return _RoomType;
            }
        }

    }
}
