using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TouchMediaGUI.Models
{
    public class DesignDetail
    {
        public int  DesignDetailsID { get; set; }
        public int JobOrderID { get; set; }
        public int DesignerID { get; set; }
        public string DesignerName { get; set; }
        public int JobOrderStatusID { get; set; }
        public string StatusName { get; set; }
        public string StatusNameAr { get; set; }
        public string StatusClass { get; set; } 
        public DateTime  StartDate { get; set; }
        public DateTime EndDate { get; set; } 
        public Guid  CreatedBy { get; set; }
        public string CreatedByName { get; set; }
        public DateTime CreatedDate { get; set; }
        public Guid UpdatedBy { get; set; }
        public string UpdatedByName { get; set; }
        public DateTime LastUpdatedDate { get; set; }
    }
}