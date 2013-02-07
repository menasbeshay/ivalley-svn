using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GlobalLogistics.BLL;
using System.Data;

namespace GlobalLogistics.WebSite.Administrator
{
    public partial class EditVedioLib : System.Web.UI.Page
    {
        #region properties
        public BLL.VedioLib CurrentVedio
        {
            get
            {
                if (Session["VedioLib"] != null)
                    return (BLL.VedioLib)Session["VedioLib"];
                else
                    return null;
            }
            set
            {
                Session["VedioLib"] = value;
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
                VedioLib objData = new VedioLib();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                uiTextBoxEnName.Text = objData.EnTitle;
                uiTextBoxArName.Text = objData.ArTitle;
                uiTextBoxURL.Text = objData.URL;                
                uiDropDownListAllCategories.SelectedValue = objData.CategoryID.ToString();
                uiPanelViewSubCategories.Visible = false;
                uiPanelEdit.Visible = true;
                CurrentVedio = objData;
                uiPanelViewSubCategories.Visible = false;
                uiPanelEdit.Visible = true;
            }
            else if (e.CommandName == "DeleteSubCategory")
            {
                VedioLib objData = new VedioLib();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
                CurrentVedio = null;
                BindData();
            }
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            if (CurrentVedio != null)
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
            CurrentVedio = null;
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
                VedioCategories objData = new VedioCategories();
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
            CurrentVedio = null;
            uiPanelEdit.Visible = false;
            uiPanelViewSubCategories.Visible = true;
        }

        protected void uiButtonSearch_Click(object sender, EventArgs e)
        {
            VedioLib objData = new VedioLib();
            objData.GetAllVediosLibByCategory(Convert.ToInt32(uiDropDownListAllCategories.SelectedValue));
            uiGridViewSubCategories.DataSource = objData.DefaultView;
            uiGridViewSubCategories.DataBind();
        }
        #endregion
        #region Methods
        private void LoadDDLs()
        {
            VedioCategories objData = new VedioCategories();
            objData.LoadAll();
            uiDropDownListAllCategories.DataSource = objData.DefaultView;
            uiDropDownListAllCategories.DataTextField = "ArName";
            uiDropDownListAllCategories.DataValueField = "CategoryID";
            uiDropDownListAllCategories.DataBind();
            uiDropDownListAllCategories.SelectedIndex = 0;
        }

        private void BindData()
        {
            VedioLib objData = new VedioLib();
            objData.GetAllVediosLibByCategory(Convert.ToInt32(uiDropDownListAllCategories.SelectedValue));
            uiGridViewSubCategories.DataSource = objData.DefaultView;
            uiGridViewSubCategories.DataBind();

        }

        private void Clearfields()
        {
            uiTextBoxEnName.Text = "";
            uiTextBoxArName.Text = "";
            uiTextBoxURL.Text = "";            
            uiLabelError.Visible = false;
        }

        private void AddNewRecord()
        {
            VedioLib objData = new VedioLib();
            objData.AddNew();
            objData.EnTitle = uiTextBoxEnName.Text;
            objData.ArTitle = uiTextBoxArName.Text;
            objData.EnDescription = uiTextBoxEnDesc.Text;
            objData.ArDescription = uiTextBoxArDesc.Text;
            objData.URL = uiTextBoxURL.Text;
            string filepath = "";
            if (uiFileUploadLogoPath.HasFile)
            {
                uiFileUploadLogoPath.SaveAs(Server.MapPath("~/FileUploads/VedioLogos" + "/" + uiFileUploadLogoPath.FileName));
                filepath = "/Fileuploads/VedioLogos" + "/" + uiFileUploadLogoPath.FileName;
            }
            if (!string.IsNullOrEmpty(filepath))
            {
                objData.IconPath = filepath;
            }
            objData.CategoryID = Convert.ToInt32(uiDropDownListAllCategories.SelectedValue);                        
            objData.Save();
        }

        private void UpdateRecord()
        {
            VedioLib objData = CurrentVedio;
            objData.EnTitle = uiTextBoxEnName.Text;
            objData.ArTitle = uiTextBoxArName.Text;
            objData.EnDescription = uiTextBoxEnDesc.Text;
            objData.ArDescription = uiTextBoxArDesc.Text;
            objData.URL = uiTextBoxURL.Text;
            string filepath = "";
            if (uiFileUploadLogoPath.HasFile)
            {
                uiFileUploadLogoPath.SaveAs(Server.MapPath("~/FileUploads/VedioLogos" + "/" + uiFileUploadLogoPath.FileName));
                filepath = "/Fileuploads/VedioLogos" + "/" + uiFileUploadLogoPath.FileName;
            }
            if (!string.IsNullOrEmpty(filepath))
            {
                objData.IconPath = filepath;
            }
            objData.CategoryID = Convert.ToInt32(uiDropDownListAllCategories.SelectedValue);
            objData.Save();
        }


        #endregion

    }
}