using EDU.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EduMontreal
{
    public partial class wireTransefer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void uiLinkButtonUpload_Click(object sender, EventArgs e)
        {
            Student student = (Student)Session["CurrentUser"];

            ApplicationData application = new ApplicationData();
            application.GetApplicationByStudentID(student.StudentID);

            ApplicationStatusHistory history = new ApplicationStatusHistory();
            history.GetApplicationStatusHistorybyApplicationDataID(application.ApplicationDataID);

            if (uiFileUploadReceipt.HasFile)
            {
                string path = "/files/" + DateTime.Now.ToString("ddMMyyyyhhmmss_") + uiFileUploadReceipt.FileName;
                uiFileUploadReceipt.SaveAs(Server.MapPath("~" + path));
                history.WireTranseferReceipt = path;
                history.Save();
                uiPanelSuccess.Visible = true;
                uiPanelFail.Visible = false;
            }
            else
            {
                uiPanelSuccess.Visible = false;
                uiPanelFail.Visible = true;
            }
        }
    }
}