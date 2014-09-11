using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Chat2Connect.Admin
{
    public partial class SiteSettings : System.Web.UI.Page
    {
        public static List<string> PageRoles
        {
            get
            {
                List<string> lstRoles = new List<string>();
                lstRoles.Add(Helper.Enums.AdminRoles.Admin_GeneralSettings.ToString());                
                return lstRoles;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BLL.SiteSettings settings = new BLL.SiteSettings();
                settings.LoadByPrimaryKey(1); //facebook
                uiTextBoxFbURL.Text = settings.URL;

                settings.LoadByPrimaryKey(2); //twitter
                uiTextBoxTwitterURL.Text = settings.URL;

                settings.LoadByPrimaryKey(3); //youtube
                uiTextBoxYtURL.Text = settings.URL;

                settings.LoadByPrimaryKey(4); //google
                uiTextBoxGURL.Text = settings.URL;


                settings.LoadByPrimaryKey(5); //terms
                ClientScript.RegisterStartupScript(this.GetType(), "addterms", "$(document).ready(function (){ setTimeout( function () { Termseditor.setValue('"+ Server.HtmlDecode(settings.Content) +"'); }, 1500); });", true);

                settings.LoadByPrimaryKey(6); //privacy
                ClientScript.RegisterStartupScript(this.GetType(), "addPrivacy", "$(document).ready(function (){ setTimeout( function () { Privacyeditor.setValue('" + Server.HtmlDecode(settings.Content) + "'); }, 1500); });", true);

                settings.LoadByPrimaryKey(7); //faq
                ClientScript.RegisterStartupScript(this.GetType(), "addFaq", "$(document).ready(function (){ setTimeout( function () { Faqeditor.setValue('" + Server.HtmlDecode(settings.Content) + "'); }, 1500); });", true);

            }
        }
    }
}