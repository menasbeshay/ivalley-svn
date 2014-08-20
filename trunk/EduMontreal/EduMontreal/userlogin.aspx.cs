using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EDU.BLL;

namespace EduMontreal
{
    public partial class userlogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CurrentUser"] != null)
            {
                Response.Redirect("default");
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
            if (student.RowCount > 0)
            {
                Session["CurrentUser"] = student;
                Response.Redirect("default");
            }
            else
            {
                uiPanelError.Visible = true;
            }
        }
    }
}