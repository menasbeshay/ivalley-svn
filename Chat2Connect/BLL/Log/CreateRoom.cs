using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL.Log
{
    public class CreateRoom : Log
    {
        public CreateRoom()
        {
            Type = Helper.Enums.LogType.CreateRoom;
        }
        public int RoomID { get; set; }
        [Helper.BoundProperty(HeaderText = "إسم الغرفة", DisplayOrder = 1)]
        public string RoomName { get; set; }

        [Helper.BoundProperty(HeaderText = "نوع الترقية", DisplayOrder = 2)]
        public string RoomTypeName { get; set; }

        [Helper.BoundProperty(HeaderText = "النقاط", DisplayOrder = 3)]
        public int Points { get; set; }
    }
}
