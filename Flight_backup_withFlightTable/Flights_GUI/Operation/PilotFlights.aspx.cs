using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flight_BLL;

namespace Flights_GUI.Operation
{
    public partial class PilotFlights : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }

        private void BindData()
        {
            Flight f = new Flight();
            f.GetPilotFlights(3);
            uiGridViewReports.DataSource = f.DefaultView;
            uiGridViewReports.DataBind();
        }

        protected void uiGridViewReports_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewReports.PageIndex = e.NewPageIndex;
            BindData();
        }


    }
}