using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using E3zmni.BLL;

namespace E3zemni_WebGUI.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void uiLinkButtonMainLogin_Click(object sender, EventArgs e)
        {
            UserInfo user = new UserInfo();
            user.GetUserByUserNameAndPassword(uiTextBoxUserName.Text, uiTextBoxPassword.Text);
            if (user.RowCount > 0 )
            {
                if (user.UserName == "Admin")
                {
                    Session["CurrentAdmin"] = user;                   
                    Response.Redirect("admincp.aspx");
                }
                else
                {
                    uiLabelError.Visible = true;
                }
            }
            else
            {
                uiLabelError.Visible = true;
            }
        }
    }
}