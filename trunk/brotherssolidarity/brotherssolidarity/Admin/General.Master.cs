using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Mardini_Admin
{
    public partial class General : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
               
            }
        }

        protected void lnkLogOut_Click(object sender, EventArgs e)
        {
            Session["LoggedInUser"] = null;
            Response.Redirect("Default.aspx");
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            if (Session["LoggedInUser"] == null)
            {
                Response.Redirect("Default.aspx");
            }
        }
    }
}