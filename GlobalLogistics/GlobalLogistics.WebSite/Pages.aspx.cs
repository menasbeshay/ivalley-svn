using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GlobalLogistics.WebSite.Arabic
{
    public partial class Pages : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int pid = 0;
                if (Request.QueryString["pid"] != null)
                {
                    try
                    {
                        pid = Convert.ToInt32(Request.QueryString["pid"].ToString());
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
                    BLL.Pages page = new BLL.Pages();
                    page.LoadByPrimaryKey(pid);
                    uiLabelTitle.Text = page.ArTitle;
                    uiLiteralContent.Text = Server.HtmlDecode(page.ArContent);
                }
            }
        }
    }
}