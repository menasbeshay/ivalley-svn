using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EduMontreal
{
    public partial class paymentmethod : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["start"] != null)
                {
                    start.Visible = true;
                }
                else
                    start.Visible = false;
            }
        }
    }
}