using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EDU.BLL;

namespace EduMontreal
{
    public partial class _Default : Page
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