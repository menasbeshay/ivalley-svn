using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Chat2Connect
{
    public partial class viewnode : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BLL.SiteSettings settings = new BLL.SiteSettings();
                if(Request.QueryString["node"] != null)
                {
                    switch (Request.QueryString["node"].ToString())
                    {
                        case "privacy":
                            settings.LoadByPrimaryKey(6);
                            uiLabelTitle.Text = settings.Name;
                            uiLiteralContent.Text = Server.HtmlDecode(settings.Content);
                            break;
                        case "terms":
                            settings.LoadByPrimaryKey(5);
                            uiLabelTitle.Text = settings.Name;
                            uiLiteralContent.Text = Server.HtmlDecode(settings.Content);
                            break;
                        case "faq":
                            settings.LoadByPrimaryKey(7);
                            uiLabelTitle.Text = settings.Name;
                            uiLiteralContent.Text = Server.HtmlDecode(settings.Content);
                            break;
                        default:
                            Response.Redirect("home.aspx");
                            break;
                    }
                }

            }
        }
    }
}