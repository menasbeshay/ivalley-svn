using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ITravel.BLL;
using Microsoft.Reporting.WebForms;
namespace ITravel
{
    public partial class Reports : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.PageTitle = GetLocalResourceObject("PageTitle").ToString();
            }
        }

        protected void uiLinkButtonCanceledTickets_Click(object sender, EventArgs e)
        {
            TicketInfo tickets = new TicketInfo();
            DateTime from, to;
            from = DateTime.TryParseExact(uiTextBoxFromDate.Text, "MM/dd/yyyy", null, System.Globalization.DateTimeStyles.None, out from) ? from : new DateTime(1900, 1, 1);
            to = DateTime.TryParseExact(uiTextBoxToDate.Text, "MM/dd/yyyy", null, System.Globalization.DateTimeStyles.None, out to) ? to : new DateTime(8000, 12, 31);
            
            tickets.RPT_GetTickets_Canceled(from, to);

            uiReportViewerMain.Reset();
            uiReportViewerMain.LocalReport.ReportPath = "ReportsFiles/CanceledTickets.rdlc";
            uiReportViewerMain.LocalReport.DataSources.Clear();
            uiReportViewerMain.LocalReport.DataSources.Add(new ReportDataSource("CanceledDataSet", tickets.DefaultView));
            uiReportViewerMain.LocalReport.Refresh();
        }

        protected void uiLinkButtonSoldCanceled_Click(object sender, EventArgs e)
        {
            TicketInfo tickets = new TicketInfo();
            DateTime from, to;
            from = DateTime.TryParseExact(uiTextBoxFromDate.Text, "MM/dd/yyyy", null, System.Globalization.DateTimeStyles.None, out from) ? from : new DateTime(1900, 1, 1);
            to = DateTime.TryParseExact(uiTextBoxToDate.Text, "MM/dd/yyyy", null, System.Globalization.DateTimeStyles.None, out to) ? to : new DateTime(8000, 12, 31);
            
            tickets.RPT_GetTickets_NetIncome(from, to);

            uiReportViewerMain.Reset();
            uiReportViewerMain.LocalReport.ReportPath = "ReportsFiles/NetIncomeTickets.rdlc";
            uiReportViewerMain.LocalReport.DataSources.Clear();
            uiReportViewerMain.LocalReport.DataSources.Add(new ReportDataSource("NetIncomeDataSet", tickets.DefaultView));
            uiReportViewerMain.LocalReport.Refresh();
        }

        protected void uiLinkButtonSold_Click(object sender, EventArgs e)
        {
            TicketInfo tickets = new TicketInfo();
            DateTime from, to;
            from = DateTime.TryParseExact(uiTextBoxFromDate.Text, "MM/dd/yyyy", null, System.Globalization.DateTimeStyles.None, out from) ? from : new DateTime(1900, 1, 1);
            to = DateTime.TryParseExact(uiTextBoxToDate.Text, "MM/dd/yyyy", null, System.Globalization.DateTimeStyles.None, out to) ? to : new DateTime(8000, 12, 31);

            tickets.RPT_GetTickets_Sold(from, to);

            uiReportViewerMain.Reset();
            uiReportViewerMain.LocalReport.ReportPath = "ReportsFiles/SoldTickets.rdlc";
            uiReportViewerMain.LocalReport.DataSources.Clear();
            uiReportViewerMain.LocalReport.DataSources.Add(new ReportDataSource("SoldDataSet", tickets.DefaultView));
            uiReportViewerMain.LocalReport.Refresh();
        }

        protected void uiLinkButtonTotalCanceledNotRefended_Click(object sender, EventArgs e)
        {
            TicketInfo tickets = new TicketInfo();
            DateTime from, to;
            from = DateTime.TryParseExact(uiTextBoxFromDate.Text, "MM/dd/yyyy", null, System.Globalization.DateTimeStyles.None, out from) ? from : new DateTime(1900, 1, 1);
            to = DateTime.TryParseExact(uiTextBoxToDate.Text, "MM/dd/yyyy", null, System.Globalization.DateTimeStyles.None, out to) ? to : new DateTime(8000, 12, 31);

            tickets.RPT_GetTicketsByStatusID(from, to,3);

            uiReportViewerMain.Reset();
            uiReportViewerMain.LocalReport.ReportPath = "ReportsFiles/CanceledPendingRefunded.rdlc";
            uiReportViewerMain.LocalReport.DataSources.Clear();
            uiReportViewerMain.LocalReport.DataSources.Add(new ReportDataSource("CanceledPendingRefundedDataSet", tickets.DefaultView));
            uiReportViewerMain.LocalReport.Refresh();
        }

        protected void uiLinkButtonTotalCanceledRefunded_Click(object sender, EventArgs e)
        {
            TicketInfo tickets = new TicketInfo();
            DateTime from, to;
            from = DateTime.TryParseExact(uiTextBoxFromDate.Text, "MM/dd/yyyy", null, System.Globalization.DateTimeStyles.None, out from) ? from : new DateTime(1900, 1, 1);
            to = DateTime.TryParseExact(uiTextBoxToDate.Text, "MM/dd/yyyy", null, System.Globalization.DateTimeStyles.None, out to) ? to : new DateTime(8000, 12, 31);

            tickets.RPT_GetTicketsByStatusID(from, to, 4);

            uiReportViewerMain.Reset();
            uiReportViewerMain.LocalReport.ReportPath = "ReportsFiles/CanceledRefunded.rdlc";
            uiReportViewerMain.LocalReport.DataSources.Clear();
            uiReportViewerMain.LocalReport.DataSources.Add(new ReportDataSource("CanceledRefundedDataSet", tickets.DefaultView));
            uiReportViewerMain.LocalReport.Refresh();
        }
    }
}