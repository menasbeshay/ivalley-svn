using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flight_BLL;
using System.Data;
using Telerik.Web.UI;

namespace Flights_GUI.Common
{
    public partial class Tickets : System.Web.UI.Page
    {
        #region Properties
        /*public Flight CurrentFlightReport
        {
            get
            {
                if (Session["CurrentFlightReport_t"] != null)
                    return (Flight)Session["CurrentFlightReport_t"];
                else
                    return null;
            }
            set
            {
                Session["CurrentFlightReport_t"] = value;
            }
        }*/

        public Sector CurrentSector
        {
            get
            {
                if (Session["CurrentSector_t"] != null)
                    return (Sector)Session["CurrentSector_t"];
                else
                    return null;
            }
            set
            {
                Session["CurrentSector_t"] = value;
            }
        }

        public SectorPilot CurrentPilots
        {
            get
            {
                if (Session["CurrentPilots_t"] != null)
                    return (SectorPilot)Session["CurrentPilots_t"];
                else
                    return null;
            }
            set
            {
                Session["CurrentPilots_t"] = value;
            }
        }

        public DataTable CurrentPilotsTable
        {
            get
            {
                if (Session["CurrentPilotsTable"] != null)
                    return (DataTable)Session["CurrentPilotsTable"];
                else
                    return null;
            }
            set
            {
                Session["CurrentPilotsTable"] = value;
            }
        }

        public SectorCrew CurrentCrew
        {
            get
            {
                if (Session["CurrentCrew_t"] != null)
                    return (SectorCrew)Session["CurrentCrew_t"];
                else
                    return null;
            }
            set
            {
                Session["CurrentCrew_t"] = value;
            }
        }

        public DataTable CurrentCrewTable
        {
            get
            {
                if (Session["CurrentCrewTable"] != null)
                    return (DataTable)Session["CurrentCrewTable"];
                else
                    return null;
            }
            set
            {
                Session["CurrentCrewTable"] = value;
            }
        }

        public Sector MasterSector
        {
            get
            {
                if (Session["MasterSector_t"] != null)
                    return (Sector)Session["MasterSector_t"];
                else
                    return null;
            }
            set
            {
                Session["MasterSector_t"] = value;
            }
        }

        public bool IsEdit
        {
            get 
            {
                if (Session["IsEditTicket"] != null)
                    return (bool)Session["IsEditTicket"];
                else
                    return false;
            }
            set 
            {
                Session["IsEditTicket"] = value;
            }
        }

        public bool CanLoad
        {
            get
            {
                if (Session["CanLoadTicket"] != null)
                    return (bool)Session["CanLoadTicket"];
                else
                    return true;
            }
            set
            {
                Session["CanLoadTicket"] = value;
            }
        }
        #endregion

