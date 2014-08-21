using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Data.DataModels;
using Data.Repositories;
using Data.Extensions;
using System.Data;


namespace Web.UI
{
    public partial class ProductDetails : System.Web.UI.Page
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
                LoadContactMEnu();
            }
        }

        private void LoadContactMEnu()
        {
            ContactRepository _conatcRepo = new ContactRepository();
            Contact _Contact = _conatcRepo.LoadById("1AD20BF6-FB40-4661-B3D3-F9FB2BB22077");


           lblemailmenu .Text = _Contact.Email;
            lblPhoneMenue.Text = _Contact.Phone;

        }

        private void LoadAlbums()
        {

            if (!string.IsNullOrEmpty(Request.QueryString["LanguageId"]))
            {
                LandId = Request.QueryString["LanguageId"].ToString();
            }

            if (!string.IsNullOrEmpty(Request.QueryString["ProductId"]))
            {
                ProId = Request.QueryString["ProductId"].ToString();
            }

            ProductAlbumRepository _rpoObj = new ProductAlbumRepository();
            dlAlbums.DataSource = _rpoObj.LoadByProductIdAndLanguageId(LandId, ProId);
            dlAlbums.DataBind();


        }

        private void LoadPRoducrData()
        {
            if (!string.IsNullOrEmpty(Request.QueryString["ProductId"]))
            {
                ProId = Request.QueryString["ProductId"].ToString();
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