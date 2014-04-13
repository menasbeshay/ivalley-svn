using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using E3zmni.BLL;

namespace E3zemni_WebGUI
{
    public partial class page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["PID"] != null && !string.IsNullOrEmpty(Request.QueryString["PID"].ToString()))
                {
                    int id = Convert.ToInt32(Request.QueryString["PID"].ToString());
                    SitePages page = new SitePages();
                    page.LoadByPrimaryKey(id);
                    if (page.RowCount > 0)
                    {
                        uiLabelTitle.Text = page.PageTitleEng;
                        uiLiteralContent.Text = Server.HtmlDecode(page.PageTextEng);
                    }
                    else
                    {
                        Response.Redirect("~/default.aspx");
                    }
                }
                else
                {
                    Response.Redirect("~/default.aspx");
                }
            }
        }
    }
}