using EDU.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EduMontreal.Admin
{
    public partial class adminlogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CurrentAdminUser"] != null)
            {
                Response.Redirect("adminlogin");
            }
            if (!IsPostBack)
            {
                Master.PageTitle = "Log in";
            }
        }

        protected void uiLinkButtonSignIn_Click(object sender, EventArgs e)
        {
            Student student = new Student();
            student.GetStudentByEmailAndPassword(uiTextBoxEmail.Text, uiTextBoxPassword.Text);
            if (student.RowCount > 0 && uiTextBoxEmail.Text == "Admin")
            {
                Session["CurrentAdminUser"] = student;
                Response.Redirect("applications");
            }
            else
            {
                uiPanelError.Visible = true;
            }
        }
    }
}