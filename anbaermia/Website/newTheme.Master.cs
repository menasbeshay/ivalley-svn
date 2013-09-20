using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Website
{
    public partial class newTheme : System.Web.UI.MasterPage
    {
        public string PageTitle { set { uiLabelageTitle.Text = value; } get { return uiLabelageTitle.Text; } }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}