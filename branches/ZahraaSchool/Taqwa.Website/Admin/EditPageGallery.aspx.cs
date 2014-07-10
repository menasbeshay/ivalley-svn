using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;

namespace Taqwa.Website.Admin
{
    public partial class EditPageGallery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDDL();
                BindData();
            }
        }

        private void LoadDDL()
        {
            DBLayer db = new DBLayer();
            DataSet ds = new DataSet();
            ds = db.GetPages();
            uiDropDownListPages.DataSource = ds;
            uiDropDownListPages.DataTextField = "ArPageTitle";
            uiDropDownListPages.DataValueField = "PageID";
            uiDropDownListPages.DataBind();
        }

        private void BindData()
        {
            DBLayer db = new DBLayer();
            if (!string.IsNullOrEmpty(uiDropDownListPages.SelectedValue) && uiDropDownListPages.SelectedValue != "0")
                uiDataListPhotos.DataSource = db.GetPageGalleryPhotoByPageID(Convert.ToInt32(uiDropDownListPages.SelectedValue));
            uiDataListPhotos.DataBind();
        }

        protected void uiButtonUpload_Click(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            string path = "";
            if (uiFileUploadPhoto.HasFile)
            {
                path = "/UserFiles/PageGallery/" + uiDropDownListPages.SelectedValue + "_" + DateTime.Now.ToString("ddMMhhmmss") + "_" + uiFileUploadPhoto.FileName;
                uiFileUploadPhoto.SaveAs(Server.MapPath("~" + path));
                db.AddPageGalleryPhoto(uiTextBoxEnNewsTitle.Text, uiTextBoxArNewsTitle.Text, path, Convert.ToInt32(uiDropDownListPages.SelectedValue));
                BindData();
                uiTextBoxArNewsTitle.Text = uiTextBoxEnNewsTitle.Text = "";                
            }
        }

        protected void uiDataListPhotos_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                DBLayer db = new DBLayer();
                db.DeletePageGalleryPhoto(Convert.ToInt32(e.CommandArgument.ToString()));
                BindData();
            }
        }

        protected void uiDropDownListPages_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindData();
        }
    }
}