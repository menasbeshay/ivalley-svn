using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Combo.Models
{
    public class UserRankUpdated
    {
        public int ComboUserID { get; set; }
        public string UserName { get; set; }
        public string ProfilePic { get; set; }
        public string DisplayName { get; set; }
        public int OldUserRankID { get; set; }
        public string OldRankName { get; set; }
        public string NewRankName { get; set; }
        public int NewUserRankID { get; set; }
    }
}