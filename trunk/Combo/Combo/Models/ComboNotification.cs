using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Combo.Models
{
    public class ComboNotification
    {
        public int ComboNotificationID { get; set; }       
        public int ComboUserID { get; set; }
        public int NotificationType { get; set; }    
        public double NotificationDate { get; set; }
        public string NotificationBody { get; set; }
        public bool IsRead { get; set; }
    }

    public enum NotificationType 
    {
        LIKE = 1,
        COMMENT_ON_POST =2,
        ADD_FRIEND =3,
        RECEIVE_MSG= 4,
        SHARE_POST = 5,
        ACCEPT_FRIEND = 6,
        FOLLOW_FIREND = 7,
        UNFOLLOW_FRIEND = 8,
        UNFRIEND = 9,
        COMMENT_ON_MESSAGE = 10
    }
}