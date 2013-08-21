using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EGEMech.BLL;

namespace website.UC
{
    public partial class UCLogin : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserLoggedIn"] != null)
                {
                    uiPanelLoggedin.Visible = true;
                    uiPanelLogin.Visible = false;
                }
                else
                {
                    uiPanelLoggedin.Visible = false;
                    uiPanelLogin.Visible = true;
                }
            }
        }

        protected void uiButtonLogin_Click(object sender, EventArgs e)
        {
            Users user = new Users();
            user.GetUserByUserNameAndPassword(uiTextBoxUserName.Text, uiTextBoxPassword.Text);
            if (user.RowCount > 0)
            {
                Session["UserLoggedIn"] = user;
                Response.Redirect("MyAccount.aspx");

            }
            else
            {
                uiLabelErrorLogin.Visible = true;
            }
        }

        protected void uiLinkButtonLogout_Click(object sender, EventArgs e)
        {
            Session["UserLoggedIn"] = null;
            Response.Redirect(Request.RawUrl);
        }
    }
}