using Flight_BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flights_GUI.CabinCrew
{
    public partial class CrewTrx : System.Web.UI.Page
    {
        #region Properties
        public CrewTransaction CurrentTrx
        {
            get
            {
                if (Session["CurrentCrewTrx"] != null)
                    return (CrewTransaction)Session["CurrentCrewTrx"];
                else
                    return null;
            }
            set
            {
                Session["CurrentCrewTrx"] = value;
            }
        }
        #endregion

        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.PageTitle = "Crew Transactions";
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
                CrewTransaction objData = new CrewTransaction();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                uiRadComboBoxCrew.SelectedValue = objData.CrewID.ToString();
                uiRadComboBoxTrx.SelectedValue = objData.TransactionsID.ToString();
                uiRadDateTimePickerFrom.SelectedDate = objData.DateFrom;
                uiRadDateTimePickerTo.SelectedDate = objData.DateTo;
                CurrentTrx = objData;
                uiPanelEdit.Visible = true;
                uiPanelViewAll.Visible = false;
            }

            else if (e.CommandName == "DeleteTrx")
            {
                CrewTransaction objData = new CrewTransaction();
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
            CrewTransaction objdata = new CrewTransaction();
            if (CurrentTrx != null)
            {
                objdata = CurrentTrx;
            }
            else
            {
                objdata.AddNew();
            }

            objdata.CrewID = Convert.ToInt32(uiRadComboBoxCrew.SelectedValue);
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
            CrewTransaction objdata = new CrewTransaction();
            objdata.GetCrewTrxByCrewID((uiRadDatePickerFromSearch.SelectedDate != null) ? uiRadDatePickerFromSearch.SelectedDate.Value : DateTime.ParseExact("01/01/1900", "dd/MM/yyyy", null),
                                      (uiRadDatePickerToSearch.SelectedDate != null) ? uiRadDatePickerToSearch.SelectedDate.Value : DateTime.ParseExact("01/01/2500", "dd/MM/yyyy", null),
                                       Convert.ToInt32(uiRadComboBoxCrewSearch.SelectedValue));
            uiRadGridTrx.DataSource = objdata.DefaultView;
            uiRadGridTrx.DataBind();
        }


        private void ClearFields()
        {
            uiRadComboBoxCrew.SelectedIndex = 0;
            uiRadComboBoxTrx.SelectedIndex = 0;
            uiRadDateTimePickerFrom.Clear();
            uiRadDateTimePickerTo.Clear();
        }

        private void LoadDDLs()
        {
            Crew AllCrew = new Crew();
            AllCrew.GetAllCrew();
            AllCrew.DefaultView.Sort = "ShortName";
            uiRadComboBoxCrew.DataSource = AllCrew.DefaultView;
            uiRadComboBoxCrew.DataTextField = "DisplayName";
            uiRadComboBoxCrew.DataValueField = "CrewID";
            uiRadComboBoxCrew.DataBind();
            uiRadComboBoxCrew.Items.Insert(0, new ListItem("Select Crew", "0"));

            uiRadComboBoxCrewSearch.DataSource = AllCrew.DefaultView; ;
            uiRadComboBoxCrewSearch.DataTextField = "DisplayName";
            uiRadComboBoxCrewSearch.DataValueField = "CrewID";
            uiRadComboBoxCrewSearch.DataBind();
            uiRadComboBoxCrewSearch.Items.Insert(0, new ListItem("Select Crew", "0"));

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