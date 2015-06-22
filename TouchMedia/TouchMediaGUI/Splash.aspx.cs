using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace TouchMediaGUI
{
    public partial class Splash : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.User.Identity.IsAuthenticated)
            {
                if (!Roles.IsUserInRole("مدير النظام"))
                {
                    if (Roles.IsUserInRole("اوامر التشغيل"))
                    {
                        Response.Redirect("JobOrders.aspx");
                    }
                    else if (Roles.IsUserInRole("اوامر الشراء"))
                    {
                        Response.Redirect("PurchaseOrder.aspx");
                    }
                    else if (Roles.IsUserInRole("اوامر تشغيل السيارات"))
                    {
                        Response.Redirect("DeliveryOrder.aspx");
                    }
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}