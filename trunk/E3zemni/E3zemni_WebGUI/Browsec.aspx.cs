using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using E3zmni.BLL;
using System.Data;

namespace E3zemni_WebGUI
{
    public partial class Browsec : System.Web.UI.Page
    {

        #region properties
        public bool IsPartySupplier
        {
            get
            {
                if (Request.QueryString["ps"] != null)
                {
                    bool result = false;
                    bool.TryParse(Request.QueryString["ps"].ToString(), out result);
                    return result;
                }
                else
                {
                    return false;
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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();                
                if (MainCatID != 0)
                {
                    MainCat cat = new MainCat();
                    cat.LoadByPrimaryKey(MainCatID);
                    Master.PageTitle = cat.NameEng;

                    TopLevelCat Tcat = new TopLevelCat();
                    Tcat.LoadByPrimaryKey(cat.TopLevelCatID);

                    Master.Path = "<li><a href='#'>" + Tcat.NameEng + "</a></li>";
                    Master.ViewPath = true;
                }
                else if (TopCatID != 0)
                {
                    TopLevelCat cat = new TopLevelCat();
                    cat.LoadByPrimaryKey(TopCatID);
                    Master.PageTitle = cat.NameEng;
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

        private void BindData()
        {
            if (TopCatID != 0 && MainCatID != 0 && IsPartySupplier)
            {
                Categories cats = new Categories();
                cats.Where.IsPartySupplier.Value = true;
                cats.Where.IsPartySupplier.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
                cats.Where.MainCatId.Value = MainCatID;
                cats.Where.MainCatId.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
                
                cats.Sort = "CatNameEng";                
                cats.Query.Load();
                PagedDataSource pds = new PagedDataSource();
                pds.DataSource = cats.DefaultView;
                pds.AllowPaging = true;
                pds.PageSize = 12;
                pds.CurrentPageIndex = currentPage;
                uiRepeaterCats.DataSource = cats.DefaultView;
                uiRepeaterCats.DataBind();
            }
            else if (TopCatID != 0 && MainCatID != 0 && !IsPartySupplier)
            {
                Categories cats = new Categories();
                cats.Where.IsPartySupplier.Value = true;
                cats.Where.IsPartySupplier.Operator = MyGeneration.dOOdads.WhereParameter.Operand.NotEqual;
                cats.Where.MainCatId.Value = MainCatID;
                cats.Where.MainCatId.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;

                cats.Sort = "CatNameEng";
                cats.Query.Load();
                PagedDataSource pds = new PagedDataSource();
                pds.DataSource = cats.DefaultView;
                pds.AllowPaging = true;
                pds.PageSize = 12;
                pds.CurrentPageIndex = currentPage;
                uiRepeaterCats.DataSource = cats.DefaultView;
                uiRepeaterCats.DataBind();
            }
            else if (TopCatID != 0 && MainCatID == 0 && IsPartySupplier)
            {
                MainCat cats = new MainCat();
                cats.Where.IsPartySupplier.Value = true;
                cats.Where.IsPartySupplier.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
                cats.Where.TopLevelCatID.Value = TopCatID;
                cats.Where.TopLevelCatID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;

                cats.Sort = "NameEng";
                cats.Query.Load();
                PagedDataSource pds = new PagedDataSource();
                pds.DataSource = cats.DefaultView;
                pds.AllowPaging = true;
                pds.PageSize = 12;
                pds.CurrentPageIndex = currentPage;
                uiRepeaterCats.DataSource = cats.DefaultView;
                uiRepeaterCats.DataBind();
            }
            else if (TopCatID != 0 && MainCatID == 0 && !IsPartySupplier)
            {
                MainCat cats = new MainCat();
                cats.Where.IsPartySupplier.Value = true;
                cats.Where.IsPartySupplier.Operator = MyGeneration.dOOdads.WhereParameter.Operand.NotEqual;
                cats.Where.TopLevelCatID.Value = TopCatID;
                cats.Where.TopLevelCatID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
                cats.Sort = "NameEng";
                cats.Query.Load();
                PagedDataSource pds = new PagedDataSource();
                pds.DataSource = cats.DefaultView;
                pds.AllowPaging = true;
                pds.PageSize = 12;
                pds.CurrentPageIndex = currentPage;
                uiRepeaterCats.DataSource = cats.DefaultView;
                uiRepeaterCats.DataBind();
            }
        }

        protected void uiRepeaterCats_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DataRowView row = (DataRowView)e.Item.DataItem;
                HyperLink firstLink = (HyperLink)e.Item.FindControl("uiHyperLinkCat1st");
                Image img = (Image)firstLink.FindControl("uiImageProduct");
                HyperLink secondLink = (HyperLink)e.Item.FindControl("uiHyperLinkCat2nd");
                if (IsPartySupplier)
                {
                    if (MainCatID != 0)
                    {
                        secondLink.Text = row["CatNameEng"].ToString();
                        img.ImageUrl = row["CatImage"].ToString();
                        firstLink.NavigateUrl = secondLink.NavigateUrl = "browse.aspx?tcid=" + TopCatID.ToString() + "&mcid=" + MainCatID.ToString() + "&cid=" + row["CategoryID"].ToString() + "&ps=true";
                    }
                    else
                    {
                        secondLink.Text = row["NameEng"].ToString();
                        img.ImageUrl = row["ImagePath"].ToString();
                        firstLink.NavigateUrl = secondLink.NavigateUrl = "browsec.aspx?tcid=" + TopCatID.ToString() + "&mcid=" + row["MainCatID"].ToString() + "&ps=true";
                    }
                }
                else
                {
                    if (MainCatID != 0)
                    {
                        secondLink.Text = row["CatNameEng"].ToString();
                        img.ImageUrl = row["CatImage"].ToString();
                        firstLink.NavigateUrl = secondLink.NavigateUrl = "browse.aspx?tcid=" + TopCatID.ToString() + "&mcid=" + MainCatID.ToString() + "&cid=" + row["CategoryID"].ToString();
                    }
                    else
                    {
                        secondLink.Text = row["NameEng"].ToString();
                        img.ImageUrl = row["ImagePath"].ToString();
                        firstLink.NavigateUrl = secondLink.NavigateUrl = "browsec.aspx?tcid=" + TopCatID.ToString() + "&mcid=" + row["MainCatID"].ToString();
                    }
                }
                
            }
        }
    }
}