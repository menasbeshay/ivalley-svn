using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Info
{
    [Serializable]
    public class WelcomeBot:RoomBot
    {
        public int WelcomeBotID
        {
            get;
            set;
        }

        public string LoginMessage
        {
            get;
            set;
        }

        public string LogoutMessage
        {
            get;
            set;
        }

        public WelcomeBot(int roomID):base(roomID,(int)Helper.Enums.Bot.Welcome)
        {
            BotID = (int)Helper.Enums.Bot.Welcome;
            LoginMessage = "";
            LogoutMessage = "";
        }

        public WelcomeBot()
        {
            LoginMessage = "";
            LogoutMessage = "";
        }
    }
}
