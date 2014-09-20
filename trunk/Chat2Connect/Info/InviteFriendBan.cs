using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Info
{
    [Serializable]
    public class InviteFriendBan : BotSettings
    {
        public List<int> BannedMemberLevels
        {
            get;
            set;
        }

        public InviteFriendBan()
            : base((int)Helper.Enums.Bot.InviteFriendsBan)
        {
            BannedMemberLevels = new List<int>();
        }

    }
}
