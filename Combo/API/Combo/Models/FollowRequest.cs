using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Combo.Models
{
    public class FollowRequest
    {
        public int ComboUserID { get; set; }
        public int ComboFriendID { get; set; }
        public string ComboUserName { get; set; }
        public string ComboDisplayName { get; set; }
        public string ProfilePic { get; set; }
        public string FriendProfilePic { get; set; }
        public bool IsFollowUser { get; set; }
    }
}