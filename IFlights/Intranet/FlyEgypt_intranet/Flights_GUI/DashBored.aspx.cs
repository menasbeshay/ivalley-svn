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
           
            Master.PageTitle = "Dashboard";
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
                            FRECirculars.Value = us.GetColumn("NotifCount").ToString();
                            break;

                        case "2":
                            Litbull_Unreaded.Text = us.GetColumn("NotifCount").ToString();
                            FREBull.Value = us.GetColumn("NotifCount").ToString();
                            break;


                        case "3":
                            LitManuals_Unreaded.Text = us.GetColumn("NotifCount").ToString();
                            FREManuals.Value = us.GetColumn("NotifCount").ToString();
                            break;

                        case "4":
                            LitForms_Unreaded.Text = us.GetColumn("NotifCount").ToString();
                            FREForms.Value = us.GetColumn("NotifCount").ToString();
                            break;

                        case "5":
                            LitAir_Unreaded.Text = us.GetColumn("NotifCount").ToString();
                            FREAir.Value = us.GetColumn("NotifCount").ToString();
                            break;
                        default:
                            break;
                    }
                    us.MoveNext();
                }
            }

            us.getReadedNotifications(new Guid(Membership.GetUser(Page.User.Identity.Name).ProviderUserKey.ToString()));
            if (us.RowCount > 0)
            {
                us.GetColumn("NotifCount");
                for (int i = 0; i < us.RowCount; i++)
                {
                    switch (us.GetColumn("NotificationTypeID").ToString())
                    {
                        case "1":
                            LitCirculars_Readed.Text = us.GetColumn("NotifCount").ToString();
                            FUNCirculars.Value = us.GetColumn("NotifCount").ToString();
                            break;

                        case "2":
                            Litbull_Readed.Text = us.GetColumn("NotifCount").ToString();
                            FUNBull.Value = us.GetColumn("NotifCount").ToString();
                            break;

                        case "3":
                            LitManulas_Readed.Text = us.GetColumn("NotifCount").ToString();
                            FUNManuals.Value = us.GetColumn("NotifCount").ToString();
                            break;

                        case "4":
                            LitForms_Readed.Text = us.GetColumn("NotifCount").ToString();
                            FUNForms.Value = us.GetColumn("NotifCount").ToString();
                            break;

                        case "5":
                            LitAir_Readed.Text = us.GetColumn("NotifCount").ToString();
                            FunAir.Value = us.GetColumn("NotifCount").ToString();
                            break;
                        default:
                            break;
                    }
                    us.MoveNext();
                }
            }


            LoadAnnouncements();
            
        }

        private void LoadAnnouncements()
        {
            Announcement all = new Announcement();
            all.GetTopAnnouncements();

            uiRepeaterCirculars.DataSource = all.DefaultView;
            uiRepeaterCirculars.DataBind();

            Announcement Bulletins = new Announcement();
            Bulletins.GetTopBulletins();

            uiRepeaterBulletins.DataSource = Bulletins.DefaultView;
            uiRepeaterBulletins.DataBind();
        }
    }
}