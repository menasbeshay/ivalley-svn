using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace Helper
{
    public class Sessions
    {
        public const string OpenedChatRooms = "OpenedChatRooms";

        public static List<RoomSession> OpenedRooms
        {
            get
            {
                if (HttpContext.Current.Session[OpenedChatRooms] == null)
                    HttpContext.Current.Session[OpenedChatRooms] = new List<RoomSession>();

                return HttpContext.Current.Session[OpenedChatRooms] as List<RoomSession>;
            }
            set
            {
                HttpContext.Current.Session[OpenedChatRooms] = value;
            }
        }

        public class RoomSession
        {
            public int ID { get; set; }
            public bool IsTemp { get; set; }
        }
    }

    
}
