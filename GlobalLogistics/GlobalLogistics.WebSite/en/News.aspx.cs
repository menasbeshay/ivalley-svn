using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GlobalLogistics.WebSite
{
    public partial class News : System.Web.UI.Page
    {
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
            BLL.News currentnews = new BLL.News();
            currentnews.LoadAll();
            uiRepeaterCurrentNews.DataSource = currentnews.DefaultView;
            uiRepeaterCurrentNews.DataBind();
        }
    }
}