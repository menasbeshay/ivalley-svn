using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EDU.BLL;

namespace EduMontreal
{
    public partial class changepassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CurrentUser"] == null)
                {
                    Response.Redirect("userlogin");
                }
            }

        }

        protected void uiLinkButtonSave_Click(object sender, EventArgs e)
        {
            Student student = (Student)Session["CurrentUser"];
            student.UserPassword = uiTextBoxPassword.Text;
            student.Save();
            uiPanelError.Visible = true;
        }
    }
}