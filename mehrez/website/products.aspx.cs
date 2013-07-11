using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace website
{
    public partial class products : System.Web.UI.Page
    {
        public int PageIndex
        {
            get
            {
                object o = this.ViewState["_CurrentPage"];
                if (o == null)
                    return 0;
                else
                    return (int)o;
            }
            set
            {
                this.ViewState["_CurrentPage"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if ((Request.QueryString["cid"] != null && !string.IsNullOrEmpty(Request.QueryString["cid"])))
                {
                    uiPanelProducts.Visible = true;
                    uiPanelDetail.Visible = false;
                    uiPanelCats.Visible = false;

                    BindCats();
                }
                else if ((Request.QueryString["pid"] != null && !string.IsNullOrEmpty(Request.QueryString["pid"])))
                {
                    uiPanelProducts.Visible = false;
                    uiPanelDetail.Visible = true;
                    uiPanelCats.Visible = false;

                    DBLayer db = new DBLayer();
                    DataSet ds = new DataSet();
                    DataSet items = new DataSet();
                    ds = db.GetProductContent(Convert.ToInt32(Request.QueryString["pid"].ToString()));
                    items = db.GetAllItemsByProductID(Convert.ToInt32(Request.QueryString["pid"].ToString()));
                    uiLabelPath.Text = db.GetCategoryContent(Convert.ToInt32(ds.Tables[0].Rows[0]["CategoryID"].ToString())).Tables[0].Rows[0]["categoryName"].ToString() + " / " + ds.Tables[0].Rows[0]["ProductName"].ToString();
                    uiImagemainPic.ImageUrl = ds.Tables[0].Rows[0]["PicPath"].ToString();
                    uiRepeaterItems.DataSource = items;
                    uiRepeaterItems.DataBind();
                }
                else //if ((Request.QueryString["cid"] == null || string.IsNullOrEmpty(Request.QueryString["cid"])) && (Request.QueryString["pid"] == null || string.IsNullOrEmpty(Request.QueryString["pid"])))
                {
                    uiPanelProducts.Visible = false;
                    uiPanelDetail.Visible = false;
                    uiPanelCats.Visible = true;
                    
                    DBLayer db = new DBLayer();
                    DataSet ds = new DataSet();
                    ds = db.GetAllCats();
                    uiRepeaterCats.DataSource = ds;
                    uiRepeaterCats.DataBind();
                    
                }
                
            }

        }


        protected void uiLinkButtonPrev_Click(object sender, EventArgs e)
        {
            PageIndex -= 1;
            BindCats();
        }

        private void BindCats()
        {
            DBLayer db = new DBLayer();
            DataSet ds = new DataSet();
            ds = db.GetAllProductByCatID(Convert.ToInt32(Request.QueryString["cid"].ToString()));
            PagedDataSource dt = new PagedDataSource();
            dt.DataSource = ds.Tables[0].DefaultView;
            dt.AllowPaging = true;
            dt.PageSize = 10;
            dt.CurrentPageIndex = PageIndex;
            uiLinkButtonPrev.Enabled = !dt.IsFirstPage;
            uiLinkButtonNext.Enabled = !dt.IsLastPage;
            uiLabelPages.Text = "Page " + (PageIndex + 1).ToString() + " of " + dt.PageCount.ToString() + " Pages";

            uiRepeaterProducts.DataSource = dt;
            uiRepeaterProducts.DataBind();
        }

        protected void uiLinkButtonNext_Click(object sender, EventArgs e)
        {
            PageIndex += 1;
            BindCats();
        }
    }
}