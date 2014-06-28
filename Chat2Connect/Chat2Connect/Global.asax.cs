using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using BLL;
using Microsoft.AspNet.SignalR;
using Chat2Connect.SRCustomHubs;
namespace Chat2Connect
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            if (Membership.GetUser(Helper.Admin.Defaults.UserName) == null)
            {
                MembershipBLL memberShip = new MembershipBLL();
                MembershipCreateStatus objStatus;
                memberShip.RegisterMember(Helper.Admin.Defaults.UserName, Helper.Admin.Defaults.Password, Helper.Admin.Defaults.Email, Helper.Admin.Defaults.Question, Helper.Admin.Defaults.Answer, out objStatus);
            }
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {
            IHubContext _Rcontext = GlobalHost.ConnectionManager.GetHubContext<ChatRoomHub>();
            IHubContext _Ncontext = GlobalHost.ConnectionManager.GetHubContext<NotificationHub>();

            if (Membership.GetUser() != null)
            {
                // uupdate status to offline 
                Member user = new Member();
                user.GetMemberByUserId(new Guid(Membership.GetUser().ProviderUserKey.ToString()));
                user.IsOnLine = false;
                user.Status = 4;
                user.Save();

                // remove user from rooms 
                //RoomMember rooms = new RoomMember();
                //rooms.GetAllRoomsByMemberID(user.MemberID);
                //if (rooms.RowCount > 0)
                //{
                //    for (int i = 0; i < rooms.RowCount; i++)
                //    {
                //        _Rcontext.Clients.Group(rooms.RoomID.ToString()).removeMember(user.MemberID);
                //        rooms.MarkAsDeleted();
                //        rooms.MoveNext();
                //    }
                //    rooms.Save();
                //}

                // notify friends with new status 
                MemberFriend friends = new MemberFriend();
                friends.GetAllMemberFriends(user.MemberID);
                for (int i = 0; i < friends.RowCount; i++)
                {
                    Member temp = new Member();
                    temp.LoadByPrimaryKey(friends.FriendID);
                    MembershipUser u = Membership.GetUser(temp.UserID);
                    _Ncontext.Clients.Group(u.UserName).friendStatusChanged(user.MemberID, user.StatusMsg, "offline");
                }
            }
        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}