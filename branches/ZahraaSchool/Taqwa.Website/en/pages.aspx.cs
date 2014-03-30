using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;

namespace Taqwa.Website.en
{
    public partial class pages : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["PID"] != null && !string.IsNullOrEmpty(Request.QueryString["PID"].ToString()))
                {
                    int id = Convert.ToInt32(Request.QueryString["PID"].ToString());
                    DBLayer db = new DBLayer();
                    DataSet ds = new DataSet();
                    ds = db.GetPage(id);
                    uiLiteralTitle.Text = ds.Tables[0].Rows[0]["EnPageTitle"].ToString();
                    uiLiteralContent.Text = Server.HtmlDecode(ds.Tables[0].Rows[0]["EnPageContent"].ToString());
                }
                else
                {
                    Response.Redirect("~/en/index.aspx");
                }
            }
        }
    }
}