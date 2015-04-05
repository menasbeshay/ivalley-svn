using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace brotherssolidarity
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BLL.Page page = new BLL.Page();
                page.LoadByPrimaryKey(1);
                uiLiteralContent.Text = Server.HtmlDecode(page.ContentAr);
            }
        }
    }
}