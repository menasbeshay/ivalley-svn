using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pricing.BLL;

namespace Pricing_GUI
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ui_txtErrorMsg.Text = "";
            }
        }

        protected void ui_btnCheckUser_Click(object sender, EventArgs e)
        {
            userLogin objData = new userLogin();
            if (objData.CheckUser(ui_txtUserName.Text, ui_txtPassword.Text))
            {
                CodeGlobal.LogedInUser = objData;
                Response.Redirect("Home.aspx");
            }
            else
            {
                ui_txtErrorMsg.Text = "Sorry, Wrong UserName or Password";
            }
        }
    }
}