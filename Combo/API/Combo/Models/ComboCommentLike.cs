using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Combo.Models
{
    public class ComboCommentLike
    {
        public int ComboCommentID { get; set; }
        public int ComboUserID { get; set; }
        public string UserName { get; set; }
    }
}