using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
namespace Chat2Connect
{
    public partial class _lock : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // logs the user out when press "sekon"
                FormsAuthentication.SignOut();
            }
        }

        protected void uiLinkButtonLogin_Click(object sender, EventArgs e)
        {
            // relogin user 
            if (Request.QueryString["u"] != null)
            {
                if (Membership.ValidateUser(Request.QueryString["u"], uiTextBoxPassword.Text))
                {
                    FormsAuthentication.SetAuthCookie(Request.QueryString["u"], false);
                    Response.Redirect("home.aspx");
                }
                else
                {
                    Response.Redirect("default.aspx");
                }
            }
            else
            {
                Response.Redirect("default.aspx");
            }

        }
    }
}