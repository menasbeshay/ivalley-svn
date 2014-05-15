using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL.Log
{
    public class AddFriend:Log  
    {
        public AddFriend()
        {
            Type = Helper.Enums.LogType.AddFriend;
        }

        public int FriendID { get; set; }
        public string FriendName { get; set; }

    }
}
