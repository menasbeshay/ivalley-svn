using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Website.ar.services
{
    public partial class SMO : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RequestService1.setSelectedIndex(3);
            }
        }

        protected void uiButtonReset_Click(object sender, EventArgs e)
        {
            RequestService1.resetControls();
            RequestService1.setSelectedIndex(3);
        }
    }
}