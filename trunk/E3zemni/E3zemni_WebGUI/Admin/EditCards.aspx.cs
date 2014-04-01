using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using E3zmni.BLL;

namespace E3zemni_WebGUI.Admin
{
    public partial class EditCards : System.Web.UI.Page
    {
        #region properties
        public Cards CurrentCard
        {
            get
            {
                if (Session["CurrentCard"] != null)
                    return (Cards)Session["CurrentCard"];
                else
                    return null;
            }
            set
            {
                Session["CurrentCard"] = value;
            }
        }

        #endregion
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

        private void BindData()
        {
            Cards cards = new Cards();
            if(uiDropDownListCats.SelectedIndex != -1)
                cards.GetCardsByCategoryID(Convert.ToInt32(uiDropDownListCats.SelectedValue));
            uiGridViewCards.DataSource = cards.DefaultView;
            uiGridViewCards.DataBind();
        }

        private void LoadDDLs()
        {
            /*
            Color colors = new Color();
            colors.LoadAll();
            uiDropDownListColor.DataSource = colors.DefaultView;
            uiDropDownListColor.DataTextField = "ColorNameEng";
            uiDropDownListColor.DataValueField = "ColorID";
            uiDropDownListColor.DataBind();
 */
            Dimension dims = new Dimension();
            dims.GetAllDims();
            uiDropDownListDim.DataSource = dims.DefaultView;
            uiDropDownListDim.DataTextField = "DisplayName";
            uiDropDownListDim.DataValueField = "DimensionID";
            uiDropDownListDim.DataBind();
            
            Categories cats = new Categories();
            cats.LoadAll();
            uiDropDownListCats.DataSource = cats.DefaultView;
            uiDropDownListCats.DataTextField = "CatNameEng";
            uiDropDownListCats.DataValueField = "CategoryID";
            uiDropDownListCats.DataBind();


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

                if (!objData.IsColumnNull("DimensionID"))
                    uiDropDownListDim.SelectedValue = objData.DimensionID.ToString();

                uiTextBoxPriceAfter.Text = objData.PriceNow.ToString();
                uiTextBoxPriceBefore.Text = objData.PriceBefore.ToString();
                
                uiPanelAllCards.Visible = false;
                uiPanelEdit.Visible = true;
                CurrentCard = objData;

                BindData();
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
            CurrentCard = null;
            ClearFields();
        }

        private void ClearFields()
        {
            uiTextBoxCardNameEn.Text = "";
            uiTextBoxCardNameAr.Text = "";
            uiTextBoxDescEn.Text = "";
            uiTextBoxDescAr.Text = "";
            uiDropDownListDim.SelectedIndex = 0;
            uiTextBoxPriceAfter.Text = "";
            uiTextBoxPriceBefore.Text = "";                
        }

        protected void uiLinkButtonOK_Click(object sender, EventArgs e)
        {
            Cards card = new Cards();
            if (CurrentCard == null)
            {
                card.AddNew();
                card.UploadDate = DateTime.Now;
            }
            else
                card = CurrentCard;


            card.CardNameEng = uiTextBoxCardNameEn.Text;
            card.CardNameAr = uiTextBoxCardNameAr.Text;
            card.DescriptionEng = uiTextBoxDescEn.Text;
            card.DescriptionAr = uiTextBoxDescAr.Text;
            card.DimensionID = Convert.ToInt32(uiDropDownListDim.SelectedValue);
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
    }
}