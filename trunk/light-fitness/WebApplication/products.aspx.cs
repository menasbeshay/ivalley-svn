using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebApplication
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
                    uiPanelCats.Visible = false;

                    BindProducts();
                }
                else
                {
                    uiPanelProducts.Visible = false;
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
            BindProducts();
        }

        private void BindProducts()
        {
            DBLayer db = new DBLayer();
            DataSet ds = new DataSet();
            DataSet ds2 = new DataSet();
            ds = db.GetAllProductByCatID(Convert.ToInt32(Request.QueryString["cid"].ToString()));
            ds2 = db.GetCategoryContent(Convert.ToInt32(Request.QueryString["cid"].ToString()));

            uiLabelCategory.Text = ds2.Tables[0].Rows[0]["CategoryName"].ToString();
            PagedDataSource dt = new PagedDataSource();
            dt.DataSource = ds.Tables[0].DefaultView;
            dt.AllowPaging = true;
            dt.PageSize = 12;
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
            BindProducts();
        }

        protected void uiLinkButtonBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("products.aspx?cid=1");
        }
    }
}