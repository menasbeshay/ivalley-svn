using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication.Admin
{
    public partial class AdminCP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CurrentUser"] == null)
            {
                Response.Redirect("login.aspx");
            }
        }
    }
}