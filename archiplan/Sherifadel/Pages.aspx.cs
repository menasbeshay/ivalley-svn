using System;
using System.Collections.Generic;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using archiplan;

namespace archiplan
{
    public partial class Pages : System.Web.UI.Page
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
                    lblPaceContent.Text = Server.HtmlDecode(ds.Tables[0].Rows[0]["Content"].ToString());
                }
                else
                {
                    Response.Redirect("Pages.aspx?PID=14");
                }
            }
            else
            {
                Response.Redirect("Pages.aspx?PID=14");
            }
        }
    }
}