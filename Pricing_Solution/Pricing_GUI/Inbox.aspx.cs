using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pricing_GUI
{
    public partial class Inbox : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindInbox();
            }
        }

        private void BindInbox()
        {
            Pricing.BLL.v_PriceSchedual inbox = new Pricing.BLL.v_PriceSchedual();
            inbox.GetTopPricingSchedual(CodeGlobal.LogedInCompany.CompanyID);

            uiGridViewInbox.DataSource = inbox.DefaultView;
            uiGridViewInbox.DataBind();
        }
    }
}