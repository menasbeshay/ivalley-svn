using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Obtravel.Arabic.UserContorls
{
    public partial class About : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DBLayer db = new DBLayer();
                DataSet ds = new DataSet();
                ds = db.GetBlockContent(2);
                uiLiteralTitle.Text = ds.Tables[0].Rows[0]["arTitle"].ToString();
                uiLiteralContent.Text = Server.HtmlDecode(ds.Tables[0].Rows[0]["arBrief"].ToString());
                uiImageBlock.ImageUrl = ds.Tables[0].Rows[0]["arImagePath"].ToString();
            }
        }
    }
}