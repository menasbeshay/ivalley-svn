using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace Pricing_GUI
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["adminUser"] == null)
            {
                Response.Redirect("Default.aspx");
            }
            else
            {
                if (!Page.IsPostBack)
                {
                    userLogin obj = (userLogin)Session["adminUser"];

                    ui_lblWelcome.Text = "Welcome " + obj.s_UserName;
                }
            }
        }

        protected void ui_lnkLogout_Click(object sender, EventArgs e)
        {
            Session["adminUser"] = null;
            Response.Redirect("Default.aspx");
        }
    }
}
