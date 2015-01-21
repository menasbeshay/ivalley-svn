using Flight_BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Flights_GUI.Operation
{
    public partial class PilotTrx : System.Web.UI.Page
    {
        #region Properties
        public PilotTransaction CurrentTrx
        {
            get
            {
                if (Session["CurrentTrx"] != null)
                    return (PilotTransaction)Session["CurrentTrx"];
                else
                    return null;
            }
            set
            {
                Session["CurrentTrx"] = value;
            }
        }
        #endregion

        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.PageTitle = "Pilot Transactions";
                LoadDDLs();
                BindData();
                uiPanelViewAll.Visible = true;
                uiPanelEdit.Visible = false;
            }
        }


        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            CurrentTrx = null;
            uiPanelViewAll.Visible = false;
            uiPanelEdit.Visible = true;
            ClearFields();
        }

        protected void uiRadGridTrx_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName == "EditTrx")
            {
                PilotTransaction objData = new PilotTransaction();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                uiRadComboBoxPilot.SelectedValue = objData.PilotID.ToString();
                uiRadComboBoxTrx.SelectedValue = objData.TransactionsID.ToString();
                uiRadDateTimePickerFrom.SelectedDate = objData.DateFrom;
                uiRadDateTimePickerTo.SelectedDate = objData.DateTo;
                CurrentTrx = objData;
                uiPanelEdit.Visible = true;
                uiPanelViewAll.Visible = false;
            }

            else if (e.CommandName == "DeleteTrx")
            {
                PilotTransaction objData = new PilotTransaction();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                
                objData.MarkAsDeleted();
                objData.Save();
                BindData();
            }
        }

        protected void uiRadGridTrx_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            BindData();
        }       


        protected void uiButtonSave_Click(object sender, EventArgs e)
        {
            PilotTransaction objdata = new PilotTransaction();
            if (CurrentTrx != null)
            {
                objdata = CurrentTrx;
            }
            else
            { 
                objdata.AddNew();
            }
            
            objdata.PilotID = Convert.ToInt32(uiRadComboBoxPilot.SelectedValue);
            objdata.TransactionsID = Convert.ToInt32(uiRadComboBoxTrx.SelectedValue);
            objdata.DateFrom = uiRadDateTimePickerFrom.SelectedDate.Value;
            objdata.DateTo = uiRadDateTimePickerTo.SelectedDate.Value;
            
            objdata.Save();
            BindData();
            CurrentTrx = null;
            uiPanelViewAll.Visible = true;
            uiPanelEdit.Visible = false;
            ClearFields();
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            CurrentTrx = null;
            uiPanelViewAll.Visible = true;
            uiPanelEdit.Visible = false;
            ClearFields();
        }


        protected void uiButtonSearch_Click(object sender, EventArgs e)
        {
            BindData();
        }
        #endregion

        #region Methods

        private void BindData()
        {
            PilotTransaction objdata = new PilotTransaction();
            objdata.GetPilotTrxByPilotID((uiRadDatePickerFromSearch.SelectedDate != null) ? uiRadDatePickerFromSearch.SelectedDate.Value : DateTime.ParseExact("01/01/1900", "dd/MM/yyyy", null),
                                      (uiRadDatePickerToSearch.SelectedDate != null) ? uiRadDatePickerToSearch.SelectedDate.Value : DateTime.ParseExact("01/01/2500", "dd/MM/yyyy", null),
                                       Convert.ToInt32(uiRadComboBoxPilotSearch.SelectedValue));
            uiRadGridTrx.DataSource = objdata.DefaultView;
            uiRadGridTrx.DataBind();
        }


        private void ClearFields()
        {
            uiRadComboBoxPilot.SelectedIndex = 0;
            uiRadComboBoxTrx.SelectedIndex = 0;
            uiRadDateTimePickerFrom.Clear();
            uiRadDateTimePickerTo.Clear();
        }

        private void LoadDDLs()
        {
            Pilot AllCrew = new Pilot();
            AllCrew.LoadAll();
            AllCrew.DefaultView.Sort = "ShortName";
            uiRadComboBoxPilot.DataSource = AllCrew.DefaultView;
            uiRadComboBoxPilot.DataTextField = "ShortName";
            uiRadComboBoxPilot.DataValueField = "PilotID";
            uiRadComboBoxPilot.DataBind();
            uiRadComboBoxPilot.Items.Insert(0, new ListItem("Select Pilot", "0"));

            uiRadComboBoxPilotSearch.DataSource = AllCrew.DefaultView; ;
            uiRadComboBoxPilotSearch.DataTextField = "ShortName";
            uiRadComboBoxPilotSearch.DataValueField = "PilotID";
            uiRadComboBoxPilotSearch.DataBind();
            uiRadComboBoxPilotSearch.Items.Insert(0,new ListItem("Select Pilot", "0"));

            Transactions AllAct = new Transactions();
            AllAct.LoadAll();
            uiRadComboBoxTrx.DataSource = AllAct.DefaultView;
            uiRadComboBoxTrx.DataTextField = "Name";
            uiRadComboBoxTrx.DataValueField = "TransactionsID";
            uiRadComboBoxTrx.DataBind();
            uiRadComboBoxTrx.Items.Insert(0, new ListItem("Select Transaction", "0"));


        }


        #endregion
    }
}