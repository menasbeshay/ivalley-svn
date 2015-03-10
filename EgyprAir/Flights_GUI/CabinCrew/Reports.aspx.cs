using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flight_BLL;
using Flights_GUI.FlightReportDataSetTableAdapters;
using System.Web.Security;
using Microsoft.Reporting.WebForms;

namespace Flights_GUI.CabinCrew
{
    public partial class Reports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDDLs();
                Master.PageTitle = "Reports"; 
            }
            if (Request.IsAuthenticated)
            {
                if (Roles.IsUserInRole(Page.User.Identity.Name, "CabinCrew"))
                {
                    uiRadioButtonListReports.Items[2].Attributes.Add("style", "display:none");
                    Crew C = new Crew();
                    C.GetCrewByUserName(Page.User.Identity.Name);
                    uiDropDownListCrew.SelectedValue = C.CrewID.ToString();
                    uiDropDownListCrew.Enabled = false;
                }
            }
        }

        private void LoadDDLs()
        {
            Crew AllCrew = new Crew();
            AllCrew.LoadAll();
            uiDropDownListCrew.DataSource = AllCrew.DefaultView;
            uiDropDownListCrew.DataTextField = "Name";
            uiDropDownListCrew.DataValueField = "CrewID";
            uiDropDownListCrew.DataBind();
            uiDropDownListCrew.Items.Insert(0, new ListItem("Select Crew", ""));
        }

        protected void uiLinkButtonGetReport_Click(object sender, EventArgs e)
        {
            Microsoft.Reporting.WebForms.ReportDataSource rds = new Microsoft.Reporting.WebForms.ReportDataSource();
            switch (uiRadioButtonListReports.SelectedValue)
            {
                case "0":
                    rds.Name = "CabinCrewHoursDataSet";
                    break;
                case "5":
                    rds.Name = "CabinCrewHoursDataSet";
                    break;
                case "1":
                    rds.Name = "CabinCrewPerDiemDataSet";
                    break;
                case "2":
                    rds.Name = "ALLCabinCrewHoursDataSet";
                    break;
                case "3":
                    rds.Name = "CabinCrewScheduleDataSet";
                    break;
                case "6":
                    rds.Name = "CrewNightCityDataSet";
                    break;
                case "7":
                    rds.Name = "CrewSummaryDataSet";
                    break; 
                default:
                    break;
            }

            GetCrewHoursTableAdapter CTA = new GetCrewHoursTableAdapter();
            GetCrewDHDHoursTableAdapter CrewDHD = new GetCrewDHDHoursTableAdapter();
            GetAllCrewHoursTableAdapter ACTA = new GetAllCrewHoursTableAdapter();
            GetCrewScheduleTableAdapter CSTA = new GetCrewScheduleTableAdapter();
            GetAllCrewHours_SummaryTableAdapter crewSummary = new GetAllCrewHours_SummaryTableAdapter();

            CTA.ClearBeforeFill = true;
            ACTA.ClearBeforeFill = true;
            CSTA.ClearBeforeFill = true;
            CrewDHD.ClearBeforeFill = true;
            crewSummary.ClearBeforeFill = true;

            try
            {

                DateTime? From = null;
                DateTime? To = null;

                From = uiRadDatePickerFrom.SelectedDate;
                To = uiRadDatePickerTo.SelectedDate;
                //if (!string.IsNullOrEmpty(uiTextBoxFrom.Text))
                //{
                //    From = DateTime.ParseExact(uiTextBoxFrom.Text, "dd/MM/yyyy", null);
                //}
                
                //if (!string.IsNullOrEmpty(uiTextBoxTo.Text))
                //{
                //    To = DateTime.ParseExact(uiTextBoxTo.Text, "dd/MM/yyyy", null);
                //}

                switch (uiRadioButtonListReports.SelectedValue)
                {
                    case "0":
                        rds.Value = CTA.GetData(Convert.ToInt32(uiDropDownListCrew.SelectedValue), From, To);
                        ReportViewer1.LocalReport.ReportPath = "Reports\\CabinCrewHours.rdlc";
                        break;
                    case "5":
                        rds.Value = CrewDHD.GetData(Convert.ToInt32(uiDropDownListCrew.SelectedValue), From, To);
                        ReportViewer1.LocalReport.ReportPath = "Reports\\CabinCrewHours.rdlc";
                        break;
                    case "2":
                        rds.Value = ACTA.GetData(From, To);
                        ReportViewer1.LocalReport.ReportPath = "Reports\\ALLCabinCrewHours.rdlc";
                        ReportParameter[] rep_params1 = new ReportParameter[1];
                        rep_params1[0] = new Microsoft.Reporting.WebForms.ReportParameter("From", string.Format("{0:MM/dd/yyyy}", uiRadDatePickerFrom.SelectedDate));                        
                        ReportViewer1.LocalReport.SetParameters(rep_params1);               
                        
                        break;
                    case "3":
                        rds.Value = CSTA.GetData(Convert.ToInt32(uiDropDownListCrew.SelectedValue), From, To);
                        ReportViewer1.LocalReport.ReportPath = "Reports\\CabinCrewSchedule.rdlc";
                        break;
                    case "6":
                        rds.Value = Common.CalculationUtils.GetCrewNightCity(Convert.ToInt32(uiDropDownListCrew.SelectedValue), From, To);
                        ReportViewer1.LocalReport.ReportPath = "Reports\\CrewNightCity.rdlc";
                        ReportParameter[] rep_params2 = new ReportParameter[2];
                        rep_params2[0] = new Microsoft.Reporting.WebForms.ReportParameter("From", string.Format("{0:MM/dd/yyyy}", uiRadDatePickerFrom.SelectedDate));
                        rep_params2[1] = new Microsoft.Reporting.WebForms.ReportParameter("To", string.Format("{0:MM/dd/yyyy}", uiRadDatePickerTo.SelectedDate));
                        ReportViewer1.LocalReport.SetParameters(rep_params2);
                        

                        break;
                    case "7":
                        rds.Value = crewSummary.GetData(From, To);
                        ReportViewer1.LocalReport.ReportPath = "Reports\\AllCrewSummary.rdlc";
                        ReportParameter[] rep_params3 = new ReportParameter[2];
                        rep_params3[0] = new Microsoft.Reporting.WebForms.ReportParameter("From", string.Format("{0:MM/dd/yyyy}", uiRadDatePickerFrom.SelectedDate));
                        rep_params3[1] = new Microsoft.Reporting.WebForms.ReportParameter("To", string.Format("{0:MM/dd/yyyy}", uiRadDatePickerTo.SelectedDate));
                        ReportViewer1.LocalReport.SetParameters(rep_params3);
                        break;
                }

                ReportViewer1.LocalReport.DataSources.Clear();
                ReportViewer1.LocalReport.DataSources.Add(rds);
                ReportViewer1.LocalReport.Refresh();

            }
            catch (Exception ex)
            {
 
            }
        }
    }
}