using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace website
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
                    uiPanelAll.Visible = false;
                    uiPanelDetails.Visible = true;
                    int id = Convert.ToInt32(Request.QueryString["NID"].ToString());
                    DBLayer db = new DBLayer();
                    DataSet ds = new DataSet();
                    ds = db.GetNewsContent(id);
                    
                    uiLabelTitle.Text = ds.Tables[0].Rows[0]["Title"].ToString();

                    uiImagemain.ImageUrl = ds.Tables[0].Rows[0]["MainPicURL"].ToString();          
                    uiLiteralContent.Text = Server.HtmlDecode( ds.Tables[0].Rows[0]["Content"].ToString());

                    newImages.DataSource = db.GetNewsImages(id);
                    newImages.DataBind();
                }
                else
                {
                    uiPanelAll.Visible = true;
                    uiPanelDetails.Visible = false;
                    BindData();
                }
            }
        }

        private void BindData()
        {
            PagedDataSource dt = new PagedDataSource();
            DBLayer db = new DBLayer();
            
            dt.DataSource = db.GetAllNews().Tables[0].DefaultView;
                        
            dt.AllowPaging = true;
            dt.PageSize = 10;
            dt.CurrentPageIndex = PageIndex;
            uiRepeaterNews.DataSource = dt;
            uiRepeaterNews.DataBind();


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