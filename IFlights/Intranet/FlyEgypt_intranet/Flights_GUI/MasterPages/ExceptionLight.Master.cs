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
            
        }
        protected void uiRepeaterInteranetMenu_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                #region
                Label lblNot = e.Item.FindControl("lblNotification") as Label;
                HiddenField hfRep = e.Item.FindControl("hfRepeater") as HiddenField;
                UsersNofications userNotif = new UsersNofications();
                switch (hfRep.Value.ToString())
                {
                    case "Circulars":
                        userNotif.getNotificationsByNotificationType(new Guid(Membership.GetUser(Page.User.Identity.Name).ProviderUserKey.ToString()), 1);
                        userNotif.GetColumn("NotifCount");
                        lblNot.Text = userNotif.GetColumn("NotifCount").ToString();
                        break;
                    case "Bulletins":
                        userNotif.getNotificationsByNotificationType(new Guid(Membership.GetUser(Page.User.Identity.Name).ProviderUserKey.ToString()), 2);
                        userNotif.GetColumn("NotifCount");
                        lblNot.Text = userNotif.GetColumn("NotifCount").ToString();
                        break;

                    case "Manuals":
                        userNotif.getManualsNotificationCounter(new Guid(Membership.GetUser(Page.User.Identity.Name).ProviderUserKey.ToString()));
                        userNotif.GetColumn("NotifCount");
                        lblNot.Text = userNotif.GetColumn("NotifCount").ToString();
                        break;

                    case "AircraftManuals":
                        userNotif.getNotificationsByNotificationType(new Guid(Membership.GetUser(Page.User.Identity.Name).ProviderUserKey.ToString()), 5);
                        userNotif.GetColumn("NotifCount");
                        lblNot.Text = userNotif.GetColumn("NotifCount").ToString();
                        break;
                    case "Blogs":
                        userNotif.getNotificationsByNotificationType(new Guid(Membership.GetUser(Page.User.Identity.Name).ProviderUserKey.ToString()), 6);
                        userNotif.GetColumn("NotifCount");
                        lblNot.Text = userNotif.GetColumn("NotifCount").ToString();
                        break;
                    default:
                        lblNot.Visible = false;
                        break;
                }
                if (lblNot.Text != "0")
                {
                    lblNot.Visible = true;
                }

                #endregion
            }
        }

        protected void uiInnerRepeaterIntranetMenu_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lblNot = e.Item.FindControl("lblInnerNotification") as Label;
                HiddenField hfRep = e.Item.FindControl("hfInnerRepeater") as HiddenField;
                if (!string.IsNullOrWhiteSpace(hfRep.Value))
                {
                    UsersNofications usNot = new UsersNofications();
                    usNot.getNotificationByCatID(new Guid(Membership.GetUser(Page.User.Identity.Name).ProviderUserKey.ToString()), int.Parse(hfRep.Value.ToString()));
                    usNot.GetColumn("NotifCount");
                    lblNot.Text = usNot.GetColumn("NotifCount").ToString();
                    if (lblNot.Text != "0")
                    {
                        lblNot.Visible = true;
                    }
                }
            }
        }
    }
}