using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;

namespace Taqwa.Website.Admin
{
    public partial class EditGallery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }

        private void BindData()
        {
            DBLayer db = new DBLayer();
            uiDataListPhotos.DataSource = db.GetAllGalleryPhoto();
            uiDataListPhotos.DataBind();
        }

        protected void uiButtonUpload_Click(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            string path = "";
            if (uiFileUploadPhoto.HasFile)
            {
                path = "/UserFiles/Gallery/" + uiFileUploadPhoto.FileName;
                uiFileUploadPhoto.SaveAs(Server.MapPath("~" + path));
                db.AddGalleryPhoto(uiTextBoxEnNewsTitle.Text, uiTextBoxArNewsTitle.Text, path);
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
    }
}