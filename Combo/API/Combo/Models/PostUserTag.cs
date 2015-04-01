using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Combo.Models
{
    public class PostUserTag
    {
        public int ComboPostID { get; set; }        
        public string CreatorUserName { get; set; }
        public string CreatorProfilePic { get; set; }
        public int ComboUserID { get; set; }        
        public string UserName { get; set; }
        public string ProfilePic { get; set; }
        public int Offset { get; set; }
        public object Attachments { get; set; }
        public string PostText { get; set; }
    }
}