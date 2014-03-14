using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace I_Stock.Admin
{
    public partial class DOTotals : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void uiLinkButtonCalculate_Click(object sender, EventArgs e)
        {
            IStock.BLL.DeliveryOrder obj = new IStock.BLL.DeliveryOrder();
            uiGridViewOrders.DataSource = obj.GetDeliveryOrdersDetailsTotals(uiTextBoxFrom.Text, uiTextBoxTo.Text);
            uiGridViewOrders.DataBind();
        }
    }
}