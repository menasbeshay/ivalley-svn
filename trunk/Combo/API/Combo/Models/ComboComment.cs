using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Combo.Models
{
    public class ComboComment
    {
        public int ComboCommentID { get; set; }
        public int ComboPostID { get; set; }
        public int ComboMsgID { get; set; }
        public string CommentText { get; set; }
        public int ComboUserID { get; set; }
        public string ComboUserName { get; set; }
        public string ComboDisplayName { get; set; }
        public string ProfilePic { get; set; }
        public double CommentDate { get; set; }
        public object Likes { get; set; }
        public object Attachments { get; set; }
        public bool IsRead { get; set; }
    }
}