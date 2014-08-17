using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using E3zmni.BLL;

namespace E3zemni_WebGUI.ar
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCats();
            }
            if (Session["CurrentUser"] == null)
            {
                //divLogin.Visible = false;
                ClientScript.RegisterStartupScript(this.GetType(), "loginmodal", @"$(document).ready(function () {$('#loginModal').modal('show');});", true);

            }
        }

        private void LoadCats()
        {
            MainCat Invcats = new MainCat();
            Invcats.Where.IsPartySupplier.Value = true;
            Invcats.Where.IsPartySupplier.Operator = MyGeneration.dOOdads.WhereParameter.Operand.NotEqual;
            Invcats.Sort = "NameAr";
            Invcats.Query.Top = 4;
            Invcats.Query.Load();
            uiRepeaterCats.DataSource = Invcats.DefaultView;
            uiRepeaterCats.DataBind();

            MainCat PScats = new MainCat();
            PScats.Where.IsPartySupplier.Value = true;
            PScats.Where.IsPartySupplier.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
            PScats.Sort = "NameAr";
            PScats.Query.Top = 4;
            PScats.Query.Load();
            uiRepeaterPS.DataSource = PScats.DefaultView;
            uiRepeaterPS.DataBind();

        }

        protected void uiLinkButtonMainLogin_Click(object sender, EventArgs e)
        {
            UserInfo user = new UserInfo();
            user.GetUserByUserNameAndPassword(uiTextBoxUserName.Text, uiTextBoxPassword.Text);
            if (user.RowCount > 0)
            {
                Session["CurrentUser"] = user;
                if (Request.QueryString["url"] != null)
                    Response.Redirect(Request.QueryString["url"].ToString());
                Response.Redirect("default.aspx");
                //divLogin.Visible = false;

            }
            else
            {
                uiLabelError.Visible = true;
            }
        }
    }
}