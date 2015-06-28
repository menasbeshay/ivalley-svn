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
    public partial class FormManagement : System.Web.UI.Page
    {
        #region Properties        
        public Manual CurrentManual
        {
            get
            {
                if (Session["CurrentManual"] != null)
                    return (Manual)Session["CurrentManual"];
                else
                    return null;
            }
            set
            {
                Session["CurrentManual"] = value;
            }
        }

        public ManualForm CurrentForm
        {
            get
            {
                if (Session["CurrentForm"] != null)
                    return (ManualForm)Session["CurrentForm"];
                else
                    return null;
            }
            set
            {
                Session["CurrentForm"] = value;
            }
        }

        public FromVersion CurrentFormVersion
        {
            get
            {
                if (Session["CurrentFormVersion"] != null)
                    return (FromVersion)Session["CurrentFormVersion"];
                else
                    return null;
            }
            set
            {
                Session["CurrentFormVersion"] = value;
            }
        }
        #endregion

        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (CurrentManual == null)
                    Response.Redirect("ManualManagment.aspx");
                Master.PageTitle = "Forms Management";
                uiLabelModule.Text = CurrentManual.Title;
                BindData();
                uiPanelViewAll.Visible = true;
                uiPanelEdit.Visible = false;
                uiPanelVersions.Visible = false;
                uiPanelEditVersions.Visible = false;
            }
        }


        protected void uiRadGridmanuals_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName == "EditForm")
            {
                ManualForm objData = new ManualForm();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                uiTextBoxTitle.Text = objData.Name;

                CurrentForm = objData;
                uiPanelEdit.Visible = true;
                uiPanelViewAll.Visible = false;
                uiPanelEditVersions.Visible = false;
                uiPanelVersions.Visible = true;
                BindData_Versions();
            }

            else if (e.CommandName == "DeleteForm")
            {
                
                ManualForm forms = new ManualForm();
                forms.GetFormsByManualID(Convert.ToInt32(e.CommandArgument.ToString()));
                for (int i = 0; i < forms.RowCount; i++)
                {
                    FromVersion formversions = new FromVersion();
                    formversions.GetVersionsByFormID(forms.ManualFormID);
                    formversions.MarkAsDeleted();
                    formversions.Save();
                }


                forms.MarkAsDeleted();
                forms.Save();

                
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
            CurrentForm = null;
            uiPanelViewAll.Visible = false;
            uiPanelEdit.Visible = true;
            uiPanelEditVersions.Visible = false;
            uiPanelVersions.Visible = false;
            ClearFields();
        }

        protected void uiButtonSave_Click(object sender, EventArgs e)
        {
            ManualForm objdata = new ManualForm();
            if (CurrentForm == null)
            {
                objdata.AddNew();
                objdata.CreatedBy = new Guid(Membership.GetUser().ProviderUserKey.ToString());
                objdata.CreatedDate = DateTime.Now;
            }
            else
                objdata = CurrentForm;
            objdata.Name = uiTextBoxTitle.Text;
            objdata.ManualID = CurrentManual.ManualID;
            objdata.UpdatedBy = new Guid(Membership.GetUser().ProviderUserKey.ToString());
            objdata.LastUpdatedDate = DateTime.Now;
            
            objdata.Save();
            BindData();
            CurrentForm = objdata;
            uiPanelViewAll.Visible = false;
            uiPanelVersions.Visible = true;
            uiPanelEditVersions.Visible = false;
            uiPanelEdit.Visible = true;            
            //ClearFields();

            // add new notifications 
            //SendingNotifications.sendNotif(3, CurrentManual.ManualCategoryID, CurrentManual.ManualID, CurrentForm.ManualFormID);
            ManualCategory cat = new ManualCategory();
            cat.GetTopMostParent(CurrentManual.ManualCategoryID);

            if (CurrentManual.ManualCategoryID == 12)
            {
                SendingNotifications.sendNotif(5, CurrentManual.ManualCategoryID, CurrentManual.ManualID, CurrentForm.ManualFormID, null, null, null, null);
            }
            else
            {
                if (!cat.IsColumnNull(ManualCategory.ColumnNames.ParentCategoryID))
                {
                    if (cat.ParentCategoryID != 12)
                        SendingNotifications.sendNotif(4, CurrentManual.ManualCategoryID, CurrentManual.ManualID, CurrentForm.ManualFormID, null, null, null, null);
                    else
                        SendingNotifications.sendNotif(5, CurrentManual.ManualCategoryID, CurrentManual.ManualID, CurrentForm.ManualFormID, null, null, null, null);
                }
                else
                    SendingNotifications.sendNotif(4, CurrentManual.ManualCategoryID, CurrentManual.ManualID, CurrentForm.ManualFormID, null, null, null, null);
            }


            //SendingNotifications.sendNotif(4, CurrentManual.ManualCategoryID, CurrentManual.ManualID, CurrentForm.ManualFormID,null,null);
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            CurrentForm = null;
            CurrentFormVersion = null;
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
            ManualForm objdata = new ManualForm();
            objdata.GetFormsByManualID(CurrentManual.ManualID);
            uiRadGridmanuals.DataSource = objdata.DefaultView;
            uiRadGridmanuals.DataBind();

        }


        private void ClearFields()
        {
            uiTextBoxTitle.Text = "";
           
        }


        #endregion


        #region Versions
        protected void uiLinkButtonAddVersion_Click(object sender, EventArgs e)
        {
            CurrentFormVersion = null;
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
                FromVersion objData = new FromVersion();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                uiTextBoxVersionTitle.Text = objData.Title;
                uiTextBoxNotes.Text= objData.Notes;
                //uiTextBoxCreatedBy.Text = objData.CreatedBy;
                uiTextBoxIssueNo.Text = objData.IssueNumber;
                uiTextBoxRevisionNo.Text = objData.RevisionNumber;
                if (!objData.IsColumnNull(ManualVersion.ColumnNames.IssueDate))
                    uiRadDatePickerIssueDate.SelectedDate = objData.IssueDate;
                if (!objData.IsColumnNull(ManualVersion.ColumnNames.RevisionDate))
                    uiRadDatePickerRevisionDate.SelectedDate = objData.RevisionDate;
                CurrentFormVersion = objData;
                uiPanelEdit.Visible = false;
                uiPanelViewAll.Visible = false;
                uiPanelEditVersions.Visible = true;
                uiPanelVersions.Visible = false;
            }

            else if (e.CommandName == "DeleteVersion")
            {

                FromVersion versions = new FromVersion();
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
            FromVersion objdata = new FromVersion();
            if (CurrentFormVersion == null)
            {
                objdata.AddNew();
                objdata.CreatedBy = new Guid(Membership.GetUser().ProviderUserKey.ToString());
                objdata.CreatedDate = DateTime.Now;
            }
            else
                objdata = CurrentFormVersion;
            objdata.Title = uiTextBoxVersionTitle.Text;
            objdata.UpdatedBy = new Guid(Membership.GetUser().ProviderUserKey.ToString());
            objdata.LastUpdatedDate = DateTime.Now;
            objdata.IssueNumber = uiTextBoxIssueNo.Text;
            objdata.RevisionNumber = uiTextBoxRevisionNo.Text;
            if (uiRadDatePickerIssueDate.SelectedDate != null)
                objdata.IssueDate = uiRadDatePickerIssueDate.SelectedDate.Value;
            if (uiRadDatePickerRevisionDate.SelectedDate != null)
                objdata.RevisionDate = uiRadDatePickerRevisionDate.SelectedDate.Value;
            objdata.ManualFromID = CurrentForm.ManualFormID;
            objdata.Notes = uiTextBoxNotes.Text;
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
            //SendingNotifications.sendNotif(4, CurrentManual.ManualCategoryID, null, CurrentForm.ManualFormID,null,objdata.FromVersionID);

            ManualCategory cat = new ManualCategory();
            cat.GetTopMostParent(CurrentManual.ManualCategoryID);

            if (CurrentManual.ManualCategoryID == 12)
            {
                SendingNotifications.sendNotif(5, CurrentManual.ManualCategoryID, CurrentManual.ManualID, CurrentForm.ManualFormID, null, objdata.FromVersionID, null, null);
            }
            else
            {
                if (!cat.IsColumnNull(ManualCategory.ColumnNames.ParentCategoryID))
                {
                    if (cat.ParentCategoryID != 12)
                        SendingNotifications.sendNotif(4, CurrentManual.ManualCategoryID, CurrentManual.ManualID, CurrentForm.ManualFormID, null, objdata.FromVersionID, null, null);
                    else
                        SendingNotifications.sendNotif(5, CurrentManual.ManualCategoryID, CurrentManual.ManualID, CurrentForm.ManualFormID, null, objdata.FromVersionID, null, null);
                }
                else
                    SendingNotifications.sendNotif(4, CurrentManual.ManualCategoryID, CurrentManual.ManualID, CurrentForm.ManualFormID, null, objdata.FromVersionID, null, null);
            }
            BindData_Versions();
            CurrentFormVersion = null;
            uiPanelViewAll.Visible = false;
            uiPanelVersions.Visible = true;
            uiPanelEditVersions.Visible = false;
            uiPanelEdit.Visible = true;
            ClearFields_Versions();
        }

        protected void uiLinkButtonCancelVersion_Click(object sender, EventArgs e)
        {
            CurrentFormVersion = null;
            uiPanelVersions.Visible = true;
            uiPanelEditVersions.Visible = false;
            uiPanelViewAll.Visible = false;
            uiPanelEdit.Visible = true;
            ClearFields_Versions();
        }
        

        private void BindData_Versions()
        {
            FromVersion objdata = new FromVersion();
            objdata.GetVersionsByFormID(CurrentForm.ManualFormID);
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