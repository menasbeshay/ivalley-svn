using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flight_BLL;
using System.Web.Security;

namespace Flights_GUI.Intranet
{
    public partial class schedules : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.PageTitle = "Schedules";
                BindData();
                MarkNotificationsAsRead();
            }
        }

        protected void uiRadGridmanuals_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            uiRadGridmanuals.CurrentPageIndex = e.NewPageIndex;
            BindData();
        }
        private void BindData()
        {
            Schedule objdata = new Schedule();
            objdata.GetSchedulesByUserID(new Guid(Membership.GetUser().ProviderUserKey.ToString()));
            uiRadGridmanuals.DataSource = objdata.DefaultView;
            uiRadGridmanuals.DataBind();
        }

        protected void MarkNotificationsAsRead()
        {
            UsersNofications userNotif = new UsersNofications();
            //userNotif.MarkNotificationsReadByNotificationType((new Guid(Membership.GetUser(Page.User.Identity.Name).ProviderUserKey.ToString())), 8);
            userNotif.MarkSchedulesNotificationsRead((new Guid(Membership.GetUser(Page.User.Identity.Name).ProviderUserKey.ToString())), 8);
        }
    }
}