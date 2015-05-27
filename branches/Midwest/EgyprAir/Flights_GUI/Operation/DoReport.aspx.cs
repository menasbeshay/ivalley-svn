using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flights_GUI.FlightReportDataSetTableAdapters;
using System.Data;

namespace Flights_GUI.Operation
{
    public partial class DoReport : System.Web.UI.Page
    {
        public string ReportName 
        { 
            get 
            {
                if (Request.QueryString["report"] != null)
                    return Request.QueryString["report"].ToString();
                else
                    return null;
            } 
        }

        public int SectorID
        {
            get
            {
                if (Request.QueryString["SectorID"] != null)
                    return Convert.ToInt32(Request.QueryString["SectorID"].ToString());
                else
                    return 0;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(ReportName))
                {
                    switch (ReportName)
                    {
                        case "GD":
                            uiPanelAddGDExtraMembers.Visible = true;
                            break;
                        default:
                            break;
                    }
                }
            }
        }

        protected void uiLinkButtonViewReport_Click(object sender, EventArgs e)
        {
            switch (ReportName) 
            {
                case "GD":
                    Microsoft.Reporting.WebForms.ReportDataSource rds = new Microsoft.Reporting.WebForms.ReportDataSource();
                    Microsoft.Reporting.WebForms.ReportDataSource rds2 = new Microsoft.Reporting.WebForms.ReportDataSource();
                    Microsoft.Reporting.WebForms.ReportDataSource rds3 = new Microsoft.Reporting.WebForms.ReportDataSource();
                    
                    DataTable extraMembers = new DataTable();
                    extraMembers.Columns.Add("Title", typeof(string));
                    extraMembers.Columns.Add("PilotName", typeof(string));
                    extraMembers.Columns.Add("PassportNo", typeof(string));                    
                    extraMembers.Columns.Add("DateOfBirth", typeof(DateTime));
                    string[] stringSeparators = new string[] { "[stop]" };
                    string[] allmembers = uiHiddenFieldExtraMembers.Value.Split(stringSeparators, StringSplitOptions.RemoveEmptyEntries);
                    foreach (string item in allmembers)
                    {
                        DataRow row = extraMembers.NewRow();
                        row["Title"] = item.Split('#')[0];
                        row["PilotName"] = item.Split('#')[1];
                        row["PassportNo"] = item.Split('#')[2];
                        row["DateOfBirth"] = item.Split('#')[3];
                        extraMembers.Rows.Add(row);
                    }
                    rds.Name = "SectorDataSet";
                    rds2.Name = "SectorPilotsDataSet";
                    rds3.Name = "ExtraMemberDataSet";
                    uiReportViewer.LocalReport.ReportPath = "Reports\\GD.rdlc";
                    GetSectorInfoTableAdapter sectorInfoTA = new GetSectorInfoTableAdapter();
                    GetSectorPilotInfoTableAdapter sectorPilotTA = new GetSectorPilotInfoTableAdapter();
                    sectorInfoTA.ClearBeforeFill = true;
                    sectorPilotTA.ClearBeforeFill = true;
                    rds.Value = sectorInfoTA.GetData(SectorID);
                    rds2.Value = sectorPilotTA.GetData(SectorID);
                    rds3.Value = extraMembers;
                    uiReportViewer.LocalReport.DataSources.Clear();
                    uiReportViewer.LocalReport.DataSources.Add(rds);
                    uiReportViewer.LocalReport.DataSources.Add(rds2);
                    uiReportViewer.LocalReport.DataSources.Add(rds3);
                    uiReportViewer.LocalReport.Refresh();
                    break;
                default:
                    break;
                
            } 
        }


    }
}