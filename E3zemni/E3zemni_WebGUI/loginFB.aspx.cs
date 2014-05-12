using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Facebook;
using E3zmni.BLL;
namespace E3zemni_WebGUI
{
    public partial class loginFB : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string code = Request.QueryString["reference"];

            FacebookClient client = new FacebookClient(code);
            dynamic result = client.Get("me", new { fields = "name,id,email" });

            if (!string.IsNullOrEmpty(code))
            {
                UserInfo user = new UserInfo();
                user.GetUserByEmail(result.email);
                if (!(user.RowCount > 0))
                {
                    user.AddNew();
                    user.UserName = result.email;
                    user.Email = result.email;
                    user.Save();
                }

                Session["CurrentUser"] = user;
                Response.Redirect(Request.QueryString["back"]);

                /*
                lblId.Text = faceBookUser.Id;
                lblUserName.Text = faceBookUser.UserName;
                lblName.Text = faceBookUser.Name;
                lblEmail.Text = faceBookUser.Email;
                ProfileImage.ImageUrl = faceBookUser.PictureUrl;
                btnLogin.Enabled = false;*/
            }
        }
    }
}