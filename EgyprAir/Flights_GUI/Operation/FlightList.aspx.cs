using Flight_BLL;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flights_GUI.Operation
{
    public partial class FlightList : System.Web.UI.Page
    {
        #region Properties
        public Flight CurrentFlight
        {
            get
            {
                if (Session["CurrentFlight"] != null)
                    return (Flight)Session["CurrentFlight"];
                else
                    return null;
            }
            set
            {
                Session["CurrentFlight"] = value;
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
                Master.PageTitle = "Flights' list";

                CurrentFlight = null;
                CurrentSector = null;
                LoadFlightTypes();
                LoadAirCrafts();
                SearchFlights();
                ViewButtons();
                // sector data 
                populateDDLs();
                LoadDDLs();

                SystemSettings settings = new SystemSettings();
                settings.LoadByPrimaryKey(1);
                uiLabelFlightPrefix.Text = settings.FlightNoPrefix;
                uiLabelSectorPrefix.Text = settings.FlightNoPrefix;

                uiPanelAllFlights.Visible = true;
                uiPanelFlightDetails.Visible = false;
                uiPanelSectors.Visible = false;
                uiPanelSectorDetails.Visible = false;

            }
        }

        private void LoadAirCrafts()
        {
            AirPlane plans = new AirPlane();
            plans.LoadAll();
            uiDropDownListACType.DataSource = plans.DefaultView;
            uiDropDownListACType.DataTextField = AirPlane.ColumnNames.Name;
            uiDropDownListACType.DataValueField = AirPlane.ColumnNames.AirPlaneID;
            uiDropDownListACType.DataBind();

            uiDropDownListAirCraftRegistration.DataSource = plans.DefaultView;
            uiDropDownListAirCraftRegistration.DataTextField = AirPlane.ColumnNames.Name;
            uiDropDownListAirCraftRegistration.DataValueField = AirPlane.ColumnNames.AirPlaneID;
            uiDropDownListAirCraftRegistration.DataBind();
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            CurrentFlight = null;
            CurrentSector = null;
            uiPanelFlightDetails.Visible = true;
            uiPanelAllFlights.Visible = false;
            uiPanelSectors.Visible = false;
            uiPanelSectorDetails.Visible = false;
        }  

        protected void uiButtonSearch_Click(object sender, EventArgs e)
        {
            SearchFlights();
        }

        protected void uiRadGridFlights_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {

            if (e.CommandName == "EditFlightDetails")
            {

                Flight objData = new Flight();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                CurrentFlight = objData;
                uiTextBoxFlightNo.Text = CurrentFlight.FlightNo.Substring(3);
                uiRadioButtonListFlightType.SelectedValue = CurrentFlight.FlightTypeID.ToString();
                uiDropDownListACType.SelectedValue = CurrentFlight.AirCraft_AirPlaneID.ToString();
                uiRaddatepickerFlightDate.SelectedDate = CurrentFlight.FlightDate;
                LoadSectors();
                uiPanelAllFlights.Visible = false;
                uiPanelFlightDetails.Visible = true;
                uiPanelSectors.Visible = true;
                uiPanelSectorDetails.Visible = false;
                ViewButtons();
            }

            else if (e.CommandName == "DeleteFlight")
            {

                Flight objData = new Flight();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                CurrentFlight = objData;

                Sector allsector = new Sector();
                allsector.GetSectorsByFlightID(CurrentFlight.FlightID);
                for (int i = 0; i < allsector.RowCount; i++)
                {
                    SectorCrew crew = new SectorCrew();
                    crew.GetCrewBySectorID(allsector.SectorID);
                    SectorPilot pilots = new SectorPilot();
                    pilots.GetPilotBySectorID(allsector.SectorID);

                    pilots.DeleteAll();
                    pilots.Save();

                    crew.DeleteAll();
                    crew.Save();

                    allsector.MoveNext();
                }

                allsector.DeleteAll();
                allsector.Save();

                objData.MarkAsDeleted();
                objData.Save();
                CurrentFlight = null;
                SearchFlights();
            }

            else if (e.CommandName == "ViewReport")
            {

                Flight objData = new Flight();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                CurrentFlight = objData;
                Response.Redirect("FlightReport.aspx?RID=" + e.CommandArgument.ToString());
            }
        }

        protected void uiRadGridFlights_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            SearchFlights();
        }

        protected void uiRadGridFlights_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
        {
            SearchFlights();
        }

        protected void uiRadGridFlights_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item.ItemType == Telerik.Web.UI.GridItemType.Item || e.Item.ItemType == Telerik.Web.UI.GridItemType.AlternatingItem)
            {
                DataRowView row = (DataRowView)e.Item.DataItem;
                AirPlane plane = new AirPlane();
                plane.LoadByPrimaryKey(Convert.ToInt32(row["AirCraft_AirPlaneID"].ToString()));
                Label l = (Label)e.Item.FindControl("uiLabelAirCraft");
                l.Text = plane.Name;

                FlightType type = new FlightType();
                type.LoadByPrimaryKey(Convert.ToInt32(row["FlightTypeID"].ToString()));
                Label t = (Label)e.Item.FindControl("uiLabelFlightType");
                t.Text = type.Name;

                //Sector sectors = new Sector();
                //sectors.GetSectorsByFlightID(Convert.ToInt32(row["ReportID"].ToString()));
                //foreach (DataRowView item in sectors.DefaultView)
                //{
                /*if (!string.IsNullOrEmpty(row["ChoxOn"].ToString()) && !string.IsNullOrEmpty(row["ChoxOff"].ToString()))
                {
                    if (DateTime.Parse(row["ChoxOn"].ToString()).Subtract(DateTime.Parse(row["ChoxOff"].ToString())) == TimeSpan.Zero)
                    {
                        e.Item.BackColor = Color.FromArgb(240, 176, 106);
                        //break;
                    }
                    else
                    {
                        e.Item.BackColor = Color.LightBlue;
                    }
                }
                else
                {
                    e.Item.BackColor = Color.FromArgb(240, 176, 106);
                }
                */
                if (Roles.IsUserInRole("Commercial") || Roles.IsUserInRole("SuperAdmin") || Roles.IsUserInRole("Operation"))
                {
                    LinkButton delButton = (LinkButton)e.Item.FindControl("uiLinkButtonDelete");
                    if (delButton != null)
                        delButton.Visible = true;
                }

                if (Roles.IsUserInRole("Operation") || Roles.IsUserInRole("SuperAdmin"))
                {
                    LinkButton delButton = (LinkButton)e.Item.FindControl("uiLinkButtonEditPilots");
                    if (delButton != null)
                        delButton.Visible = true;
                }

                if (Roles.IsUserInRole("CabinCrew Admin") || Roles.IsUserInRole("SuperAdmin"))
                {
                    LinkButton delButton = (LinkButton)e.Item.FindControl("uiLinkButtonCrew");
                    if (delButton != null)
                        delButton.Visible = true;
                }
                //}
            }
        }

        protected void uiRadGridSectors_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item.ItemType == Telerik.Web.UI.GridItemType.Item || e.Item.ItemType == Telerik.Web.UI.GridItemType.AlternatingItem)
            {
                DataRowView row = (DataRowView)e.Item.DataItem;
                AirPlane plane = new AirPlane();
                plane.LoadByPrimaryKey(Convert.ToInt32(row["AirCraft_AirPlaneID"].ToString()));
                Label l = (Label)e.Item.FindControl("uiLabelAirCraft");
                l.Text = plane.Name;
                
                if (row["From_AirportID"] != null)
                {
                    AirPort from = new AirPort();
                    from.LoadByPrimaryKey(Convert.ToInt32(row["From_AirportID"].ToString()));
                    Label lblfrom = (Label)e.Item.FindControl("uiLabelFrom");
                    lblfrom.Text = from.IATACode;
                }
                if (row["To_AirportID"] != null)
                {
                    AirPort to = new AirPort();
                    to.LoadByPrimaryKey(Convert.ToInt32(row["To_AirportID"].ToString()));
                    Label lblto = (Label)e.Item.FindControl("uiLabelTo");
                    lblto.Text = to.IATACode;
                }
                //Sector sectors = new Sector();
                //sectors.GetSectorsByFlightID(Convert.ToInt32(row["ReportID"].ToString()));
                //foreach (DataRowView item in sectors.DefaultView)
                //{
                /*if (!string.IsNullOrEmpty(row["ChoxOn"].ToString()) && !string.IsNullOrEmpty(row["ChoxOff"].ToString()))
                {
                    if (DateTime.Parse(row["ChoxOn"].ToString()).Subtract(DateTime.Parse(row["ChoxOff"].ToString())) == TimeSpan.Zero)
                    {
                        e.Item.BackColor = Color.FromArgb(240, 176, 106);
                        //break;
                    }
                    else
                    {
                        e.Item.BackColor = Color.LightBlue;
                    }
                }
                else
                {
                    e.Item.BackColor = Color.FromArgb(240, 176, 106);
                }*/

                if (Roles.IsUserInRole("Commercial") || Roles.IsUserInRole("SuperAdmin") || Roles.IsUserInRole("Operation"))
                {
                    LinkButton delButton = (LinkButton)e.Item.FindControl("uiLinkButtonDelete");
                    if (delButton != null)
                        delButton.Visible = true;
                }

                if (Roles.IsUserInRole("Operation") || Roles.IsUserInRole("SuperAdmin"))
                {
                    LinkButton delButton = (LinkButton)e.Item.FindControl("uiLinkButtonEditPilots");
                    if (delButton != null)
                        delButton.Visible = true;
                }

                if (Roles.IsUserInRole("CabinCrew Admin") || Roles.IsUserInRole("SuperAdmin"))
                {
                    LinkButton delButton = (LinkButton)e.Item.FindControl("uiLinkButtonCrew");
                    if (delButton != null)
                        delButton.Visible = true;
                }
                //}
            }
        }

        protected void uiRadGridSectors_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {                                  
            if (e.CommandName == "EditSectorDetails")
            {

                Sector objData = new Sector();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                CurrentSector = objData;
                FillSectorData();
                /*
                if (Roles.IsUserInRole("Operation") || Roles.IsUserInRole("Dispatcher"))
                {
                    Response.Redirect("~/Operation/SectorDetails.aspx?F=" + uiRadDatePickerFrom.SelectedDate.Value.ToString("dd/MM/yyyy") + "&T=" + uiRadDatePickerTo.SelectedDate.Value.ToString("dd/MM/yyyy"));
                }
                else if (Roles.IsUserInRole("Commercial"))
                {
                    Response.Redirect("~/Operation/InitiateSector.aspx?F=" + uiRadDatePickerFrom.SelectedDate.Value.ToString("dd/MM/yyyy") + "&T=" + uiRadDatePickerTo.SelectedDate.Value.ToString("dd/MM/yyyy"));
                }*/
                uiPanelAllFlights.Visible = false;
                uiPanelFlightDetails.Visible = false;
                uiPanelSectors.Visible = false;
                uiPanelSectorDetails.Visible = true;
            }
            else if (e.CommandName == "EditSectorPilots")
            {

                Sector objData = new Sector();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                CurrentSector = objData;
                Response.Redirect("~/Operation/SectorPilots.aspx?F=" + uiRadDatePickerFrom.SelectedDate.Value.ToString("dd/MM/yyyy") + "&T=" + uiRadDatePickerTo.SelectedDate.Value.ToString("dd/MM/yyyy"));
            }
            else if (e.CommandName == "EditSectorCrew")
            {

                Sector objData = new Sector();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                CurrentSector = objData;
                Response.Redirect("~/Operation/SectorCabinCrew.aspx?F=" + uiRadDatePickerFrom.SelectedDate.Value.ToString("dd/MM/yyyy") + "&T=" + uiRadDatePickerTo.SelectedDate.Value.ToString("dd/MM/yyyy"));
            }
            else if (e.CommandName == "DeleteSector")
            {

                Sector objData = new Sector();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                CurrentSector = objData;
                SectorCrew crew = new SectorCrew();
                crew.GetCrewBySectorID(objData.SectorID);
                SectorPilot pilots = new SectorPilot();
                pilots.GetPilotBySectorID(objData.SectorID);

                pilots.DeleteAll();
                pilots.Save();

                crew.DeleteAll();
                crew.Save();

                objData.MarkAsDeleted();
                objData.Save();
                CurrentSector = null;
                LoadSectors();
            }

            else if (e.CommandName == "ViewReport")
            {

                Sector objData = new Sector();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                CurrentSector = objData;
                Response.Redirect("FlightReport.aspx?RID=" + e.CommandArgument.ToString());
            }
        }

        protected void uiLinkButtonSaveFlight_Click(object sender, EventArgs e)
        {
            Flight objData = new Flight();
            if (CurrentFlight == null)
            {
                objData.AddNew();
            }
            else
                objData = CurrentFlight;

            objData.FlightNo = uiLabelFlightPrefix.Text + uiTextBoxFlightNo.Text;
            objData.FlightTypeID = Convert.ToInt32(uiRadioButtonListFlightType.SelectedValue);
            objData.AirCraft_AirPlaneID = Convert.ToInt32(uiDropDownListACType.SelectedValue);
            objData.FlightDate = uiRaddatepickerFlightDate.SelectedDate.Value;
            objData.IsHeavy = false;
            objData.Save();

            CurrentFlight = objData;

            LoadSectors();
            ViewButtons();
            uiPanelFlightDetails.Visible = true;
            uiPanelAllFlights.Visible = false;
            uiPanelSectors.Visible = true;
            uiPanelSectorDetails.Visible = false;
            
        }

        protected void uiLinkButtonAddSector_Click(object sender, EventArgs e)
        {
            uiPanelAllFlights.Visible = false;
            uiPanelFlightDetails.Visible = false;
            uiPanelSectorDetails.Visible = true;
            uiPanelSectors.Visible = false;
            ClearSectorFields();
            CurrentSector = null;
        }

        protected void uiLinkButtonBack_Click(object sender, EventArgs e)
        {
            uiPanelFlightDetails.Visible = false;
            uiPanelSectorDetails.Visible = false;
            uiPanelSectors.Visible = false;
            uiPanelAllFlights.Visible = true;
            CurrentFlight = null;
            CurrentSector = null;
        }
        #endregion

        #region Methods
        private void ViewButtons()
        {
            if (Request.IsAuthenticated)
            {
                AddDiv.Visible = false;
                if (Roles.IsUserInRole("SuperAdmin") || Roles.IsUserInRole("Commercial") || Roles.IsUserInRole("Operation"))
                {
                    AddDiv.Visible = true;
                }

                if (CurrentFlight != null)
                {
                    Sector allsec = new Sector();
                    allsec.GetSectorsByFlightID(CurrentFlight.FlightID);
                    switch (CurrentFlight.FlightTypeID)
                    {
                        case 1: // one way
                            AddSector.Visible = !(allsec.RowCount == 1);
                            break;
                        case 2: // round trip
                            AddSector.Visible = !(allsec.RowCount == 2);
                            break;
                        case 3: // multi sector
                            AddSector.Visible = true;
                            break;
                        default:
                            break;
                    }
                }
            }
            else
            {
                Response.Redirect("~/login.aspx");
            }
        }

        private void SearchFlights()
        {
            Flight flightObj = new Flight();

            if (Request.QueryString["F"] != null && uiRadDatePickerFrom.SelectedDate == null)
            {
                uiRadDatePickerFrom.SelectedDate = DateTime.ParseExact(Request.QueryString["F"].ToString(), "dd/MM/yyyy", null);
            }

            if (uiRadDatePickerFrom.SelectedDate == null)
            {
                uiRadDatePickerFrom.SelectedDate = GetWeekStartDaTe();
            }

            if (Request.QueryString["T"] != null && uiRadDatePickerTo.SelectedDate == null)
            {
                uiRadDatePickerTo.SelectedDate = DateTime.ParseExact(Request.QueryString["T"].ToString(), "dd/MM/yyyy", null);
            }

            if (uiRadDatePickerTo.SelectedDate == null)
            {
                uiRadDatePickerTo.SelectedDate = GetWeekStartDaTe().AddDays(7);
            }


            flightObj.SearchFlights(uiTextBoxSearch.Text, (uiRadDatePickerFrom.SelectedDate != null) ? uiRadDatePickerFrom.SelectedDate.Value : DateTime.ParseExact("01/" + DateTime.Now.Month.ToString("00") + "/" + DateTime.Now.Year.ToString(), "dd/MM/yyyy", null)
                , (uiRadDatePickerTo.SelectedDate != null) ? uiRadDatePickerTo.SelectedDate.Value : DateTime.ParseExact(((DateTime.Now.Month != 2) ? "30" : "28") + "/" + DateTime.Now.Month.ToString("00") + "/" + DateTime.Now.Year.ToString(), "dd/MM/yyyy", null));
            

            if (uiRadDatePickerFrom.SelectedDate == null)
            {
                uiRadDatePickerFrom.SelectedDate = DateTime.ParseExact("01/" + DateTime.Now.Month.ToString("00") + "/" + DateTime.Now.Year.ToString(), "dd/MM/yyyy", null);
            }
            if (uiRadDatePickerTo.SelectedDate == null)
            {
                uiRadDatePickerTo.SelectedDate = DateTime.ParseExact(((DateTime.Now.Month != 2) ? "30" : "28") + "/" + DateTime.Now.Month.ToString("00") + "/" + DateTime.Now.Year.ToString(), "dd/MM/yyyy", null);
            }

            uiRadGridFlights.DataSource = flightObj.DefaultView;
            uiRadGridFlights.DataBind();
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
        
        private void LoadFlightTypes()
        {
            FlightType types = new FlightType();
            types.LoadAll();
            uiRadioButtonListFlightType.DataSource = types.DefaultView;
            uiRadioButtonListFlightType.DataTextField = FlightType.ColumnNames.Name;
            uiRadioButtonListFlightType.DataValueField = FlightType.ColumnNames.FlightTypeID;
            uiRadioButtonListFlightType.DataBind();
            uiRadioButtonListFlightType.SelectedIndex = 0;
        }
        
        private void LoadSectors()
        {
            Sector AllSectors = new Sector();
            if (CurrentFlight != null)
            {
                AllSectors.GetSectorsByFlightID(CurrentFlight.FlightID);
                uiRadgridSectors.DataSource = AllSectors.DefaultView;
            }
            else
                uiRadgridSectors.DataSource = null;
            uiRadgridSectors.DataBind();
        }
      
        /* sector methods */
        private void ClearSectorFields()
        {
            uiTextBoxFule.Text = "";
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

        private void FillSectorData()
        {

            if (!CurrentSector.IsColumnNull("FuleUplifted"))
            {
                uiTextBoxFule.Text = CurrentSector.FuleUplifted.ToString();
            }
            if (!CurrentSector.IsColumnNull("ActualBurnOff"))
            {
                uiTextBoxActualBurn.Text = CurrentSector.ActualBurnOff.ToString();
            }
            if (!CurrentSector.IsColumnNull("StandardBurnOff"))
            {
                uiTextBoxPlanBurnOff.Text = CurrentSector.StandardBurnOff.ToString();
            }
            if (!CurrentSector.IsColumnNull("ATA"))
            {
                uiDropDownListATAHours.SelectedValue = CurrentSector.ATA.Hour.ToString("00");
                uiDropDownListATAMins.SelectedValue = CurrentSector.ATA.Minute.ToString("00");

            }
            if (!CurrentSector.IsColumnNull("ATD"))
            {
                uiDropDownListATDHours.SelectedValue = CurrentSector.ATD.Hour.ToString("00");
                uiDropDownListATDMins.SelectedValue = CurrentSector.ATD.Minute.ToString("00");

            }
            if (!CurrentSector.IsColumnNull("ChoxOff"))
            {
                uiDropDownListOFFHours.SelectedValue = CurrentSector.ChoxOff.Hour.ToString("00");
                uiDropDownListOFFMins.SelectedValue = CurrentSector.ChoxOff.Minute.ToString("00");

            }
            if (!CurrentSector.IsColumnNull("ChoxOn"))
            {
                uiDropDownListOnHours.SelectedValue = CurrentSector.ChoxOn.Hour.ToString("00");
                uiDropDownListOnMins.SelectedValue = CurrentSector.ChoxOn.Minute.ToString("00");

            }
            if (!CurrentSector.IsColumnNull("STA"))
            {
                uiDropDownListSTAHours.SelectedValue = CurrentSector.STA.Hour.ToString("00");
                uiDropDownListSTAMins.SelectedValue = CurrentSector.STA.Minute.ToString("00");

            }
            if (!CurrentSector.IsColumnNull("STD"))
            {
                uiDropDownListSTDHours.SelectedValue = CurrentSector.STD.Hour.ToString("00");
                uiDropDownListSTDMins.SelectedValue = CurrentSector.STD.Minute.ToString("00");
            }

            if (!CurrentSector.IsColumnNull("DepDelayID1"))
            {
                uiDropDownListDelay1Code.SelectedValue = CurrentSector.DepDelayID1.ToString();
                uiDropDownListDelay1Hours.SelectedValue = CurrentSector.DepDelayTime1.Hour.ToString("00");
                uiDropDownListDelay1Mins.SelectedValue = CurrentSector.DepDelayTime1.Minute.ToString("00");
            }

            if (!CurrentSector.IsColumnNull("DepDelayID2"))
            {
                uiDropDownListDelay2Code.SelectedValue = CurrentSector.DepDelayID2.ToString();

                uiDropDownListDelay2Hours.SelectedValue = CurrentSector.DepDelayTime2.Hour.ToString("00");
                uiDropDownListDelay2Mins.SelectedValue = CurrentSector.DepDelayTime2.Minute.ToString("00");
            }

            if (!CurrentSector.IsColumnNull("DepDelayID3"))
            {
                uiDropDownListDelay3Code.SelectedValue = CurrentSector.DepDelayID3.ToString();
                uiDropDownListDelay3Hours.SelectedValue = CurrentSector.DepDelayTime3.Hour.ToString("00");
                uiDropDownListDelay3Mins.SelectedValue = CurrentSector.DepDelayTime3.Minute.ToString("00");
            }

            if (!CurrentSector.IsColumnNull("ArrDelayID1"))
            {
                uiDropDownListArrDelay1Code.SelectedValue = CurrentSector.ArrDelayID1.ToString();
                uiDropDownListArrDelay1Hours.SelectedValue = CurrentSector.ArrDelayTime1.Hour.ToString("00");
                uiDropDownListArrDelay1Mins.SelectedValue = CurrentSector.ArrDelayTime1.Minute.ToString("00");
            }

            if (!CurrentSector.IsColumnNull("ArrDelayID2"))
            {
                uiDropDownListArrDelay2Code.SelectedValue = CurrentSector.ArrDelayID2.ToString();
                uiDropDownListArrDelay2Hours.SelectedValue = CurrentSector.ArrDelayTime2.Hour.ToString("00");
                uiDropDownListArrDelay2Mins.SelectedValue = CurrentSector.ArrDelayTime2.Minute.ToString("00");
            }


            if (!CurrentSector.IsColumnNull("ArrDelayID3"))
            {
                uiDropDownListArrDelay3Code.SelectedValue = CurrentSector.ArrDelayID3.ToString();
                uiDropDownListArrDelay3Hours.SelectedValue = CurrentSector.ArrDelayTime3.Hour.ToString("00");
                uiDropDownListArrDelay3Mins.SelectedValue = CurrentSector.ArrDelayTime3.Minute.ToString("00");
            }

            if (!CurrentSector.IsColumnNull("FlyAtDay"))
            {
                uiDropDownListDayHours.SelectedValue = CurrentSector.FlyAtDay.Hour.ToString("00");
                uiDropDownListDayMins.SelectedValue = CurrentSector.FlyAtDay.Minute.ToString("00");
            }

            if (!CurrentSector.IsColumnNull("FlyAtDay"))
            {
                uiDropDownListNightHours.SelectedValue = CurrentSector.FlyAtNight.Hour.ToString("00");
                uiDropDownListNightMins.SelectedValue = CurrentSector.FlyAtNight.Minute.ToString("00");
            }

            if (!CurrentSector.IsColumnNull("DepFule"))
            {
                uiTextBoxDepFuel.Text = CurrentSector.DepFule.ToString();
            }
            if (!CurrentSector.IsColumnNull("ArrFule"))
            {
                uiTextBoxArrFuel.Text = CurrentSector.ArrFule.ToString();
            }
            if (!CurrentSector.IsColumnNull("NoOfPax_A"))
            {
                uiTextBoxNoOFPax_A.Text = CurrentSector.NoOfPax_A.ToString();
            }
            if (!CurrentSector.IsColumnNull("NoOfPax_C"))
            {
                uiTextBoxNoOFPax_CH.Text = CurrentSector.NoOfPax_C.ToString();
            }
            if (!CurrentSector.IsColumnNull("NoOfPax_I"))
            {
                uiTextBoxNoOFPax_I.Text = CurrentSector.NoOfPax_I.ToString();
            }
            if (!CurrentSector.IsColumnNull("TOW"))
            {
                uiTextBoxTOW.Text = CurrentSector.TOW.ToString();
            }
            if (!CurrentSector.IsColumnNull("ZFW"))
            {
                uiTextBoxZFW.Text = CurrentSector.ZFW.ToString();
            }
            if (!CurrentSector.IsColumnNull("SectorDate"))
            {
                uiRaddatepickerSectorDate.SelectedDate = CurrentSector.SectorDate;                
            }
            if (!CurrentSector.IsColumnNull("FlightNo"))
            {
                uiTextBoxSectorFlightNo.Text = CurrentSector.FlightNo.Substring(3);                
            }

            if (!CurrentSector.IsColumnNull("From_AirportID"))
            {
                uiDropDownListSectorFrom.SelectedValue = CurrentSector.From_AirportID.ToString();
            }

            if (!CurrentSector.IsColumnNull("To_AirportID"))
            {
                uiDropDownListSectorTo.SelectedValue = CurrentSector.To_AirportID.ToString();
            }

            uiCheckBoxIsHeavy.Checked = CurrentSector.IsHeavy;
            if (!CurrentSector.IsColumnNull("AirCraft_AirPlaneID"))
            {
                uiDropDownListAirCraftRegistration.SelectedValue = CurrentSector.AirCraft_AirPlaneID.ToString();
            }

            if (!CurrentSector.IsColumnNull("PilotCityID"))
            {
                uiDropDownListNightCity.SelectedValue = CurrentSector.PilotCityID.ToString();
            }

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

        private void LoadDDLs()
        {

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

            AirPort AllAirports = new AirPort();
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

            uiDropDownListNightCity.DataSource = AllAirports.DefaultView;
            uiDropDownListNightCity.DataTextField = "IATACode";
            uiDropDownListNightCity.DataValueField = "AirPortID";
            uiDropDownListNightCity.DataBind();
            uiDropDownListNightCity.Items.Insert(0, new ListItem("Select City", "0"));
  

        }
        #endregion

        protected void uiLinkButtonSaveSector_Click(object sender, EventArgs e)
        {
            if (CurrentSector != null)
            {
                Sector objData = CurrentSector;
                if (uiRaddatepickerSectorDate.SelectedDate != null)
                    objData.SectorDate = uiRaddatepickerSectorDate.SelectedDate.Value;
                objData.From_AirportID = Convert.ToInt32(uiDropDownListSectorFrom.SelectedValue);
                objData.To_AirportID = Convert.ToInt32(uiDropDownListSectorTo.SelectedValue);
                objData.FlightNo = uiLabelSectorPrefix.Text + uiTextBoxSectorFlightNo.Text;
                objData.IsHeavy = uiCheckBoxIsHeavy.Checked;
                objData.AirCraft_AirPlaneID = Convert.ToInt32(uiDropDownListAirCraftRegistration.SelectedValue);
                if (uiDropDownListNightCity.SelectedIndex != 0)
                    objData.PilotCityID = Convert.ToInt32(uiDropDownListNightCity.SelectedValue);

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
                objData.FlightID = CurrentFlight.FlightID;
                if (uiRaddatepickerSectorDate.SelectedDate != null)
                    objData.SectorDate = uiRaddatepickerSectorDate.SelectedDate.Value;
                objData.From_AirportID = Convert.ToInt32(uiDropDownListSectorFrom.SelectedValue);
                objData.To_AirportID = Convert.ToInt32(uiDropDownListSectorTo.SelectedValue);
                objData.FlightNo = uiTextBoxSectorFlightNo.Text;
                objData.IsHeavy = uiCheckBoxIsHeavy.Checked;
                objData.AirCraft_AirPlaneID = Convert.ToInt32(uiDropDownListAirCraftRegistration.SelectedValue);
                if (uiDropDownListNightCity.SelectedIndex != 0)
                    objData.PilotCityID = Convert.ToInt32(uiDropDownListNightCity.SelectedValue);

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
            uiPanelFlightDetails.Visible = true;
            uiPanelAllFlights.Visible = false;
            uiPanelSectors.Visible = true;
            uiPanelSectorDetails.Visible = false;
            LoadSectors();
            CurrentSector = null;
        }

        protected void uiLinkButtonCancelSector_Click(object sender, EventArgs e)
        {
            CurrentSector = null;
            uiPanelFlightDetails.Visible = true;
            uiPanelAllFlights.Visible = false;
            uiPanelSectors.Visible = true;
            uiPanelSectorDetails.Visible = false;            
        }

       

        
    }
}