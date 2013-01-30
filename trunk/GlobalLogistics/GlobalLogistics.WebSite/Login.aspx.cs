using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GlobalLogistics.WebSite
{
    public partial class Login : System.Web.UI.Page
    {
        protected void InitializeCulture()
        {
            if (Session["Currentlang"] != null)
            {
                if (Session["Currentlang"].ToString() == "AR")
                {
                    System.Threading.Thread.CurrentThread.CurrentUICulture = new System.Globalization.CultureInfo("ar-EG");
                    System.Threading.Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo("ar-EG");
                    base.InitializeCulture();
                }
                else
                {
                    System.Threading.Thread.CurrentThread.CurrentUICulture = new System.Globalization.CultureInfo("en-US");
                    System.Threading.Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo("en-US");
                    base.InitializeCulture();
                }
            }
            else
            {
                System.Threading.Thread.CurrentThread.CurrentUICulture = new System.Globalization.CultureInfo("en-US");
                System.Threading.Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo("en-US");
                base.InitializeCulture();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}