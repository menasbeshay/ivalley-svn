using EDU.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EduMontreal.ar
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CurrentUser"] != null)
            {
                Student student = (Student)Session["CurrentUser"];

                ApplicationData app = new ApplicationData();
                app.GetApplicationByStudentID(student.StudentID);
                if (app.RowCount > 0)
                {
                    startPanel.Visible = false;
                    uiPanelfollow.Visible = true;
                }
                else
                {
                    startPanel.Visible = true;
                    uiPanelfollow.Visible = false;
                }
            }
            else
            {
                startPanel.Visible = true;
                uiPanelfollow.Visible = false;
            }
        }
    }
}