using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Info
{
    public class RoomProgram : BotSettings
    {
        public string ProgramScheduleString
        {
            get;
            set;
        }
        public Helper.Enums.RoomBotSchedule ProgramSchedule
        {
            get
            {
                if (!String.IsNullOrEmpty(ProgramScheduleString))
                {
                    return Helper.EnumUtil.ParseEnum<Helper.Enums.RoomBotSchedule>(Convert.ToInt32(ProgramScheduleString));
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

        public List<ProgramItem> Programms
        {
            get;
            set;
        }

        public RoomProgram()
            : base()
        {
            Programms = new List<ProgramItem>();
            ProgramScheduleString = Convert.ToString((int)Helper.Enums.RoomBotSchedule.OneHoure);
        }
        public class ProgramItem
        {
            public string Program
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

        public ProgramItem ProgramItemObject
        {
            get
            {
                return new ProgramItem();
            }
        }
    }
}
