using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TouchMediaGUI.Admin
{
    public partial class admin : System.Web.UI.MasterPage
    {
        public string PageTitle { set { uiLabelTitle.Text = value; } }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}