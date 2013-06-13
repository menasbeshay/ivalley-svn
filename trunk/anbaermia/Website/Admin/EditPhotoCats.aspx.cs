using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ermia_BLL;

namespace Website.Admin
{
    public partial class EditPhotoCats : System.Web.UI.Page
    {
        #region properties
        public Categories CurrentCategory
        {
            get
            {
                if (Session["CurrentVCategory"] != null)
                    return (Categories)Session["CurrentVCategory"];
                else
                    return null;
            }
            set
            {
                Session["CurrentVCategory"] = value;
            }
        }
        #endregion

        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
                uiPanelViewCategories.Visible = true;
                uiPanelEdit.Visible = false;
            }
        }


        protected void uiGridViewCategories_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditCategory")
            {
                Categories objData = new Categories();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                uiTextBoxArName.Text = objData.Title;
                uiPanelViewCategories.Visible = false;
                uiPanelEdit.Visible = true;
                CurrentCategory = objData;
            }
            else if (e.CommandName == "DeleteCategory")
            {
                Categories objData = new Categories();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
                CurrentCategory = null;
                BindData();
            }
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            if (CurrentCategory != null)
            {
                UpdateRecord();
            }
            else
            {
                AddNewRecord();
            }

            uiPanelEdit.Visible = false;
            uiPanelViewCategories.Visible = true;
            BindData();
            Clearfields();
            CurrentCategory = null;
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            Clearfields();
            uiPanelEdit.Visible = true;
            uiPanelViewCategories.Visible = false;
        }

        protected void uiGridViewCategories_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewCategories.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            Clearfields();
            uiPanelEdit.Visible = false;
            uiPanelViewCategories.Visible = true;
        }

        #endregion

        #region Methods
        private void BindData()
        {
            Categories objData = new Categories();
            objData.GetCategoriesByTypeID(2);            
            uiGridViewCategories.DataSource = objData.DefaultView;
            uiGridViewCategories.DataBind();
        }


        private void AddNewRecord()
        {
            Categories objData = new Categories();
            objData.AddNew();
            objData.Title = uiTextBoxArName.Text;
            if (uiFileUploadPicturePath.HasFile)
            {
                uiFileUploadPicturePath.SaveAs(Server.MapPath("~/UploadedFiles/Cats/" + uiFileUploadPicturePath.FileName));
                objData.IconPath = "/UploadedFiles/Cats/" + uiFileUploadPicturePath.FileName;
            }
            objData.TypeID = 2;
            objData.Save();
        }

        private void UpdateRecord()
        {
            Categories objData = CurrentCategory;
            objData.Title = uiTextBoxArName.Text;
            if (uiFileUploadPicturePath.HasFile)
            {
                uiFileUploadPicturePath.SaveAs(Server.MapPath("~/UploadedFiles/Cats/" + uiFileUploadPicturePath.FileName));
                objData.IconPath = "/UploadedFiles/Cats/" + uiFileUploadPicturePath.FileName;
            }
            objData.TypeID = 2;
            objData.Save();
        }

        private void Clearfields()
        {
            uiTextBoxArName.Text = "";
            uiLabelError.Visible = false;
        }
        #endregion 
    }
}