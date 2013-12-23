using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Chat2Connect.MasterPages
{
    public partial class Home : System.Web.UI.MasterPage
    {

        public string _pageTitle
        {
            get { return uiLabelTitle.Text; }
            set { uiLabelTitle.Text = value; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}