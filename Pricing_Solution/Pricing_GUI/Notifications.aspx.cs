using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pricing_GUI
{
    public partial class Notifications : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGeneralNotifications();
                BindPrivateNotifications();
            }
        }

        private void BindPrivateNotifications()
        {
            Pricing.BLL.Notifications privateNotifications = new Pricing.BLL.Notifications();
            privateNotifications.GetTopPrivateNotifications(CodeGlobal.LogedInCompany.CompanyID);
            //uiGridViewPrivateNotifications.DataSource = privateNotifications.DefaultView;
            //uiGridViewPrivateNotifications.DataBind();

            rptrPrivateNotifications.DataSource = privateNotifications.DefaultView;
            rptrPrivateNotifications.DataBind();
        }

        private void BindGeneralNotifications()
        {
            Pricing.BLL.Notifications generalNotifications = new Pricing.BLL.Notifications();
            generalNotifications.GetTopGeneralNotifications();
            rptrGeneralNotification.DataSource = generalNotifications.DefaultView;
            rptrGeneralNotification.DataBind();
        }
    }
}