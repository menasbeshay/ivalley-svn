using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Obtravel.Arabic
{
    public partial class AboutUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DBLayer db = new DBLayer();
                DataSet ds = new DataSet();
                ds = db.GetPageContent(1);
                uiLabelTitle.Text = ds.Tables[0].Rows[0]["arTitle"].ToString();
                uiLiteralContent.Text = Server.HtmlDecode(ds.Tables[0].Rows[0]["arContent"].ToString());

            }
            RegisterStartupScript("menu", "<script type='text/javascript'>$(\"#m2\").addClass(\"selected\");</script>");
        }
    }
}