using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Data.DataModels;
using Data.Extensions;
using Data.Repositories;
using System.Configuration;
using System.Data;

namespace Web.UI.en
{
    public partial class Default : System.Web.UI.Page
    {


        public String LandId { get; set; }
        public String ProId { get; set; }
        AlbumImagesRepository _rpoAlbumImages;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAboutUS();
                LoadProducts();
                LoadProductsSections();
                LoadContact();
            }
        }

        private void LoadContact()
        {
            ContactRepository _conatcRepo = new ContactRepository();
            Contact _Contact = _conatcRepo.LoadById("1AD20BF6-FB40-4661-B3D3-F9FB2BB22077");
            lblContactPhone.Text = _Contact.Phone;
            lblContactFax.Text = _Contact.Fax;
            lblContactEmail.Text = _Contact.Email;
            lblContactAddress.Text = _Contact.Address;
            lblcontactWorkHours.Text = _Contact.WorkHours;

            lblemailmenu.Text = _Contact.Email;
            lblPhoneMenue.Text = _Contact.Phone;

        }

        private void LoadProducts()
        {
            ProductRepository _ProRepo = new ProductRepository();
            rptProducts.DataSource = _ProRepo.LoadByLanguageId("097BE02E-A019-4853-AD50-F22EF5F0BF0F");
            rptProducts.DataBind();
        }
        private void LoadProductsSections()
        {
            ProductRepository _ProRepo = new ProductRepository();
            rptrProductsSections.DataSource = _ProRepo.LoadWoodFloorsByLanguageId("097BE02E-A019-4853-AD50-F22EF5F0BF0F");
            rptrProductsSections.DataBind();

            uiRepeaterWoodWall.DataSource = _ProRepo.LoadAllExceptWoodFloorByLanguageId("097BE02E-A019-4853-AD50-F22EF5F0BF0F"); //wood walls
            uiRepeaterWoodWall.DataBind();
        }

        private void LoadAboutUS()
        {

            PageSectionsRepository _rpoObj = new PageSectionsRepository();
            PageSection _PageSectionObjDefault = new PageSection();
            _PageSectionObjDefault = _rpoObj.LoadByLanguageIdPram("097BE02E-A019-4853-AD50-F22EF5F0BF0F");
            try
            {
                lblAboutTitleDefault.Text = _PageSectionObjDefault.SectionTitle;
                lblAboutContentDefault.Text = _PageSectionObjDefault.SectionContent;

            }
            catch (Exception)
            {


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
            //dlAlbums.DataSource = _rpoObj.LoadByProductIdAndLanguageId(LandId, ProId);
            //dlAlbums.DataBind();


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
            //lblProductTitle.Text = _pro.ProductTitle;
            //lblProductFullDescrition.Text = _pro.FullDescription;
        }




        protected void dlAlbums_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                AlbumImagesRepository _rpoAlbumImages = new AlbumImagesRepository();

                DataRowView row = (DataRowView)e.Item.DataItem;
                //tring varAlbumId = ((Label)e.Item.FindControl("lblAlbumId")).Text;
                Repeater images = (Repeater)e.Item.FindControl("dlImages");
                images.DataSource = _rpoAlbumImages.LoadByAlbumId(row["Id"].ToString());
                images.DataBind();
            }

        }
        protected void dlImages_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView row = (DataRowView)e.Item.DataItem;
                Image imgs = (Image)e.Item.FindControl("imgAlbum");
                if (e.Item.ItemIndex == 0)
                {

                    imgs.ImageUrl = "../Files/Products/" + row["ImageFile"].ToString();
                    imgs.Visible = true;
                }
                else
                {
                    imgs.Visible = false;
                }

            }

        }



        protected void rptrProductsSections_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                ProductRepository _prorpoObj = new ProductRepository();
                ProductAlbumRepository _rpoProAlbumObj = new ProductAlbumRepository();

                DataRowView row = (DataRowView)e.Item.DataItem;
                //tring varAlbumId = ((Label)e.Item.FindControl("lblAlbumId")).Text;
                Literal lbltitle = (Literal)e.Item.FindControl("lblProductTitle");
                Literal lblFullDesc = (Literal)e.Item.FindControl("lblProductFullDescrition");
                lbltitle.Text = row["ProductTitle"].ToString();
                lblFullDesc.Text = row["FullDescription"].ToString();

                Repeater albums = (Repeater)e.Item.FindControl("dlAlbums");
                albums.DataSource = _rpoProAlbumObj.LoadByProductIdAndLanguageId((row["LanguageId"].ToString()), (row["Id"].ToString()));
                albums.DataBind();

            }
        }

        protected void uiRepeaterWoodWall_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                ProductRepository _prorpoObj = new ProductRepository();
                ProductAlbumRepository _rpoProAlbumObj = new ProductAlbumRepository();

                DataRowView row = (DataRowView)e.Item.DataItem;
                //tring varAlbumId = ((Label)e.Item.FindControl("lblAlbumId")).Text;
                Literal lbltitle = (Literal)e.Item.FindControl("lblProductTitle");
                Literal lblFullDesc = (Literal)e.Item.FindControl("lblProductFullDescrition");
                lbltitle.Text = row["ProductTitle"].ToString();
                lblFullDesc.Text = row["FullDescription"].ToString();

                Repeater albums = (Repeater)e.Item.FindControl("dlAlbums");
                albums.DataSource = _rpoProAlbumObj.LoadByProductIdAndLanguageId((row["LanguageId"].ToString()), (row["Id"].ToString()));
                albums.DataBind();

            }

        }
    }
}