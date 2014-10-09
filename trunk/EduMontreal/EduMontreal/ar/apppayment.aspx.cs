using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EDU.BLL;

namespace EduMontreal.ar
{
    public partial class apppayment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CurrentUser"] == null)
            {
                Response.Redirect("userlogin");
            }

            if (Session["CurrentPaymentAmount"] != null)
            {
                uiPanelAmount.Visible = true;
                uiLabelAmount.Text = Session["CurrentPaymentAmount"].ToString();
            }
            else
            {
                uiPanelAmount.Visible = false;
            }
        }


        protected void uiLinkButtonByPass_Click(object sender, EventArgs e)
        {
            Student student = (Student)Session["CurrentUser"];

            ApplicationData application = new ApplicationData();
            application.GetApplicationByStudentID(student.StudentID);

            ApplicationStatus next = new ApplicationStatus();
            next.GetNextApplicationStatusApplicationDataID(application.ApplicationDataID);

            ApplicationStatusHistory history = new ApplicationStatusHistory();
            history.GetApplicationStatusHistorybyApplicationDataID(application.ApplicationDataID);

            history.AddNew();
            history.StudentID = student.StudentID;
            history.ApplicationDataID = application.ApplicationDataID;
            history.StatusDate = DateTime.Now;

            history.ApplicationStatusID = next.ApplicationStatusID;
            history.Save();

            Response.Redirect("checkapp");
        }
    }
}