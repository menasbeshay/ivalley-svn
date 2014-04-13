using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using E3zmni.BLL;
namespace E3zemni_WebGUI
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void uiLinkButtonMainLogin_Click(object sender, EventArgs e)
        {
            UserInfo user = new UserInfo();
            user.GetUserByUserNameAndPassword(uiTextBoxUserName.Text, uiTextBoxPassword.Text);
            if (user.RowCount > 0)
            {
                Session["CurrentUser"] = user;
                if (Request.QueryString["url"] != null)
                    Response.Redirect(Request.QueryString["url"].ToString());
                Response.Redirect("default.aspx");
            }
            else
            {
                uiLabelError.Visible = true;
            }
        }
    }
}