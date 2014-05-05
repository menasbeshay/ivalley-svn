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
    public partial class browse : System.Web.UI.Page
    {
        #region props
        public int CatID
        {
            get
            {
                if (Request.QueryString["catid"] != null)
                {
                    try
                    {
                        return int.Parse(Request.QueryString["catid"].ToString());
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


        public int MainCatID
        {
            get
            {
                if (Request.QueryString["mcid"] != null)
                {
                    try
                    {
                        return int.Parse(Request.QueryString["mcid"].ToString());
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

        public int TopCatID
        {
            get
            {
                if (Request.QueryString["tcid"] != null)
                {
                    try
                    {
                        return int.Parse(Request.QueryString["tcid"].ToString());
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

        public string SearchText
        {
            get
            {
                if (Request.QueryString["q"] != null)
                {
                    return Request.QueryString["q"].ToString();

                }
                else
                {
                    return "";
                }
            }
        }

        public double PriceFrom
        {
            get
            {
                if (Request.QueryString["pfrom"] != null)
                {
                    try
                    {
                        return double.Parse(Request.QueryString["pfrom"].ToString());
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

        public double PriceTo
        {
            get
            {
                if (Request.QueryString["pto"] != null)
                {
                    try
                    {
                        return double.Parse(Request.QueryString["pto"].ToString());
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

        public string ColorIds
        {
            get
            {
                if (Request.QueryString["c"] != null)
                {

                    return Request.QueryString["c"].ToString();
                }
                else
                {
                    return "";
                }
            }
        }

        public string DimIds
        {
            get
            {
                if (Request.QueryString["s"] != null)
                {

                    return Request.QueryString["s"].ToString();
                }
                else
                {
                    return "";
                }
            }
        }




        public int currentPage
        {
            get
            {
                object o = ViewState["_CurrentPage"];
                if (o == null)
                    return 0; // default page index of 0
                else
                    return (int)o;
            }
            set { ViewState["_CurrentPage"] = value; }
        }
        #endregion

        #region events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
                if (CatID != 0)
                {
                    Categories cat = new Categories();
                    cat.LoadByPrimaryKey(CatID);
                    Master.PageTitle = cat.CatNameAr;

                    MainCat Mcat = new MainCat();
                    Mcat.LoadByPrimaryKey(cat.MainCatId);

                    TopLevelCat Tcat = new TopLevelCat();
                    Tcat.LoadByPrimaryKey(Mcat.TopLevelCatID);

                    Master.Path = "<li><a href='#'>" + Tcat.NameAr + "</a></li>" + "<li><a href='#'>" + Mcat.NameAr + "</a></li>";

                    Master.ViewPath = true;
                }
                else if (MainCatID != 0)
                {
                    MainCat cat = new MainCat();
                    cat.LoadByPrimaryKey(MainCatID);
                    Master.PageTitle = cat.NameAr;

                    TopLevelCat Tcat = new TopLevelCat();
                    Tcat.LoadByPrimaryKey(cat.TopLevelCatID);

                    Master.Path = "<li><a href='#'>" + Tcat.NameAr + "</a></li>";

                    Master.ViewPath = true;
                }
                else if (TopCatID != 0)
                {
                    TopLevelCat cat = new TopLevelCat();
                    cat.LoadByPrimaryKey(MainCatID);
                    Master.PageTitle = cat.NameAr;

                    Master.ViewPath = true;
                }


            }
        }

        protected void uiLinkButtonNext_Click(object sender, EventArgs e)
        {
            currentPage++;
            BindData();
        }
        protected void uiLinkButtonPrev_Click(object sender, EventArgs e)
        {
            currentPage--;
            BindData();
        }
        #endregion

        #region methods

        private void BindData()
        {
            Cards cards = new Cards();
            cards.SearchCards(SearchText, CatID, PriceFrom, PriceTo, DimIds, ColorIds);

            PagedDataSource pds = new PagedDataSource();
            pds.DataSource = cards.DefaultView;
            pds.AllowPaging = true;
            pds.PageSize = 12;
            pds.CurrentPageIndex = currentPage;
            uiRepeaterCards.DataSource = pds;
            uiRepeaterCards.DataBind();
            uiLinkButtonPrev.Enabled = true;
            uiLinkButtonNext.Enabled = true;
            if (currentPage == 0)
            {
                uiLinkButtonPrev.Enabled = false;
            }

            if (currentPage == (pds.PageCount - 1))
            {
                uiLinkButtonNext.Enabled = false;
            }
        }

        protected void uiRepeaterCards_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.AlternatingItem || e.Item.ItemType == ListItemType.Item)
            {
                DataRowView row = (DataRowView)e.Item.DataItem;
                CardColor colors = new CardColor();
                colors.GetCardColorsByCardIDTop3(Convert.ToInt32(row["CardID"].ToString()));

                Repeater uiRepeaterColor = (Repeater)e.Item.FindControl("uiRepeaterColor");

                uiRepeaterColor.DataSource = colors.DefaultView;
                uiRepeaterColor.DataBind();
            }
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
        #endregion
    }
}