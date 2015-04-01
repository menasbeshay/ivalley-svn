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
        COMMENT_ON_MESSAGE = 10,
        LIKE_PROFILE = 11,
        UNLIKE_PROFILE = 12,
        TAG_USER_IN_POST = 13,
        ACCEPT_FOLLOW_REQUEST = 14 ,
        UPDATE_USER_RANK = 15,
        FOLLOWER_BIRTHDAY = 16
    }


    public enum ReceivingNotificationType
    {
        NO_NOTIFICATIONS = 0,
        GET_NOTIFICATIONS_FROM_FOLLOWINGS = 1,
        GET_NOTIFICATIONS_FROM_ALL= 2
    }
}