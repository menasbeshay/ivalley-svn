using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Combo.Models
{
    public class CommentUserTag
    {
        public int ComboPostID { get; set; }
        public int ComboCommentID { get; set; }
        public int ComboUserID { get; set; }
        public string UserName { get; set; }
        public int Offset { get; set; }
        public int CreatorUserID { get; set; }
        public string CreatorUserName { get; set; }
        public string CreatorProfilePic { get; set; }
        public string CommentText { get; set; }
        public object Attachments { get; set; }
    }
}