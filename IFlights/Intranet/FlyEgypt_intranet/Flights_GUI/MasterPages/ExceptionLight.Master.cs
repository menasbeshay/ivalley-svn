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
                    switch (usNotif.GetColumn("NotificationTypeID"))
                    {
                        default:
                    }
                }
                HFCirculars.Value = usNotif.GetColumn("NotifCount").ToString();
            }
        }
    }
}