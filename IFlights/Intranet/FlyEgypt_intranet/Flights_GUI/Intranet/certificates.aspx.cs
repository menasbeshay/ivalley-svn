using Flight_BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flights_GUI.Intranet
{
    public partial class certificates : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.PageTitle = "Certificates";
                BindData();
                MarkNotificationsAsRead();
            }
        }

        private void BindData()
        {
            Certificate all = new Certificate();
            all.GetAllCertificates();
            uiRadListViewCircularsPublic.DataSource = all.DefaultView;
            uiRadListViewCircularsPublic.DataBind();
        }
        protected void uiRadListViewCircularsPublic_PageIndexChanged(object sender, Telerik.Web.UI.RadListViewPageChangedEventArgs e)
        {
            uiRadListViewCircularsPublic.CurrentPageIndex = e.NewPageIndex;
            BindData();
        }

        private void MarkNotificationsAsRead()
        {
            UsersNofications userNotif = new UsersNofications();
            userNotif.MarkNotificationsReadByNotificationType((new Guid(Membership.GetUser(Page.User.Identity.Name).ProviderUserKey.ToString())), 7);
        }
    }
}