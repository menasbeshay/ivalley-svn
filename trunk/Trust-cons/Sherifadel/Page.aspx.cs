using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Sherifadel
{
    public partial class Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["PID"] != null && !string.IsNullOrEmpty(Request.QueryString["PID"].ToString()))
            {
                int id = Convert.ToInt32(Request.QueryString["PID"].ToString());
                DBLayer db = new DBLayer();
                DataSet ds = new DataSet();
                ds = db.GetPageContent(id);
                if (ds.Tables[0].Rows.Count != 0)
                {
                    Master.PageTitle = ds.Tables[0].Rows[0]["Title"].ToString();
                    uiLiteralContent.Text = Server.HtmlDecode(ds.Tables[0].Rows[0]["Content"].ToString());
                }
                else
                {
                    Response.Redirect("Page.aspx?PID=10");
                }
            }
            else
            {
                Response.Redirect("Page.aspx?PID=10");
            }
            
        }
    }
}