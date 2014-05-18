using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pricing.BLL;

namespace Pricing_GUI
{
    public partial class Company_Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblResult.Text = "";
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Companies obj = new Companies();

            obj.Where.Login_Code.Value = input_username.Text;
            obj.Where.Login_Code.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;

            obj.Where.Login_Code.Conjuction = MyGeneration.dOOdads.WhereParameter.Conj.And;

            obj.Where.Login_Password.Value = input_password.Text;
            obj.Where.Login_Password.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;

            if (obj.Query.Load())
            {
                CodeGlobal.LogedInCompany = obj;
                Response.Redirect("Home.aspx");
            }
            else
            {
                CodeGlobal.LogedInCompany = null;
                lblResult.Text = "Your Code or Password error please try again !";
            }
        }
    }
}