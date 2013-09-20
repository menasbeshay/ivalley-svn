using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ermia_BLL;
namespace Website
{
    public partial class ArticleDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.PageTitle = "مقالات";
                int pid = 0;
                if (Request.QueryString["Aid"] != null)
                {
                    try
                    {
                        pid = Convert.ToInt32(Request.QueryString["Aid"].ToString());
                    }
                    catch (Exception ex)
                    {
                        pid = 0;
                    }
                }

                if (pid == 0)
                {
                    Response.Redirect("~/Default.aspx");
                }
                else
                {
                    CMS_Content page = new CMS_Content();
                    page.LoadByPrimaryKey(pid);
                    uiImageMain.ImageUrl = "Images.aspx?Inner=t&Image=" + page.MainImagePath;
                    uiLiteralContent.Text = Server.HtmlDecode(page.ArContent);
                }
            }
        }
    }
}