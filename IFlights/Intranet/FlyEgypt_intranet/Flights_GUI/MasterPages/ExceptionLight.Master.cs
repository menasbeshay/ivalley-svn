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
                if (usNotif.RowCount > 0)
                {
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
                }
            }
        }

        protected void uiRepeaterInteranetMenu_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Label lblNot = e.Item.FindControl("lblNotification") as Label;
                HiddenField hfRep = e.Item.FindControl("hfRepeater") as HiddenField;
                switch (hfRep.Value.ToString())
                {
                    case "Circulars":
                        if (HFCirculars.Value.ToString() != "0" || string.IsNullOrEmpty(HFCirculars.Value.ToString()))
                        {
                            lblNot.Text = HFCirculars.Value;
                        }
                        else
                        {
                            lblNot.Visible = false;
                        }
                        break;
                    case "Bulletins":
                        if (HFBulletins.Value.ToString() != "0" || string.IsNullOrEmpty(HFBulletins.Value.ToString()))
                        {
                            lblNot.Text = HFBulletins.Value;
                        }
                        else
                        {
                            lblNot.Visible = false;
                        }
                        break;
                    case "Manuals":
                        if (HFManuals.Value.ToString() != "0" || string.IsNullOrEmpty(HFManuals.Value.ToString()))
                        {
                            lblNot.Text = HFManuals.Value;
                        }
                        else
                        {
                            lblNot.Visible = false;
                        }
                        break;
                    case "Forms":
                        if (HFForms.Value.ToString() != "0" || string.IsNullOrEmpty(HFForms.Value.ToString()))
                        {
                            lblNot.Text = HFForms.Value;
                        }
                        else
                        {
                            lblNot.Visible = false;
                        }
                        break;
                    case "AircraftManuals":
                        if (HFAircraftManuals.Value.ToString() != "0" || string.IsNullOrEmpty(HFAircraftManuals.Value.ToString()))
                        {
                            lblNot.Text = HFAircraftManuals.Value;
                        }
                        else
                        {
                            lblNot.Visible = false;
                        }
                        break;
                    default:
                        lblNot.Visible = false;
                        break;
                }
            }
        }
    }
}