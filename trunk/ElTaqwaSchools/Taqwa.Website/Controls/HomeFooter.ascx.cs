using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;

namespace Taqwa.Website.Controls
{
    public partial class HomeFooter : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DBLayer db = new DBLayer();
                DataSet ds = new DataSet();
                ds = db.GetHomePageBlock(6);
                uiLiteralContent.Text = Server.HtmlDecode(ds.Tables[0].Rows[0]["ArBlockContent"].ToString());
            }
        }
    }
}