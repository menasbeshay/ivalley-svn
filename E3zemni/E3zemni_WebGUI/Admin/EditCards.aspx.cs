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

        public CardText CurrentTxt
        {
            get
            {
                if (Session["CurrentTxt"] != null)
                    return (CardText)Session["CurrentTxt"];
                else
                    return null;
            }
            set
            {
                Session["CurrentTxt"] = value;
            }
        }

        public CardImages CurrentImg
        {
            get
            {
                if (Session["CurrentImg"] != null)
                    return (CardImages)Session["CurrentImg"];
                else
                    return null;
            }
            set
            {
                Session["CurrentImg"] = value;
            }
        }

        public CardLayouts CurrentLayout
        {
            get
            {
                if (Session["CurrentLayout"] != null)
                    return (CardLayouts)Session["CurrentLayout"];
                else
                    return null;
            }
            set
            {
                Session["CurrentLayout"] = value;
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

                if (!objData.IsColumnNull("DimensionID"))
                    uiDropDownListDim.SelectedValue = objData.DimensionID.ToString();

                uiTextBoxPriceAfter.Text = objData.PriceNow.ToString();
                uiTextBoxPriceBefore.Text = objData.PriceBefore.ToString();
                
                uiPanelAllCards.Visible = false;
                uiPanelEdit.Visible = true;
                tabs.Visible = true;
                tabscontent.Visible = true;
                CurrentCard = objData;

                BindData();
                BindCardTxt();
                BindCardLayout();
                BindCardColors();
                BindCardImages();
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
            if (!string.IsNullOrEmpty(uiDropDownListCats.SelectedValue) && uiDropDownListCats.SelectedIndex != -1)
            {
                Cards card = new Cards();
                if (CurrentCard == null)
                {
                    card.AddNew();
                    card.UploadDate = DateTime.Now;
                    card.CategoryID = Convert.ToInt32(uiDropDownListCats.SelectedValue);
                    card.IsPartySupplier = false;
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
                uiLabelMsg.Text = "Card saved successfully. Now you can add card text, card layouts and card default colors.";
                uiLabelMsg.ForeColor = System.Drawing.Color.Green;
                uiLabelMsg.Visible = true;
                tabs.Visible = true;
                tabscontent.Visible = true;
                CurrentCard = card;
            }
            else
            {
                uiLabelMsg.Text = "Error. please back to select a category before adding a new card. ";
                uiLabelMsg.ForeColor = System.Drawing.Color.Red;
                uiLabelMsg.Visible = true;
            }
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

        protected void uiGridViewCardText_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewCardText.PageIndex = e.NewPageIndex;
            BindCardTxt();
        }

        protected void uiGridViewCardText_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditTxt")
            {
                CardText objData = new CardText();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                uiTextBoxTxtLabel.Text = objData.TextLabel;
                uiTextBoxWidth.Text = objData.Width.ToString();
                uiTextBoxHeight.Text = objData.Height.ToString();
                uiTextBoxX.Text = objData.PosX.ToString();
                uiTextBoxY.Text = objData.PosY.ToString();
                uiCheckBoxIsMultiLine.Checked = objData.IsMultiLine;

                CurrentTxt = objData;
                ClientScript.RegisterStartupScript(this.GetType(), "selectTab", "$(document).ready(function (){ $('#myTab a[href=\"#t-2\"]').tab('show'); $('#myTab a[href=\"#t-1\"]').removeClass('active'); $('#myTab a[href=\"#t-2\"]').addClass('active'); });", true);
            }
            else if (e.CommandName == "DeleteTxt")
            {
                try
                {
                    CardText objData = new CardText();
                    objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                    objData.MarkAsDeleted();
                    objData.Save();
                    CurrentTxt = null;
                    BindCardTxt();
                }
                catch (Exception ex)
                {
                    return;
                }
            }
        }


        protected void uiButtonSaveText_Click(object sender, EventArgs e)
        {
            CardText txt = new CardText();
            if (CurrentTxt == null)
            {
                txt.AddNew();
                txt.CardID = CurrentCard.CardID;
            }
            else
                txt = CurrentTxt;

            txt.TextLabel = uiTextBoxTxtLabel.Text;
            int width, height, x, y;
            int.TryParse(uiTextBoxWidth.Text, out width);
            int.TryParse(uiTextBoxHeight.Text, out height);
            int.TryParse(uiTextBoxY.Text, out y);
            int.TryParse(uiTextBoxX.Text, out x);
            txt.Width = width;
            txt.Height = height;
            txt.PosX = x;
            txt.PosY = y;
            txt.IsMultiLine = uiCheckBoxIsMultiLine.Checked;
            txt.Save();
            BindCardTxt();
            ClientScript.RegisterStartupScript(this.GetType(), "selectTab", "$(document).ready(function (){ $('#myTab a[href=\"#t-2\"]').tab('show'); $('#myTab a[href=\"#t-1\"]').removeClass('active'); $('#myTab a[href=\"#t-2\"]').addClass('active'); });", true);
            CleartextFields();
            CurrentTxt = null;
        }
        protected void uiLinkButtonCancelText_Click(object sender, EventArgs e)
        {
            CleartextFields();
            CurrentTxt = null;
            ClientScript.RegisterStartupScript(this.GetType(), "selectTab", "$(document).ready(function (){ $('#myTab a[href=\"#t-2\"]').tab('show'); $('#myTab a[href=\"#t-1\"]').removeClass('active'); $('#myTab a[href=\"#t-2\"]').addClass('active'); });", true);
        }



        protected void uiGridViewLayout_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewLayout.PageIndex = e.NewPageIndex;
            BindCardLayout();
        }

        protected void uiGridViewLayout_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteLayout")
            {
                try
                {
                    CardLayouts objData = new CardLayouts();
                    objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                    objData.MarkAsDeleted();
                    objData.Save();
                    CurrentLayout = null;
                    BindCardLayout();
                }
                catch (Exception ex)
                {
                    return;
                }
            }
        }

        protected void uiGridViewLayout_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                System.Web.UI.HtmlControls.HtmlGenericControl div = e.Row.FindControl("ColorDiv") as System.Web.UI.HtmlControls.HtmlGenericControl;

                int Colid = (int)DataBinder.Eval(e.Row.DataItem, "ColorID");
                Color col = new Color();
                col.LoadByPrimaryKey(Colid);

                string color = "#" + col.ColorCode;
                div.Attributes.CssStyle.Add("background-color", color);

            }
        }


        protected void uiButtonSaveLayout_Click(object sender, EventArgs e)
        {
            CardLayouts layout = new CardLayouts();
            if (CurrentLayout == null)
            {
                layout.AddNew();
                layout.CardID = CurrentCard.CardID;
            }
            else
                layout = CurrentLayout;

            if (uiFileUploadLayoutFront.HasFile)
            {
                string filepath = "/images/Layout/" + DateTime.Now.ToString("ddMMyyyyhhmmss") + "_" + uiFileUploadLayoutFront.FileName;
                uiFileUploadLayoutFront.SaveAs(Server.MapPath("~" + filepath));
                layout.LayoutImage = filepath;
            }

            if (uiFileUploadLayoutBack.HasFile)
            {
                string filepath = "/images/Layout/" + DateTime.Now.ToString("ddMMyyyyhhmmss") + "_" + uiFileUploadLayoutBack.FileName;
                uiFileUploadLayoutBack.SaveAs(Server.MapPath("~" + filepath));
                layout.LayeoutBackImage = filepath;
            }

            layout.ColorID = Convert.ToInt32(uiDropDownListColor.SelectedValue);

            layout.Save();

            BindCardLayout();
            ClientScript.RegisterStartupScript(this.GetType(), "selectTab", "$(document).ready(function (){ $('#myTab a[href=\"#t-3\"]').tab('show'); $('#myTab a[href=\"#t-1\"]').removeClass('active'); $('#myTab a[href=\"#t-3\"]').addClass('active'); });", true);
            uiDropDownListColor.SelectedIndex = 0;
            CurrentLayout = null;
        }

        protected void uiLinkButtonCancelLayout_Click(object sender, EventArgs e)
        {
            uiDropDownListColor.SelectedIndex = 0;
            CurrentLayout = null;
            ClientScript.RegisterStartupScript(this.GetType(), "selectTab", "$(document).ready(function (){ $('#myTab a[href=\"#t-3\"]').tab('show'); $('#myTab a[href=\"#t-1\"]').removeClass('active'); $('#myTab a[href=\"#t-3\"]').addClass('active'); });", true);
        }


        protected void uiGridViewColors_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewColors.PageIndex = e.NewPageIndex;
            BindCardColors();
        }


        protected void uiGridViewColors_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteColor")
            {
                try
                {
                    CardColor objData = new CardColor();
                    objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()), CurrentCard.CardID);
                    objData.MarkAsDeleted();
                    objData.Save();                    
                    BindCardColors();
                    ClientScript.RegisterStartupScript(this.GetType(), "selectTab", "$(document).ready(function (){ $('#myTab a[href=\"#t-4\"]').tab('show'); $('#myTab a[href=\"#t-1\"]').removeClass('active'); $('#myTab a[href=\"#t-4\"]').addClass('active'); });", true);
                }
                catch (Exception ex)
                {
                    return;
                }
            }
        }

        protected void uiGridViewColors_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                System.Web.UI.HtmlControls.HtmlGenericControl div = e.Row.FindControl("ColorDiv") as System.Web.UI.HtmlControls.HtmlGenericControl;

                int Colid = (int)DataBinder.Eval(e.Row.DataItem, "ColorID");
                Color col = new Color();
                col.LoadByPrimaryKey(Colid);

                string color = "#" + col.ColorCode;
                div.Attributes.CssStyle.Add("background-color", color);

            }
        }


        protected void uiButtonSaveColor_Click(object sender, EventArgs e)
        {
            CardColor color = new CardColor();
            CardColor temp = new CardColor();
            temp.LoadByPrimaryKey(Convert.ToInt32(uiDropDownListBackColor.SelectedValue), CurrentCard.CardID);
            if (!(temp.RowCount > 0))
            {
                color.AddNew();
                color.CardID = CurrentCard.CardID;
                color.ColorID = Convert.ToInt32(uiDropDownListBackColor.SelectedValue);
                color.Save();

                BindCardColors();
                ClientScript.RegisterStartupScript(this.GetType(), "selectTab", "$(document).ready(function (){ $('#myTab a[href=\"#t-4\"]').tab('show'); $('#myTab a[href=\"#t-1\"]').removeClass('active'); $('#myTab a[href=\"#t-4\"]').addClass('active'); });", true);
                uiDropDownListBackColor.SelectedIndex = 0;
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "selectTab", "$(document).ready(function (){ $('#myTab a[href=\"#t-4\"]').tab('show'); $('#myTab a[href=\"#t-1\"]').removeClass('active'); $('#myTab a[href=\"#t-4\"]').addClass('active'); });", true);
                return;
            }

        }

        protected void uiGridViewCardImages_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditImg")
            {
                CardImages objData = new CardImages();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                
                uiTextBoxImageWidth.Text = objData.ImgWidth.ToString();
                uiTextBoxImageHeight.Text = objData.ImgHieght.ToString();
                uiTextBoxImageX.Text = objData.PosX.ToString();
                uiTextBoxImageY.Text = objData.PosY.ToString();
                

                CurrentImg = objData;
                ClientScript.RegisterStartupScript(this.GetType(), "selectTab", "$(document).ready(function (){ $('#myTab a[href=\"#t-5\"]').tab('show'); $('#myTab a[href=\"#t-1\"]').removeClass('active'); $('#myTab a[href=\"#t-5\"]').addClass('active'); });", true);
            }
            else if (e.CommandName == "DeleteImg")
            {
                try
                {
                    CardImages objData = new CardImages();
                    objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                    objData.MarkAsDeleted();
                    objData.Save();
                    CurrentImg = null;
                    BindCardImages();
                    ClientScript.RegisterStartupScript(this.GetType(), "selectTab", "$(document).ready(function (){ $('#myTab a[href=\"#t-5\"]').tab('show'); $('#myTab a[href=\"#t-1\"]').removeClass('active'); $('#myTab a[href=\"#t-5\"]').addClass('active'); });", true);
                }
                catch (Exception ex)
                {
                    return;
                }
            }
        }


        protected void uiButtonSaveImageInfo_Click(object sender, EventArgs e)
        {
            CardImages txt = new CardImages();
            if (CurrentTxt == null)
            {
                txt.AddNew();
                txt.CardID = CurrentCard.CardID;
            }
            else
                txt = CurrentImg;

            
            int width, height, x, y;
            int.TryParse(uiTextBoxImageWidth.Text, out width);
            int.TryParse(uiTextBoxImageHeight.Text, out height);
            int.TryParse(uiTextBoxImageY.Text, out y);
            int.TryParse(uiTextBoxImageX.Text, out x);
            txt.ImgWidth = width;
            txt.ImgHieght = height;
            txt.PosX = x;
            txt.PosY = y;            
            txt.Save();
            BindCardImages();
            ClientScript.RegisterStartupScript(this.GetType(), "selectTab", "$(document).ready(function (){ $('#myTab a[href=\"#t-5\"]').tab('show'); $('#myTab a[href=\"#t-1\"]').removeClass('active'); $('#myTab a[href=\"#t-5\"]').addClass('active'); });", true);
            ClearImageFields();
            CurrentImg = null;
        }
        protected void uiLinkButtonCancelImage_Click(object sender, EventArgs e)
        {
            ClearImageFields();
            CurrentImg = null;
            ClientScript.RegisterStartupScript(this.GetType(), "selectTab", "$(document).ready(function (){ $('#myTab a[href=\"#t-5\"]').tab('show'); $('#myTab a[href=\"#t-1\"]').removeClass('active'); $('#myTab a[href=\"#t-5\"]').addClass('active'); });", true);
        }
        #endregion

        #region Methods
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


        private void CleartextFields()
        {
            uiTextBoxTxtLabel.Text = "";
            uiTextBoxX.Text = "";
            uiTextBoxY.Text = "";
            uiTextBoxWidth.Text = "";
            uiTextBoxHeight.Text = "";
            uiCheckBoxIsMultiLine.Checked = false;
        }

        private void ClearImageFields()
        {            
            uiTextBoxImageWidth.Text = "";
            uiTextBoxImageHeight.Text = "";
            uiTextBoxImageX.Text = "";
            uiTextBoxImageY.Text = "";            
        }


        private void BindData()
        {
            Cards cards = new Cards();
            if (uiDropDownListCats.SelectedIndex != -1)
                cards.GetCardsByCategoryID(Convert.ToInt32(uiDropDownListCats.SelectedValue), false);
            uiGridViewCards.DataSource = cards.DefaultView;
            uiGridViewCards.DataBind();
        }

        private void BindCardTxt()
        {
            CardText txt = new CardText();
            txt.GetCardTxtByCardID(CurrentCard.CardID);
            uiGridViewCardText.DataSource = txt.DefaultView;
            uiGridViewCardText.DataBind();
        }

        private void BindCardImages()
        {
            CardImages txt = new CardImages();
            txt.GetCardImageByCardID(CurrentCard.CardID);
            uiGridViewCardImages.DataSource = txt.DefaultView;
            uiGridViewCardImages.DataBind();
            if (txt.RowCount < 2)
            {
                uiButtonSaveImageInfo.Visible = true;
            }
            else 
            {
                uiButtonSaveImageInfo.Visible = false;
            }
        }

        private void BindCardLayout()
        {
            CardLayouts layout = new CardLayouts();
            layout.GetCardLayoutByCardID(CurrentCard.CardID);
            uiGridViewLayout.DataSource = layout.DefaultView;
            uiGridViewLayout.DataBind();
        }


        private void BindCardColors()
        {
            CardColor colors = new CardColor();
            colors.GetCardColorsByCardID(CurrentCard.CardID);
            uiGridViewColors.DataSource = colors.DefaultView;
            uiGridViewColors.DataBind();
        }

        private void LoadDDLs()
        {
            
            Color colors = new Color();
            colors.LoadAll();
            uiDropDownListColor.DataSource = colors.DefaultView;
            uiDropDownListColor.DataTextField = "ColorNameEng";
            uiDropDownListColor.DataValueField = "ColorID";
            uiDropDownListColor.DataBind();

            uiDropDownListBackColor.DataSource = colors.DefaultView;
            uiDropDownListBackColor.DataTextField = "ColorNameEng";
            uiDropDownListBackColor.DataValueField = "ColorID";
            uiDropDownListBackColor.DataBind();

            Dimension dims = new Dimension();
            dims.GetAllDims();
            uiDropDownListDim.DataSource = dims.DefaultView;
            uiDropDownListDim.DataTextField = "DisplayName";
            uiDropDownListDim.DataValueField = "DimensionID";
            uiDropDownListDim.DataBind();


            TopLevelCat Tcats = new TopLevelCat();
            Tcats.Where.IsPartySupplier.Value = true;
            Tcats.Where.IsPartySupplier.Operator = MyGeneration.dOOdads.WhereParameter.Operand.NotEqual;
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