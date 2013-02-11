using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Obtravel
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterStartupScript("menu", "<script type='text/javascript'>$(\"#m1\").addClass(\"selected\");</script>");
        }
    }
}