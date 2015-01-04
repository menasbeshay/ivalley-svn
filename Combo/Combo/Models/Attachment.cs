using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Combo.Models
{
    public class Attachment
    {
        public int AttachmentID { get; set; }
        public string Path { get; set; }
        public int AttachmentTypeID { get; set; }
    }
}