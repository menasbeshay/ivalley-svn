using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Combo.Models
{
    public class PostHashTag
    {
        public int HashTagID { get; set; }                
        public int Offset { get; set; }
        public string TagName { get; set; }
    }
}