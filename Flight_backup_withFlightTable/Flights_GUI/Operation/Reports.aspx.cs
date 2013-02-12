using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flight_BLL;
using System.Web.Security;
using Flights_GUI.FlightReportDataSetTableAdapters;

namespace Flights_GUI.Operation
{
    public partial class Reports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDDLs();
                ReportViewer1.Visible = false;
                ReportViewer2.Visible = false;
                ReportViewer3.Visible = false;
                
            }
            if (Request.IsAuthenticated)
            {
                if (Roles.IsUserInRole(Page.User.Identity.Name, "Pilot"))
                {
                    uiRadioButtonListReports.Items[3].Attributes.Add("style", "display:none");
                    uiRadioButtonListReports.Items[4].Attributes.Add("style", "display:none");
                    uiRadioButtonListReports.Items[5].Attributes.Add("style", "display:none");
                    Pilot p = new Pilot();
                    p.GetPilotByUserName(Page.User.Identity.Name);
                    uiDropDownListPilots.SelectedValue = p.PilotID.ToString();
                    uiDropDownListPilots.Enabled = false;
                }
            }
        }

        private void LoadDDLs()
        {
            Pilot Allpilots = new Pilot();
            Allpilots.LoadAll();
            uiDropDownListPilots.DataSource = Allpilots.DefaultView;
            uiDropDownListPilots.DataTextField = "ShortName";
            uiDropDownListPilots.DataValueField = "PilotID";
            uiDropDownListPilots.DataBind();
            uiDropDownListPilots.Items.Insert(0, new ListItem("Select Pilot", ""));

            AirPlane AllPlanes = new AirPlane();
            AllPlanes.LoadAll();
            uiDropDownListAirplane.DataSource = AllPlanes.DefaultView;
            uiDropDownListAirplane.DataTextField = "Name";
            uiDropDownListAirplane.DataValueField = "AirPlaneID";
            uiDropDownListAirplane.DataBind();
            uiDropDownListAirplane.Items.Insert(0, new ListItem("All", "0"));

            AirPort AllAirports = new AirPort();
            AllAirports.LoadAll();
            uiDropDownListFrom.DataSource = AllAirports.DefaultView;
            uiDropDownListFrom.DataTextField = "IATACode";
            uiDropDownListFrom.DataValueField = "AirPortID";
            uiDropDownListFrom.DataBind();
            uiDropDownListFrom.Items.Insert(0, new ListItem("Select Airport", "0"));

            uiDropDownListTo.DataSource = AllAirports.DefaultView;
            uiDropDownListTo.DataTextField = "IATACode";
            uiDropDownListTo.DataValueField = "AirPortID";
            uiDropDownListTo.DataBind();
            uiDropDownListTo.Items.Insert(0, new ListItem("Select Airport", "0"));

        }

        protected void uiLinkButtonGetReport_Click(object sender, EventArgs e)
        {            
            Microsoft.Reporting.WebForms.ReportDataSource rds = new Microsoft.Reporting.WebForms.ReportDataSource();
            Microsoft.Reporting.WebForms.ReportDataSource rds2 = new Microsoft.Reporting.WebForms.ReportDataSource();            
            switch (uiRadioButtonListReports.SelectedValue)
            {
                case "0":
                    rds.Name = "PilotDataSet";
                    break;
                case "1":
                    rds.Name = "PAXDataSet";
                    break;
                case "2":
                    rds.Name = "FlyHoursDataSet";
                    break;
                case "3":
                    rds.Name = "ScheduleDataSet";
                    break;
                case "4":
                    rds.Name = "PerDiemDataSet";
                    rds2.Name = "PerdiemLogDataSet";
                    break;
                case "5":
                    rds.Name = "PerDiemDataSet";
                    rds2.Name = "PerdiemLogDataSet";
                    break;
                case "6":
                    rds.Name = "AirplaneActualBurnOffDataSet";
                    break;
                case "7":
                    rds.Name = "SectorActualBurnOffDataSet";
                    break;
                default:
                    break;
            }
            
            GetPilotReportTableAdapter ta = new GetPilotReportTableAdapter();
            GetPAXReportTableAdapter taP = new GetPAXReportTableAdapter();
            GetFlyHoursReportTableAdapter taF = new GetFlyHoursReportTableAdapter();
            GetPilotScheduleTableAdapter taS = new GetPilotScheduleTableAdapter();
            
            CalculatePerDiemTableAdapter TPD = new CalculatePerDiemTableAdapter();
            GetPerDiemLogTableAdapter TPDL = new GetPerDiemLogTableAdapter();
            GetAirPlaneActualBurnOffTableAdapter APBO = new GetAirPlaneActualBurnOffTableAdapter();
            GetSectorActualBurnOffTableAdapter SBO = new GetSectorActualBurnOffTableAdapter();

            ta.ClearBeforeFill = true;
            taP.ClearBeforeFill = true;
            taF.ClearBeforeFill = true;
            taS.ClearBeforeFill = true;

            TPD.ClearBeforeFill = true;
            TPDL.ClearBeforeFill = true;
            APBO.ClearBeforeFill = true;
            SBO.ClearBeforeFill = true;

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
                        rds.Value = ta.GetData(Convert.ToInt32(uiDropDownListPilots.SelectedValue), From, To);                     
                        ReportViewer1.LocalReport.ReportPath = "Reports\\PilotReport.rdlc";
                        break;
                    case "1":
                        rds.Value = taP.GetData(From, To,Convert.ToInt32(uiDropDownListAirplane.SelectedValue));
                        ReportViewer1.LocalReport.ReportPath = "Reports\\PAXReport.rdlc";
                        break;
                    case "2":
                        rds.Value = taF.GetData(From, To);
                        ReportViewer1.LocalReport.ReportPath = "Reports\\PlaneReport.rdlc";
                        break;
                    case "3":
                        if(!Roles.IsUserInRole(Page.User.Identity.Name,"Pilot"))
                        {   
                            rds.Value = taS.GetData(0,From, To);
                        }
                        else
                        {
                            Pilot p = new Pilot();
                            p.GetPilotByUserName(Page.User.Identity.Name);
                            rds.Value = taS.GetData(p.PilotID, From, To);
                        }
                        ReportViewer1.LocalReport.ReportPath = "Reports\\Schedule.rdlc";
                        break;
                    case "4":
                        rds.Value = TPD.GetData(From, To, Convert.ToInt32(uiDropDownListPilots.SelectedValue));
                        rds2.Value = TPDL.GetData(From, To, Convert.ToInt32(uiDropDownListPilots.SelectedValue));
                        ReportViewer2.LocalReport.ReportPath = "Reports\\PerDiem.rdlc";
                        break;
                    case "5":
                        rds.Value = TPD.GetData(From, To, Convert.ToInt32(uiDropDownListPilots.SelectedValue));
                        rds2.Value = TPDL.GetData(From, To, Convert.ToInt32(uiDropDownListPilots.SelectedValue));
                        ReportViewer2.LocalReport.ReportPath = "Reports\\Copy_PerDiem.rdlc";
                        break;
                    case "6":
                        rds.Value = APBO.GetData(Convert.ToInt32(uiDropDownListAirplane.SelectedValue),From, To);
                        ReportViewer3.LocalReport.ReportPath = "Reports\\AirplaneActualBurnOff.rdlc";
                        break;
                    case "7":
                        rds.Value = SBO.GetData(Convert.ToInt32(uiDropDownListFrom.SelectedValue), Convert.ToInt32(uiDropDownListTo.SelectedValue), From, To);
                        ReportViewer3.LocalReport.ReportPath = "Reports\\SectorActualBurnOff.rdlc";
                        break;

                    default:
                        break;
                }

                
            }
            catch (Exception ex)
            {

            }


            if (uiRadioButtonListReports.SelectedValue == "4" || uiRadioButtonListReports.SelectedValue == "5")
            {
                ReportViewer2.LocalReport.DataSources.Clear();
                ReportViewer2.LocalReport.DataSources.Add(rds);
                ReportViewer2.LocalReport.DataSources.Add(rds2);
                //ReportViewer2.LocalReport.SetParameters(new Microsoft.Reporting.WebForms.ReportParameter("From", uiTextBoxFrom.Text));
                //ReportViewer2.LocalReport.SetParameters(new Microsoft.Reporting.WebForms.ReportParameter("To", uiTextBoxTo.Text));
                ReportViewer2.LocalReport.SetParameters(new Microsoft.Reporting.WebForms.ReportParameter("RateParameter", uiTextBoxRate.Text));
                ReportViewer2.LocalReport.Refresh();
                ReportViewer1.Visible = false;
                ReportViewer2.Visible = true;
                ReportViewer3.Visible = false;
            }
            else if (uiRadioButtonListReports.SelectedValue == "0" || uiRadioButtonListReports.SelectedValue == "1" || uiRadioButtonListReports.SelectedValue == "2" || uiRadioButtonListReports.SelectedValue == "3")
            {
                ReportViewer1.LocalReport.DataSources.Clear();
                ReportViewer1.LocalReport.DataSources.Add(rds);
                if (uiRadioButtonListReports.SelectedValue != "3")
                {
                    ReportViewer1.LocalReport.SetParameters(new Microsoft.Reporting.WebForms.ReportParameter("From", uiRadDatePickerFrom.SelectedDate.ToString()));
                    ReportViewer1.LocalReport.SetParameters(new Microsoft.Reporting.WebForms.ReportParameter("To", uiRadDatePickerTo.SelectedDate.ToString()));
                    if (uiRadioButtonListReports.SelectedValue == "1")
                    {
                        ReportViewer1.LocalReport.SetParameters(new Microsoft.Reporting.WebForms.ReportParameter("Airplane", uiDropDownListAirplane.SelectedValue));
                    }
                }
                ReportViewer1.LocalReport.Refresh();
                ReportViewer2.Visible = false;
                ReportViewer1.Visible = true;
                ReportViewer3.Visible = false;
            }
            else if (uiRadioButtonListReports.SelectedValue == "6" || uiRadioButtonListReports.SelectedValue == "7")
            {
                ReportViewer3.LocalReport.DataSources.Clear();
                ReportViewer3.LocalReport.DataSources.Add(rds);
                if (uiRadioButtonListReports.SelectedValue == "7")
                {
                    ReportViewer3.LocalReport.SetParameters(new Microsoft.Reporting.WebForms.ReportParameter("FromAirPort", uiDropDownListFrom.SelectedValue));
                    ReportViewer3.LocalReport.SetParameters(new Microsoft.Reporting.WebForms.ReportParameter("ToAirPort", uiDropDownListTo.SelectedValue));
                }
                ReportViewer3.LocalReport.SetParameters(new Microsoft.Reporting.WebForms.ReportParameter("StartDate", string.Format("{0:MM/dd/yyyy}", uiRadDatePickerFrom.SelectedDate)));
                ReportViewer3.LocalReport.SetParameters(new Microsoft.Reporting.WebForms.ReportParameter("EndDate", string.Format("{0:MM/dd/yyyy}", uiRadDatePickerTo.SelectedDate)));
                ReportViewer3.LocalReport.Refresh();
                ReportViewer2.Visible = false;
                ReportViewer1.Visible = false;
                ReportViewer3.Visible = true;
            }

            
            
        }

    }
}