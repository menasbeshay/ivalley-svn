using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL.Log
{
    public class AddRoomBot : Log
    {
        public AddRoomBot()
        {
            Type = Helper.Enums.LogType.AddRoomBot;
        }
        public int RoomID { get; set; }
        [Helper.BoundProperty(HeaderText = "إسم الغرفة", DisplayOrder = 1)]
        public string RoomName { get; set; }

        public int BotID { get; set; }
        [Helper.BoundProperty(HeaderText = "البوت", DisplayOrder = 1)]
        public string Bot
        {
            get
            {
                return Helper.StringEnum.GetStringValue(Helper.EnumUtil.ParseEnum<Helper.Enums.Bot>(BotID));
            }
        }

        [Helper.BoundProperty(HeaderText = "نقاط البوت", DisplayOrder = 2)]
        public decimal BotPoints { get; set; }
    }
}
