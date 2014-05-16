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
        [Helper.BoundProperty(HeaderText = "النيكنيم", DisplayOrder = 1)]
        public string FriendName { get; set; }

        public static AddFriend FromString(string stringValue)
        {
            return Helper.JsonConverter.Deserialize<AddFriend>(stringValue);
        }

    }
}
