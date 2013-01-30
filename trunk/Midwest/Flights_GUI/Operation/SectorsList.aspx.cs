using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flight_BLL;
using System.Data;
using System.Collections;
using System.Drawing;
using System.Web.Security;

namespace Flights_GUI.Operation
{
    public partial class SectorsList : System.Web.UI.Page
    {
        #region Properties
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
                SearchSectors();
                ViewButtons();
                uiPanelViewAll.Visible = true;
            }
        }

        protected void uiRadGridFlights_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            Sector objData = new Sector();
            objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
            CurrentSector = objData;
            if (e.CommandName == "EditSectorDetails")
            {
                
                if (Roles.IsUserInRole("Operation"))
                {
                    Response.Redirect("~/Operation/SectorDetails.aspx?F=" + uiRadDatePickerFrom.SelectedDate.Value.ToString("dd/MM/yyyy") + "&T=" + uiRadDatePickerTo.SelectedDate.Value.ToString("dd/MM/yyyy"));
                }
                else if (Roles.IsUserInRole("Commercial"))
                {
                    Response.Redirect("~/Operation/InitiateSector.aspx?F=" + uiRadDatePickerFrom.SelectedDate.Value.ToString("dd/MM/yyyy") + "&T=" + uiRadDatePickerTo.SelectedDate.Value.ToString("dd/MM/yyyy"));
                }
                
            }
            else if (e.CommandName == "EditSectorPilots")
            {
                Response.Redirect("~/Operation/SectorPilots.aspx?F=" + uiRadDatePickerFrom.SelectedDate.Value.ToString("dd/MM/yyyy") + "&T=" + uiRadDatePickerTo.SelectedDate.Value.ToString("dd/MM/yyyy"));
            }
            else if (e.CommandName == "EditSectorCrew")
            {
                Response.Redirect("~/Operation/SectorCabinCrew.aspx?F=" + uiRadDatePickerFrom.SelectedDate.Value.ToString("dd/MM/yyyy") + "&T=" + uiRadDatePickerTo.SelectedDate.Value.ToString("dd/MM/yyyy"));
            }
            else if (e.CommandName == "DeleteSector")
            {
                
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
                SearchSectors();
            }

            else if (e.CommandName == "ViewReport")
            {
                Response.Redirect("FlightReport.aspx?RID=" + e.CommandArgument.ToString());
            }
        }
       
        protected void uiRadGridFlights_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            SearchSectors();
        }

        protected void uiRadGridFlights_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
        {
            SearchSectors();
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

                //Sector sectors = new Sector();
                //sectors.GetSectorsByFlightID(Convert.ToInt32(row["ReportID"].ToString()));
                //foreach (DataRowView item in sectors.DefaultView)
                //{
                if (!string.IsNullOrEmpty(row["ChoxOn"].ToString()) && !string.IsNullOrEmpty(row["ChoxOff"].ToString()))
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
                
                if (Roles.IsUserInRole("Commercial") || Roles.IsUserInRole("SuperAdmin"))
                {
                    LinkButton delButton = (LinkButton)e.Item.FindControl("uiLinkButtonDelete");
                    if(delButton != null)
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

        protected void uiButtonSearch_Click(object sender, EventArgs e)
        {
            SearchSectors();
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {            
            CurrentSector = null;
            Response.Redirect("~/Operation/InitiateSector.aspx?F=" + uiRadDatePickerFrom.SelectedDate.Value.ToString("dd/MM/yyyy") + "&T=" + uiRadDatePickerTo.SelectedDate.Value.ToString("dd/MM/yyyy"));
        }        

        #endregion

        #region Methods
        private void ViewButtons()
        {
            if (Request.IsAuthenticated)
            {
                AddDiv.Visible = false;
                if (Roles.IsUserInRole("SuperAdmin") || Roles.IsUserInRole("Commercial"))
                {
                    AddDiv.Visible = true;
                }                
            }
            else
            {
                Response.Redirect("~/login.aspx");
            }
        }
        
        private void SearchSectors()
        {
            Sector sectorObj = new Sector();
            if (Request.QueryString["F"] != null)
            {
                uiRadDatePickerFrom.SelectedDate = DateTime.ParseExact(Request.QueryString["F"].ToString(),"dd/MM/yyyy",null);
            }
            else if(uiRadDatePickerFrom.SelectedDate == null)
            {
                uiRadDatePickerFrom.SelectedDate = GetWeekStartDaTe();
            }
            if (Request.QueryString["T"] != null)
            {
                uiRadDatePickerTo.SelectedDate = DateTime.ParseExact(Request.QueryString["T"].ToString(), "dd/MM/yyyy", null);
            }
            else if (uiRadDatePickerTo.SelectedDate == null)
            {
                uiRadDatePickerTo.SelectedDate = GetWeekStartDaTe().AddDays(7);
            }

            sectorObj.SearchSectors(uiTextBoxSearch.Text, (uiRadDatePickerFrom.SelectedDate != null) ? uiRadDatePickerFrom.SelectedDate.Value : DateTime.ParseExact("01/" + DateTime.Now.Month.ToString("00") + "/" + DateTime.Now.Year.ToString(), "dd/MM/yyyy", null)
                , (uiRadDatePickerTo.SelectedDate != null) ? uiRadDatePickerTo.SelectedDate.Value : DateTime.ParseExact(((DateTime.Now.Month != 2) ? "30" : "28") + "/" + DateTime.Now.Month.ToString("00") + "/" + DateTime.Now.Year.ToString(), "dd/MM/yyyy", null));
            sectorObj.Sort = "SectorDate Desc";

            if (uiRadDatePickerFrom.SelectedDate == null)
            {
                uiRadDatePickerFrom.SelectedDate = DateTime.ParseExact("01/" + DateTime.Now.Month.ToString("00") + "/" + DateTime.Now.Year.ToString(), "dd/MM/yyyy", null);
            }
            if (uiRadDatePickerTo.SelectedDate == null)
            {
                uiRadDatePickerTo.SelectedDate = DateTime.ParseExact(((DateTime.Now.Month != 2) ? "30" : "28") + "/" + DateTime.Now.Month.ToString("00") + "/" + DateTime.Now.Year.ToString(), "dd/MM/yyyy", null);
            }

            uiRadGridFlights.DataSource = sectorObj.DefaultView;
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
        #endregion
    }
}