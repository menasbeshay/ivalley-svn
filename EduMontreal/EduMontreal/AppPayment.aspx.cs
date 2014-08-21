using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EDU.BLL;

namespace EduMontreal
{
    public partial class AppPayment : System.Web.UI.Page
    {        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CurrentUser"] == null)
                {
                    Response.Redirect("userlogin");
                }
                Master.PageTitle = "Payment";


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