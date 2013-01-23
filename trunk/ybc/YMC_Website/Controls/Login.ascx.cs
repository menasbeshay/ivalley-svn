using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YMC.BLL;

namespace YMC_Website.Controls
{
    public partial class Login : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewLoginPanel();
            }
        }

        private void ViewLoginPanel()
        {
            if (Session["CurrentUser"] != null)
            {
                uiPanelLoggedIn.Visible = true;
                uiPanelNotLogin.Visible = false;
            }
            else
            {
                uiPanelLoggedIn.Visible = false;
                uiPanelNotLogin.Visible = true;
            }
        }

        protected void uiButtonLogin_Click(object sender, EventArgs e)
        {
            SiteUsers user = new SiteUsers();
            uiLabelError.Visible = false;
            uiLabelError.Visible = false;
            user.GetUserByUserNameAndPassword(uiTextBoxUserName.Text, uiTextBoxPassword.Text);
            if (user.RowCount == 0)
            {
                uiLabelError.Visible = true;
            }
            else
            {
                if (user.IsColumnNull("IsApproved") || !user.IsApproved)
                {
                    uiLabelError.Visible = false;
                    uiLabelNotApproved.Visible = true;
                }
                else
                {
                    Session["CurrentUser"] = user;
                    ViewLoginPanel();
                    
                }
            }
        }

        protected void uiButtonLogout_Click(object sender, EventArgs e)
        {
            Session["CurrentUser"] = null;
            ViewLoginPanel();
        }
    }
}