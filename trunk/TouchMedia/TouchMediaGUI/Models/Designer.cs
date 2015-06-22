using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TouchMediaGUI.Models
{
    public class Designer
    {
        public int DesignerID { get; set; }
        public int CategoryID { get; set; }
        public string DesignerName { get; set; }
        public string Address { get; set; }
        public string Telephone { get; set; }
        public string Email { get; set; }
    }
}