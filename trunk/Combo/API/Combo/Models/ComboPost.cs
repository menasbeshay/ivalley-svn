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
        public double PostDate { get; set; }
        public object Likes { get; set; }
        public object Comments { get; set; }
        public object Attachments { get; set; }
        public int CommentsCount { get; set; }
        public int ShareCount { get; set; }
        public bool IsDownloadable { get; set; }
        public object HashTags { get; set; }
        public object UserTags { get; set; }
        public bool IsFavourite { get; set; }
        public int Source { get; set; }
        public bool IsLike { get; set; }
        public int UserRankID { get; set; }
    }
}