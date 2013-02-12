using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Threading;
using System.Collections;
using Flight_BLL;
using System.Data;
using System.Web.Security;

namespace Flights_GUI.Operation
{
    public partial class FlightDetails : System.Web.UI.Page
    {
        #region Properties
        public Flight CurrentFlightReport 
        {
            get
            {
                if (Session["CurrentFlightReport"] != null)
                    return (Flight)Session["CurrentFlightReport"];
                else
                    return null;
            }
            set
            {
                Session["CurrentFlightReport"] = value;
            }
        }

        public Sector CurrentSector
        {
            get
            {
                if (Session["CurrentSector"] != null)
                    return (Sector)Session["CurrentSector"];
                else
                    return null;
            }
            set
            {
                Session["CurrentSector"] = value;
            }
        }
        #endregion

        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                populateDDLs();
                LoadDDLs();
                BindReportData();
                uiPanelViewAll.Visible = true;
                uiPanelEdit.Visible = false;                
            }
        }
        
        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            uiPanelViewAll.Visible = false;
            uiPanelEdit.Visible = true;
            ClearFields();
            CurrentFlightReport = null;
            EnableDisableTabs();
        }        

        protected void uiButtonSaveMaster_Click(object sender, EventArgs e)
        {
            if (CurrentFlightReport != null)
            {
                Flight objData = CurrentFlightReport;                
                objData.FlightNo = uiTextBoxFlightNo.Text;
                objData.AirCraft_AirPlaneID = Convert.ToInt32(uiDropDownListAirCraftRegistration.SelectedValue);
                objData.ReportDate = DateTime.ParseExact(uiTextBoxDate.Text, "dd/MM/yyyy", null);
                objData.IsHeavy = uiCheckBoxIsHeavy.Checked;
                objData.Save();
            }
            else
            {
                Flight objData = new Flight();
                objData.AddNew();
                objData.FlightNo = uiTextBoxFlightNo.Text;
                objData.AirCraft_AirPlaneID = Convert.ToInt32(uiDropDownListAirCraftRegistration.SelectedValue);
                objData.ReportDate = DateTime.ParseExact(uiTextBoxDate.Text, "dd/MM/yyyy", null);
                objData.IsHeavy = uiCheckBoxIsHeavy.Checked;
                objData.Save();
                CurrentFlightReport = objData;
                EnableDisableTabs();
            }
        }

        protected void uiGridViewReports_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewReports.PageIndex = e.NewPageIndex;
            BindReportData();
        }

        protected void uiGridViewReports_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditReport")
            {
                Flight objData = new Flight();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                uiDropDownListAirCraftRegistration.SelectedValue = objData.AirCraft_AirPlaneID.ToString();
                uiTextBoxFlightNo.Text = objData.FlightNo;
                uiTextBoxDate.Text = objData.ReportDate.ToString("dd/MM/yyyy");
                uiCheckBoxIsHeavy.Checked = objData.IsHeavy;
                CurrentFlightReport = objData;
                uiPanelEdit.Visible = true;
                uiPanelViewAll.Visible = false;
                EnableDisableTabs();
                BindSectors();
                BindCrew();
                BindPilots();
            }

            else if (e.CommandName == "DeleteReport")
            {
                Flight objData = new Flight();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                FlightCrew crew = new FlightCrew();
                crew.GetCrewByFlightID(objData.ReportID);
                FlightPilot pilots = new FlightPilot();
                pilots.GetPilotByFlightID(objData.ReportID);
                Sector sectors = new Sector();
                sectors.GetSectorsByFlightID(objData.ReportID);

                pilots.DeleteAll();
                pilots.Save();

                crew.DeleteAll();
                crew.Save();

                sectors.DeleteAll();
                sectors.Save();

                objData.MarkAsDeleted();
                objData.Save();

                BindReportData();
            }

            else if (e.CommandName == "ViewReport")
            {
                Response.Redirect("FlightReport.aspx?RID=" + e.CommandArgument.ToString());
            }
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentFlightReport = null;
            uiPanelEdit.Visible = false;
            uiPanelViewAll.Visible = true;
        }


        /********************************** Crew Section *****************************************/
        protected void uiLinkButtonAddFlying_Click(object sender, EventArgs e)
        {
            FlightPilot Member = new FlightPilot();
            Member.AddNew();
            Member.ReportID = CurrentFlightReport.ReportID;
            Member.PositionID = Convert.ToInt32(uiDropDownListPilotPos.SelectedValue);
            Member.PilotID = Convert.ToInt32(uiDropDownListPilot.SelectedValue);
            Member.Save();
            BindPilots();
        }

        protected void uiLinkButtonAddCo_Click(object sender, EventArgs e)
        {
            FlightPilot Member = new FlightPilot();
            Member.AddNew();
            Member.ReportID = CurrentFlightReport.ReportID;
            Member.PositionID = Convert.ToInt32(uiDropDownListCOPos.SelectedValue);
            Member.PilotID = Convert.ToInt32(uiDropDownListCoPilot.SelectedValue);
            Member.Save();
            BindPilots();
        }

       
        protected void uiLinkButtonAddCrew_Click(object sender, EventArgs e)
        {
            FlightCrew Member = new FlightCrew();
            Member.AddNew();
            Member.ReportID = CurrentFlightReport.ReportID;
            Member.PositionID = Convert.ToInt32(uiDropDownListCrewPos.SelectedValue);
            Member.CrewID = Convert.ToInt32(uiDropDownListCrew.SelectedValue);
            Member.Save();
            BindCrew();
        }

        protected void uiGridViewCrew_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteCrew")
            {
                FlightCrew objData = new FlightCrew();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
                BindCrew();
            }
        }

        protected void uiGridViewCrew_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView objData = (DataRowView)e.Row.DataItem;
                Crew current = new Crew();
                current.LoadByPrimaryKey(Convert.ToInt32(objData["CrewID"].ToString()));
                Label temp = (Label)e.Row.FindControl("uiLabelName");
                temp.Text = current.Name;
                Label temp2 = (Label)e.Row.FindControl("uiLabelStaffNo");
                if (!current.IsColumnNull("StaffNo"))
                {
                    temp2.Text = current.StaffNo.ToString();
                }
                if (objData["PositionID"] != null)
                {
                    Label pos = (Label)e.Row.FindControl("uiLabelPosition");
                    Position Currentpos = new Position();
                    Currentpos.LoadByPrimaryKey(Convert.ToInt32(objData["PositionID"].ToString()));
                    pos.Text = Currentpos.Title;
                }
            }
        }

        protected void uiGridViewPiolts_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeletePiolt")
            {
                FlightPilot objData = new FlightPilot();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
                BindPilots();
            }
        }

        protected void uiGridViewPiolts_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView objData = (DataRowView)e.Row.DataItem;
                Pilot current = new Pilot();
                current.LoadByPrimaryKey(Convert.ToInt32(objData["PilotID"].ToString()));
                Label temp = (Label)e.Row.FindControl("uiLabelName");
                temp.Text = current.FirstName + " " + current.SecondName;
                Label temp2 = (Label)e.Row.FindControl("uiLabelStaffNo");
                if (!current.IsColumnNull("StaffNo"))
                {
                    temp2.Text = current.StaffNo.ToString();
                }

                CheckBox IsPilot = (CheckBox)e.Row.FindControl("uiCheckBoxIsPilot");
                if (!current.IsColumnNull("IsPilot"))
                    IsPilot.Checked = current.IsPilot;
                else
                    IsPilot.Checked = false;

                if (objData["PositionID"] != null)
                {
                    Label pos = (Label)e.Row.FindControl("uiLabelPosition");
                    Position Currentpos = new Position();
                    Currentpos.LoadByPrimaryKey(Convert.ToInt32(objData["PositionID"].ToString()));
                    pos.Text = Currentpos.Title;
                }
            }
        }


        /*****************************************************************************************/


        /**************** Sector section ********************/
        protected void uiLinkButtonSaveSector_Click(object sender, EventArgs e)
        {
            if (CurrentSector != null)
            {
                Sector objData = CurrentSector;
                objData.ReportID = CurrentFlightReport.ReportID;
                objData.From_AirportID = Convert.ToInt32(uiDropDownListSectorFrom.SelectedValue);
                objData.To_AirportID = Convert.ToInt32(uiDropDownListSectorTo.SelectedValue);
                objData.FlightNo = uiTextBoxSectorFlightNo.Text;
                objData.IsPAX = false;
                if (!string.IsNullOrEmpty(uiTextBoxFule.Text))
                {
                    objData.FuleUplifted = Convert.ToInt32(uiTextBoxFule.Text);
                }

                if (!string.IsNullOrEmpty(uiTextBoxActualBurn.Text))
                {
                    objData.ActualBurnOff = Convert.ToInt32(uiTextBoxActualBurn.Text);
                }
                if (!string.IsNullOrEmpty(uiTextBoxPlanBurnOff.Text))
                {
                    objData.StandardBurnOff = Convert.ToInt32(uiTextBoxPlanBurnOff.Text);
                }


                TimeSpan STD = new TimeSpan(Convert.ToInt32(uiDropDownListSTDHours.Text), Convert.ToInt32(uiDropDownListSTDMins.Text), 0);
                objData.STD = Convert.ToDateTime(STD.ToString());

                TimeSpan ATD = new TimeSpan(Convert.ToInt32(uiDropDownListATDHours.Text), Convert.ToInt32(uiDropDownListATDMins.Text), 0);
                objData.ATD = Convert.ToDateTime(ATD.ToString());

                TimeSpan ATA = new TimeSpan(Convert.ToInt32(uiDropDownListATAHours.Text), Convert.ToInt32(uiDropDownListATAMins.Text), 0);
                if (Convert.ToInt32(uiDropDownListATAHours.Text) < Convert.ToInt32(uiDropDownListATDHours.Text))
                {
                    objData.ATA = Convert.ToDateTime(ATA.ToString()).AddDays(1);
                }
                else
                {
                    objData.ATA = Convert.ToDateTime(ATA.ToString());
                }
                
                TimeSpan OFF = new TimeSpan(Convert.ToInt32(uiDropDownListOFFHours.Text), Convert.ToInt32(uiDropDownListOFFMins.Text), 0);
                objData.ChoxOff = Convert.ToDateTime(OFF.ToString());
                
                TimeSpan On = new TimeSpan(Convert.ToInt32(uiDropDownListOnHours.Text), Convert.ToInt32(uiDropDownListOnMins.Text), 0);
                if (Convert.ToInt32(uiDropDownListOnHours.Text) < Convert.ToInt32(uiDropDownListOFFHours.Text))
                {
                    objData.ChoxOn = Convert.ToDateTime(On.ToString()).AddDays(1);
                }
                else
                {
                    objData.ChoxOn = Convert.ToDateTime(On.ToString());
                }

                TimeSpan STA = new TimeSpan(Convert.ToInt32(uiDropDownListSTAHours.Text), Convert.ToInt32(uiDropDownListSTAMins.Text), 0);
                if (Convert.ToInt32(uiDropDownListSTAHours.Text) < Convert.ToInt32(uiDropDownListSTDHours.Text))
                {
                    objData.STA = Convert.ToDateTime(STA.ToString()).AddDays(1);
                }
                else
                {
                    objData.STA = Convert.ToDateTime(STA.ToString());
                }

                if (!string.IsNullOrEmpty(uiDropDownListDelay1Code.SelectedValue))
                {
                    objData.DepDelayID1 = Convert.ToInt32(uiDropDownListDelay1Code.SelectedValue);
                    TimeSpan Delay1 = new TimeSpan(Convert.ToInt32(uiDropDownListDelay1Hours.Text), Convert.ToInt32(uiDropDownListDelay1Mins.Text), 0);
                    objData.DepDelayTime1 = Convert.ToDateTime(Delay1.ToString());
                }

                if (!string.IsNullOrEmpty(uiDropDownListDelay2Code.SelectedValue))
                {
                    objData.DepDelayID2 = Convert.ToInt32(uiDropDownListDelay2Code.SelectedValue);
                    TimeSpan Delay2 = new TimeSpan(Convert.ToInt32(uiDropDownListDelay2Hours.Text), Convert.ToInt32(uiDropDownListDelay2Mins.Text), 0);
                    objData.DepDelayTime2 = Convert.ToDateTime(Delay2.ToString());
                }

                if (!string.IsNullOrEmpty(uiDropDownListDelay3Code.SelectedValue))
                {
                    objData.DepDelayID3 = Convert.ToInt32(uiDropDownListDelay3Code.SelectedValue);
                    TimeSpan Delay3 = new TimeSpan(Convert.ToInt32(uiDropDownListDelay3Hours.Text), Convert.ToInt32(uiDropDownListDelay3Mins.Text), 0);
                    objData.DepDelayTime3 = Convert.ToDateTime(Delay3.ToString());
                }

                if (!string.IsNullOrEmpty(uiDropDownListArrDelay1Code.SelectedValue))
                {
                    objData.ArrDelayID1 = Convert.ToInt32(uiDropDownListArrDelay1Code.SelectedValue);
                    TimeSpan ArrDelay1 = new TimeSpan(Convert.ToInt32(uiDropDownListArrDelay1Hours.Text), Convert.ToInt32(uiDropDownListArrDelay1Mins.Text), 0);
                    objData.ArrDelayTime1 = Convert.ToDateTime(ArrDelay1.ToString());
                }

                if (!string.IsNullOrEmpty(uiDropDownListArrDelay2Code.SelectedValue))
                {
                    objData.ArrDelayID2 = Convert.ToInt32(uiDropDownListArrDelay2Code.SelectedValue);
                    TimeSpan ArrDelay2 = new TimeSpan(Convert.ToInt32(uiDropDownListArrDelay2Hours.Text), Convert.ToInt32(uiDropDownListArrDelay2Mins.Text), 0);
                    objData.ArrDelayTime2 = Convert.ToDateTime(ArrDelay2.ToString());
                }

                if (!string.IsNullOrEmpty(uiDropDownListArrDelay3Code.SelectedValue))
                {
                    objData.ArrDelayID3 = Convert.ToInt32(uiDropDownListArrDelay3Code.SelectedValue);
                    TimeSpan ArrDelay3 = new TimeSpan(Convert.ToInt32(uiDropDownListArrDelay3Hours.Text), Convert.ToInt32(uiDropDownListArrDelay3Mins.Text), 0);
                    objData.ArrDelayTime3 = Convert.ToDateTime(ArrDelay3.ToString());
                }

                TimeSpan Day = new TimeSpan(Convert.ToInt32(uiDropDownListDayHours.Text), Convert.ToInt32(uiDropDownListDayMins.Text), 0);
                objData.FlyAtDay = Convert.ToDateTime(Day.ToString());

                TimeSpan Night = new TimeSpan(Convert.ToInt32(uiDropDownListNightHours.Text), Convert.ToInt32(uiDropDownListNightMins.Text), 0);
                objData.FlyAtNight = Convert.ToDateTime(Night.ToString());

              
                if (!string.IsNullOrEmpty(uiTextBoxDepFuel.Text))
                {
                    objData.DepFule = Convert.ToInt32(uiTextBoxDepFuel.Text);
                }
                if (!string.IsNullOrEmpty(uiTextBoxArrFuel.Text))
                {
                    objData.ArrFule = Convert.ToInt32(uiTextBoxArrFuel.Text);
                }
                if (!string.IsNullOrEmpty(uiTextBoxNoOFPax_A.Text))
                {
                    objData.NoOfPax_A = Convert.ToInt32(uiTextBoxNoOFPax_A.Text);
                }
                if (!string.IsNullOrEmpty(uiTextBoxNoOFPax_CH.Text))
                {
                    objData.NoOfPax_C = Convert.ToInt32(uiTextBoxNoOFPax_CH.Text);
                }
                if (!string.IsNullOrEmpty(uiTextBoxNoOFPax_I.Text))
                {
                    objData.NoOfPax_I = Convert.ToInt32(uiTextBoxNoOFPax_I.Text);
                }
                if (!string.IsNullOrEmpty(uiTextBoxTOW.Text))
                {
                    objData.TOW = Convert.ToInt32(uiTextBoxTOW.Text);
                }
                if (!string.IsNullOrEmpty(uiTextBoxZFW.Text))
                {
                    objData.ZFW = Convert.ToInt32(uiTextBoxZFW.Text);
                }


                objData.Save();                

            }
            else
            {
                Sector objData = new Sector();
                objData.AddNew();
                objData.ReportID = CurrentFlightReport.ReportID;
                objData.From_AirportID = Convert.ToInt32(uiDropDownListSectorFrom.SelectedValue);
                objData.To_AirportID = Convert.ToInt32(uiDropDownListSectorTo.SelectedValue);
                objData.FlightNo = uiTextBoxSectorFlightNo.Text;
                objData.IsPAX = false;

                if (!string.IsNullOrEmpty(uiTextBoxFule.Text))
                {
                    objData.FuleUplifted = Convert.ToInt32(uiTextBoxFule.Text);
                }

                if (!string.IsNullOrEmpty(uiTextBoxActualBurn.Text))
                {
                    objData.ActualBurnOff = Convert.ToInt32(uiTextBoxActualBurn.Text);
                }
                if (!string.IsNullOrEmpty(uiTextBoxPlanBurnOff.Text))
                {
                    objData.StandardBurnOff = Convert.ToInt32(uiTextBoxPlanBurnOff.Text);
                }


                TimeSpan STD = new TimeSpan(Convert.ToInt32(uiDropDownListSTDHours.Text), Convert.ToInt32(uiDropDownListSTDMins.Text), 0);
                objData.STD = Convert.ToDateTime(STD.ToString());

                TimeSpan ATD = new TimeSpan(Convert.ToInt32(uiDropDownListATDHours.Text), Convert.ToInt32(uiDropDownListATDMins.Text), 0);
                objData.ATD = Convert.ToDateTime(ATD.ToString());

                TimeSpan ATA = new TimeSpan(Convert.ToInt32(uiDropDownListATAHours.Text), Convert.ToInt32(uiDropDownListATAMins.Text), 0);
                if (Convert.ToInt32(uiDropDownListATAHours.Text) < Convert.ToInt32(uiDropDownListATDHours.Text))
                {
                    objData.ATA = Convert.ToDateTime(ATA.ToString()).AddDays(1);
                }
                else
                {
                    objData.ATA = Convert.ToDateTime(ATA.ToString());
                }

                TimeSpan OFF = new TimeSpan(Convert.ToInt32(uiDropDownListOFFHours.Text), Convert.ToInt32(uiDropDownListOFFMins.Text), 0);
                objData.ChoxOff = Convert.ToDateTime(OFF.ToString());

                TimeSpan On = new TimeSpan(Convert.ToInt32(uiDropDownListOnHours.Text), Convert.ToInt32(uiDropDownListOnMins.Text), 0);
                if (Convert.ToInt32(uiDropDownListOnHours.Text) < Convert.ToInt32(uiDropDownListOFFHours.Text))
                {
                    objData.ChoxOn = Convert.ToDateTime(On.ToString()).AddDays(1);
                }
                else
                {
                    objData.ChoxOn = Convert.ToDateTime(On.ToString());
                }

                TimeSpan STA = new TimeSpan(Convert.ToInt32(uiDropDownListSTAHours.Text), Convert.ToInt32(uiDropDownListSTAMins.Text), 0);
                if (Convert.ToInt32(uiDropDownListSTAHours.Text) < Convert.ToInt32(uiDropDownListSTDHours.Text))
                {
                    objData.STA = Convert.ToDateTime(STA.ToString()).AddDays(1);
                }
                else
                {
                    objData.STA = Convert.ToDateTime(STA.ToString());
                }

                if (!string.IsNullOrEmpty(uiDropDownListDelay1Code.SelectedValue))
                {
                    objData.DepDelayID1 = Convert.ToInt32(uiDropDownListDelay1Code.SelectedValue);
                    TimeSpan Delay1 = new TimeSpan(Convert.ToInt32(uiDropDownListDelay1Hours.Text), Convert.ToInt32(uiDropDownListDelay1Mins.Text), 0);
                    objData.DepDelayTime1 = Convert.ToDateTime(Delay1.ToString());
                }

                if (!string.IsNullOrEmpty(uiDropDownListDelay2Code.SelectedValue))
                {
                    objData.DepDelayID2 = Convert.ToInt32(uiDropDownListDelay2Code.SelectedValue);
                    TimeSpan Delay2 = new TimeSpan(Convert.ToInt32(uiDropDownListDelay2Hours.Text), Convert.ToInt32(uiDropDownListDelay2Mins.Text), 0);
                    objData.DepDelayTime2 = Convert.ToDateTime(Delay2.ToString());
                }

                if (!string.IsNullOrEmpty(uiDropDownListDelay3Code.SelectedValue))
                {
                    objData.DepDelayID3 = Convert.ToInt32(uiDropDownListDelay3Code.SelectedValue);
                    TimeSpan Delay3 = new TimeSpan(Convert.ToInt32(uiDropDownListDelay3Hours.Text), Convert.ToInt32(uiDropDownListDelay3Mins.Text), 0);
                    objData.DepDelayTime3 = Convert.ToDateTime(Delay3.ToString());
                }

                if (!string.IsNullOrEmpty(uiDropDownListArrDelay1Code.SelectedValue))
                {
                    objData.ArrDelayID1 = Convert.ToInt32(uiDropDownListArrDelay1Code.SelectedValue);
                    TimeSpan ArrDelay1 = new TimeSpan(Convert.ToInt32(uiDropDownListArrDelay1Hours.Text), Convert.ToInt32(uiDropDownListArrDelay1Mins.Text), 0);
                    objData.ArrDelayTime1 = Convert.ToDateTime(ArrDelay1.ToString());
                }

                if (!string.IsNullOrEmpty(uiDropDownListArrDelay2Code.SelectedValue))
                {
                    objData.ArrDelayID2 = Convert.ToInt32(uiDropDownListArrDelay2Code.SelectedValue);
                    TimeSpan ArrDelay2 = new TimeSpan(Convert.ToInt32(uiDropDownListArrDelay2Hours.Text), Convert.ToInt32(uiDropDownListArrDelay2Mins.Text), 0);
                    objData.ArrDelayTime2 = Convert.ToDateTime(ArrDelay2.ToString());
                }

                if (!string.IsNullOrEmpty(uiDropDownListArrDelay3Code.SelectedValue))
                {
                    objData.ArrDelayID3 = Convert.ToInt32(uiDropDownListArrDelay3Code.SelectedValue);
                    TimeSpan ArrDelay3 = new TimeSpan(Convert.ToInt32(uiDropDownListArrDelay3Hours.Text), Convert.ToInt32(uiDropDownListArrDelay3Mins.Text), 0);
                    objData.ArrDelayTime3 = Convert.ToDateTime(ArrDelay3.ToString());
                }

                TimeSpan Day = new TimeSpan(Convert.ToInt32(uiDropDownListDayHours.Text), Convert.ToInt32(uiDropDownListDayMins.Text), 0);
                objData.FlyAtDay = Convert.ToDateTime(Day.ToString());

                TimeSpan Night = new TimeSpan(Convert.ToInt32(uiDropDownListNightHours.Text), Convert.ToInt32(uiDropDownListNightMins.Text), 0);
                objData.FlyAtNight = Convert.ToDateTime(Night.ToString());


                if (!string.IsNullOrEmpty(uiTextBoxDepFuel.Text))
                {
                    objData.DepFule = Convert.ToInt32(uiTextBoxDepFuel.Text);
                }
                if (!string.IsNullOrEmpty(uiTextBoxArrFuel.Text))
                {
                    objData.ArrFule = Convert.ToInt32(uiTextBoxArrFuel.Text);
                }
                if (!string.IsNullOrEmpty(uiTextBoxNoOFPax_A.Text))
                {
                    objData.NoOfPax_A = Convert.ToInt32(uiTextBoxNoOFPax_A.Text);
                }
                if (!string.IsNullOrEmpty(uiTextBoxNoOFPax_CH.Text))
                {
                    objData.NoOfPax_C = Convert.ToInt32(uiTextBoxNoOFPax_CH.Text);
                }
                if (!string.IsNullOrEmpty(uiTextBoxNoOFPax_I.Text))
                {
                    objData.NoOfPax_I = Convert.ToInt32(uiTextBoxNoOFPax_I.Text);
                }
                if (!string.IsNullOrEmpty(uiTextBoxTOW.Text))
                {
                    objData.TOW = Convert.ToInt32(uiTextBoxTOW.Text);
                }
                if (!string.IsNullOrEmpty(uiTextBoxZFW.Text))
                {
                    objData.ZFW = Convert.ToInt32(uiTextBoxZFW.Text);
                }


                objData.Save();   
            }
            ClearSectorFields();
            CurrentSector = null;
            BindSectors();
        }

       

        protected void uiLinkButtonCancelSector_Click(object sender, EventArgs e)
        {
            ClearSectorFields();
            CurrentSector = null;
        }

        protected void uiGridViewSectors_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteSector")
            {
                Sector objData = new Sector();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
                BindSectors();
            }
            else if (e.CommandName == "EditSector")
            {
                Sector objData = new Sector();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                uiDropDownListSectorFrom.SelectedValue = objData.From_AirportID.ToString();
                uiDropDownListSectorTo.SelectedValue = objData.To_AirportID.ToString();
                uiTextBoxSectorFlightNo.Text = objData.FlightNo;
                if (!objData.IsColumnNull("FuleUplifted"))
                {
                    uiTextBoxFule.Text = objData.FuleUplifted.ToString();
                }
                if (!objData.IsColumnNull("ActualBurnOff"))
                {
                    uiTextBoxActualBurn.Text = objData.ActualBurnOff.ToString();
                }
                if (!objData.IsColumnNull("StandardBurnOff"))
                {
                    uiTextBoxPlanBurnOff.Text = objData.StandardBurnOff.ToString();
                }
                uiDropDownListATAHours.SelectedValue = objData.ATA.Hour.ToString("00");
                uiDropDownListATDHours.SelectedValue = objData.ATD.Hour.ToString("00");
                uiDropDownListOFFHours.SelectedValue = objData.ChoxOff.Hour.ToString("00"); ;
                uiDropDownListOnHours.SelectedValue = objData.ChoxOn.Hour.ToString("00");
                uiDropDownListSTAHours.SelectedValue = objData.STA.Hour.ToString("00");
                uiDropDownListSTDHours.SelectedValue = objData.STD.Hour.ToString("00");


                if (!objData.IsColumnNull("DepDelayID1"))
                {
                    uiDropDownListDelay1Code.SelectedValue = objData.DepDelayID1.ToString();
                    uiDropDownListDelay1Hours.SelectedValue = objData.DepDelayTime1.Hour.ToString("00");
                    uiDropDownListDelay1Mins.SelectedValue = objData.DepDelayTime1.Minute.ToString("00");
                }

                if (!objData.IsColumnNull("DepDelayID2"))
                {
                    uiDropDownListDelay2Code.SelectedValue = objData.DepDelayID2.ToString();
                    
                    uiDropDownListDelay2Hours.SelectedValue = objData.DepDelayTime2.Hour.ToString("00");
                    uiDropDownListDelay2Mins.SelectedValue = objData.DepDelayTime2.Minute.ToString("00");
                }

                if (!objData.IsColumnNull("DepDelayID3"))
                {
                    uiDropDownListDelay3Code.SelectedValue = objData.DepDelayID3.ToString();
                    uiDropDownListDelay3Hours.SelectedValue = objData.DepDelayTime3.Hour.ToString("00");
                    uiDropDownListDelay3Mins.SelectedValue = objData.DepDelayTime3.Minute.ToString("00");
                }

                if (!objData.IsColumnNull("ArrDelayID1"))
                {
                    uiDropDownListArrDelay1Code.SelectedValue = objData.ArrDelayID1.ToString();             
                    uiDropDownListArrDelay1Hours.SelectedValue = objData.ArrDelayTime1.Hour.ToString("00");
                    uiDropDownListArrDelay1Mins.SelectedValue = objData.ArrDelayTime1.Minute.ToString("00");
                }

                if (!objData.IsColumnNull("ArrDelayID2"))
                {
                    uiDropDownListArrDelay2Code.SelectedValue = objData.ArrDelayID2.ToString();
                    uiDropDownListArrDelay2Hours.SelectedValue = objData.ArrDelayTime2.Hour.ToString("00");
                    uiDropDownListArrDelay2Mins.SelectedValue = objData.ArrDelayTime2.Minute.ToString("00");
                }

                
                if (!objData.IsColumnNull("ArrDelayID3"))
                {
                    uiDropDownListArrDelay3Code.SelectedValue = objData.ArrDelayID3.ToString();
                    uiDropDownListArrDelay3Hours.SelectedValue = objData.ArrDelayTime3.Hour.ToString("00");
                    uiDropDownListArrDelay3Mins.SelectedValue = objData.ArrDelayTime3.Minute.ToString("00");
                }

                uiDropDownListDayHours.SelectedValue = objData.FlyAtDay.Hour.ToString("00");
                uiDropDownListNightHours.SelectedValue = objData.FlyAtNight.Hour.ToString("00");
                uiDropDownListATAMins.SelectedValue = objData.ATA.Minute.ToString("00");
                uiDropDownListATDMins.SelectedValue = objData.ATD.Minute.ToString("00");
                uiDropDownListOFFMins.SelectedValue = objData.ChoxOff.Minute.ToString("00");
                uiDropDownListOnMins.SelectedValue = objData.ChoxOn.Minute.ToString("00");
                uiDropDownListSTAMins.SelectedValue = objData.STA.Minute.ToString("00");
                uiDropDownListSTDMins.SelectedValue = objData.STD.Minute.ToString("00");
               
                uiDropDownListDayMins.SelectedValue = objData.FlyAtDay.Minute.ToString("00");
                uiDropDownListNightMins.SelectedValue = objData.FlyAtNight.Minute.ToString("00");

                if (!objData.IsColumnNull("DepFule"))
                {
                    uiTextBoxDepFuel.Text = objData.DepFule.ToString();
                }
                if (!objData.IsColumnNull("ArrFule"))
                {
                    uiTextBoxArrFuel.Text = objData.ArrFule.ToString();
                }
                if (!objData.IsColumnNull("NoOfPax_A"))
                {
                    uiTextBoxNoOFPax_A.Text = objData.NoOfPax_A.ToString();
                }
                if (!objData.IsColumnNull("NoOfPax_C"))
                {
                    uiTextBoxNoOFPax_CH.Text = objData.NoOfPax_C.ToString();
                }
                if (!objData.IsColumnNull("NoOfPax_I"))
                {
                    uiTextBoxNoOFPax_I.Text = objData.NoOfPax_I.ToString();
                }
                if (!objData.IsColumnNull("TOW"))
                {
                    uiTextBoxTOW.Text = objData.TOW.ToString();
                }
                if (!objData.IsColumnNull("ZFW"))
                {
                    uiTextBoxZFW.Text = objData.ZFW.ToString();
                }

                CurrentSector = objData;
            }
        }

        protected void uiGridViewSectors_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView objData = (DataRowView)e.Row.DataItem;
                AirPort From = new AirPort();
                AirPort To = new AirPort();
                From.LoadByPrimaryKey(Convert.ToInt32(objData["From_AirportID"].ToString()));
                To.LoadByPrimaryKey(Convert.ToInt32(objData["To_AirportID"].ToString()));
                Label temp = (Label)e.Row.FindControl("uiLabelFrom");
                temp.Text = From.IATACode;
                Label temp2 = (Label)e.Row.FindControl("uiLabelTo");
                temp2.Text = To.IATACode;

            }
        }
        
        /****************************************************/

        
        #endregion

        #region Methods

        private void EnableDisableTabs()
        {
            if (CurrentFlightReport == null)
            {
                uiTabPanelBasicInfo.Enabled = true;
                uiTabPanelCrewInfo.Enabled = false;
                uiTabPanelFlightInfo.Enabled = false;
            }
            else
            {
                uiTabPanelBasicInfo.Enabled = true;
                uiTabPanelCrewInfo.Enabled = true;
                uiTabPanelFlightInfo.Enabled = true;
            }
        }

        private void ClearFields()
        {            
            uiDropDownListAirCraftRegistration.SelectedIndex = 0;
            uiTextBoxFlightNo.Text = "";
            uiTextBoxDate.Text = "";
            uiCheckBoxIsHeavy.Checked = false;
            ClearSectorFields();
        }

        private void ClearSectorFields()
        {
            uiDropDownListSectorFrom.SelectedIndex = -1;
            uiDropDownListSectorTo.SelectedIndex = -1;
            uiTextBoxFule.Text = "";
            uiTextBoxSectorFlightNo.Text = "";
            uiTextBoxActualBurn.Text = "";
            uiTextBoxPlanBurnOff.Text = "";

            uiDropDownListATAHours.SelectedIndex = -1;
            uiDropDownListATDHours.SelectedIndex = -1;
            uiDropDownListOFFHours.SelectedIndex = -1;
            uiDropDownListOnHours.SelectedIndex = -1;
            uiDropDownListSTAHours.SelectedIndex = -1;
            uiDropDownListSTDHours.SelectedIndex = -1;
            uiDropDownListDelay1Hours.SelectedIndex = -1;
            uiDropDownListDelay2Hours.SelectedIndex = -1;
            uiDropDownListDelay3Hours.SelectedIndex = -1;
            uiDropDownListArrDelay1Hours.SelectedIndex = -1;
            uiDropDownListArrDelay2Hours.SelectedIndex = -1;
            uiDropDownListArrDelay3Hours.SelectedIndex = -1;
            uiDropDownListDayHours.SelectedIndex = -1;
            uiDropDownListNightHours.SelectedIndex = -1;            
            uiDropDownListATAMins.SelectedIndex = -1;
            uiDropDownListATDMins.SelectedIndex = -1;
            uiDropDownListOFFMins.SelectedIndex = -1;
            uiDropDownListOnMins.SelectedIndex = -1;
            uiDropDownListSTAMins.SelectedIndex = -1;
            uiDropDownListSTDMins.SelectedIndex = -1;
            uiDropDownListDelay1Mins.SelectedIndex = -1;
            uiDropDownListDelay2Mins.SelectedIndex = -1;
            uiDropDownListDelay3Mins.SelectedIndex = -1;
            uiDropDownListArrDelay1Mins.SelectedIndex = -1;
            uiDropDownListArrDelay2Mins.SelectedIndex = -1;
            uiDropDownListArrDelay3Mins.SelectedIndex = -1;
            uiDropDownListDayMins.SelectedIndex = -1;
            uiDropDownListNightMins.SelectedIndex = -1;            
            uiDropDownListArrDelay1Code.SelectedIndex = -1;
            uiDropDownListArrDelay2Code.SelectedIndex = -1;
            uiDropDownListArrDelay3Code.SelectedIndex = -1;
            uiDropDownListDelay1Code.SelectedIndex = -1;
            uiDropDownListDelay2Code.SelectedIndex = -1;
            uiDropDownListDelay3Code.SelectedIndex = -1;

            uiTextBoxDepFuel.Text = "";
            uiTextBoxArrFuel.Text = "";
            uiTextBoxNoOFPax_A.Text = "";
            uiTextBoxNoOFPax_CH.Text = "";
            uiTextBoxNoOFPax_I.Text = "";

            uiTextBoxTOW.Text = "";
            uiTextBoxZFW.Text = "";
        }

        public void populateDDLs()
        {
            ArrayList Hours = new ArrayList();
            for (int i = 0; i < 24; i++)
            {
                Hours.Add(i.ToString("00"));
            }

            ArrayList Mins = new ArrayList();
            for (int i = 0; i < 60; i++)
            {
                Mins.Add(i.ToString("00"));
            }

            uiDropDownListATAHours.DataSource = Hours;
            uiDropDownListATAHours.DataBind();

            uiDropDownListATDHours.DataSource = Hours;
            uiDropDownListATDHours.DataBind();

            uiDropDownListOFFHours.DataSource = Hours;
            uiDropDownListOFFHours.DataBind();

            uiDropDownListOnHours.DataSource = Hours;
            uiDropDownListOnHours.DataBind();

            uiDropDownListSTAHours.DataSource = Hours;
            uiDropDownListSTAHours.DataBind();

            uiDropDownListSTDHours.DataSource = Hours;
            uiDropDownListSTDHours.DataBind();

            uiDropDownListDelay1Hours.DataSource = Hours;
            uiDropDownListDelay1Hours.DataBind();

            uiDropDownListDelay2Hours.DataSource = Hours;
            uiDropDownListDelay2Hours.DataBind();

            uiDropDownListDelay3Hours.DataSource = Hours;
            uiDropDownListDelay3Hours.DataBind();

            uiDropDownListArrDelay1Hours.DataSource = Hours;
            uiDropDownListArrDelay1Hours.DataBind();

            uiDropDownListArrDelay2Hours.DataSource = Hours;
            uiDropDownListArrDelay2Hours.DataBind();

            uiDropDownListArrDelay3Hours.DataSource = Hours;
            uiDropDownListArrDelay3Hours.DataBind();

            uiDropDownListDayHours.DataSource = Hours;
            uiDropDownListDayHours.DataBind();

            uiDropDownListNightHours.DataSource = Hours;
            uiDropDownListNightHours.DataBind();

            uiDropDownListATAMins.DataSource = Mins;
            uiDropDownListATAMins.DataBind();

            uiDropDownListATDMins.DataSource = Mins;
            uiDropDownListATDMins.DataBind();

            uiDropDownListOFFMins.DataSource = Mins;
            uiDropDownListOFFMins.DataBind();

            uiDropDownListOnMins.DataSource = Mins;
            uiDropDownListOnMins.DataBind();

            uiDropDownListSTAMins.DataSource = Mins;
            uiDropDownListSTAMins.DataBind();

            uiDropDownListSTDMins.DataSource = Mins;
            uiDropDownListSTDMins.DataBind();

            uiDropDownListDelay1Mins.DataSource = Mins;
            uiDropDownListDelay1Mins.DataBind();

            uiDropDownListDelay2Mins.DataSource = Mins;
            uiDropDownListDelay2Mins.DataBind();

            uiDropDownListDelay3Mins.DataSource = Mins;
            uiDropDownListDelay3Mins.DataBind();

            uiDropDownListArrDelay1Mins.DataSource = Mins;
            uiDropDownListArrDelay1Mins.DataBind();

            uiDropDownListArrDelay2Mins.DataSource = Mins;
            uiDropDownListArrDelay2Mins.DataBind();

            uiDropDownListArrDelay3Mins.DataSource = Mins;
            uiDropDownListArrDelay3Mins.DataBind();

            uiDropDownListDayMins.DataSource = Mins;
            uiDropDownListDayMins.DataBind();

            uiDropDownListNightMins.DataSource = Mins;
            uiDropDownListNightMins.DataBind();
            
        }

        private void BindReportData()
        {
            Flight AllReports = new Flight();
            AllReports.LoadAll();
            AllReports.Sort = "ReportDate Desc";
            uiGridViewReports.DataSource = AllReports.DefaultView;
            uiGridViewReports.DataBind();
        }

        private void BindPilots()
        {
            FlightPilot pilots = new FlightPilot();
            pilots.GetPilotByFlightID(CurrentFlightReport.ReportID);
            uiGridViewPiolts.DataSource = pilots.DefaultView;
            uiGridViewPiolts.DataBind();
        }

        private void BindCrew()
        {
            FlightCrew crew = new FlightCrew();
            crew.GetCrewByFlightID(CurrentFlightReport.ReportID);
            uiGridViewCrew.DataSource = crew.DefaultView;
            uiGridViewCrew.DataBind();
        }

        private void BindSectors()
        {
            Sector Sectors = new Sector();
            Sectors.GetSectorsByFlightID(CurrentFlightReport.ReportID);
            uiGridViewSectors.DataSource = Sectors.DefaultView;
            uiGridViewSectors.DataBind();
        }

        private void LoadDDLs()
        {
            Pilot Allpilots = new Pilot();
            Allpilots.GetAllPilots();            
            uiDropDownListPilot.DataSource = Allpilots.DefaultView;
            uiDropDownListPilot.DataTextField = "DisplayName";
            uiDropDownListPilot.DataValueField = "PilotID";
            uiDropDownListPilot.DataBind();
            uiDropDownListPilot.Items.Insert(0, new ListItem("Select Pilot", ""));

            Pilot AllCopilots = new Pilot();
            AllCopilots.GetAllCoPilots();
            uiDropDownListCoPilot.DataSource = AllCopilots.DefaultView;
            uiDropDownListCoPilot.DataTextField = "DisplayName";
            uiDropDownListCoPilot.DataValueField = "PilotID";
            uiDropDownListCoPilot.DataBind();
            uiDropDownListCoPilot.Items.Insert(0, new ListItem("Select Co-Pilot", ""));

            Position AllPositions = new Position();
            AllPositions.LoadAll();
            uiDropDownListPilotPos.DataSource = AllPositions.DefaultView;
            uiDropDownListPilotPos.DataTextField= "Title";
            uiDropDownListPilotPos.DataValueField = "PositionID";
            uiDropDownListPilotPos.DataBind();
            uiDropDownListPilotPos.Items.Insert(0, new ListItem("Select Position", ""));

            uiDropDownListCOPos.DataSource = AllPositions.DefaultView;
            uiDropDownListCOPos.DataTextField = "Title";
            uiDropDownListCOPos.DataValueField = "PositionID";
            uiDropDownListCOPos.DataBind();
            uiDropDownListCOPos.Items.Insert(0, new ListItem("Select Position", ""));

            Crew AllCrew = new Crew();
            AllCrew.LoadAll();
            uiDropDownListCrew.DataSource = AllCrew.DefaultView;
            uiDropDownListCrew.DataTextField = "Name";
            uiDropDownListCrew.DataValueField = "CrewID";
            uiDropDownListCrew.DataBind();
            uiDropDownListCrew.Items.Insert(0, new ListItem("Select Member", ""));

            uiDropDownListCrewPos.DataSource = AllPositions.DefaultView; ;
            uiDropDownListCrewPos.DataTextField = "Title";
            uiDropDownListCrewPos.DataValueField = "PositionID";
            uiDropDownListCrewPos.DataBind();
            uiDropDownListCrewPos.Items.Insert(0, new ListItem("Select Position", ""));


            AirPort AllAirports= new AirPort();
            AllAirports.LoadAll();
            uiDropDownListSectorFrom.DataSource = AllAirports.DefaultView;
            uiDropDownListSectorFrom.DataTextField = "IATACode";
            uiDropDownListSectorFrom.DataValueField = "AirPortID";
            uiDropDownListSectorFrom.DataBind();
            uiDropDownListSectorFrom.Items.Insert(0, new ListItem("Select Airport", "0"));

            uiDropDownListSectorTo.DataSource = AllAirports.DefaultView;
            uiDropDownListSectorTo.DataTextField = "IATACode";
            uiDropDownListSectorTo.DataValueField = "AirPortID";
            uiDropDownListSectorTo.DataBind();
            uiDropDownListSectorTo.Items.Insert(0, new ListItem("Select Airport", "0"));

            Delay delays = new Delay();
            delays.LoadAll();
            uiDropDownListArrDelay1Code.DataSource = delays.DefaultView;
            uiDropDownListArrDelay1Code.DataTextField = "Code";
            uiDropDownListArrDelay1Code.DataValueField = "DelayID";
            uiDropDownListArrDelay1Code.DataBind();
            uiDropDownListArrDelay1Code.Items.Insert(0, new ListItem("Select Code", ""));

            uiDropDownListArrDelay2Code.DataSource = delays.DefaultView;
            uiDropDownListArrDelay2Code.DataTextField = "Code";
            uiDropDownListArrDelay2Code.DataValueField = "DelayID";
            uiDropDownListArrDelay2Code.DataBind();
            uiDropDownListArrDelay2Code.Items.Insert(0, new ListItem("Select Code", ""));

            uiDropDownListArrDelay3Code.DataSource = delays.DefaultView;
            uiDropDownListArrDelay3Code.DataTextField = "Code";
            uiDropDownListArrDelay3Code.DataValueField = "DelayID";
            uiDropDownListArrDelay3Code.DataBind();
            uiDropDownListArrDelay3Code.Items.Insert(0, new ListItem("Select Code", ""));

            uiDropDownListDelay1Code.DataSource = delays.DefaultView;
            uiDropDownListDelay1Code.DataTextField = "Code";
            uiDropDownListDelay1Code.DataValueField = "DelayID";
            uiDropDownListDelay1Code.DataBind();
            uiDropDownListDelay1Code.Items.Insert(0, new ListItem("Select Code", ""));

            uiDropDownListDelay2Code.DataSource = delays.DefaultView;
            uiDropDownListDelay2Code.DataTextField = "Code";
            uiDropDownListDelay2Code.DataValueField = "DelayID";
            uiDropDownListDelay2Code.DataBind();
            uiDropDownListDelay2Code.Items.Insert(0, new ListItem("Select Code", ""));

            uiDropDownListDelay3Code.DataSource = delays.DefaultView;
            uiDropDownListDelay3Code.DataTextField = "Code";
            uiDropDownListDelay3Code.DataValueField = "DelayID";
            uiDropDownListDelay3Code.DataBind();
            uiDropDownListDelay3Code.Items.Insert(0, new ListItem("Select Code", ""));


            AirPlane Ap = new AirPlane();
            Ap.LoadAll();
            uiDropDownListAirCraftRegistration.DataSource = Ap.DefaultView;
            uiDropDownListAirCraftRegistration.DataTextField = "Name";
            uiDropDownListAirCraftRegistration.DataValueField = "AirPlaneID";
            uiDropDownListAirCraftRegistration.DataBind();
        }


        #endregion

        protected void uiButtonSearch_Click(object sender, EventArgs e)
        {
            Flight r = new Flight();
            r.SearchFlights(uiTextBoxSearch.Text, !string.IsNullOrEmpty(uiTextBoxFromDate.Text) ? DateTime.ParseExact(uiTextBoxFromDate.Text,"dd/MM/yyyy",null) : DateTime.ParseExact("01/01/1900", "dd/MM/yyyy", null)
                                                     , !string.IsNullOrEmpty(uiTextBoxToDate.Text) ? DateTime.ParseExact(uiTextBoxToDate.Text, "dd/MM/yyyy", null) : DateTime.MaxValue);
            r.Sort = "ReportDate Desc";
            uiGridViewReports.DataSource = r.DefaultView;
            uiGridViewReports.DataBind();
        }

    }
}