using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Info
{
    [Serializable]
    public class FollowAdmin : BotSettings
    {
        public List<string> FollowMemberLevels
        {
            get;
            set;
        }

        public FollowAdmin()
            : base()
        {
            FollowMemberLevels = new List<string>();
        }

        public object MemberLevels
        {
            get
            {
                return Helper.EnumUtil.GetValues<Helper.Enums.RoomMemberLevel>().Where(r => (int)r > 1).Select(r => new
                {
                    ID = (int)r,
                    Name = Helper.StringEnum.GetStringValue(r)
                }).ToList();
            }
        }

        public string FollowSchedule
        {
            get;
            set;
        }

        public object Schedule
        {
            get
            {
                return Helper.EnumUtil.GetValues<Helper.Enums.FollowAdminBotSchedule>().Select(r => new
                {
                    ID = (int)r,
                    Name = Helper.StringEnum.GetStringValue(r)
                }).ToList();
            }
        }

    }
}
