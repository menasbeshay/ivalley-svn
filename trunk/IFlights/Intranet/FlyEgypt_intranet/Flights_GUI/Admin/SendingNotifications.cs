using Flight_BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

namespace Flights_GUI.Admin
{
    public class SendingNotifications
    {

        public static void sendNotif(int NotificationType)
        {
            System.Threading.Thread sendNotif = new System.Threading.Thread(() => SendNotifications(NotificationType));
            sendNotif.Start();
        }

        public static void SendNotifications(int NotificationType)
        {
            MembershipUserCollection users = Membership.GetAllUsers();
            foreach (MembershipUser user in users)
            {
                UsersNofications userNotif = new UsersNofications();
                userNotif.AddNew();
                userNotif.UserID = new Guid(user.ProviderUserKey.ToString());
                userNotif.NotificationType = NotificationType;
                userNotif.IsRead = false;
                userNotif.Save();
            }
        }

    }
}