using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GlobalLogistics.WebSite
{
    public partial class RedirectToPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.IsAuthenticated)
            {
                if (User.IsInRole("Admin"))
                {
                    Response.Redirect("~/Administrator/Default.aspx");
                }
                else if (User.IsInRole("Company"))
                {
                    Response.Redirect("~/Company/Default.aspx");
                }
            }
            else
            {
                Response.Redirect("~/login.aspx");
            }
        }
    }
}