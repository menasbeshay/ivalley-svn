using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace WebApplication.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void uiLinkButtonLogin_Click(object sender, EventArgs e)
        {

            DBLayer db = new DBLayer();
            DataSet ds = db.GetUser(uiTextBoxUserName.Text, uiTextBoxPassword.Text);
            uiLabelErrorLogin.Visible = false;
            if (ds != null)
            {
                if (ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
                {
                    string user = ds.Tables[0].Rows[0]["UserName"].ToString();
                    Session["CurrentUser"] = user;
                    Response.Redirect("~/Admin/AdminCP.aspx");
                }
                else
                {
                    uiLabelErrorLogin.Visible = true;
                }
            }
            else
            {
                uiLabelErrorLogin.Visible = true;
            }
        }
    }
}