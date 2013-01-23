using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YMC.BLL;

namespace YMC_Website
{
    public partial class RequestService : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CurrentUser"] != null)
            {
                SiteUsers user = new SiteUsers();
                user = (SiteUsers)Session["CurrentUser"];
                uiLiteralContent.Text = Server.HtmlDecode(user.UserPage);

            }
        }
    }
}