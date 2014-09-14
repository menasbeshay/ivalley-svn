using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pricing_GUI.CAPA
{
    public partial class test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnOpenModal_Click(object sender, EventArgs e)
        {
            ui_modalPopup_Status.Show();
        }
    }
}