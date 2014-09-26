using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Info
{
    public class RoomLaw : BotSettings
    {
        public string LawScheduleString
        {
            get;
            set;
        }

        public Helper.Enums.RoomBotSchedule LawSchedule
        {
            get
            {
                if (!string.IsNullOrEmpty(LawScheduleString))
                {
                    return Helper.EnumUtil.ParseEnum<Helper.Enums.RoomBotSchedule>(Convert.ToInt32(LawScheduleString));
                }
                return Helper.Enums.RoomBotSchedule.OneHoure;
            }
        }
        
        public object Schedule
        {
            get
            {
                return Helper.EnumUtil.GetValues<Helper.Enums.RoomBotSchedule>().Select(r => new
                {
                    ID = (int)r,
                    Name = Helper.StringEnum.GetStringValue(r)
                }).ToList();
            }
        }

        public List<LawItem> Laws
        {
            get;
            set;
        }

        public RoomLaw():base()
        {
            Laws = new List<LawItem>();
            LawScheduleString = Convert.ToString((int)Helper.Enums.RoomBotSchedule.OneHoure);
        }

        public class LawItem
        {
            public string Law
            {
                get;
                set;
            }

            public bool IsActive
            {
                get;
                set;
            }
        }

        public LawItem LawItemObject
        {
            get
            {
                return new LawItem();
            }
        }
    }
}
