using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ermia_BLL;

namespace Website.Admin
{
    public partial class EditPhotoSubCats : System.Web.UI.Page
    {
        #region properties
        public SubCategories CurrentSubCategory
        {
            get
            {
                if (Session["CurrentSubCategory"] != null)
                    return (SubCategories)Session["CurrentSubCategory"];
                else
                    return null;
            }
            set
            {
                Session["CurrentSubCategory"] = value;
            }
        }
        #endregion

        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDDls();
                BindData();
                uiPanelViewCategories.Visible = true;
                uiPanelEdit.Visible = false;
            }
        }


        protected void uiGridViewSubCategories_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditCategory")
            {
                SubCategories objData = new SubCategories();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                uiTextBoxArName.Text = objData.Title;
                uiPanelViewCategories.Visible = false;
                uiPanelEdit.Visible = true;
                CurrentSubCategory = objData;
            }
            else if (e.CommandName == "DeleteCategory")
            {
                SubCategories objData = new SubCategories();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
                CurrentSubCategory = null;
                BindData();
            }
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            if (CurrentSubCategory != null)
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
            CurrentSubCategory = null;
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            Clearfields();
            uiPanelEdit.Visible = true;
            uiPanelViewCategories.Visible = false;
        }

        protected void uiGridViewSubCategories_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewSubCategories.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            Clearfields();
            uiPanelEdit.Visible = false;
            uiPanelViewCategories.Visible = true;
        }


        protected void uiDropDownListAllCategories_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindData();
        }

        #endregion

        #region Methods


        private void LoadDDls()
        {
            Categories cats = new Categories();
            cats.GetCategoriesByTypeID(2);
            uiDropDownListAllCategories.DataSource = cats.DefaultView;
            uiDropDownListAllCategories.DataTextField = "Title";
            uiDropDownListAllCategories.DataValueField = "CategoryID";
            uiDropDownListAllCategories.DataBind();
            uiDropDownListAllCategories.SelectedIndex = 0;
        }

        private void BindData()
        {
            SubCategories objData = new SubCategories();
            if (uiDropDownListAllCategories.SelectedIndex != -1)
            {
                objData.GetSubCatsByCategoryID(Convert.ToInt32(uiDropDownListAllCategories.SelectedValue));
            }
            uiGridViewSubCategories.DataSource = objData.DefaultView;
            uiGridViewSubCategories.DataBind();
        }


        private void AddNewRecord()
        {
            SubCategories objData = new SubCategories();
            objData.AddNew();
            objData.Title = uiTextBoxArName.Text;
            objData.CategoryID = Convert.ToInt32(uiDropDownListAllCategories.SelectedValue);
            if (uiFileUploadPicturePath.HasFile)
            {
                uiFileUploadPicturePath.SaveAs(Server.MapPath("~/UploadedFiles/Cats/" + uiFileUploadPicturePath.FileName));
                objData.IconPath = "/UploadedFiles/Cats/" + uiFileUploadPicturePath.FileName;
            }            
            objData.Save();
        }

        private void UpdateRecord()
        {
            SubCategories objData = CurrentSubCategory;
            objData.Title = uiTextBoxArName.Text;
            objData.CategoryID = Convert.ToInt32(uiDropDownListAllCategories.SelectedValue);
            if (uiFileUploadPicturePath.HasFile)
            {
                uiFileUploadPicturePath.SaveAs(Server.MapPath("~/UploadedFiles/Cats/" + uiFileUploadPicturePath.FileName));
                objData.IconPath = "/UploadedFiles/Cats/" + uiFileUploadPicturePath.FileName;
            }            
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