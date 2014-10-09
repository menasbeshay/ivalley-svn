using EDU.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EduMontreal.Admin
{
    public partial class changepassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CurrentAdminUser"] == null)
                {
                    Response.Redirect("adminlogin");
                }
            }
        }

        protected void uiLinkButtonSave_Click(object sender, EventArgs e)
        {
            Student student = (Student)Session["CurrentAdminUser"];
            student.UserPassword = uiTextBoxPassword.Text;
            student.Save();
            uiPanelError.Visible = true;
        }
    }
}