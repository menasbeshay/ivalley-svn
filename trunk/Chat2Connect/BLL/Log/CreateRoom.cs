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
        public static CreateRoom FromString(string stringValue)
        {
            return Helper.JsonConverter.Deserialize<CreateRoom>(stringValue);
        }
        public int RoomID { get; set; }
        [Helper.BoundProperty(HeaderText = "إسم الغرفة", DisplayOrder = 1)]
        public string RoomName { get; set; }        
    }
}
