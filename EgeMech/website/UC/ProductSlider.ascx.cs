using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace website.UC
{
    public partial class ProductSlider : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                EGEMech.BLL.Product products = new EGEMech.BLL.Product();
                products.Query.Top = 10;
                products.Query.Load();
                uiRepeaterProducts.DataSource = products.DefaultView;
                uiRepeaterProducts.DataBind();
            }
        }
    }
}