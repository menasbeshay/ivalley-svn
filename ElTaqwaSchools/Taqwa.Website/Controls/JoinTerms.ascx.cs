using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;

namespace Taqwa.Website.Controls
{
    public partial class JoinTerms : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DBLayer db = new DBLayer();
                DataSet ds = db.GetPage(4);
                if (ds.Tables[0].Rows[0]["ArPageContent"].ToString().Length > 250)
                {
                    uiLiteralContent.Text = Server.HtmlDecode(ds.Tables[0].Rows[0]["ArPageContent"].ToString().Substring(0, 250));
                }
                else
                {
                    uiLiteralContent.Text = Server.HtmlDecode(ds.Tables[0].Rows[0]["ArPageContent"].ToString());
                }
            }
        }
    }
}