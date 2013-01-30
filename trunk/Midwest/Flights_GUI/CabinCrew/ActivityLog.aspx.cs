using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flight_BLL;
using Telerik.Web.UI;
using System.Data;

namespace Flights_GUI.CabinCrew
{
    public partial class ActivityLog : System.Web.UI.Page
    {
        #region Properties
        public ActivitiesLog CurrentActivityLog
        {
            get
            {
                if (Session["CurrentActivityLog"] != null)
                    return (ActivitiesLog)Session["CurrentActivityLog"];
                else
                    return null;
            }
            set
            {
                Session["CurrentActivityLog"] = value;
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
                uiPanelViewAll.Visible = true;
                uiPanelEdit.Visible = false;
            }
        }


        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            CurrentActivityLog = null;
            uiPanelViewAll.Visible = false;
            uiPanelEdit.Visible = true;
            ClearFields();
        }

        protected void uiRadGridActivityLog_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName == "EditActivityLog")
            {
                ActivitiesLog objData = new ActivitiesLog();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                uiRadComboBoxCabin.SelectedValue = objData.CrewID.ToString();
                uiRadComboBoxActivity.SelectedValue = objData.ActivityID.ToString();
                uiRadDatePickerFrom.SelectedDate = objData.FromDate;
                uiRadDatePickerTo.SelectedDate = objData.TODate;
                CurrentActivityLog = objData;
                uiPanelEdit.Visible = true;
                uiPanelViewAll.Visible = false;
            }

            else if (e.CommandName == "DeleteActivityLog")
            {
                ActivitiesLog objData = new ActivitiesLog();
                string[] param = e.CommandArgument.ToString().Split(new Char[] { '#' });
                objData.GetAllActivityLogForDelete(Convert.ToDateTime(param[0]), Convert.ToDateTime(param[1]), Convert.ToInt32(param[3]), Convert.ToInt32(param[2]));
                objData.DeleteAll();
                objData.Save();
                BindData();
            }
        }

        protected void uiRadGridActivityLog_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            BindData();
        }


        protected void uiRadGridActivityLog_ItemDataBound(object sender, GridItemEventArgs e)
        {
            if (e.Item.ItemType == GridItemType.AlternatingItem || e.Item.ItemType == GridItemType.Item)
            {
                DataRowView row = (DataRowView)e.Item.DataItem;
                Crew c = new Crew();
                c.LoadByPrimaryKey(Convert.ToInt32(row["CrewID"].ToString()));
                Label CrewName = (Label)e.Item.FindControl("uiLabelName");
                CrewName.Text = c.Name;

                Flight_BLL.Activities Act = new Flight_BLL.Activities();
                Act.LoadByPrimaryKey(Convert.ToInt32(row["ActivityID"].ToString()));
                Label ActName = (Label)e.Item.FindControl("uiLabelActivityName");
                ActName.Text = Act.Name;

            }
        }


        protected void uiButtonSave_Click(object sender, EventArgs e)
        {
            ActivitiesLog objdata = new ActivitiesLog();
            objdata.AddNew();
            for (int i = 0; i <= uiRadDatePickerTo.SelectedDate.Value.Day - uiRadDatePickerFrom.SelectedDate.Value.Day; i++)
            {
                objdata.AddNew();
                objdata.CrewID = Convert.ToInt32(uiRadComboBoxCabin.SelectedValue);
                objdata.ActivityID = Convert.ToInt32(uiRadComboBoxActivity.SelectedValue);
                objdata.FromDate = uiRadDatePickerFrom.SelectedDate.Value;
                objdata.TODate = uiRadDatePickerTo.SelectedDate.Value;
                objdata.Date = uiRadDatePickerFrom.SelectedDate.Value.AddDays(i);
            }            
            objdata.Save();
            BindData();           
            uiPanelViewAll.Visible = true;
            uiPanelEdit.Visible = false;
            ClearFields();
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            CurrentActivityLog = null;
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
            ActivitiesLog objdata = new ActivitiesLog();
            objdata.GetAllActivityLog((uiRadDatePickerFromSearch.SelectedDate != null) ? uiRadDatePickerFromSearch.SelectedDate.Value : DateTime.ParseExact("01/01/1900", "dd/MM/yyyy", null),
                                      (uiRadDatePickerToSearch.SelectedDate != null) ? uiRadDatePickerToSearch.SelectedDate.Value : DateTime.ParseExact("01/01/2500", "dd/MM/yyyy", null),
                                      Convert.ToInt32(uiRadComboBoxActSearch.SelectedValue), Convert.ToInt32(uiRadComboBoxCrewSearch.SelectedValue));
            uiRadGridActivityLog.DataSource = objdata.DefaultView;
            uiRadGridActivityLog.DataBind();
        }


        private void ClearFields()
        {
            uiRadComboBoxCabin.SelectedIndex = 0;
            uiRadComboBoxActivity.SelectedIndex = 0;
            uiRadDatePickerFrom.Clear();
            uiRadDatePickerTo.Clear();            
        }

        private void LoadDDLs()
        {
            Crew AllCrew = new Crew();
            AllCrew.LoadAll();
            AllCrew.DefaultView.Sort = "Name";
            uiRadComboBoxCabin.DataSource = AllCrew.DefaultView;
            uiRadComboBoxCabin.DataTextField = "Name";
            uiRadComboBoxCabin.DataValueField = "CrewID";
            uiRadComboBoxCabin.DataBind();
            uiRadComboBoxCabin.Items.Insert(0, new RadComboBoxItem("Select Crew", "0"));

            uiRadComboBoxCrewSearch.DataSource = AllCrew.DefaultView; ;
            uiRadComboBoxCrewSearch.DataTextField = "Name";
            uiRadComboBoxCrewSearch.DataValueField = "CrewID";
            uiRadComboBoxCrewSearch.DataBind();
            uiRadComboBoxCrewSearch.Items.Insert(0, new RadComboBoxItem("Select Crew", "0"));


            Flight_BLL.Activities AllAct = new Flight_BLL.Activities();
            AllAct.LoadAll();
            uiRadComboBoxActivity.DataSource = AllAct.DefaultView;
            uiRadComboBoxActivity.DataTextField = "Name";
            uiRadComboBoxActivity.DataValueField = "ActivityID";
            uiRadComboBoxActivity.DataBind();
            uiRadComboBoxActivity.Items.Insert(0, new RadComboBoxItem("Select Activity", "0"));

            uiRadComboBoxActSearch.DataSource = AllAct.DefaultView; ;
            uiRadComboBoxActSearch.DataTextField = "Name";
            uiRadComboBoxActSearch.DataValueField = "ActivityID";
            uiRadComboBoxActSearch.DataBind();
            uiRadComboBoxActSearch.Items.Insert(0, new RadComboBoxItem("Select Activity", "0"));

        }


        #endregion

    }
}