using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Info
{
    [Serializable]
    public class RoomBot
    {
        public int RoomBotID
        {
            get;
            set;
        }
        public int RoomID
        {
            get;
            set;
        }
        public int BotID
        {
            get;
            set;
        }

        public bool IsActive
        {
            get;
            set;
        }

        public string ShortcutKey
        {
            get;
            set;
        }

        public RoomBot(int roomID, int botID)
        {
            RoomID = roomID;
            BotID = BotID;
            ShortcutKey = "";
        }

        public RoomBot()
        {
            ShortcutKey = "";
        }

        public Info.Bot Bot
        {
            get;
            set;
        }
    }
}
