using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Combo.Models
{
    public class ComboPost
    {
        public int ComboPostID { get; set; }
        public string PostText { get; set; }
        public int ComboUserID { get; set; }
        public string ComboUserName { get; set; }
        public string ProfilePic { get; set; }
        public DateTime PostDate { get; set; }
        public object Likes { get; set; }
        public object Comments { get; set; }
        public object Attachments { get; set; }
        public int CommentsCount { get; set; }
    }
}