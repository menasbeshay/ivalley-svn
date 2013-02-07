using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GlobalLogistics.WebSite
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
                    BLL.News currentnews = new BLL.News();
                    currentnews.LoadByPrimaryKey(id);
                    uiLabelDate.Text = string.Format("{0:yyyy-MM-dd}", currentnews.CreatedDate.ToString());
                    uiLabelTime.Text = string.Format("{0:hh:mm:ss}", currentnews.CreatedDate.ToString());
                    uiLabelTitle.Text = currentnews.EnTitle;
                    if (!string.IsNullOrEmpty(currentnews.MainPicturePath))
                        uiImageNews.ImageUrl = currentnews.MainPicturePath;
                    else
                        uiImageNews.ImageUrl = "images/logo_Big_watermark.jpg";                    
                    uiLiteralContent.Text = Server.HtmlDecode(currentnews.EnBody);
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
            BLL.News currentnews = new BLL.News();
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
            uiLabelPages.Text = "Page " + (PageIndex + 1).ToString() + " of " + dt.PageCount.ToString() + " Pages";

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