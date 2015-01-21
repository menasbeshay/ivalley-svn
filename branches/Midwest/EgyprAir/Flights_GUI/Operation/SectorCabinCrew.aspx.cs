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
    public partial class SectorCabinCrew : System.Web.UI.Page
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
                Master.PageTitle = "Sector crew";
                LoadDDLs();
                BindCrew();
            }
        }

        protected void uiLinkButtonAddCrew_Click(object sender, EventArgs e)
        {
            SectorCrew Member = new SectorCrew();
            if (!CrewExists(Convert.ToInt32(uiDropDownListCrew.SelectedValue)))
            {
                Member.AddNew();
                Member.SectorID = CurrentSector.SectorID;
                Member.PositionID = Convert.ToInt32(uiDropDownListCrewPos.SelectedValue);
                Member.CrewID = Convert.ToInt32(uiDropDownListCrew.SelectedValue);
                Member.Save();
            }
            BindCrew();
        }

        protected void uiGridViewCrew_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteCrew")
            {
                SectorCrew objData = new SectorCrew();
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

        protected void uiLinkButtonBack_Click(object sender, EventArgs e)
        {
            CurrentSector = null;
            Response.Redirect("~/Operation/FlightList.aspx?" + Request.QueryString.ToString());
        }
        #endregion

        #region Methods
        private void BindCrew()
        {
            SectorCrew crew = new SectorCrew();
            crew.GetCrewBySectorID(CurrentSector.SectorID);
            uiGridViewCrew.DataSource = crew.DefaultView;
            uiGridViewCrew.DataBind();
        }

        private bool CrewExists(int CrewID)
        {
            bool exist = false;
            SectorCrew Member = new SectorCrew();
            Member.GetCrewBySectorID(CurrentSector.SectorID);
            foreach (DataRowView item in Member.DefaultView)
            {
                if (CrewID.ToString() == item["CrewID"].ToString())
                {
                    exist = true;
                    break;
                }
            }
            return exist;
        }

        private void LoadDDLs()
        {
            Crew AllCrew = new Crew();
            AllCrew.LoadAll();
            uiDropDownListCrew.DataSource = AllCrew.DefaultView;
            uiDropDownListCrew.DataTextField = "Name";
            uiDropDownListCrew.DataValueField = "CrewID";
            uiDropDownListCrew.DataBind();
            uiDropDownListCrew.Items.Insert(0, new ListItem("Select Member", ""));

            Position AllPositions = new Position();
            AllPositions.LoadAll();
            uiDropDownListCrewPos.DataSource = AllPositions.DefaultView; ;
            uiDropDownListCrewPos.DataTextField = "Title";
            uiDropDownListCrewPos.DataValueField = "PositionID";
            uiDropDownListCrewPos.DataBind();
            uiDropDownListCrewPos.Items.Insert(0, new ListItem("Select Position", ""));

        }
        #endregion
        
    }
}