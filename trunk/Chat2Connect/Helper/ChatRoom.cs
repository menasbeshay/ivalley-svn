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
            this.CurrentMemberSettings = new MemberSettings();
            this.BanningTypes = Helper.EnumUtil.GetValues<Helper.Enums.BanningType>().Select(r => new
            {
                ID = (int)r,
                Name = Helper.StringEnum.GetStringValue(r)
            }).ToList();
            //this.AllMembersSettings = new List<object>();
        }
        public int ID { get; set; }

        public string Type { get; set; }

        public bool IsTemp { get; set; }

        public string RoomTopic { get; set; }

        public string Message { get; set; }

        public string MessageHistory { get; set; }

        public string Name { get; set; }

        public string AdminName { get; set; }

        public int MemberCount { get; set; }
        
        public int OpenCams { get; set; }

        public List<ChatMember> RoomMembers { get; set; }

        public List<ChatMember> QueueMembers { get; set; }

        public ChatMember MicMember { get; set; }

        public RoomSettings Settings
        {
            get;
            set;
        }

        public MemberSettings CurrentMemberSettings { get; set; }

        public object AllMembersSettings { get; set; }

        public object Gifts { get; set; }

        public object BanningTypes
        {
            get;
            set;
        }

        public string fbURL { get; set; }

        public string tURL { get; set; }

        public string utURL { get; set; }
    }

    public class ChatMember
    {
        public object MemberID { get; set; }

        public object MemberName { get; set; }

        public object MemberTypeID { get; set; }

        public bool IsCamOpened { get; set; }
        public bool IsMicOpened { get; set; }

        public bool IsAdmin { get; set; }

        public string ProfileImg { get; set; }
    }

    public class RoomSettings
    {
        public bool EnableCam { get; set; }

        public bool EnableMic { get; set; }

        public int MaxMic { get; set; }

        public int CamCount { get; set; }
    }

    public class MemberSettings
    {
        public bool IsFav { get; set; }
        public int UserRate { get; set; }
        public int MemberID { get; set; }
        public bool IsAdmin { get; set; }
        public bool IsMicOpened { get; set; }
        public bool IsCamOpened { get; set; }
        public bool CanAccessCam { get; set; }

        public bool CanAccessMic { get; set; }

        public bool CanWrite { get; set; }

        public bool IsBanned { get; set; }
        public bool IsMarked { get; set; }

        public bool NotifyOnCloseCam { get; set; }

        public bool NotifyOnFriendsLogOff { get; set; }
        public bool NotifyOnFriendsLogOn { get; set; }

        public bool NotifyOnMicOff { get; set; }

        public bool NotifyOnMicOn { get; set; }

        public bool NotifyOnOpenCam { get; set; }
    }

}
