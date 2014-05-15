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
        public string RoomName { get; set; }        
    }
}
