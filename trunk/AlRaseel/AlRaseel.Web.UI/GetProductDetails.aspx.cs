using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Data.DataModels;
using Data.Repositories;

namespace Web.UI
{
    public partial class GetProductDetails : System.Web.UI.Page
    {
        public String LandId { get; set; }
        public String ProId { get; set; }
        AlbumImagesRepository _rpoAlbumImages;

        protected void Page_Load(object sender, EventArgs e)
        {
            _rpoAlbumImages = new AlbumImagesRepository();

            if (!IsPostBack)
            {
                LoadPRoducrData();
                LoadAlbums();               
            }
        }

        private void LoadAlbums()
        {

            if (!string.IsNullOrEmpty(Request.Form["LanguageId"]))
            {
                LandId = Request.Form["LanguageId"].ToString();
            }

            if (!string.IsNullOrEmpty(Request.Form["ProductId"]))
            {
                ProId = Request.Form["ProductId"].ToString();
            }

            ProductAlbumRepository _rpoObj = new ProductAlbumRepository();
            dlAlbums.DataSource = _rpoObj.LoadByProductIdAndLanguageId(LandId, ProId);
            dlAlbums.DataBind();


        }

        private void LoadPRoducrData()
        {
            if (!string.IsNullOrEmpty(Request.Form["ProductId"]))
            {
                ProId = Request.Form["ProductId"].ToString();
            }
            ProductRepository _prorpoObj = new ProductRepository();
            Product _pro = new Product();
            _pro = _prorpoObj.LoadById(ProId);
            lblProductTitle.Text = _pro.ProductTitle;
            lblProductFullDescrition.Text = _pro.FullDescription;
        }

        protected void dlAlbums_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView row = (DataRowView)e.Item.DataItem;
                //tring varAlbumId = ((Label)e.Item.FindControl("lblAlbumId")).Text;
                Repeater images = (Repeater)e.Item.FindControl("dlImages");
                images.DataSource = _rpoAlbumImages.LoadByAlbumId(row["Id"].ToString());
                images.DataBind();
            }

        }
    }
}