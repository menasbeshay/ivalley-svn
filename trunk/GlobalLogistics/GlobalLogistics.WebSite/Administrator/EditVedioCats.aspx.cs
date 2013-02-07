using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GlobalLogistics.BLL;

namespace GlobalLogistics.WebSite.Administrator
{
    public partial class EditVedioCats : System.Web.UI.Page
    {
        #region properties
        public BLL.VedioCategories CurrentCategory
        {
            get
            {
                if (Session["CurrentVCategory"] != null)
                    return (BLL.VedioCategories)Session["CurrentVCategory"];
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
                VedioCategories objData = new VedioCategories();
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
                VedioCategories objData = new VedioCategories();
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
            BLL.VedioCategories objData = new VedioCategories();
            objData.SearchVedioCat(uiTextBoxSearch.Text);
            uiGridViewCategories.DataSource = objData.DefaultView;
            uiGridViewCategories.DataBind();
        }
        #endregion

        #region Methods
        private void BindData()
        {
            BLL.VedioCategories objData = new VedioCategories();
            objData.LoadAll();
            uiGridViewCategories.DataSource = objData.DefaultView;
            uiGridViewCategories.DataBind();
        }


        private void AddNewRecord()
        {
            VedioCategories objData = new VedioCategories();
            objData.AddNew();
            objData.EnName = uiTextBoxEnName.Text;
            objData.ArName = uiTextBoxArName.Text;
            objData.EnDescription = uiTextBoxEnDesc.Text;
            objData.ArDescription = uiTextBoxArDesc.Text;
            string filepath = "";
            if (uiFileUploadLogoPath.HasFile)
            {
                uiFileUploadLogoPath.SaveAs(Server.MapPath("~/FileUploads/VedioCategories" + "/" + uiFileUploadLogoPath.FileName));
                filepath = "/Fileuploads/VedioCategories" + "/" + uiFileUploadLogoPath.FileName;
            }
            if (!string.IsNullOrEmpty(filepath))
            {
                objData.IconPath = filepath;
            }
            objData.Save();
        }

        private void UpdateRecord()
        {
            VedioCategories objData = CurrentCategory;
            objData.EnName = uiTextBoxEnName.Text;
            objData.ArName = uiTextBoxArName.Text;
            objData.EnDescription = uiTextBoxEnDesc.Text;
            objData.ArDescription = uiTextBoxArDesc.Text;
            string filepath = "";
            if (uiFileUploadLogoPath.HasFile)
            {
                uiFileUploadLogoPath.SaveAs(Server.MapPath("~/FileUploads/VedioCategories" + "/" + uiFileUploadLogoPath.FileName));
                filepath = "/Fileuploads/VedioCategories" + "/" + uiFileUploadLogoPath.FileName;
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