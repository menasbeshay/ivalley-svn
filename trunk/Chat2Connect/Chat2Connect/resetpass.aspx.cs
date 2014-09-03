using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace Chat2Connect
{
    public partial class resetpass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SiteSettings settings = new SiteSettings();
                settings.LoadByPrimaryKey(1); //fb
                uiHyperLinkFB.NavigateUrl = settings.URL;

                settings.LoadByPrimaryKey(2); //twitter
                uiHyperLinkTwitter.NavigateUrl = settings.URL;

                settings.LoadByPrimaryKey(3); //youtube
                uiHyperLinkYoutube.NavigateUrl = settings.URL;

                settings.LoadByPrimaryKey(4); //google
                uiHyperLinkGp.NavigateUrl = settings.URL;
            }
        }

        protected void uiButtonChangePass_Click(object sender, EventArgs e)
        {
            Member user = new Member();
            if (Request.QueryString["rc"] != null)
            {
                string querystring = Helper.General.DecryptString(Request.QueryString["rc"].ToString());
                string[] allkeys = querystring.Split('&');

                if (!(allkeys.Length < 2))
                {
                    int id = Convert.ToInt32(allkeys[0].Substring(4));
                    string mail = allkeys[1].Substring(6);

                    user.LoadByPrimaryKey(id);
                    if (user.Email == mail)
                    {
                        MembershipUser _user = Membership.GetUser(user.UserName);
                        if (_user.ChangePassword(_user.GetPassword(user.Answer), Password.Text))
                            ErrorMessage.Text = "تم تغيير كلمة السر بنجاح.";
                        else
                            ErrorMessage.Text = "حدث خطأ . من فضلك حاول مرة أخرى.";
                        ClearFields();
                    }
                    else
                        ErrorMessage.Text = "حدث خطأ . من فضلك حاول مرة أخرى.";
                }
                else
                    ErrorMessage.Text = "حدث خطأ . من فضلك حاول مرة أخرى.";

                ErrorMessage.Visible = true;
            }
            else
                Response.Redirect("default.aspx");
        }

        private void ClearFields()
        {
            Password.Text = "";
            ConfirmPassword.Text = "";
        }
    }
}