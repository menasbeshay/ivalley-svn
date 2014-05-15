using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL.Log
{
    public class EnterPrivateChate:Log
    {
        public EnterPrivateChate()
        {
            Type = Helper.Enums.LogType.EnterRoom;
        }

        public int FriendID { get; set; }
        public string FriendName { get; set; }


    }
}
