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
    public partial class Inner : System.Web.UI.MasterPage
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
                    return "EN";
                }
            }
            set { Session["CurrentLang"] = value; }
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            Currentlang = "EN";
            Thread.CurrentThread.CurrentCulture = new CultureInfo("en-US");
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void uiLinkButtonArabic_Click(object sender, EventArgs e)
        {
            Currentlang = "AR";
            Thread.CurrentThread.CurrentCulture = new CultureInfo("ar-EG");            
            Response.Redirect("~/ar/" + Request.RawUrl);
        }
    }
}