using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EGEMech.BLL;

namespace website
{
    public partial class UserLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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
    }
}