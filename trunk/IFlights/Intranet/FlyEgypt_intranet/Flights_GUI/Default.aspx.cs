using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Flights_GUI
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.IsAuthenticated)
            {
                /*if (Roles.IsUserInRole(Page.User.Identity.Name, "Training Admin") || Roles.IsUserInRole(Page.User.Identity.Name, "Pilot"))
                {
                    Response.Redirect("~/Training/Default.aspx");
                }
                else if (Roles.IsUserInRole(Page.User.Identity.Name, "Operation") || Roles.IsUserInRole(Page.User.Identity.Name, "Dispatch") || Roles.IsUserInRole(Page.User.Identity.Name, "Flight Data Entry") || Roles.IsUserInRole(Page.User.Identity.Name, "Hosting") || Roles.IsUserInRole(Page.User.Identity.Name, "Pilot"))
                {
                    Response.Redirect("~/Operation/Default.aspx");
                }
                else if (Roles.IsUserInRole(Page.User.Identity.Name, "CabinCrew") || Roles.IsUserInRole(Page.User.Identity.Name, "CabinCrew Admin"))
                {
                    Response.Redirect("~/CabinCrew/Default.aspx");
                }
                

                else if (Roles.IsUserInRole(Page.User.Identity.Name, "SuperAdmin"))
                {
                    uipanelDefault.Visible = false;
                    uiPanelAdmin.Visible = true;
                }*/
                Response.Redirect("~/dashboard.aspx");
            }
            else
            {
                Response.Redirect("~/login.aspx");
                //uipanelDefault.Visible = true;
                //uiPanelAdmin.Visible = false;
            }
        }
    }
}
