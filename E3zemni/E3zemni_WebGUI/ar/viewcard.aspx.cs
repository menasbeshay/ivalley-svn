using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using E3zmni.BLL;
using System.Data;

namespace E3zemni_WebGUI.ar
{
    public partial class viewcard : System.Web.UI.Page
    {
        public int CardID
        {
            get
            {
                if (Request.QueryString["cid"] != null)
                {
                    try
                    {
                        return int.Parse(Request.QueryString["cid"].ToString());
                    }
                    catch (Exception ex)
                    {
                        return 0;
                    }

                }
                else
                {
                    return 0;
                }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (CardID != 0)
                {
                    Cards card = new Cards();
                    card.LoadByPrimaryKey(CardID);
                    uiLabelName.Text = card.CardNameAr;
                    uiLabelPriceFrom.Text = card.PriceBefore.ToString();
                    uiLabelPriceTo.Text = card.PriceNow.ToString();
                    uiImagemain.ImageUrl = "../" + card.MainPhoto;
                    uiLabelDate.Text = card.UploadDate.ToString("dd/MM/yyyy");
                    uiLiteralDesc.Text = card.DescriptionAr;
                    if (card.IsPartySupplier)
                    {
                        uipanelIsCard.Visible = false;
                        uiLinkButtonCustomize.Visible = false;
                        uiLinkButtonAddToCart.Visible = true;

                        uipanelImages.Visible = true;
                        uiImagemain.Visible = false;

                        PartySupplierImages images = new PartySupplierImages();
                        images.Where.CardID.Value = card.CardID;
                        images.Where.CardID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
                        images.Query.Load();
                        images.AddNew();
                        images.CardID = card.CardID;
                        images.ImagePath = card.MainPhoto;
                        uiRepeaterImages.DataSource = images.DefaultView;
                        uiRepeaterImages.DataBind();

                        uiRepeaterthumbs.DataSource = images.DefaultView;
                        uiRepeaterthumbs.DataBind();
                    }
                    else
                    {
                        uipanelImages.Visible = false;
                        CardColor colors = new CardColor();
                        colors.GetCardColorsByCardID(card.CardID);
                        uiRepeaterColor.DataSource = colors.DefaultView;
                        uiRepeaterColor.DataBind();
                        uiLinkButtonCustomize.PostBackUrl = "customize.aspx?cid=" + card.CardID;
                    }
                    BindReviews();


                    Master.PageTitle = card.CardNameAr;

                    Categories cat = new Categories();
                    cat.LoadByPrimaryKey(card.CategoryID);

                    MainCat mcat = new MainCat();
                    mcat.LoadByPrimaryKey(cat.MainCatId);

                    TopLevelCat tcat = new TopLevelCat();
                    tcat.LoadByPrimaryKey(mcat.TopLevelCatID);

                    Master.Path = "<li><a href='#'>" + tcat.NameAr + "</a></li>" + "<li><a href='#'>" + mcat.NameAr + "</a></li>";
                    Master.ViewPath = true;
                }
                else
                {
                    Response.Redirect("~/ar/browse.aspx");
                }
            }
        }

        private void BindReviews()
        {
            UserReviews rev = new UserReviews();
            rev.GetUserReviewsByCardID(CardID);
            uiRepeaterReviews.DataSource = rev.DefaultView;
            uiRepeaterReviews.DataBind();
        }

        protected void uiRepeaterColor_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                Literal l = (Literal)e.Item.FindControl("uiLiteralColor");
                DataRowView row = (DataRowView)e.Item.DataItem;
                Color c = new Color();
                c.LoadByPrimaryKey(Convert.ToInt32(row["ColorID"].ToString()));
                l.Text = "<label style='background-color: #" + c.ColorCode + ";width:20px;height:20px;'></label>";
            }
        }

        protected void uiLinkButtonSave_Click(object sender, EventArgs e)
        {
            if (Session["CurrentUser"] != null)
            {
                UserInfo user = (UserInfo)Session["CurrentUser"];
                UserReviews rev = new UserReviews();
                rev.AddNew();
                rev.UserID = user.UserID;
                rev.CardID = CardID;
                rev.RevTitle = uiTextBoxTitle.Text;
                rev.RevDescription = uiTextBoxReview.Text;
                rev.Save();
                BindReviews();
                uiLabelError.Visible = false;
            }
            else
            {
                uiLabelError.Visible = true;
            }

        }

        protected void uiLinkButtonAddToCart_Click(object sender, EventArgs e)
        {
            UserPayement temp = (UserPayement)Session["UserPayment"];
            if (temp == null)
                temp = new UserPayement();
            temp.AddNew();
            Cards card = new Cards();
            card.LoadByPrimaryKey(CardID);
            temp.CardID = card.CardID;
            temp.CardDesign = card.MainPhoto;
            temp.CardCount = 1;
            Session["UserPayment"] = temp;
        }
    }
}