using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Info
{
    [Serializable]
    public class MemberTypeLogin : BotSettings
    {
        public List<string> AcceptedMemberTypes
        {
            get;
            set;
        }

        public MemberTypeLogin()
            : base()
        {
            AcceptedMemberTypes = new List<string>();
        }

        public object MemberTypes
        {
            get
            {
                return Helper.EnumUtil.GetValues<Helper.Enums.MemberType>().Select(r => new
                {
                    ID = (int)r,
                    Name = Helper.StringEnum.GetStringValue(r)
                }).ToList();
            }
        }

    }
}
