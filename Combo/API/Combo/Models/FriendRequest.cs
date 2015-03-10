using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Combo.Models
{
    public class ComboFriendRequest
    {
        public int ComboUserID { get; set; }
        public int ComboFriendID { get; set; }
        public string ComboUserName { get; set; }
        public string ComboFriendName { get; set; }
        public string ComboFriendDisplayName { get; set; }
    }
}