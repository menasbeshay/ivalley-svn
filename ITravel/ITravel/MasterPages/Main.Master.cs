using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ITravel.MasterPages
{
    public partial class Main : System.Web.UI.MasterPage
    {
        public string PageTitle { get { return uiLabelTitle.Text; } set { uiLabelTitle.Text = value; } }
        protected void Page_Load(object sender, EventArgs e)
        {            
        }

        protected void uiLinkButtonEnglish_Click(object sender, EventArgs e)
        {
            Session["CurrentCulture"] = "en-US";
            Response.Redirect(Request.RawUrl);
        }

        protected void uiLinkButtonArabic_Click(object sender, EventArgs e)
        {
            Session["CurrentCulture"] = "ar-EG";
            Response.Redirect(Request.RawUrl);
        }

       
    }
}