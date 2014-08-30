using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Info
{
    public class RoomBot
    {
        public int ID
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
    }
}
