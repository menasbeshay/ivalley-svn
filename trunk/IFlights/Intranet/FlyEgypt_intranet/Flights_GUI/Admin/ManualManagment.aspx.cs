using Flight_BLL;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace Flights_GUI.Admin
{
    public partial class ManualManagment : System.Web.UI.Page
    {
        #region Properties
        public int currentManualCat
        {
            get
            {
                object o = this.ViewState["_currentManualCat"];
                if (o == null)
                    return 0;
                else
                    return (int)o;
            }
            set
            {
                this.ViewState["_currentManualCat"] = value;
            }
        }
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

        public ManualVersion CurrentManualVersion
        {
            get
            {
                if (Session["CurrentManualVersion"] != null)
                    return (ManualVersion)Session["CurrentManualVersion"];
                else
                    return null;
            }
            set
            {
                Session["CurrentManualVersion"] = value;
            }
        }
        #endregion

        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.PageTitle = "Manuals Management";
                LoadCats();
                if (currentManualCat != 0)
                {
                    //uiRadTreeViewCats.Nodes.FindNodeByValue(currentManualCat.ToString()).Selected = true;
                    RadTreeNode node = uiRadTreeViewCats.FindNodeByValue(currentManualCat.ToString());
                    node.Selected = true;
                    node.ExpandParentNodes();
                    
                }
                else
                    uiRadTreeViewCats.Nodes[0].Selected = true;
                currentManualCat = Convert.ToInt32(uiRadTreeViewCats.SelectedNode.Value);
                BindData();
                uiPanelViewAll.Visible = true;
                uiPanelEdit.Visible = false;
                uiPanelVersions.Visible = false;
                uiPanelEditVersions.Visible = false;
            }
        }


        protected void uiRadGridmanuals_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName == "EditManual")
            {
                Manual objData = new Manual();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                uiTextBoxTitle.Text = objData.Title;                
               
                CurrentManual = objData;
                uiPanelEdit.Visible = true;
                uiPanelViewAll.Visible = false;
                uiPanelEditVersions.Visible = false;
                uiPanelVersions.Visible = true;
                uiLinkButtonEditForms.Visible = true;
                BindData_Versions();
            }

            else if (e.CommandName == "DeleteManual")
            {
                Manual objData = new Manual();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                ManualVersion versions = new ManualVersion();
                versions.GetVersionsByManualID(objData.ManualID);
                versions.DeleteAll();
                versions.Save();

                ManualForm forms = new ManualForm();
                forms.GetFormsByManualID(objData.ManualID);
                for (int i = 0; i < forms.RowCount; i++)
                {
                    FromVersion formversions = new FromVersion();
                    formversions.GetVersionsByFormID(forms.ManualFormID);
                    formversions.MarkAsDeleted();
                    formversions.Save();
                }
                

                forms.DeleteAll();
                forms.Save();

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
            CurrentManual = null;
            uiPanelViewAll.Visible = false;
            uiPanelEdit.Visible = true;
            uiPanelEditVersions.Visible = false;
            uiPanelVersions.Visible = false;
            uiLinkButtonEditForms.Visible = false;
            ClearFields();
        }

        protected void uiButtonSave_Click(object sender, EventArgs e)
        {
            Manual objdata = new Manual();
            if (CurrentManual == null)
            {
                objdata.AddNew();
                objdata.CreatedBy = new Guid(Membership.GetUser().ProviderUserKey.ToString());
                objdata.CreatedDate = DateTime.Now;
            }
            else
                objdata = CurrentManual;
            objdata.Title = uiTextBoxTitle.Text;
            
            objdata.UpdatedBy = new Guid(Membership.GetUser().ProviderUserKey.ToString());
            objdata.LastUpdatedDate = DateTime.Now;
            //objdata.CreatedBy = uiTextBoxCreatedBy.Text;
            if (currentManualCat != 0)
                objdata.ManualCategoryID = currentManualCat;
           
            objdata.Save();
            BindData();
            CurrentManual = objdata;
            uiPanelViewAll.Visible = false;
            uiPanelVersions.Visible = true;
            uiPanelEditVersions.Visible = false;
            uiPanelEdit.Visible = true;
            uiLinkButtonEditForms.Visible = true;
            //ClearFields();

            // add new notifications         
            ManualCategory cat = new ManualCategory();
            cat.GetTopMostParent(CurrentManual.ManualCategoryID);

            if (!cat.IsColumnNull(ManualCategory.ColumnNames.ParentCategoryID))
            {
                if (cat.ParentCategoryID != 12 || CurrentManual.ManualCategoryID != 12)
                    SendingNotifications.sendNotif(3, CurrentManual.ManualCategoryID, CurrentManual.ManualID, null,null,null);
                else
                    SendingNotifications.sendNotif(5, CurrentManual.ManualCategoryID, CurrentManual.ManualID, null, null, null);
            }
            else
                SendingNotifications.sendNotif(3, CurrentManual.ManualCategoryID, CurrentManual.ManualID, null, null, null);
                
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            CurrentManual = null;
            CurrentManualVersion = null;
            uiPanelViewAll.Visible = true;
            uiPanelVersions.Visible = false;
            uiPanelEditVersions.Visible = false;
            uiPanelEdit.Visible = false;
            ClearFields();
        }

        protected void uiRadTreeViewCats_NodeClick(object sender, Telerik.Web.UI.RadTreeNodeEventArgs e)
        {
            currentManualCat = Convert.ToInt32(e.Node.Value);
            BindData();
        }

        #endregion

        #region Methods

        private void BindData()
        {
            Manual objdata = new Manual();
            objdata.GetManualsByCatID(currentManualCat);
            uiRadGridmanuals.DataSource = objdata.DefaultView;
            uiRadGridmanuals.DataBind();

        }


        private void ClearFields()
        {
            uiTextBoxTitle.Text = "";
            /*uiTextBoxCreatedBy.Text = "";
            uiTextBoxIssueNo.Text = "";
            uiTextBoxRevisionNo.Text = "";
            
            uiRadDatePickerIssueDate.SelectedDate = null;
            uiRadDatePickerRevisionDate.SelectedDate = null;*/
        }


        private void LoadCats()
        {
            ManualCategory cats = new ManualCategory();
            cats.LoadAll();

            uiRadTreeViewCats.DataSource = cats.DefaultView;
            uiRadTreeViewCats.DataFieldID = ManualCategory.ColumnNames.ManualCategoryID;
            uiRadTreeViewCats.DataFieldParentID = ManualCategory.ColumnNames.ParentCategoryID;
            uiRadTreeViewCats.DataTextField = ManualCategory.ColumnNames.Title;
            uiRadTreeViewCats.DataValueField = ManualCategory.ColumnNames.ManualCategoryID;
            uiRadTreeViewCats.DataBind();
        }
        #endregion


        #region Versions
        protected void uiLinkButtonAddVersion_Click(object sender, EventArgs e)
        {
            CurrentManualVersion = null;
            uiPanelViewAll.Visible = false;
            uiPanelEdit.Visible = false;
            uiPanelVersions.Visible = false;
            uiPanelEditVersions.Visible = true;
            ClearFields_Versions();
        }

        protected void uiRadGridVersions_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName == "EditManualVersion")
            {
                ManualVersion objData = new ManualVersion();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                uiTextBoxVersionTitle.Text = objData.Title;
                uiTextBoxNotes.Text = objData.Notes;
                 uiTextBoxIssueNo.Text = objData.IssueNumber;
                 uiTextBoxRevisionNo.Text = objData.RevisionNumber;
                 if (!objData.IsColumnNull(ManualVersion.ColumnNames.IssueDate))
                     uiRadDatePickerIssueDate.SelectedDate = objData.IssueDate;
                 if (!objData.IsColumnNull(ManualVersion.ColumnNames.RevisionDate))
                     uiRadDatePickerRevisionDate.SelectedDate = objData.RevisionDate;
                CurrentManualVersion = objData;
                uiPanelEdit.Visible = false;
                uiPanelViewAll.Visible = false;
                uiPanelEditVersions.Visible = true;
                uiPanelVersions.Visible = false;
            }

            else if (e.CommandName == "DeleteManualVersion")
            {
                
                ManualVersion versions = new ManualVersion();
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
            ManualVersion objdata = new ManualVersion();
            if (CurrentManualVersion == null)
            {
                objdata.AddNew();
                objdata.CreatedBy = new Guid(Membership.GetUser().ProviderUserKey.ToString());
                objdata.CreatedDate = DateTime.Now;
            }
            else
                objdata = CurrentManualVersion;
            objdata.Title = uiTextBoxVersionTitle.Text;
            objdata.Notes =uiTextBoxNotes.Text;
            objdata.UpdatedBy = new Guid(Membership.GetUser().ProviderUserKey.ToString());
            objdata.LastUpdatedDate = DateTime.Now;            
            objdata.IssueNumber = uiTextBoxIssueNo.Text;
            objdata.RevisionNumber = uiTextBoxRevisionNo.Text;
            objdata.IssueDate = uiRadDatePickerIssueDate.SelectedDate.Value;
            objdata.RevisionDate = uiRadDatePickerRevisionDate.SelectedDate.Value;
            objdata.ManualID = CurrentManual.ManualID;

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
            ManualCategory cat = new ManualCategory();
            cat.GetTopMostParent(CurrentManual.ManualCategoryID);

            if (!cat.IsColumnNull(ManualCategory.ColumnNames.ParentCategoryID))
            {
                if (cat.ParentCategoryID != 12 || CurrentManual.ManualCategoryID != 12)
                    SendingNotifications.sendNotif(3, CurrentManual.ManualCategoryID, CurrentManual.ManualID, null,objdata.ManualVersionID,null);
                else
                    SendingNotifications.sendNotif(5, CurrentManual.ManualCategoryID, CurrentManual.ManualID, null, objdata.ManualVersionID, null);
            }
            else
                SendingNotifications.sendNotif(3, CurrentManual.ManualCategoryID, CurrentManual.ManualID, null, objdata.ManualVersionID, null);

            BindData_Versions();
            CurrentManualVersion = null;
            uiPanelViewAll.Visible = false;
            uiPanelVersions.Visible = true;
            uiPanelEditVersions.Visible = false;
            uiPanelEdit.Visible = true;
            ClearFields_Versions();

            
        }

        protected void uiLinkButtonCancelVersion_Click(object sender, EventArgs e)
        {
            CurrentManualVersion = null;
            uiPanelVersions.Visible = true;
            uiPanelEditVersions.Visible = false;
            uiPanelViewAll.Visible = false;
            uiPanelEdit.Visible = true;
            ClearFields_Versions();
        }

        protected void uiLinkButtonEditForms_Click(object sender, EventArgs e)
        {
            Response.Redirect("FormManagement.aspx");
        }

        private void BindData_Versions()
        {
            ManualVersion objdata = new ManualVersion();
            objdata.GetVersionsByManualID(CurrentManual.ManualID);
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