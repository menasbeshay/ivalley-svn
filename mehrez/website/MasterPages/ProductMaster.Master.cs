using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace website.MasterPages
{
    public partial class ProductMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if ((Request.QueryString["cid"] != null && !string.IsNullOrEmpty(Request.QueryString["cid"])))
                {                    
                    BindProducts();
                }
            }
        }

        private void BindProducts()
        {
            DBLayer db = new DBLayer();
            DataSet ds = new DataSet();
            ds = db.GetAllProductByCatID(Convert.ToInt32(Request.QueryString["cid"].ToString()));

            uiRepeaterProducts.DataSource = ds;
            uiRepeaterProducts.DataBind();
        }
    }
}