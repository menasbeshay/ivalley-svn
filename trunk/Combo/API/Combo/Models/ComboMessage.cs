using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Combo.Models
{
    public class ComboMessage
    {
        public int ComboMsgID { get; set; }
        public string MsgText { get; set; }
        public int ComboUserID { get; set; }
        public string ComboUserName { get; set; }
        public string ComboUserDisplayName { get; set; }
        public string ProfilePic { get; set; }
        public double MsgDate { get; set; }        
        public object Comments { get; set; }
        public object Attachments { get; set; }
        public int CommentsCount { get; set; }
        public bool IsRead { get; set; }
        public string ToIds { get; set; }
    }
}