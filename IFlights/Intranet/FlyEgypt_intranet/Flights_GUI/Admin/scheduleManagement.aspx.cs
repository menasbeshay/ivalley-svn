using Flight_BLL;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flights_GUI.Admin
{
    public partial class schedualManagement : System.Web.UI.Page
    {
        #region Properties
        
        public Schedule CurrentSchedule
        {
            get
            {
                if (Session["CurrentSchedule"] != null)
                    return (Schedule)Session["CurrentSchedule"];
                else
                    return null;
            }
            set
            {
                Session["CurrentSchedule"] = value;
            }
        }

        public ScheduleVersion CurrentScheduleVersion
        {
            get
            {
                if (Session["CurrentScheduleVersion"] != null)
                    return (ScheduleVersion)Session["CurrentScheduleVersion"];
                else
                    return null;
            }
            set
            {
                Session["CurrentScheduleVersion"] = value;
            }
        }
        #endregion

        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.PageTitle = "Schedule Management";                
                BindData();
                uiPanelViewAll.Visible = true;
                uiPanelEdit.Visible = false;
                uiPanelVersions.Visible = false;
                uiPanelEditVersions.Visible = false;
            }
        }


        protected void uiRadGridmanuals_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName == "EditSchedule")
            {
                Schedule objData = new Schedule();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                uiTextBoxTitle.Text = objData.Name;
                if (!objData.IsColumnNull(Schedule.ColumnNames.StartDate))
                    uiRadDatePickerStartDate.SelectedDate = objData.StartDate;
                if (!objData.IsColumnNull(Schedule.ColumnNames.EndDate))
                    uiRadDatePickerEndDate.SelectedDate = objData.EndDate;
                CurrentSchedule = objData;
                uiPanelEdit.Visible = true;
                uiPanelViewAll.Visible = false;
                uiPanelEditVersions.Visible = false;
                uiPanelVersions.Visible = true;
                
                BindData_Versions();
            }

            else if (e.CommandName == "DeleteSchedule")
            {
                Schedule objData = new Schedule();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                ScheduleVersion versions = new ScheduleVersion();
                versions.GetVersionsByScheduleID(objData.ScheduleID);
                versions.DeleteAll();
                versions.Save();

                objData.MarkAsDeleted();
                objData.Save();
                BindData();
            }
        }

        protected void uiRadGridmanuals_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            uiRadGridmanuals.CurrentPageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            CurrentSchedule = null;
            uiPanelViewAll.Visible = false;
            uiPanelEdit.Visible = true;
            uiPanelEditVersions.Visible = false;
            uiPanelVersions.Visible = false;
            
            ClearFields();
        }

        protected void uiButtonSave_Click(object sender, EventArgs e)
        {
            Schedule objdata = new Schedule();
            if (CurrentSchedule == null)
            {
                objdata.AddNew();
                objdata.CreatedBy = new Guid(Membership.GetUser().ProviderUserKey.ToString());
                objdata.CreatedDate = DateTime.Now;
            }
            else
                objdata = CurrentSchedule;
            objdata.Name = uiTextBoxTitle.Text;
            if (uiRadDatePickerStartDate.SelectedDate != null)
                objdata.StartDate = uiRadDatePickerStartDate.SelectedDate.Value;
            if (uiRadDatePickerEndDate.SelectedDate != null)
                objdata.EndDate = uiRadDatePickerEndDate.SelectedDate.Value;
            objdata.UpdatedBy = new Guid(Membership.GetUser().ProviderUserKey.ToString());
            objdata.LastUpdatedDate = DateTime.Now;
            
            objdata.Save();
            BindData();
            CurrentSchedule = objdata;
            uiPanelViewAll.Visible = false;
            uiPanelVersions.Visible = true;
            uiPanelEditVersions.Visible = false;
            uiPanelEdit.Visible = true;
            
            //ClearFields();

            // add new notifications   
      
            /*ManualCategory cat = new ManualCategory();
            cat.GetTopMostParent(CurrentSchedule.ManualCategoryID);

            if (CurrentSchedule.ManualCategoryID == 12)
            {
                SendingNotifications.sendNotif(5, CurrentSchedule.ManualCategoryID, CurrentSchedule.ManualID, null, null, null);
            }
            else
            {
                if (!cat.IsColumnNull(ManualCategory.ColumnNames.ParentCategoryID))
                {
                    if (cat.ParentCategoryID != 12)
                        SendingNotifications.sendNotif(3, CurrentSchedule.ManualCategoryID, CurrentSchedule.ManualID, null, null, null);
                    else
                        SendingNotifications.sendNotif(5, CurrentSchedule.ManualCategoryID, CurrentSchedule.ManualID, null, null, null);
                }
                else
                    SendingNotifications.sendNotif(3, CurrentSchedule.ManualCategoryID, CurrentSchedule.ManualID, null, null, null);
            }*/
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            CurrentSchedule = null;
            CurrentScheduleVersion = null;
            uiPanelViewAll.Visible = true;
            uiPanelVersions.Visible = false;
            uiPanelEditVersions.Visible = false;
            uiPanelEdit.Visible = false;
            ClearFields();
        }


        #endregion

        #region Methods

        private void BindData()
        {
            Schedule objdata = new Schedule();
            objdata.GetAllSchedules();
            uiRadGridmanuals.DataSource = objdata.DefaultView;
            uiRadGridmanuals.DataBind();

        }


        private void ClearFields()
        {
            uiTextBoxTitle.Text = "";
            /*uiTextBoxCreatedBy.Text = "";
            uiTextBoxIssueNo.Text = "";
            uiTextBoxRevisionNo.Text = "";*/
            
            uiRadDatePickerStartDate.SelectedDate = null;
            uiRadDatePickerEndDate.SelectedDate = null;
        }


        #endregion


        #region Versions
        protected void uiLinkButtonAddVersion_Click(object sender, EventArgs e)
        {
            CurrentScheduleVersion = null;
            uiPanelViewAll.Visible = false;
            uiPanelEdit.Visible = false;
            uiPanelVersions.Visible = false;
            uiPanelEditVersions.Visible = true;
            ClearFields_Versions();
        }

        protected void uiRadGridVersions_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName == "EditVersion")
            {
                ScheduleVersion objData = new ScheduleVersion();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                uiTextBoxVersionTitle.Text = objData.Title;
                uiTextBoxNotes.Text = objData.Notes;
                uiTextBoxIssueNo.Text = objData.IssueNumber;
                uiTextBoxRevisionNo.Text = objData.RevisionNumber;
                if (!objData.IsColumnNull(ScheduleVersion.ColumnNames.IssueDate))
                    uiRadDatePickerIssueDate.SelectedDate = objData.IssueDate;
                if (!objData.IsColumnNull(ScheduleVersion.ColumnNames.RevisionDate))
                    uiRadDatePickerRevisionDate.SelectedDate = objData.RevisionDate;
                CurrentScheduleVersion = objData;
                uiPanelEdit.Visible = false;
                uiPanelViewAll.Visible = false;
                uiPanelEditVersions.Visible = true;
                uiPanelVersions.Visible = false;
            }

            else if (e.CommandName == "DeleteVersion")
            {

                ScheduleVersion versions = new ScheduleVersion();
                versions.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                versions.MarkAsDeleted();
                versions.Save();

                BindData_Versions();
            }
        }

        protected void uiRadGridVersions_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            uiRadGridVersions.CurrentPageIndex = e.NewPageIndex;
            BindData_Versions();
        }

        protected void uiButtonSaveVersion_Click(object sender, EventArgs e)
        {
            ScheduleVersion objdata = new ScheduleVersion();
            if (CurrentScheduleVersion == null)
            {
                objdata.AddNew();
                objdata.CreatedBy = new Guid(Membership.GetUser().ProviderUserKey.ToString());
                objdata.CreatedDate = DateTime.Now;
            }
            else
                objdata = CurrentScheduleVersion;
            objdata.Title = uiTextBoxVersionTitle.Text;
            objdata.Notes = uiTextBoxNotes.Text;
            objdata.UpdatedBy = new Guid(Membership.GetUser().ProviderUserKey.ToString());
            objdata.LastUpdatedDate = DateTime.Now;
            objdata.IssueNumber = uiTextBoxIssueNo.Text;
            objdata.RevisionNumber = uiTextBoxRevisionNo.Text;
            if (uiRadDatePickerIssueDate.SelectedDate != null)
                objdata.IssueDate = uiRadDatePickerIssueDate.SelectedDate.Value;
            if (uiRadDatePickerRevisionDate.SelectedDate != null)
                objdata.RevisionDate = uiRadDatePickerRevisionDate.SelectedDate.Value;
            objdata.ScheduleID = CurrentSchedule.ScheduleID;

            if (Session["CurrentUploadedFiles"] != null)
            {
                Hashtable Files;
                Files = (Hashtable)Session["CurrentUploadedFiles"];

                if (Files.Count > 0)
                {
                    foreach (DictionaryEntry item in Files)
                    {
                        objdata.Path = item.Value.ToString();
                    }

                    Session["CurrentUploadedFiles"] = null;
                }

            }

            objdata.Save();
            // add new notifications 
            /*ManualCategory cat = new ManualCategory();
            cat.GetTopMostParent(CurrentSchedule.ManualCategoryID);

            if (CurrentSchedule.ManualCategoryID == 12)
            {
                SendingNotifications.sendNotif(5, CurrentSchedule.ManualCategoryID, CurrentSchedule.ManualID, null, objdata.ManualVersionID, null);
            }
            else
            {
                if (!cat.IsColumnNull(ManualCategory.ColumnNames.ParentCategoryID))
                {
                    if (cat.ParentCategoryID != 12)
                        SendingNotifications.sendNotif(3, CurrentSchedule.ManualCategoryID, CurrentSchedule.ManualID, null, objdata.ManualVersionID, null);
                    else
                        SendingNotifications.sendNotif(5, CurrentSchedule.ManualCategoryID, CurrentSchedule.ManualID, null, objdata.ManualVersionID, null);
                }
                else
                    SendingNotifications.sendNotif(3, CurrentSchedule.ManualCategoryID, CurrentSchedule.ManualID, null, objdata.ManualVersionID, null);
            }*/

            BindData_Versions();
            CurrentScheduleVersion = null;
            uiPanelViewAll.Visible = false;
            uiPanelVersions.Visible = true;
            uiPanelEditVersions.Visible = false;
            uiPanelEdit.Visible = true;
            ClearFields_Versions();


        }

        protected void uiLinkButtonCancelVersion_Click(object sender, EventArgs e)
        {
            CurrentScheduleVersion = null;
            uiPanelVersions.Visible = true;
            uiPanelEditVersions.Visible = false;
            uiPanelViewAll.Visible = false;
            uiPanelEdit.Visible = true;
            ClearFields_Versions();
        }      

        private void BindData_Versions()
        {
            ScheduleVersion objdata = new ScheduleVersion();
            objdata.GetVersionsByScheduleID(CurrentSchedule.ScheduleID);
            uiRadGridVersions.DataSource = objdata.DefaultView;
            uiRadGridVersions.DataBind();

        }

        private void ClearFields_Versions()
        {
            uiTextBoxVersionTitle.Text = "";
            uiTextBoxIssueNo.Text = "";
            uiTextBoxRevisionNo.Text = "";
            uiRadDatePickerIssueDate.SelectedDate = null;
            uiRadDatePickerRevisionDate.SelectedDate = null;
            uiTextBoxNotes.Text = "";
        }
        #endregion
    }
}