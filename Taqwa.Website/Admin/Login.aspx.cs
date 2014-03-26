using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;
namespace Taqwa.Website.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void uiButtonLogin_Click(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            DataSet ds = new DataSet();
            ds = db.GetUserByUserNameAndPassword(uiTextBoxUserName.Text, uiTextBoxPassword.Text);
            if (ds.Tables[0].Rows.Count > 0)
            {
                Session["CurrentUser"] = ds.Tables[0].Rows[0]["UserID"].ToString();
                Response.Redirect("AdminCP.aspx");
            }
        }


    }
}