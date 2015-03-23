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
using System.Data;

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
            ReportViewer8.LocalReport.DataSources.Clear();
            ReportViewer9.LocalReport.DataSources.Clear();
            ReportViewer10.LocalReport.DataSources.Clear();
            ReportViewer11.LocalReport.DataSources.Clear();
            Microsoft.Reporting.WebForms.ReportDataSource rds = new Microsoft.Reporting.WebForms.ReportDataSource();
            Microsoft.Reporting.WebForms.ReportDataSource rds2 = new Microsoft.Reporting.WebForms.ReportDataSource();                        
            
            GetPilotReportTableAdapter ta = new GetPilotReportTableAdapter();
            GetPilotReportWithinRangeTableAdapter pilotHoursWithinRange = new GetPilotReportWithinRangeTableAdapter();
            GetPilotDHDWithinRangeTableAdapter pilotDHDHoursWithinRange = new GetPilotDHDWithinRangeTableAdapter();
            GetAllPilotsHours_SummaryTableAdapter pilotSummary = new GetAllPilotsHours_SummaryTableAdapter();
            GetPilotSimulationHoursWithinRangeTableAdapter pilotSim = new GetPilotSimulationHoursWithinRangeTableAdapter();

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
            pilotSummary.ClearBeforeFill = true;
            pilotSim.ClearBeforeFill = true;

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
                        ReportViewer8.Visible = false;
                        ReportViewer9.Visible = false;
                        ReportViewer10.Visible = false;
                        ReportViewer11.Visible = false;
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
                        ReportViewer8.Visible = false;
                        ReportViewer9.Visible = false;
                        ReportViewer10.Visible = false;
                        ReportViewer11.Visible = false;
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
                        ReportViewer8.Visible = false;
                        ReportViewer9.Visible = false;
                        ReportViewer10.Visible = false;
                        ReportViewer11.Visible = false;
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
                        ReportViewer8.Visible = false;
                        ReportViewer9.Visible = false;
                        ReportViewer10.Visible = false;
                        ReportViewer11.Visible = false;
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
                        ReportViewer8.Visible = false;
                        ReportViewer9.Visible = false;
                        ReportViewer10.Visible = false;
                        ReportViewer11.Visible = false;
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
                        ReportViewer8.Visible = false;
                        ReportViewer9.Visible = false;
                        ReportViewer10.Visible = false;
                        ReportViewer11.Visible = false;
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
                        ReportViewer8.Visible = false;
                        ReportViewer9.Visible = false;
                        ReportViewer10.Visible = false;
                        ReportViewer11.Visible = false;
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
                        ReportViewer8.Visible = false;
                        ReportViewer9.Visible = false;
                        ReportViewer10.Visible = false;
                        ReportViewer11.Visible = false;
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
                        ReportViewer8.Visible = false;
                        ReportViewer9.Visible = false;
                        ReportViewer10.Visible = false;
                        ReportViewer11.Visible = false;
                        break;
                    case "9":
                        rds.Name = "PilotNightCityDataSet";
                        rds.Value = Common.CalculationUtils.GetPilotNightCity(Convert.ToInt32(uiDropDownListPilots.SelectedValue), From, To);
                        ReportParameter[] rep_params9 = new ReportParameter[2];
                        rep_params9[0] = new Microsoft.Reporting.WebForms.ReportParameter("From", string.Format("{0:MM/dd/yyyy}", uiRadDatePickerFrom.SelectedDate));
                        rep_params9[1] = new Microsoft.Reporting.WebForms.ReportParameter("To", string.Format("{0:MM/dd/yyyy}", uiRadDatePickerTo.SelectedDate));
                        ReportViewer8.LocalReport.SetParameters(rep_params9);  
                        ReportViewer8.LocalReport.DataSources.Add(rds);  
                        ReportViewer8.LocalReport.Refresh();  
                        ReportViewer1.Visible = false;
                        ReportViewer2.Visible = false;
                        ReportViewer3.Visible = false;
                        ReportViewer4.Visible = false;
                        ReportViewer5.Visible = false;
                        ReportViewer6.Visible = false;
                        ReportViewer7.Visible = false;
                        ReportViewer8.Visible = true;                        
                        ReportViewer9.Visible = false;
                        ReportViewer10.Visible = false;
                        ReportViewer11.Visible = false;
                        break;
                    case "11":
                        rds.Name = "PilotNightCityDataSet";
                        Pilot pilots = new Pilot();
                        pilots.LoadAll();
                        DataTable allPilotsData = new DataTable();
                        allPilotsData.Columns.Add("PilotID", typeof(Int32));
                        allPilotsData.Columns.Add("CityID", typeof(Int32));
                        allPilotsData.Columns.Add("PilotName", typeof(string));
                        allPilotsData.Columns.Add("CityName", typeof(string));
                        allPilotsData.Columns.Add("Date", typeof(DateTime));
                        allPilotsData.PrimaryKey = new DataColumn[] { allPilotsData.Columns[0], allPilotsData.Columns[1], allPilotsData.Columns[4] };
                        for (int i = 0; i < pilots.RowCount; i++)
                        {                       
                            foreach (DataRow item in Common.CalculationUtils.GetPilotNightCity(pilots.PilotID, From, To).Rows)
	                        {
		                        allPilotsData.ImportRow(item);
	                        }
                            
                            pilots.MoveNext();
                        }
                        rds.Value = allPilotsData;
                        ReportParameter[] rep_params11 = new ReportParameter[2];
                        rep_params11[0] = new Microsoft.Reporting.WebForms.ReportParameter("From", string.Format("{0:MM/dd/yyyy}", uiRadDatePickerFrom.SelectedDate));
                        rep_params11[1] = new Microsoft.Reporting.WebForms.ReportParameter("To", string.Format("{0:MM/dd/yyyy}", uiRadDatePickerTo.SelectedDate));
                        ReportViewer10.LocalReport.SetParameters(rep_params11);
                        ReportViewer10.LocalReport.DataSources.Add(rds);
                        ReportViewer10.LocalReport.Refresh();
                        ReportViewer1.Visible = false;
                        ReportViewer2.Visible = false;
                        ReportViewer3.Visible = false;
                        ReportViewer4.Visible = false;
                        ReportViewer5.Visible = false;
                        ReportViewer6.Visible = false;
                        ReportViewer7.Visible = false;
                        ReportViewer8.Visible = false;
                        ReportViewer9.Visible = false;
                        ReportViewer10.Visible = true;
                        ReportViewer11.Visible = false;

                        break;
                    case "10":
                        rds.Name = "PilotSummaryDataSet";
                        rds.Value = pilotSummary.GetData(From, To);
                        ReportParameter[] rep_params10 = new ReportParameter[2];
                        rep_params10[0] = new Microsoft.Reporting.WebForms.ReportParameter("From", string.Format("{0:MM/dd/yyyy}", uiRadDatePickerFrom.SelectedDate));
                        rep_params10[1] = new Microsoft.Reporting.WebForms.ReportParameter("To", string.Format("{0:MM/dd/yyyy}", uiRadDatePickerTo.SelectedDate));
                        ReportViewer9.LocalReport.SetParameters(rep_params10);  
                        ReportViewer9.LocalReport.DataSources.Add(rds);  
                        ReportViewer9.LocalReport.Refresh();  
                        ReportViewer1.Visible = false;
                        ReportViewer2.Visible = false;
                        ReportViewer3.Visible = false;
                        ReportViewer4.Visible = false;
                        ReportViewer5.Visible = false;
                        ReportViewer6.Visible = false;
                        ReportViewer7.Visible = false;
                        ReportViewer8.Visible = false;                        
                        ReportViewer9.Visible = true;
                        ReportViewer10.Visible = false;
                        ReportViewer11.Visible = false;
                        break;
                   case "12":
                        rds.Name = "PilotSimulationDataSet";
                        rds.Value = pilotSim.GetData(Convert.ToInt32(uiDropDownListPilots.SelectedValue),From, To);
                        ReportParameter[] rep_params12 = new ReportParameter[2];
                        rep_params12[0] = new Microsoft.Reporting.WebForms.ReportParameter("From", string.Format("{0:MM/dd/yyyy}", uiRadDatePickerFrom.SelectedDate));
                        rep_params12[1] = new Microsoft.Reporting.WebForms.ReportParameter("To", string.Format("{0:MM/dd/yyyy}", uiRadDatePickerTo.SelectedDate));
                        ReportViewer11.LocalReport.SetParameters(rep_params12);  
                        ReportViewer11.LocalReport.DataSources.Add(rds);  
                        ReportViewer11.LocalReport.Refresh();  
                        ReportViewer1.Visible = false;
                        ReportViewer2.Visible = false;
                        ReportViewer3.Visible = false;
                        ReportViewer4.Visible = false;
                        ReportViewer5.Visible = false;
                        ReportViewer6.Visible = false;
                        ReportViewer7.Visible = false;
                        ReportViewer8.Visible = false;                        
                        ReportViewer9.Visible = false;
                        ReportViewer10.Visible = false;
                        ReportViewer11.Visible = true;
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
