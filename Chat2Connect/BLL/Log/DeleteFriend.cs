using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BLL.Log
{
    public class DeleteFriend:Log  
    {
        public DeleteFriend()
        {
            Type = Helper.Enums.LogType.DeleteFriend;
        }

        public int FriendID { get; set; }
        [Helper.BoundProperty(HeaderText = "النيكنيم", DisplayOrder = 1)]
        public string FriendName { get; set; }

        public static DeleteFriend FromString(string stringValue)
        {
            return Helper.JsonConverter.Deserialize<DeleteFriend>(stringValue);
        }

    }
}
