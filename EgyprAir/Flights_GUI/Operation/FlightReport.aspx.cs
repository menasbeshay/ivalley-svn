using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flights_GUI.Operation
{
    public partial class FlightReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void uiLinkButtonViewReport_Click(object sender, EventArgs e)
        {
            Microsoft.Reporting.WebForms.ReportDataSource rds = new Microsoft.Reporting.WebForms.ReportDataSource();
            Microsoft.Reporting.WebForms.ReportDataSource rds2 = new Microsoft.Reporting.WebForms.ReportDataSource();
            Microsoft.Reporting.WebForms.ReportDataSource rds3 = new Microsoft.Reporting.WebForms.ReportDataSource();
            Microsoft.Reporting.WebForms.ReportDataSource rds4 = new Microsoft.Reporting.WebForms.ReportDataSource();
            Microsoft.Reporting.WebForms.ReportDataSource rds5 = new Microsoft.Reporting.WebForms.ReportDataSource();
            DataTable extraMembers = new DataTable();            
            extraMembers.Columns.Add("FirstName", typeof(string));            
            
            string[] stringSeparators = new string[] { "[stop]" };
            string[] allmembers = uiHiddenFieldExtraMembers.Value.Split(stringSeparators, StringSplitOptions.RemoveEmptyEntries);
            foreach (string item in allmembers)
            {
                DataRow row = extraMembers.NewRow();
                row["FirstName"] = item.Split('#')[0];                
                extraMembers.Rows.Add(row);
            }

            rds.Name = "FlightLog";
            rds2.Name = "FlightLogPilot";
            rds3.Name = "FlightLogCrew";
            rds4.Name = "FlightLogTotals";
            rds5.Name = "ExtraMemberDataSet";

            FlightReportDataSetTableAdapters.GetFlightLogTableAdapter flightlog = new FlightReportDataSetTableAdapters.GetFlightLogTableAdapter();
            FlightReportDataSetTableAdapters.GetFlightLogPilotTableAdapter flightpilotlog = new FlightReportDataSetTableAdapters.GetFlightLogPilotTableAdapter();
            FlightReportDataSetTableAdapters.GetFlightLogCrewTableAdapter flightCrewlog = new FlightReportDataSetTableAdapters.GetFlightLogCrewTableAdapter();
            FlightReportDataSetTableAdapters.GetFlightLogTotalTimeTableAdapter flightlogTime = new FlightReportDataSetTableAdapters.GetFlightLogTotalTimeTableAdapter();

            flightlog.ClearBeforeFill = true;
            flightpilotlog.ClearBeforeFill = true;
            flightCrewlog.ClearBeforeFill = true;
            flightlogTime.ClearBeforeFill = true;

            rds.Value = flightlog.GetData(Convert.ToInt32(Request.QueryString["RID"].ToString()));            
            rds2.Value = flightpilotlog.GetData(Convert.ToInt32(Request.QueryString["RID"].ToString()));
            rds3.Value = flightCrewlog.GetData(Convert.ToInt32(Request.QueryString["RID"].ToString()));
            rds4.Value = flightlogTime.GetData(Convert.ToInt32(Request.QueryString["RID"].ToString()));
            rds5.Value = extraMembers;

            uiReportViewer.LocalReport.DataSources.Clear();
            uiReportViewer.LocalReport.DataSources.Add(rds);
            uiReportViewer.LocalReport.DataSources.Add(rds2);
            uiReportViewer.LocalReport.DataSources.Add(rds3);
            uiReportViewer.LocalReport.DataSources.Add(rds4);
            uiReportViewer.LocalReport.DataSources.Add(rds5);
            uiReportViewer.LocalReport.Refresh();
        }
    }
}