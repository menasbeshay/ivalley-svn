using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace YMC_Website
{
    public partial class ViewNews : System.Web.UI.Page
    {
        public int currentPage
        {
            get
            {
                object o = ViewState["_CurrentPageNews"];
                if (o == null)
                    return 0; // default page index of 0
                else
                    return (int)o;
            }
            set { ViewState["_CurrentPageNews"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["nid"] != null && !string.IsNullOrEmpty(Request.QueryString["nid"]))
                {
                    uiPanelAllNews.Visible = false;
                    uiPanelViewNews.Visible = true;
                    int id = Convert.ToInt32(Request.QueryString["nid"].ToString());
                    YMC.BLL.News currentnews = new YMC.BLL.News();
                    currentnews.LoadByPrimaryKey(id);                    
                    uiLabelTitle.Text = currentnews.Title;                    
                    uiLiteralContent.Text = Server.HtmlDecode(currentnews.Details);
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
            YMC.BLL.News currentnews = new YMC.BLL.News();
            currentnews.LoadAll();
            currentnews.DefaultView.Sort = "NewsDate desc";
            PagedDataSource pds = new PagedDataSource();
            pds.DataSource = currentnews.DefaultView;
            pds.AllowPaging = true;
            pds.PageSize = 10;
            pds.CurrentPageIndex = currentPage;
            uiRepeaterNews.DataSource = pds;
            uiRepeaterNews.DataBind();
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

        protected void uiGridViewNews_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewNews.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiLinkButtonPrev_Click(object sender, EventArgs e)
        {
            currentPage--;
            BindData();
        }

        protected void uiLinkButtonNext_Click(object sender, EventArgs e)
        {
            currentPage++;
            BindData();
        }
    }
}