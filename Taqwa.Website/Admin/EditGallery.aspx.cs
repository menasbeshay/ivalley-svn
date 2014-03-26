using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;

namespace Taqwa.Website.Admin
{
    public partial class EditGallery : System.Web.UI.Page
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
            ds = db.GetAllCategory();
            uiDropDownListCat.DataSource = ds;
            uiDropDownListCat.DataTextField = "ArTitle";
            uiDropDownListCat.DataValueField = "CategoryID";
            uiDropDownListCat.DataBind();
        }

        private void BindData()
        {
            DBLayer db = new DBLayer();
            if (!string.IsNullOrEmpty( uiDropDownListCat.SelectedValue) && uiDropDownListCat.SelectedValue != "0")
                uiDataListPhotos.DataSource = db.GetGalleryPhotoByCategoryID(Convert.ToInt32(uiDropDownListCat.SelectedValue));
            uiDataListPhotos.DataBind();
        }

        protected void uiButtonUpload_Click(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            string path = "";
            if (uiFileUploadPhoto.HasFile)
            {
                path = "/UserFiles/Gallery/" + uiDropDownListCat.SelectedValue+ "_"+DateTime.Now.ToString("ddMMhhmmss")+"_"+uiFileUploadPhoto.FileName;
                uiFileUploadPhoto.SaveAs(Server.MapPath("~" + path));
                db.AddGalleryPhoto(uiTextBoxEnNewsTitle.Text, uiTextBoxArNewsTitle.Text, path, Convert.ToInt32(uiDropDownListCat.SelectedValue));
                BindData();
            }
        }

        protected void uiDataListPhotos_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                DBLayer db = new DBLayer();
                db.DeleteGalleryPhoto(Convert.ToInt32(e.CommandArgument.ToString()));
                BindData();
            }
        }

        protected void uiDropDownListCat_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindData();
        }
    }
}