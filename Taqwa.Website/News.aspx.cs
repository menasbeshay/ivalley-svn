using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;

namespace Taqwa.Website
{
    public partial class News : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["NID"] != null && !string.IsNullOrEmpty(Request.QueryString["NID"].ToString()) && Request.QueryString["NID"].ToString() != "0")
                {                    
                    BindData();
                    uiPanelAllNews.Visible = false;
                    uiPanelCurrent.Visible = true;
                }
                else
                {
                    DBLayer db = new DBLayer();
                    uiGridViewAllNews.DataSource = db.GetAllNews();
                    uiGridViewAllNews.DataBind();
                    uiPanelAllNews.Visible = true;
                    uiPanelCurrent.Visible = false;
                }
            }
        }

        private void BindData()
        {
            DBLayer db = new DBLayer();
            DataSet ds = new DataSet();

            int id = 0;
            bool done = int.TryParse(Request.QueryString["NID"].ToString(), out id);
            if (done)
            {
                ds = db.GetNews(Convert.ToInt32(Request.QueryString["NID"].ToString()));
                if (ds.Tables.Count > 0)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        uiLabelTitle.Text = ds.Tables[0].Rows[0]["ArTitle"].ToString();
                        uiLiteralContent.Text = Server.HtmlDecode(ds.Tables[0].Rows[0]["ArBody"].ToString());
                    }
                    else
                    {
                        Response.Redirect("~/News.aspx");
                    }

                }
                else
                {
                    Response.Redirect("~/News.aspx");
                }
            }
            else
            {
                Response.Redirect("~/News.aspx");
            }
            
        }
    }
}