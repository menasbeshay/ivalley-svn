using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace archiplan.MasterPages
{
    public partial class Site : System.Web.UI.MasterPage
    {
        public string PageTitle { get { return uiLabelTitle.Text; } set { uiLabelTitle.Text = value; } }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}