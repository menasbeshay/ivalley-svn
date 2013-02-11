using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;

namespace Taqwa.Website
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            if (Session["CurrentLoggedInStudent"] != null)
            {
                Response.Redirect("MyAccount.aspx");
            }
            
        }

        protected void uiImageButtonLogin_Click(object sender, ImageClickEventArgs e)
        {
            DBLayer db = new DBLayer();
            DataSet ds = new DataSet();
            ds = db.GetStudentByUserNameAndSecertCode(uiTextBoxUserName.Text, uiTextBoxSecertCode.Text);

            if (ds.Tables[0].Rows.Count > 0)
            {
                Session["CurrentLoggedInStudent"] = ds.Tables[0].Rows[0]["StudentID"].ToString();
                Response.Redirect("MyAccount.aspx");
            }
        }
    }
}