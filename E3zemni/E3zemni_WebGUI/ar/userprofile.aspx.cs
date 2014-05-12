using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using E3zmni.BLL;

namespace E3zemni_WebGUI.ar
{
    public partial class userprofile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CurrentUser"] != null)
            {

                LoadUserInfo();

            }
            else
            {
                Response.Redirect("default.aspx");
            }
        }

        private void LoadUserInfo()
        {
            UserInfo user = (UserInfo)Session["CurrentUser"];
            uiTextBoxFN.Text = user.FullName;
            uiTextBoxUN.Text = user.UserName;
            uiTextBoxPassword.Text = user.UserPassword;
            uiTextBoxEmail.Text = user.Email;
            uiTextBoxAddress.Text = user.UserAddress;
            uiTextBoxSAddress.Text = user.ShippingAddress;

            uiTextBoxLandLine.Text = user.LandLine;
            uiTextBoxMobile.Text = user.MobilePhone;
        }

        protected void uiLinkButtonRegister_Click(object sender, EventArgs e)
        {
            UserInfo user = (UserInfo)Session["CurrentUser"];
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

        }
    }
}