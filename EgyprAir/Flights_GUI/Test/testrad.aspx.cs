using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flight_BLL;

namespace Flights_GUI.Test
{
    public partial class testrad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //BindReportData();
            }
        }

        private void BindReportData()
        {
            Flight AllReports = new Flight();
            AllReports.GetPAXFlights();
            AllReports.Sort = "ReportDate Desc";
           

            uiRadGrid.DataSource = AllReports.DefaultView;
            uiRadGrid.DataBind();
        }

        protected void uiRadGrid_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            BindReportData();
        }
    }
}