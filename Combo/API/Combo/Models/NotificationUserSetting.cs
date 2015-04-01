using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Combo.Models
{
    public class NotificationUserSetting
    {
        public int ComboUserID { get; set; }
        public int NotificationTypeID { get; set; }
        public short Status { get; set; }
    }
}