using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GlobalLogistics.BLL;
using System.Data;

namespace GlobalLogistics.WebSite.Administrator
{
    public partial class EditSubCategories : System.Web.UI.Page
    {
        #region properties
        public BLL.SubCategories CurrentSubCategory
        {
            get
            {
                if (Session["CurrentSubCategory"] != null)
                    return (BLL.SubCategories)Session["CurrentSubCategory"];
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
                LoadDDLs();
                BindData();
                uiPanelViewSubCategories.Visible = true;
                uiPanelEdit.Visible = false;
            } 
        }

        protected void uiGridViewSubCategories_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditSubCategory")
            {                
                SubCategories objData = new SubCategories();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                uiTextBoxEnName.Text = objData.EnName;
                uiTextBoxArName.Text = objData.ArName;
                uiTextBoxEnDesc.Text = objData.EnDescription;
                uiTextBoxArDesc.Text = objData.ArDescription;
                uiDropDownListAllCategories.SelectedValue = objData.CategoryID.ToString();
                uiPanelViewSubCategories.Visible = false;
                uiPanelEdit.Visible = true;
                CurrentSubCategory = objData;
                uiPanelViewSubCategories.Visible = false;
                uiPanelEdit.Visible = true;
            }
            else if (e.CommandName == "DeleteSubCategory")
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
            uiPanelViewSubCategories.Visible = true;
            BindData();
            Clearfields();
            CurrentSubCategory = null;     
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
                Categories objData = new Categories();
                objData.LoadByPrimaryKey(Convert.ToInt32(row["CategoryID"].ToString()));
                Label l = (Label)e.Row.FindControl("uiLabelCategoryName");
                l.Text = objData.ArName;
            }
        }

        protected void uiDropDownListAllCategories_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindData();
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            Clearfields();
            CurrentSubCategory = null;
            uiPanelEdit.Visible = false;
            uiPanelViewSubCategories.Visible = true;
        }

        protected void uiButtonSearch_Click(object sender, EventArgs e)
        {
            SubCategories objData = new SubCategories();
            objData.GetAllSubCategoriesByCategory(Convert.ToInt32(uiDropDownListAllCategories.SelectedValue));
            uiGridViewSubCategories.DataSource = objData.DefaultView;
            uiGridViewSubCategories.DataBind();
        }
        #endregion
        #region Methods
        private void LoadDDLs()
        {
            Categories objData = new Categories();
            objData.LoadAll();
            uiDropDownListAllCategories.DataSource = objData.DefaultView;
            uiDropDownListAllCategories.DataTextField = "ArName";
            uiDropDownListAllCategories.DataValueField = "CategoryID";
            uiDropDownListAllCategories.DataBind();
            uiDropDownListAllCategories.SelectedIndex = 0;
        }

        private void BindData()
        {
            SubCategories objData = new SubCategories();
            objData.GetAllSubCategoriesByCategory(Convert.ToInt32(uiDropDownListAllCategories.SelectedValue));
            uiGridViewSubCategories.DataSource = objData.DefaultView;
            uiGridViewSubCategories.DataBind();
           
        }

        private void Clearfields()
        {
            uiTextBoxEnName.Text = "";
            uiTextBoxArName.Text = "";
            uiTextBoxEnDesc.Text = "";
            uiTextBoxArDesc.Text = "";            
            uiLabelError.Visible = false;
        }

        private void AddNewRecord()
        {
            SubCategories objData = new SubCategories();
            objData.AddNew();
            objData.EnName = uiTextBoxEnName.Text;
            objData.ArName = uiTextBoxArName.Text;
            objData.EnDescription = uiTextBoxEnDesc.Text;
            objData.ArDescription = uiTextBoxArDesc.Text;
            objData.CategoryID = Convert.ToInt32(uiDropDownListAllCategories.SelectedValue);
            string filepath = "";
            if (uiFileUploadLogoPath.HasFile)
            {
                uiFileUploadLogoPath.SaveAs(Server.MapPath("~/FileUploads/Categories" + "/" + uiFileUploadLogoPath.FileName));
                filepath = "/Fileuploads/Categories" + "/" + uiFileUploadLogoPath.FileName;
            }
            if (!string.IsNullOrEmpty(filepath))
            {
                objData.IconPath = filepath;
            }
            objData.Save();
        }

        private void UpdateRecord()
        {
            SubCategories objData = CurrentSubCategory;
            objData.EnName = uiTextBoxEnName.Text;
            objData.ArName = uiTextBoxArName.Text;
            objData.EnDescription = uiTextBoxEnDesc.Text;
            objData.ArDescription = uiTextBoxArDesc.Text;
            objData.CategoryID = Convert.ToInt32(uiDropDownListAllCategories.SelectedValue);
            string filepath = "";
            if (uiFileUploadLogoPath.HasFile)
            {
                uiFileUploadLogoPath.SaveAs(Server.MapPath("~/FileUploads/Categories" + "/" + uiFileUploadLogoPath.FileName));
                filepath = "/Fileuploads/Categories" + "/" + uiFileUploadLogoPath.FileName;
            }
            if (!string.IsNullOrEmpty(filepath))
            {
                objData.IconPath = filepath;
            }
            objData.Save();
        }


        #endregion

        
    }
}