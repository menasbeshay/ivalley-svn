using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;
using System.Globalization;

namespace Website.MasterPages
{
    public partial class ArSite : System.Web.UI.MasterPage
    {
        public string Currentlang
        {
            get
            {
                if (Session["CurrentLang"] != null && !string.IsNullOrEmpty(Session["CurrentLang"].ToString()))
                {
                    return Session["CurrentLang"].ToString();
                }
                else
                {
                    return "AR";
                }
            }
            set { Session["CurrentLang"] = value; }
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            Currentlang = "AR";
            Thread.CurrentThread.CurrentCulture = new CultureInfo("ar-EG");
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void uiLinkButtonEnglish_Click(object sender, EventArgs e)
        {
            Currentlang = "EN";
            Thread.CurrentThread.CurrentCulture = new CultureInfo("en-US");
            Response.Redirect(Request.RawUrl.Replace("/ar", ""));
        }
    }
}