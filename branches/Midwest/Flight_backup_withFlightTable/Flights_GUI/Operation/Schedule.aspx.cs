using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flight_BLL;
using System.Globalization;
using Flights_GUI.FlightReportDataSetTableAdapters;

namespace Flights_GUI.Operation
{
    public partial class Schedule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["F"] != null)
                {
                    if(!string.IsNullOrEmpty(Request.QueryString["F"].ToString()))
                        uiTextBoxFrom.Text = Request.QueryString["F"].ToString();
                    else
                        uiTextBoxFrom.Text = GetWeekStartDaTe().ToString("dd/MM/yyyy");
                }
                else
                {
                    uiTextBoxFrom.Text = GetWeekStartDaTe().ToString("dd/MM/yyyy");
                }
                if (Request.QueryString["T"] != null)
                {
                    if (!string.IsNullOrEmpty(Request.QueryString["T"].ToString()))
                        uiTextBoxTo.Text = Request.QueryString["T"].ToString();
                    else
                        uiTextBoxTo.Text = GetWeekStartDaTe().AddDays(7).ToString("dd/MM/yyyy");
                }
                else
                {
                    uiTextBoxTo.Text = GetWeekStartDaTe().AddDays(7).ToString("dd/MM/yyyy");
                }
                uiLinkButtonGetReport_Click(sender, e);
            }
        }

        private DateTime GetWeekStartDaTe()
        {
            if (DateTime.Now.DayOfWeek == DayOfWeek.Monday)
            {
                return DateTime.Now;
            }
            else if (DateTime.Now.DayOfWeek == DayOfWeek.Sunday)
            {
                return DateTime.Now.AddDays(1);
            }
            else
            {
                return DateTime.Now.AddDays(-1 * (Convert.ToInt32(DateTime.Now.DayOfWeek) - 1));
            }
        }

        protected void uiLinkButtonGetReport_Click(object sender, EventArgs e)
        {
            Microsoft.Reporting.WebForms.ReportDataSource rds = new Microsoft.Reporting.WebForms.ReportDataSource();
            GetPilotScheduleTableAdapter ta = new GetPilotScheduleTableAdapter();
            rds.Name = "ScheduleDataSet";
            ta.ClearBeforeFill = true;

            try
            {
                CultureInfo provider = CultureInfo.InvariantCulture;
                provider = new CultureInfo("fr-FR");
                DateTime? From = null;
                DateTime? To = null;
                if (!string.IsNullOrEmpty(uiTextBoxFrom.Text))
                {
                    From = DateTime.ParseExact(uiTextBoxFrom.Text, "dd/MM/yyyy", provider);
                }
                if (!string.IsNullOrEmpty(uiTextBoxTo.Text))
                {
                    To = DateTime.ParseExact(uiTextBoxTo.Text, "dd/MM/yyyy", provider);
                }
                Pilot current = new Pilot();
                current.GetPilotByUserName(Page.User.Identity.Name);
                if(current.RowCount > 0 )
                    rds.Value = ta.GetData(current.PilotID, From, To);
                else
                    rds.Value = ta.GetData(0, From, To);
            }
            catch (Exception ex)
            {

                throw;
            }
            uiReportViewer.LocalReport.DataSources.Clear();
            uiReportViewer.LocalReport.DataSources.Add(rds);
            //uiReportViewer.LocalReport.SetParameters(new Microsoft.Reporting.WebForms.ReportParameter("From", uiTextBoxFrom.Text));
            //uiReportViewer.LocalReport.SetParameters(new Microsoft.Reporting.WebForms.ReportParameter("To", uiTextBoxTo.Text));
            uiReportViewer.LocalReport.Refresh();
        }

        protected void uiLinkButtonBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("ViewSchedule.aspx?F=" + uiTextBoxFrom.Text + "&T=" + uiTextBoxTo.Text);
        }
    }
}