using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Helper
{
    public class ChatRoom
    {
        public int ID { get; set; }

        public string Type { get; set; }

        public bool IsTemp { get; set; }

        public string Message { get; set; }

        public string MessageHistory { get; set; }

        public string Name { get; set; }

        public string AdminName { get; set; }

        public int MemberID { get; set; }

        public bool IsAdmin { get; set; }

        public int CamCount { get; set; }

        public int MaxMic { get; set; }

        public int MemberCount { get; set; }

        public bool IsFav { get; set; }

        public int UserRate { get; set; }

        public List<ChatMember> RoomMembers { get; set; }

        public List<ChatMember> QueueMembers { get; set; }

        public bool IsMicOpened { get; set; }

        public ChatMember MicMember { get; set; }

        public bool IsCamOpened { get; set; }
    }

    public class ChatMessage
    {
    }

    public class ChatMember
    {
        public object MemberID { get; set; }

        public object MemberName { get; set; }

        public object MemberTypeID { get; set; }
    }
}
