using Flight_BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

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
        #endregion

        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.PageTitle = "Manuals Management";
                LoadCats();
                BindData();
                uiPanelViewAll.Visible = true;
                uiPanelEdit.Visible = false;
            }
        }


        protected void uiRadGridmanuals_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName == "EditManual")
            {
                Manual objData = new Manual();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                uiTextBoxTitle.Text = objData.Title;                
                //uiTextBoxCreatedBy.Text = objData.CreatedBy;
               /* uiTextBoxIssueNo.Text = objData.IssueNumber;
                uiTextBoxRevisionNo.Text = objData.RevisionNumber;
                if (!objData.IsColumnNull(Manual.ColumnNames.IssueDate))
                    uiRadDatePickerIssueDate.SelectedDate = objData.IssueDate;
                if (!objData.IsColumnNull(Manual.ColumnNames.RevisionDate))
                    uiRadDatePickerRevisionDate.SelectedDate = objData.RevisionDate;*/
                CurrentManual = objData;
                uiPanelEdit.Visible = true;
                uiPanelViewAll.Visible = false;
            }

            else if (e.CommandName == "DeleteManual")
            {
                Manual objData = new Manual();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
                BindData();
            }
        }

        protected void uiRadGridcirculars_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            BindData();
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            CurrentManual = null;
            uiPanelViewAll.Visible = false;
            uiPanelEdit.Visible = true;
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
           /* if (uiFileUploadManual.HasFile)
            {
                string path = "/fileUploads/manuals/" + Guid.NewGuid() + "_" + uiFileUploadManual.FileName;
                uiFileUploadManual.SaveAs(Server.MapPath("~" + path));
                objdata.Path = path;
            }
            

            objdata.IssueNumber = uiTextBoxIssueNo.Text;
            objdata.RevisionNumber = uiTextBoxRevisionNo.Text;
            objdata.IssueDate = uiRadDatePickerIssueDate.SelectedDate.Value;
            objdata.RevisionDate = uiRadDatePickerRevisionDate.SelectedDate.Value;
            */
            objdata.Save();
            BindData();
            CurrentManual = null;
            uiPanelViewAll.Visible = true;
            uiPanelEdit.Visible = false;
            ClearFields();

            SendingNotifications.sendNotif(3);
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            CurrentManual = null;
            uiPanelViewAll.Visible = true;
            uiPanelEdit.Visible = false;
            ClearFields();
        }

        protected void uiRadTreeViewCats_NodeClick(object sender, Telerik.Web.UI.RadTreeNodeEventArgs e)
        {
            currentManualCat = Convert.ToInt32(e.Node.Value);
            BindData();
        }

        protected void uiRadGridmanuals_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            uiRadGridmanuals.CurrentPageIndex = e.NewPageIndex;
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

      

       
    }
}