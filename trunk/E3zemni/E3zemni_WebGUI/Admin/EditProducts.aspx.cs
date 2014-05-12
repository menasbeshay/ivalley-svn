using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using E3zmni.BLL;

namespace E3zemni_WebGUI.Admin
{
    public partial class EditProducts : System.Web.UI.Page
    {

        #region properties
        public Cards CurrentCard
        {
            get
            {
                if (Session["CurrentCardPS"] != null)
                    return (Cards)Session["CurrentCardPS"];
                else
                    return null;
            }
            set
            {
                Session["CurrentCardPS"] = value;
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
                uiPanelAllCards.Visible = true;
                uiPanelEdit.Visible = false;
            }

        }


        protected void uiGridViewCards_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewCards.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewCards_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditCard")
            {
                Cards objData = new Cards();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                uiTextBoxCardNameEn.Text = objData.CardNameEng;
                uiTextBoxCardNameAr.Text = objData.CardNameAr;
                uiTextBoxDescEn.Text = objData.DescriptionEng;
                uiTextBoxDescAr.Text = objData.DescriptionAr;

                
                uiTextBoxPriceAfter.Text = objData.PriceNow.ToString();
                uiTextBoxPriceBefore.Text = objData.PriceBefore.ToString();

                uiPanelAllCards.Visible = false;
                uiPanelEdit.Visible = true;
                tabs.Visible = true;
                tabscontent.Visible = true;
                CurrentCard = objData;

                BindData();
                BindImages();
            }
            else if (e.CommandName == "DeleteCard")
            {
                try
                {
                    Cards objData = new Cards();
                    objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                    objData.MarkAsDeleted();
                    objData.Save();
                    CurrentCard = null;
                    BindData();
                }
                catch (Exception ex)
                {
                    return;
                }
            }
        }


        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            uiPanelAllCards.Visible = false;
            uiPanelEdit.Visible = true;
            tabs.Visible = false;
            tabscontent.Visible = false;
            CurrentCard = null;
            ClearFields();
        }


        protected void uiLinkButtonOK_Click(object sender, EventArgs e)
        {
            Cards card = new Cards();
            if (CurrentCard == null)
            {
                card.AddNew();
                card.UploadDate = DateTime.Now;
                card.CategoryID = Convert.ToInt32(uiDropDownListCats.SelectedValue);
                card.IsPartySupplier = true;
            }
            else
                card = CurrentCard;


            card.CardNameEng = uiTextBoxCardNameEn.Text;
            card.CardNameAr = uiTextBoxCardNameAr.Text;
            card.DescriptionEng = uiTextBoxDescEn.Text;
            card.DescriptionAr = uiTextBoxDescAr.Text;            
            double priceBefore, priceAfter = 0;
            double.TryParse(uiTextBoxPriceAfter.Text, out priceAfter);
            double.TryParse(uiTextBoxPriceBefore.Text, out priceBefore);
            card.PriceNow = priceAfter;
            card.PriceBefore = priceBefore;

            if (uiFileUploadMainImage.HasFile)
            {
                string filepath = "/images/Card/" + DateTime.Now.ToString("ddMMyyyyhhmmss") + "_" + uiFileUploadMainImage.FileName;
                uiFileUploadMainImage.SaveAs(Server.MapPath("~" + filepath));
                card.MainPhoto = filepath;
            }

            if (uiFileUploadHoverImage.HasFile)
            {
                string filepath = "/images/Card/" + DateTime.Now.ToString("ddMMyyyyhhmmss") + "_" + uiFileUploadHoverImage.FileName;
                uiFileUploadHoverImage.SaveAs(Server.MapPath("~" + filepath));
                card.MainPhotoHover = filepath;
            }

            card.Save();
            uiLabelMsg.Text = "Product saved successfully. Now you can add Product images.";
            uiLabelMsg.ForeColor = System.Drawing.Color.Green;
            uiLabelMsg.Visible = true;
            tabs.Visible = true;
            tabscontent.Visible = true;
            CurrentCard = card;
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            uiPanelAllCards.Visible = true;
            uiPanelEdit.Visible = false;
            CurrentCard = null;
            ClearFields();
        }

        protected void uiLinkButtonBack_Click(object sender, EventArgs e)
        {
            uiPanelAllCards.Visible = true;
            uiPanelEdit.Visible = false;
            CurrentCard = null;
            ClearFields();
        }



        protected void uiDropDownListTC_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadMainCat();
        }

        protected void uiDropDownListMainCats_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadCats();
        }

        protected void uiDropDownListCats_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindData();
        }

        protected void uiDataListPhotos_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                PartySupplierImages image = new PartySupplierImages();
                image.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                image.MarkAsDeleted();
                image.Save();
                BindImages();
                ClientScript.RegisterStartupScript(this.GetType(), "selectTab", "$(document).ready(function (){ $('#myTab a[href=\"#t-2\"]').tab('show'); $('#myTab a[href=\"#t-1\"]').removeClass('active'); $('#myTab a[href=\"#t-2\"]').addClass('active'); });", true);            
            }

        }

        protected void uiButtonSaveText_Click(object sender, EventArgs e)
        {
            if (uiFileUploadProdImage.HasFile)
            {
                PartySupplierImages image = new PartySupplierImages();
                image.AddNew();
                image.CardID = CurrentCard.CardID;
                string path = "/images/ProductImages/" + uiFileUploadProdImage.FileName;
                uiFileUploadProdImage.SaveAs(Server.MapPath("~" + path));
                image.ImagePath = path;
                image.Save();
                BindImages();
            }
            ClientScript.RegisterStartupScript(this.GetType(), "selectTab", "$(document).ready(function (){ $('#myTab a[href=\"#t-2\"]').tab('show'); $('#myTab a[href=\"#t-1\"]').removeClass('active'); $('#myTab a[href=\"#t-2\"]').addClass('active'); });", true);            

        }




        #endregion

        #region Methods
        private void ClearFields()
        {
            uiTextBoxCardNameEn.Text = "";
            uiTextBoxCardNameAr.Text = "";
            uiTextBoxDescEn.Text = "";
            uiTextBoxDescAr.Text = "";           
            uiTextBoxPriceAfter.Text = "";
            uiTextBoxPriceBefore.Text = "";
        }


       


        private void BindData()
        {
            Cards cards = new Cards();
            if (uiDropDownListCats.SelectedIndex != -1)
                cards.GetCardsByCategoryID(Convert.ToInt32(uiDropDownListCats.SelectedValue), true);
            uiGridViewCards.DataSource = cards.DefaultView;
            uiGridViewCards.DataBind();
        }


        private void BindImages()
        {
            PartySupplierImages images = new PartySupplierImages();
            images.Where.CardID.Value = CurrentCard.CardID;
            images.Where.CardID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
            images.Query.Load();
            uiDataListPhotos.DataSource = images.DefaultView;
            uiDataListPhotos.DataBind();
        }

        private void LoadDDLs()
        {

            

            TopLevelCat Tcats = new TopLevelCat();
            Tcats.Where.IsPartySupplier.Value = true;
            Tcats.Where.IsPartySupplier.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
            Tcats.Sort = "NameEng";
            Tcats.Query.Load();
            uiDropDownListTC.DataSource = Tcats.DefaultView;
            uiDropDownListTC.DataTextField = "NameEng";
            uiDropDownListTC.DataValueField = "TopLevelCatID";
            uiDropDownListTC.DataBind();
            LoadMainCat();


        }

        private void LoadMainCat()
        {
            MainCat Tcats = new MainCat();
            if (uiDropDownListTC.SelectedIndex != -1)
                Tcats.GetMaincatByTopLevelCatId(Convert.ToInt32(uiDropDownListTC.SelectedValue));
            uiDropDownListMainCats.DataSource = Tcats.DefaultView;
            uiDropDownListMainCats.DataTextField = "NameEng";
            uiDropDownListMainCats.DataValueField = "MainCatID";
            uiDropDownListMainCats.DataBind();
            LoadCats();
        }

        private void LoadCats()
        {
            Categories cats = new Categories();
            if (uiDropDownListMainCats.SelectedIndex != -1)
                cats.GetCatsByMainCatID(Convert.ToInt32(uiDropDownListMainCats.SelectedValue));
            uiDropDownListCats.DataSource = cats.DefaultView;
            uiDropDownListCats.DataTextField = "CatNameEng";
            uiDropDownListCats.DataValueField = "CategoryID";
            uiDropDownListCats.DataBind();
            BindData();
        }
        #endregion
    }
}