using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flight_BLL;
using System.Data;

namespace Flights_GUI.Operation
{
    public partial class PAX : System.Web.UI.Page
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

        protected void uiButtonSearch_Click(object sender, EventArgs e)
        {
            Flight r = new Flight();
            r.SearchPAXFlights(uiTextBoxSearch.Text, !string.IsNullOrEmpty(uiTextBoxFromDate.Text) ? DateTime.ParseExact(uiTextBoxFromDate.Text, "dd/MM/yyyy", null) : DateTime.ParseExact("01/01/1900", "dd/MM/yyyy", null)
                                                     , !string.IsNullOrEmpty(uiTextBoxToDate.Text) ? DateTime.ParseExact(uiTextBoxToDate.Text, "dd/MM/yyyy", null) : DateTime.MaxValue);            
            uiGridViewReports.DataSource = r.DefaultView;
            uiGridViewReports.DataBind();
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

        protected void uiLinkButtonSaveSector_Click(object sender, EventArgs e)
        {
            if (CurrentSector != null)
            {
                Sector objData = CurrentSector;
                objData.ReportID = CurrentFlightReport.ReportID;
                objData.From_AirportID = Convert.ToInt32(uiDropDownListSectorFrom.SelectedValue);
                objData.To_AirportID = Convert.ToInt32(uiDropDownListSectorTo.SelectedValue);
                objData.FlightNo = CurrentFlightReport.FlightNo;
                objData.IsPAX = true;                
                objData.Save();
            }
            else
            {
                Sector objData = new Sector();
                objData.AddNew();
                objData.ReportID = CurrentFlightReport.ReportID;
                objData.From_AirportID = Convert.ToInt32(uiDropDownListSectorFrom.SelectedValue);
                objData.To_AirportID = Convert.ToInt32(uiDropDownListSectorTo.SelectedValue);
                objData.FlightNo = CurrentFlightReport.FlightNo;
                objData.IsPAX = true;
                objData.Save();
            }
            ClearSectorFields();
            CurrentSector = null;
            BindSectors();
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
                //uiTextBoxSectorFlightNo.Text = objData.FlightNo;
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

        protected void uiLinkButtonCancelSector_Click(object sender, EventArgs e)
        {
            ClearSectorFields();
            CurrentSector = null;
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

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentFlightReport = null;
            uiPanelEdit.Visible = false;
            uiPanelViewAll.Visible = true;
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

        /********************************** Crew Section *****************************************/

        
        #endregion

        #region Methods

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

        private void BindReportData()
        {
            Flight AllReports = new Flight();
            AllReports.GetPAXFlights();
            AllReports.Sort = "ReportDate Desc";
            uiGridViewReports.DataSource = AllReports.DefaultView;
            uiGridViewReports.DataBind();
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
            uiDropDownListPilotPos.DataTextField = "Title";
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


            AirPort AllAirports = new AirPort();
            AllAirports.LoadAll();
            uiDropDownListSectorFrom.DataSource = AllAirports.DefaultView;
            uiDropDownListSectorFrom.DataTextField = "IATACode";
            uiDropDownListSectorFrom.DataValueField = "AirPortID";
            uiDropDownListSectorFrom.DataBind();
            uiDropDownListSectorFrom.Items.Insert(0, new ListItem("Select Airport", ""));

            uiDropDownListSectorTo.DataSource = AllAirports.DefaultView;
            uiDropDownListSectorTo.DataTextField = "IATACode";
            uiDropDownListSectorTo.DataValueField = "AirPortID";
            uiDropDownListSectorTo.DataBind();
            uiDropDownListSectorTo.Items.Insert(0, new ListItem("Select Airport", ""));
            

            AirPlane Ap = new AirPlane();
            Ap.LoadAll();
            uiDropDownListAirCraftRegistration.DataSource = Ap.DefaultView;
            uiDropDownListAirCraftRegistration.DataTextField = "Name";
            uiDropDownListAirCraftRegistration.DataValueField = "AirPlaneID";
            uiDropDownListAirCraftRegistration.DataBind();
        }

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
            //uiTextBoxSectorFlightNo.Text = "";
        }
        #endregion

        

       
        
    }
}