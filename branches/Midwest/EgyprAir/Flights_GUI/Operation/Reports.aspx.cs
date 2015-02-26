using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flight_BLL;
using System.Web.Security;
using Flights_GUI.FlightReportDataSetTableAdapters;
using Microsoft.Reporting.WebForms;

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
                ReportViewer4.Visible = false;
                ReportViewer5.Visible = false;
                ReportViewer6.Visible = false;
                ReportViewer7.Visible = false;
                Master.PageTitle = "Reports";      
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
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer2.LocalReport.DataSources.Clear();
            ReportViewer3.LocalReport.DataSources.Clear();
            ReportViewer4.LocalReport.DataSources.Clear();
            ReportViewer5.LocalReport.DataSources.Clear();
            ReportViewer6.LocalReport.DataSources.Clear();
            ReportViewer7.LocalReport.DataSources.Clear();
            Microsoft.Reporting.WebForms.ReportDataSource rds = new Microsoft.Reporting.WebForms.ReportDataSource();
            Microsoft.Reporting.WebForms.ReportDataSource rds2 = new Microsoft.Reporting.WebForms.ReportDataSource();                        
            
            GetPilotReportTableAdapter ta = new GetPilotReportTableAdapter();
            GetPilotReportWithinRangeTableAdapter pilotHoursWithinRange = new GetPilotReportWithinRangeTableAdapter();
            GetPilotDHDWithinRangeTableAdapter pilotDHDHoursWithinRange = new GetPilotDHDWithinRangeTableAdapter();

            GetPAXReportTableAdapter taP = new GetPAXReportTableAdapter();
            GetFlyHoursReportTableAdapter taF = new GetFlyHoursReportTableAdapter();
            GetPilotScheduleTableAdapter taS = new GetPilotScheduleTableAdapter();
            
            CalculatePerDiemTableAdapter TPD = new CalculatePerDiemTableAdapter();
            GetPerDiemLogTableAdapter TPDL = new GetPerDiemLogTableAdapter();
            GetAirPlaneActualBurnOffTableAdapter APBO = new GetAirPlaneActualBurnOffTableAdapter();
            GetSectorsActualBurnOffTableAdapter SBO = new GetSectorsActualBurnOffTableAdapter();

            ta.ClearBeforeFill = true;
            pilotHoursWithinRange.ClearBeforeFill = true;
            pilotDHDHoursWithinRange.ClearBeforeFill = true;

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
                
                
                switch (uiRadioButtonListReports.SelectedValue)
                {
                    case "0":
                        rds.Name = "PilotDataSet";
                        rds.Value = ta.GetData(Convert.ToInt32(uiDropDownListPilots.SelectedValue), From, To);

                        //rds.Value = pilotHoursWithinRange.GetData(Convert.ToInt32(uiDropDownListPilots.SelectedValue), From, To);

                        ReportViewer1.LocalReport.DataSources.Add(rds);
                        ReportParameter[] rep_params1 = new ReportParameter[2];
                        rep_params1[0] = new Microsoft.Reporting.WebForms.ReportParameter("From", string.Format("{0:MM/dd/yyyy}", uiRadDatePickerFrom.SelectedDate));
                        rep_params1[1] = new Microsoft.Reporting.WebForms.ReportParameter("To", string.Format("{0:MM/dd/yyyy}", uiRadDatePickerTo.SelectedDate));
                        ReportViewer1.LocalReport.SetParameters(rep_params1);                        
                        ReportViewer1.LocalReport.Refresh();
                        ReportViewer1.Visible = true;
                        ReportViewer2.Visible = false;
                        ReportViewer3.Visible = false;
                        ReportViewer4.Visible = false;
                        ReportViewer5.Visible = false;
                        ReportViewer6.Visible = false;
                        ReportViewer7.Visible = false;                        
                        break;
                    case "8":
                        rds.Name = "PilotDataSet";
                        //rds.Value = ta.GetData(Convert.ToInt32(uiDropDownListPilots.SelectedValue), From, To);

                        rds.Value = pilotDHDHoursWithinRange.GetData(Convert.ToInt32(uiDropDownListPilots.SelectedValue), From, To);

                        ReportViewer1.LocalReport.DataSources.Add(rds);
                        ReportParameter[] rep_params8 = new ReportParameter[2];
                        rep_params8[0] = new Microsoft.Reporting.WebForms.ReportParameter("From", string.Format("{0:MM/dd/yyyy}", uiRadDatePickerFrom.SelectedDate));
                        rep_params8[1] = new Microsoft.Reporting.WebForms.ReportParameter("To", string.Format("{0:MM/dd/yyyy}", uiRadDatePickerTo.SelectedDate));
                        ReportViewer1.LocalReport.SetParameters(rep_params8);
                        ReportViewer1.LocalReport.Refresh();
                        ReportViewer1.Visible = true;
                        ReportViewer2.Visible = false;
                        ReportViewer3.Visible = false;
                        ReportViewer4.Visible = false;
                        ReportViewer5.Visible = false;
                        ReportViewer6.Visible = false;
                        ReportViewer7.Visible = false;
                        break;
                    case "1":
                        rds.Name = "PAXDataSet";
                        rds.Value = taP.GetData(From, To,Convert.ToInt32(uiDropDownListAirplane.SelectedValue));
                        ReportViewer3.LocalReport.DataSources.Add(rds);
                        ReportParameter[] rep_params3 = new ReportParameter[3];
                        rep_params3[0] = new Microsoft.Reporting.WebForms.ReportParameter("From", string.Format("{0:MM/dd/yyyy}", uiRadDatePickerFrom.SelectedDate));
                        rep_params3[1] = new Microsoft.Reporting.WebForms.ReportParameter("To", string.Format("{0:MM/dd/yyyy}", uiRadDatePickerTo.SelectedDate));
                        rep_params3[2] = new Microsoft.Reporting.WebForms.ReportParameter("Airplane", uiDropDownListAirplane.SelectedValue);
                        ReportViewer3.LocalReport.SetParameters(rep_params3);                                                
                        
                        ReportViewer3.LocalReport.Refresh();
                        ReportViewer1.Visible = false;
                        ReportViewer2.Visible = false;
                        ReportViewer3.Visible = true;
                        ReportViewer4.Visible = false;
                        ReportViewer5.Visible = false;
                        ReportViewer6.Visible = false;
                        ReportViewer7.Visible = false;
                        break;
                    case "2":
                        rds.Name = "FlyHoursDataSet";
                        rds.Value = taF.GetData(From, To);
                        ReportViewer4.LocalReport.DataSources.Add(rds);
                        ReportParameter[] rep_params4 = new ReportParameter[2];
                        rep_params4[0] = new Microsoft.Reporting.WebForms.ReportParameter("From", string.Format("{0:MM/dd/yyyy}", uiRadDatePickerFrom.SelectedDate));
                        rep_params4[1] = new Microsoft.Reporting.WebForms.ReportParameter("To", string.Format("{0:MM/dd/yyyy}", uiRadDatePickerTo.SelectedDate));
                        ReportViewer4.LocalReport.SetParameters(rep_params4);               
                        ReportViewer4.LocalReport.Refresh();
                        ReportViewer1.Visible = false;
                        ReportViewer2.Visible = false;
                        ReportViewer3.Visible = false;
                        ReportViewer4.Visible = true;
                        ReportViewer5.Visible = false;
                        ReportViewer6.Visible = false;
                        ReportViewer7.Visible = false;
                        break;
                    case "3":
                        rds.Name = "ScheduleDataSet";
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
                        ReportViewer5.LocalReport.DataSources.Add(rds);
                        //ReportViewer5.LocalReport.SetParameters(new Microsoft.Reporting.WebForms.ReportParameter("From", string.Format("{0:MM/dd/yyyy}", uiRadDatePickerFrom.SelectedDate)));
                        //ReportViewer5.LocalReport.SetParameters(new Microsoft.Reporting.WebForms.ReportParameter("To", string.Format("{0:MM/dd/yyyy}", uiRadDatePickerTo.SelectedDate)));
                        ReportViewer5.LocalReport.Refresh();
                        ReportViewer1.Visible = false;
                        ReportViewer2.Visible = false;
                        ReportViewer3.Visible = false;
                        ReportViewer4.Visible = false;
                        ReportViewer5.Visible = true;
                        ReportViewer6.Visible = false;
                        ReportViewer7.Visible = false;
                        break;
                    case "4":
                        rds.Name = "PerDiemDataSet";
                        rds2.Name = "PerdiemLogDataSet";
                        rds.Value = TPD.GetData(From, To, Convert.ToInt32(uiDropDownListPilots.SelectedValue));
                        rds2.Value = TPDL.GetData(From, To, Convert.ToInt32(uiDropDownListPilots.SelectedValue));
                        ReportViewer2.LocalReport.DataSources.Add(rds);
                        ReportViewer2.LocalReport.DataSources.Add(rds2);
                        ReportParameter[] rep_params2 = new ReportParameter[1];
                        rep_params2[0] = new Microsoft.Reporting.WebForms.ReportParameter("RateParameter", uiTextBoxRate.Text);
                        ReportViewer2.LocalReport.SetParameters(rep_params2);                           
                        ReportViewer2.LocalReport.Refresh(); 
                        ReportViewer1.Visible = false;
                        ReportViewer2.Visible = true;
                        ReportViewer3.Visible = false;
                        ReportViewer4.Visible = false;
                        ReportViewer5.Visible = false;
                        ReportViewer6.Visible = false;
                        ReportViewer7.Visible = false;
                        break;
                    case "5":
                        rds.Name = "PerDiemDataSet";
                        rds2.Name = "PerdiemLogDataSet";
                        rds.Value = TPD.GetData(From, To, Convert.ToInt32(uiDropDownListPilots.SelectedValue));
                        rds2.Value = TPDL.GetData(From, To, Convert.ToInt32(uiDropDownListPilots.SelectedValue));
                        ReportViewer2.LocalReport.DataSources.Add(rds);
                        ReportViewer2.LocalReport.DataSources.Add(rds2);                
                        ReportParameter[] rep_params22 = new ReportParameter[1];
                        rep_params22[0] = new Microsoft.Reporting.WebForms.ReportParameter("RateParameter", uiTextBoxRate.Text);
                        ReportViewer2.LocalReport.SetParameters(rep_params22);                           
                        ReportViewer2.LocalReport.Refresh(); 
                        ReportViewer1.Visible = false;
                        ReportViewer2.Visible = true;
                        ReportViewer3.Visible = false;
                        ReportViewer4.Visible = false;
                        ReportViewer5.Visible = false;
                        ReportViewer6.Visible = false;
                        ReportViewer7.Visible = false;
                        break;
                    case "6":
                        rds.Name = "AirplaneActualBurnOffDataSet";
                        rds.Value = APBO.GetData(Convert.ToInt32(uiDropDownListAirplane.SelectedValue),From, To);
                        ReportViewer6.LocalReport.DataSources.Add(rds);  
                        ReportParameter[] rep_params6 = new ReportParameter[2];
                        rep_params6[0] = new Microsoft.Reporting.WebForms.ReportParameter("StartDate", string.Format("{0:MM/dd/yyyy}", uiRadDatePickerFrom.SelectedDate));
                        rep_params6[1] = new Microsoft.Reporting.WebForms.ReportParameter("EndDate", string.Format("{0:MM/dd/yyyy}", uiRadDatePickerTo.SelectedDate));
                        ReportViewer6.LocalReport.SetParameters(rep_params6);                          
                        ReportViewer6.LocalReport.Refresh();    
                        ReportViewer1.Visible = false;
                        ReportViewer2.Visible = false;
                        ReportViewer3.Visible = false;
                        ReportViewer4.Visible = false;
                        ReportViewer5.Visible = false;
                        ReportViewer6.Visible = true;
                        ReportViewer7.Visible = false;
                        break;
                    case "7":
                        rds.Name = "SectorActualBurnOffDataSet";
                        rds.Value = SBO.GetData(Convert.ToInt32(uiDropDownListFrom.SelectedValue), Convert.ToInt32(uiDropDownListTo.SelectedValue), From, To);
                        ReportViewer7.LocalReport.DataSources.Add(rds); 
                        ReportParameter[] rep_params7 = new ReportParameter[4];
                        rep_params7[0] = new Microsoft.Reporting.WebForms.ReportParameter("StartDate", string.Format("{0:MM/dd/yyyy}", uiRadDatePickerFrom.SelectedDate));
                        rep_params7[1] = new Microsoft.Reporting.WebForms.ReportParameter("EndDate", string.Format("{0:MM/dd/yyyy}", uiRadDatePickerTo.SelectedDate));
                        rep_params7[2] = new Microsoft.Reporting.WebForms.ReportParameter("FromAirPort", uiDropDownListFrom.SelectedValue);
                        rep_params7[3] = new Microsoft.Reporting.WebForms.ReportParameter("ToAirPort", uiDropDownListTo.SelectedValue);
                        ReportViewer7.LocalReport.SetParameters(rep_params7);  
                        ReportViewer7.LocalReport.Refresh();  
                        ReportViewer1.Visible = false;
                        ReportViewer2.Visible = false;
                        ReportViewer3.Visible = false;
                        ReportViewer4.Visible = false;
                        ReportViewer5.Visible = false;
                        ReportViewer6.Visible = false;
                        ReportViewer7.Visible = true;
                        break;

                    default:
                        break;
                }

                
            }
            catch (Exception ex)
            {

            }            
        }

    }
}