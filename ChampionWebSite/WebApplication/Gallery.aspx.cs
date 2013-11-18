using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication.lib;

namespace WebApplication
{
    public partial class Gallery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();

            uiRepeaterCats.DataSource = db.GetAllCats();
            uiRepeaterCats.DataBind();

            uiRepeaterGallery.DataSource = db.GetAllProducts();
            uiRepeaterGallery.DataBind();
        }
    }
}