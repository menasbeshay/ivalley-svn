using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;

namespace Taqwa.Website
{
    public partial class Gallery : System.Web.UI.Page
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
            uiRepeaterCats.DataSource = ds;
            uiRepeaterCats.DataBind();
            //uiDropDownListCat.DataSource = ds;
            //uiDropDownListCat.DataTextField = "ArTitle";
            //uiDropDownListCat.DataValueField = "CategoryID";
            //uiDropDownListCat.DataBind();
        }

        private void BindData()
        {
            DBLayer db = new DBLayer();
           // if (!string.IsNullOrEmpty(uiDropDownListCat.SelectedValue) && uiDropDownListCat.SelectedValue != "0")
            //    uiRepeaterPhotos.DataSource = db.GetGalleryPhotoByCategoryID(Convert.ToInt32(uiDropDownListCat.SelectedValue));
            uiRepeaterPhotos.DataSource = db.GetAllGalleryPhoto();
            uiRepeaterPhotos.DataBind();
        }

        protected void uiDropDownListCat_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindData();
        }
    }
}