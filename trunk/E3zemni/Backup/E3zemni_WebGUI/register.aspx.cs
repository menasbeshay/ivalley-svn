using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using E3zmni.BLL;

namespace E3zemni_WebGUI
{
    public partial class register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void uiLinkButtonRegister_Click(object sender, EventArgs e)
        {
            UserInfo user = new UserInfo();
            user.AddNew();
            user.FullName = uiTextBoxFN.Text;
            user.UserName = uiTextBoxUN.Text;
            user.UserPassword = uiTextBoxPassword.Text;
            user.Email = uiTextBoxEmail.Text;
            user.UserAddress = uiTextBoxAddress.Text;
            user.ShippingAddress = uiTextBoxSAddress.Text;
            
            user.LandLine = uiTextBoxLandLine.Text;
            user.MobilePhone = uiTextBoxMobile.Text;
            user.Save();

            Session["CurrentUser"] = user;
            Response.Redirect("default.aspx");

        }
    }
}