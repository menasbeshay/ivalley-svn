using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GlobalLogistics.BLL;

namespace GlobalLogistics.WebSite.Controls
{
    public partial class Exchanges : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }

        private void BindData()
        {
            BLL.Exchange objEx = new BLL.Exchange();
            objEx.GetTopExchange();
            uiRepeaterExchange.DataSource = objEx.DefaultView;
            uiRepeaterExchange.DataBind();

        }
    }
}