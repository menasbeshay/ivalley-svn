using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Combo.Models
{
    public class ComboUser 
    {        
        public int ComboUserID { get; set; }
        public string UserName { get; set; }
        public string DisplayName { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public string Bio { get; set; }
        public int ProfileImgID { get; set; }
        public int CoverImgID { get; set; }
        public int GenderID { get; set; }
        public bool IsActivated { get; set; }
        public int ExternalIDType { get; set; }
        public string ExternalID { get; set; }
        public string DeviceID { get; set; }
        public Guid ActivationCode { get; set; }
        public Guid PassResetCode { get; set; }
        public string ProfilePic { get; set; }
        public int FollowingCount { get; set; }
        public int FollowersCount { get; set; }
        public int PostsCount { get; set; }
        public int PostsLikeCount { get; set; }
        public int FriendsCount { get; set; }
        public bool IsFollower { get; set; }
        public bool IsFollowing { get; set; }
        public bool IsFriend { get; set; }
        public bool IsFriendRequestSent { get; set; }
        public string SecurityQuestion { get; set; }
        public string SecurityAnswer { get; set; }
        public int UserRankID { get; set; }

    }
}