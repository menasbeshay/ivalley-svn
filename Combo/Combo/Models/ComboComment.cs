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
        public string CommentText { get; set; }
        public int ComboUserID { get; set; }
        public DateTime CommentDate { get; set; }
        public object Likes { get; set; }
        public object Attachments { get; set; }
    }
}