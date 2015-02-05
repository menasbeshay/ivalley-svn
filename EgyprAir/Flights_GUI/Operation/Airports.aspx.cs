using Flight_BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flights_GUI.Operation
{
    public partial class Airports : System.Web.UI.Page
    {
        #region Properties
        public AirPort CurrentAirport
        {
            get
            {
                if (Session["CurrentAirport"] != null)
                    return (AirPort)Session["CurrentAirport"];
                else
                    return null;
            }
            set
            {
                Session["CurrentAirport"] = value;
            }
        }
        #endregion

        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.PageTitle = "Airports";
                BindData();
                uiPanelViewAll.Visible = true;
                uiPanelEdit.Visible = false;
            }
        }

        protected void uiRadGridAirports_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName == "EditAirport")
            {
                AirPort objData = new AirPort();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                uiTextBoxName.Text = objData.Name;
                uiTextBoxCode.Text = objData.IATACode;
                CurrentAirport = objData;
                uiPanelEdit.Visible = true;
                uiPanelViewAll.Visible = false;
            }

            else if (e.CommandName == "DeleteAirport")
            {
                AirPort objData = new AirPort();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
                BindData();
            }
        }

        protected void uiRadGridAirports_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            BindData();
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            CurrentAirport = null;
            uiPanelViewAll.Visible = false;
            uiPanelEdit.Visible = true;
            ClearFields();
        }

        protected void uiButtonSave_Click(object sender, EventArgs e)
        {
            AirPort objdata = new AirPort();
            if (CurrentAirport == null)
                objdata.AddNew();
            else
                objdata = CurrentAirport;
            objdata.Name = uiTextBoxName.Text;
            objdata.IATACode = uiTextBoxCode.Text;
            objdata.Save();
            BindData();
            CurrentAirport = null;
            uiPanelViewAll.Visible = true;
            uiPanelEdit.Visible = false;
            ClearFields();

        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            CurrentAirport = null;
            uiPanelViewAll.Visible = true;
            uiPanelEdit.Visible = false;
            ClearFields();
        }
        #endregion

        #region Methods

        private void BindData()
        {
            AirPort objdata = new AirPort();
            objdata.LoadAll();
            uiRadGridAirports.DataSource = objdata.DefaultView;
            uiRadGridAirports.DataBind();

        }


        private void ClearFields()
        {
            uiTextBoxName.Text = "";
            uiTextBoxCode.Text = "";
        }


        #endregion
    }
}