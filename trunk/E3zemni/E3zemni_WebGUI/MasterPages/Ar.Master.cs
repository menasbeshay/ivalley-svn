using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace E3zemni_WebGUI.MasterPages
{
    public partial class Ar : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void uiLinkButtonEn_Click(object sender, EventArgs e)
        {            
            Response.Redirect(Request.RawUrl.Replace("/ar", ""));
        }
    }
}