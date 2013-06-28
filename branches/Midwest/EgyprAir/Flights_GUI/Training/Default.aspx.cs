using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Flights_GUI.Training
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.CustomPageTitle = "Dashboard";
            if (Roles.IsUserInRole("Pilot"))
            {
                Response.Redirect("PilotHome.aspx");
            }
        }
    }
}