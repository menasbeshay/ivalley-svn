﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Combo.Models
{
    public class ComboSharePost
    {
        public int ComboPostID { get; set; }        
        public int ComboUserID { get; set; }
        public string ComboUserName { get; set; }
        public int ComboFriendID { get; set; }
        public string ComboFriendName { get; set; }
        public string ComboFriendDisplayName { get; set; }
        public string PostText { get; set; }
        public object Attachments { get; set; }
        public bool IsFollowing { get; set; }
    }
}