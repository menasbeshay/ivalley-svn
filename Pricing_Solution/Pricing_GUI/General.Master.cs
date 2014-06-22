using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pricing_GUI
{
    public partial class General : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (CodeGlobal.LogedInCompany == null)
            {
                Response.Redirect("Company_Login.aspx");
            }
            else
            {
                if (!Page.IsPostBack)
                {
                    ui_lblWelcome.Text = CodeGlobal.LogedInCompany.CompNameEng;
                }
            }
        }

        protected void lnkLogOut_Click(object sender, EventArgs e)
        {
            CodeGlobal.LogedInCompany = null;
            Response.Redirect("Company_Login.aspx");
        }
    }
}