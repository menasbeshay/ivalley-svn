using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Info
{
    public class BotSettings
    {
        public int BotID
        {
            get;
            set;
        }

        public BotSettings(int botID)
        {
            BotID = BotID;
        }

        public BotSettings()
        {
        }
    }
}
