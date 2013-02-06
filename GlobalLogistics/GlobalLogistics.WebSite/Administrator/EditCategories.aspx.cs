using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GlobalLogistics.BLL;
using System.Data;

namespace GlobalLogistics.WebSite.Administrator
{
    public partial class EditCategories : System.Web.UI.Page
    {
        #region properties
        public BLL.Categories CurrentCategory
        {
            get
            {
                if (Session["CurrentCategory"] != null)
                    return (BLL.Categories)Session["CurrentCategory"];
                else
                    return null;
            }
            set
            {
                Session["CurrentCategory"] = value;
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
                uiTextBoxEnName.Text = objData.EnName;
                uiTextBoxArName.Text = objData.ArName;
                uiTextBoxEnDesc.Text = objData.EnDescription;
                uiTextBoxArDesc.Text = objData.ArDescription;
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

        protected void uiButtonSearch_Click(object sender, EventArgs e)
        {
            BLL.Categories objData = new Categories();
            objData.SearchCategories(uiTextBoxSearch.Text);
            uiGridViewCategories.DataSource = objData.DefaultView;
            uiGridViewCategories.DataBind();
        }
        #endregion

        #region Methods
        private void BindData()
        {
            BLL.Categories objData = new Categories();
            objData.LoadAll();
            uiGridViewCategories.DataSource = objData.DefaultView;
            uiGridViewCategories.DataBind();
        }


        private void AddNewRecord()
        {
            Categories objData = new Categories();
            objData.AddNew();
            objData.EnName = uiTextBoxEnName.Text;
            objData.ArName = uiTextBoxArName.Text;
            objData.EnDescription = uiTextBoxEnDesc.Text;
            objData.ArDescription = uiTextBoxArDesc.Text;
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
            Categories objData = CurrentCategory;
            objData.EnName = uiTextBoxEnName.Text;
            objData.ArName = uiTextBoxArName.Text;
            objData.EnDescription = uiTextBoxEnDesc.Text;
            objData.ArDescription = uiTextBoxArDesc.Text;
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

        private void Clearfields()
        {
            uiTextBoxEnName.Text = "";
            uiTextBoxArName.Text = "";
            uiTextBoxEnDesc.Text = "";
            uiTextBoxArDesc.Text = "";
            uiLabelError.Visible = false;
        }
        #endregion 

        



        


       
    }
}