        #region DataTables
        public DataTable DT_CurrentPilots;
        public DataTable DT_CurrentCrew;
        #endregion 

        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {                
                LoadDDLs();
                InitializeDataTables(0);
                BindReportData();
                uiPanelViewAll.Visible = true;
                uiPanelEdit.Visible = false;
                
            }
        }
        
        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            uiPanelViewAll.Visible = false;
            uiPanelEdit.Visible = true;
            IsEdit = false;
            ClearFields();
            CurrentSector = new Sector();
            //CurrentFlightReport = new Flight();            
        }

        /*protected void uiGridViewReports_PageIndexChanging(object sender, GridViewPageEventArgs e)
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
                uiTextBoxSectorFlightNo.Text = objData.FlightNo;
                uiTextBoxDate.Text = objData.ReportDate.ToString("dd/MM/yyyy");                
                CurrentFlightReport = objData;
                if (!CurrentFlightReport.IsColumnNull("IsReturnFlight"))
                {
                    uiLinkButtonAddReturnFlight.Visible = (CurrentFlightReport.IsReturnFlight != true);
                }
                else
                {
                    uiLinkButtonAddReturnFlight.Visible = true;
                }
                IsEdit = true;
                CanLoad = true;
                uiPanelEdit.Visible = true;
                uiPanelViewAll.Visible = false;                
                BindSectors();
                BindCrew();
                BindPilots();
                CanLoad = false;
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
        }*/

        #region Crew
        protected void uiLinkButtonAddFlying_Click(object sender, EventArgs e)
        {
            //if(CurrentPilots == null)
            //    CurrentPilots = new FlightPilot();
            //CurrentPilots.AddNew();
            //CurrentPilots.PilotID = Convert.ToInt32(uiDropDownListPilot.SelectedValue);
            //CurrentPilots.PositionID = Convert.ToInt32(uiDropDownListPilotPos.SelectedValue);
            if (CurrentPilotsTable == null)
                InitializeDataTables(1);
            DataRow row = CurrentPilotsTable.NewRow();
            row["PilotID"] = Convert.ToInt32(uiDropDownListPilot.SelectedValue);            

            CurrentPilotsTable.Rows.Add(row);
            BindPilots();
        }

        protected void uiLinkButtonAddCo_Click(object sender, EventArgs e)
        {
            //if (CurrentPilots == null)
            //    CurrentPilots = new FlightPilot();
            //CurrentPilots.AddNew();
            //CurrentPilots.PilotID = Convert.ToInt32(uiDropDownListCoPilot.SelectedValue);
            //CurrentPilots.PositionID = Convert.ToInt32(uiDropDownListCOPos.SelectedValue);
            if (CurrentPilotsTable == null)
                InitializeDataTables(1);
            DataRow row = CurrentPilotsTable.NewRow();
            row["PilotID"] = Convert.ToInt32(uiDropDownListCoPilot.SelectedValue);            

            CurrentPilotsTable.Rows.Add(row);
            BindPilots();
        }

        protected void uiLinkButtonAddCrew_Click(object sender, EventArgs e)
        {
            //if(CurrentCrew == null)
            //    CurrentCrew = new FlightCrew();
            //CurrentCrew.AddNew();
            //CurrentCrew.CrewID = Convert.ToInt32(uiDropDownListCrew.SelectedValue);
            //CurrentCrew.PositionID = Convert.ToInt32(uiDropDownListCrewPos.SelectedValue);

            if (CurrentCrewTable == null)
                InitializeDataTables(2);
            DataRow row = CurrentCrewTable.NewRow();
            row["CrewID"] = Convert.ToInt32(uiDropDownListCrew.SelectedValue);            

            CurrentCrewTable.Rows.Add(row);
            BindCrew();
        }                

        protected void uiGridViewPiolts_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeletePilot")
            {
                //CurrentPilots.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                //CurrentPilots.MarkAsDeleted();               

                DataRow row = CurrentPilotsTable.Rows.Find(Convert.ToInt32(e.CommandArgument.ToString()));
                row.Delete();

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

                //if (objData["PositionID"] != null)
                //{
                //    Label pos = (Label)e.Row.FindControl("uiLabelPosition");
                //    Position Currentpos = new Position();
                //    Currentpos.LoadByPrimaryKey(Convert.ToInt32(objData["PositionID"].ToString()));
                //    pos.Text = Currentpos.Title;
                //}
            }
        }

        protected void uiGridViewCrew_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteCrew")
            {
                //CurrentCrew.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                //CurrentCrew.MarkAsDeleted();

                DataRow row = CurrentCrewTable.Rows.Find(Convert.ToInt32(e.CommandArgument.ToString()));
                row.Delete();
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
                //if (objData["PositionID"] != null)
                //{
                //    Label pos = (Label)e.Row.FindControl("uiLabelPosition");
                //    Position Currentpos = new Position();
                //    Currentpos.LoadByPrimaryKey(Convert.ToInt32(objData["PositionID"].ToString()));
                //    pos.Text = Currentpos.Title;
                //}
            }
        }
        #endregion

        protected void uiLinkButtonSave_Click(object sender, EventArgs e)
        {
            if (!IsEdit)
            {
                CurrentSector = new Sector();
                CurrentSector.AddNew();
            }
            CurrentSector.AirCraft_AirPlaneID = 1;
            CurrentSector.FlightNo = uiTextBoxSectorFlightNo.Text;
            CurrentSector.SectorDate = DateTime.ParseExact(uiTextBoxDate.Text, "dd/MM/yyyy", null);
            CurrentSector.IsPAX = true;                                   
            CurrentSector.From_AirportID = Convert.ToInt32(uiDropDownListSectorFrom.SelectedValue);
            CurrentSector.To_AirportID = Convert.ToInt32(uiDropDownListSectorTo.SelectedValue);                        
            CurrentSector.Save();

            if (IsEdit)
            {
                SectorPilot Oldpilots = new SectorPilot();
                Oldpilots.GetPilotBySectorID(CurrentSector.SectorID);
                Oldpilots.DeleteAll();
                Oldpilots.Save();

                SectorCrew OldCrew = new SectorCrew();
                OldCrew.GetCrewBySectorID(CurrentSector.SectorID);
                OldCrew.DeleteAll();
                OldCrew.Save();
            }

            CurrentPilots = new SectorPilot();
            for(int i=0 ;i< CurrentPilotsTable.Rows.Count ; i++)
            {
                CurrentPilots.AddNew();
                CurrentPilots.SectorID = CurrentSector.SectorID;
                CurrentPilots.PilotID = Convert.ToInt32(CurrentPilotsTable.Rows[i]["PilotID"]);
               // CurrentPilots.PositionID = Convert.ToInt32(CurrentPilotsTable.Rows[i]["PositionID"]);
                
            }
            CurrentPilots.Save();

            CurrentCrew = new SectorCrew();
            for (int i = 0; i < CurrentCrewTable.Rows.Count; i++)
            {
                CurrentCrew.AddNew();
                CurrentCrew.SectorID = CurrentSector.SectorID;
                CurrentCrew.CrewID = Convert.ToInt32(CurrentCrewTable.Rows[i]["CrewID"]);
              //  CurrentCrew.PositionID = Convert.ToInt32(CurrentCrewTable.Rows[i]["PositionID"]);
            }
            
            CurrentCrew.Save();

            if (MasterSector != null)
            {
                MasterSector.ReturnSectorID = CurrentSector.SectorID;
                CurrentSector.IsReturnSector = true;
                MasterSector.Save();
                CurrentSector.Save();
            }

            BindReportData();
            uiPanelViewAll.Visible = true;
            uiPanelEdit.Visible = false;

            MasterSector = null;
            CurrentSector = null;
            CurrentCrew = null;
            CurrentPilots = null;
            CurrentCrewTable = null;
            CurrentPilotsTable = null;
            
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            BindReportData();
            uiPanelViewAll.Visible = true;
            uiPanelEdit.Visible = false;

            MasterSector = null;
            CurrentSector = null;
            CurrentCrew = null;
            CurrentPilots = null;
            CurrentCrewTable = null;
            CurrentPilotsTable = null;
            ClearFields();
        }

        protected void uiButtonSearch_Click(object sender, EventArgs e)
        {
            Sector r = new Sector();
            r.SearchPAXSectors(uiTextBoxSearch.Text, !string.IsNullOrEmpty(uiTextBoxFromDate.Text) ? DateTime.ParseExact(uiTextBoxFromDate.Text, "dd/MM/yyyy", null) : DateTime.ParseExact("01/01/1900", "dd/MM/yyyy", null)
                                                     , !string.IsNullOrEmpty(uiTextBoxToDate.Text) ? DateTime.ParseExact(uiTextBoxToDate.Text, "dd/MM/yyyy", null) : DateTime.MaxValue);
            r.Sort = "SectorDate Desc";
            uiRadGrid.DataSource = r.DefaultView;           
            uiRadGrid.DataBind();
        }

        protected void uiLinkButtonAddReturnFlight_Click(object sender, EventArgs e)
        {
            if (!IsEdit)
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ReturnFlightValidation", "<script type='text/javascript'>alert(\"Can" + "\'t add \'Return Back Ticket\' till saving current ticket." + "\");</script>", false);
                return;
            }
            else
            {
                InitializeReturnFlight();
            }
        }

        protected void uiRadGrid_ItemCommand(object sender, GridCommandEventArgs e)
        {
            if (e.CommandName == "EditSector")
            {
                Sector objData = new Sector();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                uiTextBoxSectorFlightNo.Text = objData.FlightNo;
                uiTextBoxDate.Text = objData.SectorDate.ToString("dd/MM/yyyy");
                uiDropDownListSectorFrom.SelectedValue = objData.From_AirportID.ToString();
                uiDropDownListSectorTo.SelectedValue = objData.To_AirportID.ToString();
                CurrentSector = objData;
                IsEdit = true;
                CanLoad = true;
                uiPanelEdit.Visible = true;
                uiPanelViewAll.Visible = false;
//                BindSectors();
                BindCrew();
                BindPilots();
                CanLoad = false;
            }

            else if (e.CommandName == "DeleteSector")
            {
                Sector objData = new Sector();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                if ((objData.IsColumnNull("IsReturnSector") || objData.IsReturnSector == false) && !objData.IsColumnNull("ReturnSectorID"))
                {
                    Sector ReturnFlight = new Sector();
                    ReturnFlight.LoadByPrimaryKey(objData.ReturnSectorID);
                    ReturnFlight.IsReturnSector = false;
                    ReturnFlight.Save();

                }
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

                BindReportData();
            }
        }

        protected void uiRadGrid_PageIndexChanged(object sender, GridPageChangedEventArgs e)
        {
            BindReportData();
        }

        protected void uiLinkButtonBack_Click(object sender, EventArgs e)
        {
            ClearFields();
            uiPanelEdit.Visible = false;
            uiPanelViewAll.Visible = true;
        }

        protected void uiRadGrid_PageSizeChanged(object sender, GridPageSizeChangedEventArgs e)
        {
            BindReportData();
        }

        protected void uiRadGrid_ItemCreated(object sender, GridItemEventArgs e)
        {
            if (e.Item is GridHeaderItem && e.Item.OwnerTableView != uiRadGrid.MasterTableView)
            {
                e.Item.Style["display"] = "none";
            }

            if (e.Item is GridItem && e.Item.OwnerTableView != uiRadGrid.MasterTableView)
            {
                e.Item.Style["text-align"] = "center";
            }

            // hide expand column from child rows 
            //if (e.Item is GridNestedViewItem)
            //{                
            //    e.Item.Cells[0].Visible = false;
            //}


        }

        #endregion

        #region Methods
        private void BindReportData()
        {
            Sector AllSectors = new Sector();
            AllSectors.GetPAXSectors();
            AllSectors.Sort = "SectorDate Desc";
            //uiGridViewReports.DataSource = AllReports.DefaultView;
            //uiGridViewReports.DataBind();
            
            uiRadGrid.DataSource = AllSectors.DefaultView;
            uiRadGrid.MasterTableView.FilterExpression = "([IsReturnSector] is null) OR ([IsReturnSector] = false)";
            uiRadGrid.DataBind();
            
        }

        private void BindPilots()
        {
            /*if (CurrentFlightReport.RowCount > 0)
            {
                CurrentPilots.GetPilotByFlightID(CurrentFlightReport.ReportID);
                DT_CurrentPilots = CurrentPilots.DefaultView.Table;
            }*/
            if (IsEdit && CanLoad)
            {
                CurrentPilots = new SectorPilot();
                CurrentPilots.GetPilotBySectorID(CurrentSector.SectorID);
                InitializeDataTables(1);
                foreach (DataRow item in CurrentPilots.DefaultView.Table.Rows)
                {
                    DataRow row = CurrentPilotsTable.NewRow();
                    row["ReportPilotID"] = item["ReportPilotID"];
                    row["SectorID"] = item["SectorID"];
                    row["PilotID"] = item["PilotID"];
                    row["PositionID"] = item["PositionID"];
                    CurrentPilotsTable.Rows.Add(row);
                }                                
                uiGridViewPiolts.DataSource = CurrentPilotsTable;
            }
            else
            {
                uiGridViewPiolts.DataSource = CurrentPilotsTable;
            }
            uiGridViewPiolts.DataBind();
        }

        private void BindCrew()
        {
            if (IsEdit && CanLoad)
            {
                CurrentCrew = new SectorCrew();
                CurrentCrew.GetCrewBySectorID(CurrentSector.SectorID);
                InitializeDataTables(0);
                foreach (DataRow item in CurrentCrew.DefaultView.Table.Rows)
                {
                    DataRow row = CurrentCrewTable.NewRow();
                    row["ReportCrewID"] = item["ReportCrewID"];
                    row["SectorID"] = item["SectorID"];
                    row["CrewID"] = item["CrewID"];
                    row["PositionID"] = item["PositionID"];
                    CurrentCrewTable.Rows.Add(row);
                }             
                uiGridViewCrew.DataSource = CurrentCrewTable;
            }
            else
            {
                uiGridViewCrew.DataSource = CurrentCrewTable;
            }
            uiGridViewCrew.DataBind();
        }

        private void BindSectors()
        {
            /*CurrentSector = new Sector();
            if (IsEdit && CanLoad)
            {
                CurrentSector.GetSectorsByFlightID(CurrentFlightReport.ReportID);
                if (CurrentSector.RowCount > 0)
                {
                    uiDropDownListSectorFrom.SelectedValue = CurrentSector.From_AirportID.ToString();
                    uiDropDownListSectorTo.SelectedValue = CurrentSector.To_AirportID.ToString();
                }
            }            */           
        }

        private void InitializeDataTables(int table)
        {
            if (table == 1 || table == 0)
            {
                DataColumn Pilotcolumn = new DataColumn();
                Pilotcolumn.DataType = System.Type.GetType("System.Int32");
                Pilotcolumn.AutoIncrement = true;
                Pilotcolumn.AutoIncrementSeed = 1000;
                Pilotcolumn.AutoIncrementStep = 1;
                Pilotcolumn.ColumnName = "ReportPilotID";

                DataColumn[] Pilotkeys = new DataColumn[1];

                DT_CurrentPilots = new DataTable();
                DT_CurrentPilots.Columns.Add(Pilotcolumn);
                Pilotkeys[0] = Pilotcolumn;
                DT_CurrentPilots.PrimaryKey = Pilotkeys;
                DT_CurrentPilots.Columns.Add("SectorID");
                DT_CurrentPilots.Columns.Add("PilotID");
                DT_CurrentPilots.Columns.Add("PositionID");

                CurrentPilotsTable = DT_CurrentPilots;
            }
            if (table == 2 || table == 0)
            {
                DataColumn Crewcolumn = new DataColumn();
                Crewcolumn.DataType = System.Type.GetType("System.Int32");
                Crewcolumn.AutoIncrement = true;
                Crewcolumn.AutoIncrementSeed = 1000;
                Crewcolumn.AutoIncrementStep = 1;
                Crewcolumn.ColumnName = "ReportCrewID";

                
                DataColumn[] Crewkeys = new DataColumn[1];

                DT_CurrentCrew = new DataTable();
                DT_CurrentCrew.Columns.Add(Crewcolumn);
                Crewkeys[0] = Crewcolumn;
                DT_CurrentCrew.PrimaryKey = Crewkeys;
                DT_CurrentCrew.Columns.Add("SectorID");
                DT_CurrentCrew.Columns.Add("CrewID");
                DT_CurrentCrew.Columns.Add("PositionID");

                CurrentCrewTable = DT_CurrentCrew;
            }
            

           

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

            Crew AllCrew = new Crew();
            AllCrew.LoadAll();
            uiDropDownListCrew.DataSource = AllCrew.DefaultView;
            uiDropDownListCrew.DataTextField = "Name";
            uiDropDownListCrew.DataValueField = "CrewID";
            uiDropDownListCrew.DataBind();
            uiDropDownListCrew.Items.Insert(0, new ListItem("Select Member", ""));            

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
            
        }

        private void ClearFields()
        {            
            uiTextBoxSectorFlightNo.Text = "";
            uiTextBoxDate.Text = "";

            uiDropDownListSectorFrom.SelectedIndex = -1;
            uiDropDownListSectorTo.SelectedIndex = -1;            
            uiTextBoxSectorFlightNo.Text = "";

            uiDropDownListPilot.SelectedIndex = 0;
            uiDropDownListCoPilot.SelectedIndex = 0;           

            uiGridViewPiolts.DataSource = null;
            uiGridViewCrew.DataSource = null;            

            uiGridViewPiolts.DataBind();
            uiGridViewCrew.DataBind();
        }

        private void InitializeReturnFlight()
        {
            MasterSector = CurrentSector;
            IsEdit = false;
            uiTextBoxDate.Text = "";
            uiTextBoxSectorFlightNo.Text = "";
            uiDropDownListSectorFrom.SelectedIndex = 0;
            uiDropDownListSectorTo.SelectedIndex = 0;

        }

        #endregion               
        
    }
}