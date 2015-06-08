using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flight_BLL;
using System.Web.Security;

namespace Flights_GUI.MasterPages
{
    public partial class ExceptionLight : System.Web.UI.MasterPage
    {
        public string PageTitle { get { return uiLabelTitle.Text; } set { uiLabelTitle.Text = value; } }
        public string ModuleTitle { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(Membership.GetUser(Page.User.Identity.Name).ProviderUserKey.ToString()))
            {
                UsersNofications usNotif = new UsersNofications();
                usNotif.getNotifications(new Guid(Membership.GetUser(Page.User.Identity.Name).ProviderUserKey.ToString()));
                usNotif.GetColumn("NotifCount");
                for (int i = 0; i < usNotif.RowCount; i++)
                {
                    switch (usNotif.GetColumn("NotificationTypeID").ToString())
                    {
                        case "1":
                            HFCirculars.Value = usNotif.GetColumn("NotifCount").ToString();
                            break;

                        case "2":
                            HFBulletins.Value = usNotif.GetColumn("NotifCount").ToString();
                            break;

                        case "3":
                            HFManuals.Value = usNotif.GetColumn("NotifCount").ToString();
                            break;

                        case "4":
                            HFForms.Value = usNotif.GetColumn("NotifCount").ToString();
                            break;

                        case "5":
                            HFAircraftManuals.Value = usNotif.GetColumn("NotifCount").ToString();
                            break;
                        default:
                            break;
                    }
                    usNotif.MoveNext();
                }
                HFCirculars.Value = usNotif.GetColumn("NotifCount").ToString();
            }
        }
    }
}