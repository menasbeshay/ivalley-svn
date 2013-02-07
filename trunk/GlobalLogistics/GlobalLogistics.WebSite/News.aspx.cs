using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GlobalLogistics.WebSite.Arabic
{
    public partial class News : System.Web.UI.Page
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
                if (Request.QueryString["NID"] != null && !string.IsNullOrEmpty(Request.QueryString["NID"]))
                {
                    uiPanelAllNews.Visible = false;
                    uiPanelViewNews.Visible = true;
                    int id = Convert.ToInt32(Request.QueryString["NID"].ToString());
                    BLL.ArNews currentnews = new BLL.ArNews();
                    currentnews.LoadByPrimaryKey(id);
                    uiLabelDate.Text = string.Format("{0:yyyy-MM-dd}", currentnews.CreatedDate.ToString());
                    uiLabelTime.Text = string.Format("{0:hh:mm:ss}", currentnews.CreatedDate.ToString());
                    uiLabelTitle.Text = currentnews.ArTitle;
                    if (!string.IsNullOrEmpty(currentnews.MainPicturePath))
                        uiImageNews.ImageUrl = currentnews.MainPicturePath;
                    else
                        uiImageNews.ImageUrl = "arabic/images/logo_Big_watermark.jpg";
                    uiLiteralContent.Text = Server.HtmlDecode(currentnews.ArBody);
                }
                else
                {
                    uiPanelAllNews.Visible = true;
                    uiPanelViewNews.Visible = false;
                    BindData();
                }
            }
        }

        private void BindData()
        {
            PagedDataSource dt = new PagedDataSource();
            BLL.ArNews currentnews = new BLL.ArNews();
            currentnews.LoadAll();
            currentnews.DefaultView.Sort = "CreatedDate desc";
            dt.DataSource = currentnews.DefaultView;
            dt.AllowPaging = true;
            dt.PageSize = 10;
            dt.CurrentPageIndex = PageIndex;
            uiRepeaterCurrentNews.DataSource = dt;
            uiRepeaterCurrentNews.DataBind();

            uiLinkButtonPrev.Enabled = !dt.IsFirstPage;
            uiLinkButtonNext.Enabled = !dt.IsLastPage;
            uiLabelPages.Text = "صفحة " + (PageIndex + 1).ToString() + " من " + dt.PageCount.ToString() + " صفحات";
        }

        protected void uiLinkButtonPrev_Click(object sender, EventArgs e)
        {
            PageIndex -= 1;
            BindData();
        }

        protected void uiLinkButtonNext_Click(object sender, EventArgs e)
        {
            PageIndex += 1;
            BindData();
        }
    }
}