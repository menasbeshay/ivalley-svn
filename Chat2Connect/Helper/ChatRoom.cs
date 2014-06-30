using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Helper
{
    public class ChatRoom
    {
        public ChatRoom()
        {
            this.Settings = new RoomSettings();
            this.BanningTypes = Helper.EnumUtil.GetValues<Helper.Enums.BanningType>().Select(r => new
            {
                ID = (int)r,
                Name = Helper.StringEnum.GetStringValue(r)
            }).ToList();
            
            this.Members = new List<ChatMember>();
        }
        public int ID { get; set; }

        public string Type { get; set; }

        public bool IsTemp { get; set; }

        public string RoomTopic { get; set; }

        public string Message { get; set; }

        public string Name { get; set; }

        public int OpenCams { get; set; }

        public RoomSettings Settings
        {
            get;
            set;
        }

        public object Gifts { get; set; }

        public object BanningTypes
        {
            get;
            set;
        }

        public string fbURL { get; set; }

        public string tURL { get; set; }

        public string utURL { get; set; }

        public List<ChatMember> Members { get; set; }

        public List<ChatMember> Admins { get; set; }

        public int CurrentMemberID { get; set; }

        public int CreatedBy { get; set; }

        public string AdminMessage { get; set; }


        public List<ChatMessage> MessageHistory { get; set; }


        public object MemberLevels { get; set; }

        public string WelcomeMsg { get; set; }
        public string CategoryName { get; set; }
        public string SubCategoryName { get; set; }

        public DateTime CreatedDate { get; set; }
    }

    public class ChatMember
    {
        public int MemberID { get; set; }
        public object MemberName { get; set; }
        public object MemberTypeID { get; set; }
        public string ProfileImg { get; set; }
        public bool IsFavorite { get; set; }
        public int UserRate { get; set; }
        public bool CanAccessCam { get; set; }
        public bool CanAccessMic { get; set; }
        public bool CanWrite { get; set; }
        public bool IsMarked { get; set; }
        public bool HasGift { get; set; }
        public bool NotifyOnCloseCam { get; set; }
        public bool NotifyOnFriendsLogOff { get; set; }
        public bool NotifyOnFriendsLogOn { get; set; }
        public bool NotifyOnMicOff { get; set; }
        public bool NotifyOnMicOn { get; set; }
        public bool NotifyOnOpenCam { get; set; }
        public object IsMemberBanned { get; set; }
        public int? BanType { get; set; }

        public int MemberLevelID { get; set; }

        public object QueueOrder { get; set; }

        public bool IsMicOpened { get; set; }

        public bool IsCamOpened { get; set; }

        public bool IsCamViewed { get; set; }

        public bool InRoom { get; set; }

        public bool ShowMessageTime { get; set; }

        public bool IsFriend { get; set; }
    }

    public class RoomSettings
    {
        public bool EnableCam { get; set; }

        public bool EnableMic { get; set; }

        public int MaxMic { get; set; }

        public int CamCount { get; set; }

        public bool MarkOnLoginWithWrite { get; set; }
        public bool MarkOnLoginWithoutWrite { get; set; }

        public bool EnableMicForAdminsOnly { get; set; }
    }

    public class ChatMessage
    {
        public object ID { get; set; }

        public object ToID { get; set; }

        public object FromID { get; set; }

        public object FromName { get; set; }

        public object Message { get; set; }

        public object MessageDate { get; set; }

        public object MemberLevel { get; set; }
    }

}
