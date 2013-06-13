using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ermia_BLL;
using System.Data;

namespace Website.Admin
{
    public partial class EditPhotos : System.Web.UI.Page
    {
        #region properties
        public GeneralPhotos CurrentPhoto
        {
            get
            {
                if (Session["GeneralPhotos"] != null)
                    return (GeneralPhotos)Session["GeneralPhotos"];
                else
                    return null;
            }
            set
            {
                Session["GeneralPhotos"] = value;
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
                uiPanelViewSubCategories.Visible = true;
                uiPanelEdit.Visible = false;
            }
        }

        protected void uiGridViewSubCategories_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditPhoto")
            {
                GeneralPhotos objData = new GeneralPhotos();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                uiTextBoxArName.Text = objData.ArTitle;                
                uiTextBoxArDesc.Text = objData.Description;
                //uiDropDownListAllCategories.SelectedValue = objData.SubCategoryID.ToString();
                uiPanelViewSubCategories.Visible = false;
                uiPanelEdit.Visible = true;
                CurrentPhoto = objData;
                uiPanelEdit.Visible = true;
                RequiredFieldValidator3.Enabled = false;
            }
            else if (e.CommandName == "DeletePhoto")
            {
                GeneralPhotos objData = new GeneralPhotos();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
                CurrentPhoto = null;
                BindData();
            }
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            if (CurrentPhoto != null)
            {
                UpdateRecord();
            }
            else
            {
                AddNewRecord();
            }

            uiPanelEdit.Visible = false;
            uiPanelViewSubCategories.Visible = true;
            BindData();
            Clearfields();
            RequiredFieldValidator3.Enabled = true;
            CurrentPhoto = null;
        }


        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            Clearfields();
            uiPanelEdit.Visible = true;
            uiPanelViewSubCategories.Visible = false;
        }

        protected void uiGridViewSubCategories_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView row = (DataRowView)e.Row.DataItem;
                SubCategories objData = new SubCategories();
                objData.LoadByPrimaryKey(Convert.ToInt32(row["SubCategoryID"].ToString()));
                Label l = (Label)e.Row.FindControl("uiLabelCategoryName");
                l.Text = objData.Title;
            }
        }


        protected void uiDropDownListSubCats_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindData();
        }

        protected void uiDropDownListAllCategories_SelectedIndexChanged(object sender, EventArgs e)
        {
            SubCategories obj = new SubCategories();
            obj.GetSubCatsByCategoryID(Convert.ToInt32(uiDropDownListAllCategories.SelectedValue));
            uiDropDownListSubCats.DataSource = obj.DefaultView;
            uiDropDownListSubCats.DataTextField = "Title";
            uiDropDownListSubCats.DataValueField = "SubCategoryID";
            uiDropDownListSubCats.DataBind();
            if(obj.RowCount > 0 )
                uiDropDownListSubCats.SelectedIndex = 0;
            BindData();
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            Clearfields();
            CurrentPhoto = null;
            uiPanelEdit.Visible = false;
            uiPanelViewSubCategories.Visible = true;
        }


        #endregion
        #region Methods
        private void LoadDDLs()
        {
            Categories objData = new Categories();
            objData.GetCategoriesByTypeID(2);
            uiDropDownListAllCategories.DataSource = objData.DefaultView;
            uiDropDownListAllCategories.DataTextField = "Title";
            uiDropDownListAllCategories.DataValueField = "CategoryID";
            uiDropDownListAllCategories.DataBind();
            uiDropDownListAllCategories.SelectedIndex = 0;

            SubCategories obj = new SubCategories();
            obj.GetSubCatsByCategoryID(Convert.ToInt32(uiDropDownListAllCategories.SelectedValue));
            uiDropDownListSubCats.DataSource = obj.DefaultView;
            uiDropDownListSubCats.DataTextField = "Title";
            uiDropDownListSubCats.DataValueField = "SubCategoryID";
            uiDropDownListSubCats.DataBind();
            uiDropDownListSubCats.SelectedIndex = 0;
        }

        private void BindData()
        {
            GeneralPhotos objData = new GeneralPhotos();
            if (uiDropDownListSubCats.SelectedIndex > -1)
            {
                objData.GetGeneralPhotosBySubCategoryID(Convert.ToInt32(uiDropDownListSubCats.SelectedValue));
                objData.DefaultView.Sort = "ArTitle asc";
            }
            uiGridViewSubCategories.DataSource = objData.DefaultView;
            uiGridViewSubCategories.DataBind();

        }

        private void Clearfields()
        {
            uiTextBoxArName.Text = "";
            uiTextBoxArDesc.Text = "";
            uiLabelError.Visible = false;
        }

        private void AddNewRecord()
        {
            GeneralPhotos objData = new GeneralPhotos();
            objData.AddNew();
            objData.ArTitle = uiTextBoxArName.Text;
            objData.Description = uiTextBoxArDesc.Text;
            if (uiFileUploadImage.HasFile)
            {
                uiFileUploadImage.SaveAs(Server.MapPath("~/UploadedFiles/PhotoGallery/" + uiFileUploadImage.FileName));
                objData.URL = "/UploadedFiles/PhotoGallery/" + uiFileUploadImage.FileName;
            }
            objData.SubCategoryID = Convert.ToInt32(uiDropDownListSubCats.SelectedValue);
            objData.Save();
        }

        private void UpdateRecord()
        {
            GeneralPhotos objData = CurrentPhoto;
            objData.ArTitle = uiTextBoxArName.Text;
            objData.Description = uiTextBoxArDesc.Text;
            if (uiFileUploadImage.HasFile)
            {
                uiFileUploadImage.SaveAs(Server.MapPath("~/UploadedFiles/PhotoGallery/" + uiFileUploadImage.FileName));
                objData.URL = "/UploadedFiles/PhotoGallery/" + uiFileUploadImage.FileName;
            }
            objData.SubCategoryID = Convert.ToInt32(uiDropDownListSubCats.SelectedValue);
            objData.Save();
        }


        #endregion

    }
}