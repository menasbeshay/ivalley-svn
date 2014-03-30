using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Taqwa.Website
{
    public partial class Zahraa : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void uiLinkButtonArabic_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl.Replace("/en", ""));
        }
    }
}