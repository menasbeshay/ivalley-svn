using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Info
{
    public class WelcomeBot : BotSettings
    {
        public string LoginMsgPart1
        {
            get;
            set;
        }
        public string LoginMsgPart2
        {
            get;
            set;
        }
        public string LogoutMsgPart1
        {
            get;
            set;
        }
        public string LogoutMsgPart2
        {
            get;
            set;
        }
        public WelcomeBot()
            : base((int)Helper.Enums.Bot.Welcome)
        {
            LoginMsgPart1 = "";
            LoginMsgPart2 = "";
            LogoutMsgPart1 = "";
            LogoutMsgPart2 = "";
        }
    }
}
