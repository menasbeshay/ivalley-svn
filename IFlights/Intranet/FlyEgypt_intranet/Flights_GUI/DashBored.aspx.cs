using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flight_BLL;
using System.Web.Security;


namespace Flights_GUI
{
    public partial class DashBored : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UsersNofications us = new UsersNofications();
            us.getNotifications(new Guid(Membership.GetUser(Page.User.Identity.Name).ProviderUserKey.ToString()));
            if (us.RowCount > 0)
            {
                us.GetColumn("NotifCount");
                for (int i = 0; i < us.RowCount; i++)
                {
                    switch (us.GetColumn("NotificationTypeID").ToString())
                    {
                        case "1":
                            LitCirculars_Unreaded.Text = us.GetColumn("NotifCount").ToString();
                            break;

                        case "2":
                            Litbull_Unreaded.Text = us.GetColumn("NotifCount").ToString();
                            break;

                        case "3":
                            LitManuals_Unreaded.Text = us.GetColumn("NotifCount").ToString();
                            break;

                        case "4":
                            LitForms_Unreaded.Text = us.GetColumn("NotifCount").ToString();
                            break;

                        case "5":
                            LitAir_Unreaded.Text = us.GetColumn("NotifCount").ToString();
                            break;
                        default:
                            break;
                    }
                    us.MoveNext();
                }
            }

            us.getUnreadedNotifications(new Guid(Membership.GetUser(Page.User.Identity.Name).ProviderUserKey.ToString()));
            if (us.RowCount > 0)
            {
                us.GetColumn("NotifCount");
                for (int i = 0; i < us.RowCount; i++)
                {
                    switch (us.GetColumn("NotificationTypeID").ToString())
                    {
                        case "1":
                            LitCirculars_Readed.Text = us.GetColumn("NotifCount").ToString();
                            break;

                        case "2":
                            Litbull_Readed.Text = us.GetColumn("NotifCount").ToString();
                            break;

                        case "3":
                            LitManulas_Readed.Text = us.GetColumn("NotifCount").ToString();
                            break;

                        case "4":
                            LitForms_Readed.Text = us.GetColumn("NotifCount").ToString();
                            break;

                        case "5":
                            LitAir_Readed.Text = us.GetColumn("NotifCount").ToString();
                            break;
                        default:
                            break;
                    }
                    us.MoveNext();
                }
            }
        }
    }
}