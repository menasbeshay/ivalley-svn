using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace brotherssolidarity.Admin
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            BLL.Admin objAdmin = new BLL.Admin();

            objAdmin.Where.UserName.Value = txtUserName.Text;
            objAdmin.Where.UserName.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
            objAdmin.Where.UserName.Conjuction = MyGeneration.dOOdads.WhereParameter.Conj.And;

            objAdmin.Where.UserPassword.Value = txtPassword.Text;
            objAdmin.Where.UserPassword.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;

            if (objAdmin.Query.Load())
            {
                // if this user exist 
                Session["LoggedInUser"] = "1";
                Response.Redirect("AdminHome.aspx");

            }
            else
            {
                Session["LoggedInUser"] = null;
                lblLoginResult.Text = "UserName or Password error please check them and try again";
            }
        }
    }
}