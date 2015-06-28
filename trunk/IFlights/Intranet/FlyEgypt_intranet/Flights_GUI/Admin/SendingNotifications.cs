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
        public static void sendNotif(int NotificationType, int? CategoryID, int? ManualID, int? FormID, int? ManualVersionID, int? FormVersionID, int? ScheduleID, int? ScheduleVersionID)
        {
            System.Threading.Thread sendNotif = new System.Threading.Thread(() => SendNotifications(NotificationType, CategoryID, ManualID, FormID, ManualVersionID, FormVersionID, ScheduleID, ScheduleVersionID));
            sendNotif.Start();
        }

        public static void SendNotifications(int NotificationType, int? CategoryID, int? ManualID, int? FormID, int? ManualVersionID, int? FormVersionID, int? ScheduleID, int? ScheduleVersionID)
        {
            MembershipUserCollection users = Membership.GetAllUsers();
            foreach (MembershipUser user in users)
            {
                UsersNofications userNotif = new UsersNofications();
                userNotif.AddNew();
                if (CategoryID != null)
                    userNotif.CategoryID = CategoryID.Value;
                else
                    userNotif.SetColumnNull("CategoryID");

                if (ManualID != null)
                    userNotif.ManualID = ManualID.Value;
                else
                    userNotif.SetColumnNull("ManualID");

                if (FormID != null)
                    userNotif.FormID = FormID.Value;
                else
                    userNotif.SetColumnNull("FormID");

                if (ManualVersionID != null)
                    userNotif.ManualVersionID = ManualVersionID.Value;
                else
                    userNotif.SetColumnNull("ManualVersionID");

                if (FormVersionID != null)
                    userNotif.FromVersionID = FormVersionID.Value;
                else
                    userNotif.SetColumnNull("FromVersionID");

                if (ScheduleID != null)
                    userNotif.ScheduleID = ScheduleID.Value;
                else
                    userNotif.SetColumnNull("ScheduleID");

                if (ScheduleVersionID != null)
                    userNotif.ScheduleVersionID = ScheduleVersionID.Value;
                else
                    userNotif.SetColumnNull("ScheduleVersionID");


                userNotif.UserID = new Guid(user.ProviderUserKey.ToString());
                userNotif.NotificationType = NotificationType;
                userNotif.IsRead = false;
                userNotif.Save();
            }
        }
    }
}