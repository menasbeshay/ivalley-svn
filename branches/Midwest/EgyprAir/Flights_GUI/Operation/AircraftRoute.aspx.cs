using Flight_BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flights_GUI.Operation
{
    public partial class AircraftRoute : System.Web.UI.Page
    {
        #region Properties
        public Flight_BLL.AircraftRoute currentRoute {
            get
            {
                if (Session["CurrentAircraftRoute"] != null)
                    return (Flight_BLL.AircraftRoute)Session["CurrentAircraftRoute"];
                else
                    return null;
            }
            set
            {
                Session["CurrentAircraftRoute"] = value;
            }
        }
        #endregion

        #region Events

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDDLs();
                BindData();
                uiPanelEdit.Visible = false;
                uiPanelViewAll.Visible = true;
            }
        }


        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            uiPanelEdit.Visible = true;
            uiPanelViewAll.Visible = false;
            currentRoute = null;
            clearFields();
        }

        protected void uiRadGridAircraftRoute_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName == "EditRoute")
            {
                Flight_BLL.AircraftRoute objData = new Flight_BLL.AircraftRoute();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                uiTextBoxName.Text = objData.Name;
                if (!objData.IsColumnNull(Flight_BLL.AircraftRoute.ColumnNames.AircraftRouteDate))
                    uiRadDatePickerDate.SelectedDate = objData.AircraftRouteDate;

                if (!objData.IsColumnNull(Flight_BLL.AircraftRoute.ColumnNames.AirPlaneID))
                    uiDropDownListAircraft.SelectedValue = objData.AirPlaneID.ToString();

                uiHiddenFieldCurrentACRoute.Value = objData.AircraftRouteID.ToString();
                currentRoute= objData;
                uiPanelEdit.Visible = true;
                uiPanelViewAll.Visible = false;
            }

            else if (e.CommandName == "DeleteRoute")
            {
                Flight_BLL.AircraftRoute objData = new Flight_BLL.AircraftRoute();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                // delete sectors - pilots - crew 
                // delete route
                objData.MarkAsDeleted();
                objData.Save();
                BindData();
            }
        }

        protected void uiRadGridAircraftRoute_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            uiRadGridAircraftRoute.CurrentPageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiButtonSave_Click(object sender, EventArgs e)
        {
            Flight_BLL.AircraftRoute objdata = new Flight_BLL.AircraftRoute();
            if (currentRoute == null)
                objdata.AddNew();
            else
                objdata = currentRoute;
            objdata.Name = uiTextBoxName.Text;
            objdata.AircraftRouteDate = uiRadDatePickerDate.SelectedDate.Value;
            objdata.AirPlaneID = Convert.ToInt32(uiDropDownListAircraft.SelectedValue);
            objdata.Save();
            BindData();
            uiHiddenFieldCurrentACRoute.Value = objdata.AircraftRouteID.ToString();
            currentRoute = objdata;
            uiPanelEdit.Visible = false;
            uiPanelViewAll.Visible = true;
            //clearFields();
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            uiPanelEdit.Visible = false;
            uiPanelViewAll.Visible = true;
            clearFields();
            currentRoute = null;
        }

        #endregion

        #region Methods

        private void LoadDDLs()
        {
            AirPlane aircraft = new AirPlane();
            aircraft.LoadAll();
            uiDropDownListAircraft.DataSource = aircraft.DefaultView;
            uiDropDownListAircraft.DataTextField = AirPlane.ColumnNames.Name;
            uiDropDownListAircraft.DataValueField = AirPlane.ColumnNames.AirPlaneID;
            uiDropDownListAircraft.DataBind();
        }
        private void BindData()
        {
            Flight_BLL.AircraftRoute routes = new Flight_BLL.AircraftRoute();
            routes.LoadAll();
            uiRadGridAircraftRoute.DataSource = routes.DefaultView;
            uiRadGridAircraftRoute.DataBind();
        }

        private void clearFields()
        {
            uiTextBoxName.Text = "";
            uiRadDatePickerDate.SelectedDate = null;
            uiDropDownListAircraft.SelectedIndex = 0;
        }
        #endregion

        
    }
}