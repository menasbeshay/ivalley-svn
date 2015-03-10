using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flights_GUI.MasterPages
{
    public partial class IFlights : System.Web.UI.MasterPage
    {
        public string PageTitle { get { return uiLabelTitle.Text; } set { uiLabelTitle.Text = value; uiLabelContTitle.Text = value; } }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}