using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using Telerik.Charting;
using Telerik.Charting.Styles;
namespace Flights_GUI
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                //MembershipUser u = Membership.FindUsersByName("dispatch")["dispatch"];
                //Response.Write( u.GetPassword());
                //ReportViewer1.LocalReport.SetParameters(new Microsoft.Reporting.WebForms.ReportParameter("StartDate", new DateTime(2012,10,1).ToString()));
                //ReportViewer1.LocalReport.SetParameters(new Microsoft.Reporting.WebForms.ReportParameter("EndDate", new DateTime(2012, 10, 15).ToString()));
                //ReportViewer1.LocalReport.SetParameters(new Microsoft.Reporting.WebForms.ReportParameter("FromAirPort", "0"));
                //ReportViewer1.LocalReport.SetParameters(new Microsoft.Reporting.WebForms.ReportParameter("ToAirPort", "0"));
                //ReportViewer1.LocalReport.Refresh();
                //RadChart1.PlotArea.XAxis.AutoScale = false;
                //RadChart1.PlotArea.XAxis.Appearance.ValueFormat = ChartValueFormat.ShortDate;
                //RadChart1.SeriesOrientation = ChartSeriesOrientation.Vertical;

                //ChartSeries series1 = new ChartSeries();
                //series1.Type = ChartSeriesType.Gantt;
                //series1.DefaultLabelValue = " ";
                //series1.DataXColumn = "STD";
                //series1.DataXColumn2 = "STA";
                //series1.DataYColumn = "AirCraft_AirPlaneID";
                //series1.DataYColumn2 = "AirCraft_AirPlaneID";

                //RadChart1.AddChartSeries(series1);

                //RadChart1.PlotArea.XAxis.AutoScale = false;
                //RadChart1.PlotArea.XAxis.Appearance.ValueFormat = ChartValueFormat.ShortDate;
                //RadChart1.PlotArea.XAxis.AddRange((new DateTime(2012, 1, 1)).ToOADate(), (new DateTime(2013, 1, 1)).ToOADate(), ((new DateTime(2013, 1, 1)).ToOADate() - (new DateTime(2012, 1, 1)).ToOADate()) / 12);
                //RadChart1.SeriesOrientation = ChartSeriesOrientation.Vertical;



                //RadChart1.DataSource = SqlDataSource1;
                //RadChart1.DataBind();
                //ChartSeries series1 = new ChartSeries();
                //series1.Type = ChartSeriesType.Gantt;
                //series1.DefaultLabelValue = " ";

                //series1.AddItem(new ChartSeriesItem(1, (new DateTime(2007, 8, 1)).ToOADate(), 2, (new DateTime(2007, 10, 14)).ToOADate()));

               // RadChart1.Series.Add(series1);
            }

        }
    }
}
