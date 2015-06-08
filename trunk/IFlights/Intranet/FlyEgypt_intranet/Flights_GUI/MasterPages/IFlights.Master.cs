using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flights_GUI.MasterPages
{
    public partial class IFlights : System.Web.UI.MasterPage
    {
        public string PageTitle { get { return uiLabelTitle.Text; } set { uiLabelTitle.Text = value; uiLabelContTitle.Text = value; } }
        public string ModuleTitle { get { return uiLabelModuleName.Text; } set { uiLabelModuleName.Text = value; uiLabelModuleName2.Text = value; } }
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

    }
}