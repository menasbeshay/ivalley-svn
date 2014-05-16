using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL.Log
{
    public class EnterRoom : Log
    {
        public EnterRoom()
        {
            Type = Helper.Enums.LogType.EnterRoom;
        }

        public int RoomID { get; set; }

        [Helper.BoundProperty(HeaderText = "إسم الغرفة", DisplayOrder = 1)]

        public string RoomName { get; set; }

        public static EnterRoom FromString(string stringValue)
        {
            return Helper.JsonConverter.Deserialize<EnterRoom>(stringValue);
        }
    }
}
