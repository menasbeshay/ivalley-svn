using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Security;
using BLL;
using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;

namespace Chat2Connect.SRCustomHubs
{
    public class NotificationHub : Hub
    {
        public void Hello()
        {
            Clients.All.hello();
        }

        public void sendMailNotifications()
        {
            NotificationHub hup = new NotificationHub();
            hup.SendMailNotifications(null);
        }
        [HubMethodName("sendMailNotifications")]
        public void SendMailNotifications(int? memberID)
        {
            IHubContext context = GlobalHost.ConnectionManager.GetHubContext<NotificationHub>();
            if (!memberID.HasValue)
            {
                memberID = 0;
                BLL.Member member=new Member();
                if (member.GetMemberByUserId(new Guid(Membership.GetUser().ProviderUserKey.ToString())))
                {
                    memberID = member.MemberID;
                }
            }
            SendMailNotication(memberID.Value, context);

            if (Helper.Admin.IsAdmin() && Helper.Admin.HasRole(Helper.Enums.AdminRoles.Admin_SiteMails.ToString()))
            {
                foreach (var m in BLL.Member.SiteMembers)
                {
                    SendMailNotication(m.MemberID, context);
                }
            }
        }

        private static void SendMailNotication(int memberID, IHubContext context)
        {
            BLL.MemberMessage messages = new MemberMessage();
            int unReadCount = 0;
            messages.LoadReceivedMessages(memberID);
            if (messages.RowCount > 0)
            {
                do
                {
                    if (messages.IsColumnNull(MemberMessage.ColumnNames.IsRead) || messages.IsRead == false)
                        unReadCount++;
                } while (messages.MoveNext());
            }
            //return context.Clients.Group("gherbas").RecieveNotification(totalNewMessages);
            context.Clients.All.RecieveMailNotification(memberID, unReadCount);
        }

        public override Task OnConnected()
        {
            Groups.Add(Context.ConnectionId, Context.User.Identity.Name);
            return base.OnConnected();
        }

        public override Task OnDisconnected(bool stopCalled)
        {
            Groups.Remove(Context.ConnectionId, Context.User.Identity.Name);
            return base.OnDisconnected(stopCalled);
        }
    }
}