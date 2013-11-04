using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;

namespace Taqwa.Website.Controls
{
    public partial class News : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DBLayer db = new DBLayer();
                uiRepeaterTopNews.DataSource = db.GetTopNews();
                uiRepeaterTopNews.DataBind();
            }

        }
    }
}