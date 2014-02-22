using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Security;
using BLL;
using Microsoft.AspNet.SignalR;

namespace Chat2Connect.SRCustomHubs
{
    public class NotificationHub : Hub
    {
        public void Hello()
        {
            Clients.All.hello();
        }

        public void StatusChanged(int memberID)
        {
            Member member = new Member();
            member.LoadByPrimaryKey(memberID);
            string status = "";
            switch (member.Status)
	        {
                case 1:
                    status = "online";
                    break;
                case 2:
                    status = "busy";
                    break;
                case 3:
                    status = "away";
                    break;
                case 4:
                    status = "offline";
                    break;

		        default:
                    status = "offline";
                break;
	        }
            MemberFriend friends = new MemberFriend();
            friends.GetAllMemberFriends(member.MemberID);
            for (int i = 0; i < friends.RowCount; i++)
            {
                Member temp = new Member ();
                temp.LoadByPrimaryKey(friends.FriendID);
                MembershipUser u = Membership.GetUser(temp.UserID);
                Clients.Group(u.UserName).friendStatusChanged(member.MemberID, member.StatusMsg, status);
            }
            //Clients.All.friendStatusChanged(member.MemberID, member.StatusMsg, status);
        }

       

        public override Task OnConnected()
        {
            Groups.Add(Context.ConnectionId, Context.User.Identity.Name);
            return base.OnConnected();
        }

        public override Task OnDisconnected()
        {
            Groups.Remove(Context.ConnectionId, Context.User.Identity.Name);
            return base.OnDisconnected();
        }
    }
}