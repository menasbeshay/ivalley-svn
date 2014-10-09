using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EDU.BLL;

namespace EduMontreal.ar
{
    public partial class checkapp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CurrentUser"] != null)
                    BindHistory();
                if (Session["CurrentUser"] == null)
                {
                    Response.Redirect("userlogin");
                }
            }
        }


        private void BindHistory()
        {
            Student student = (Student)Session["CurrentUser"];
            ApplicationData app = new ApplicationData();
            app.GetApplicationByStudentID(student.StudentID);
            if (app.RowCount > 0 && app.IsSubmit == true)
            {
                ApplicationStatusHistory Apphistroy = new ApplicationStatusHistory();
                Apphistroy.GetApplicationStatusHistorybyApplicationDataID(app.ApplicationDataID);

                ApplicationStatus status = new ApplicationStatus();
                status.LoadByPrimaryKey(Apphistroy.ApplicationStatusID);

                uiLabelStatusName.Text = status.Status;
                uiImageCurrentStatus.ImageUrl = ".." + status.StatusImg;
                uiImageCurrentStatus.AlternateText = status.Status;

                uiGridViewStatusHistory.DataSource = Apphistroy.DefaultView;
                uiGridViewStatusHistory.DataBind();

                if (status.ApplicationStatusID == 3) // application fees
                {
                    TuitionFeesTitle.Visible = false;
                    uiPanelTuitionFeesBody.Visible = false;
                    AppPaymentTitle.Visible = true;
                    uiPanelAppPayment.Visible = true;
                    uiLabelAppAmount.Text = "1500";
                    Session["CurrentPaymentAmount"] = "1500";
                    ClientScript.RegisterStartupScript(this.GetType(), "openPayment", "$(document).ready(function(){ $('#paymentPopup').modal('show'); });", true);
                }

                if (status.ApplicationStatusID == 7) // Tuition  Fees
                {
                    TuitionFeesTitle.Visible = true;
                    uiPanelTuitionFeesBody.Visible = true;
                    AppPaymentTitle.Visible = false;
                    uiPanelAppPayment.Visible = false;
                    uiLabelAmount.Text = Apphistroy.TuitionFees.ToString();
                    Session["CurrentPaymentAmount"] = Apphistroy.TuitionFees.ToString();
                    ClientScript.RegisterStartupScript(this.GetType(), "openPayment", "$(document).ready(function(){ $('#paymentPopup').modal('show'); });", true);
                }

                // visa result
                uiPanelVisaResult.Visible = (status.ApplicationStatusID == 14);
            }
            else
                Response.Redirect("apply");
        }

        protected void uiLinkButtonUploadVisaResult_Click(object sender, EventArgs e)
        {
            Student student = (Student)Session["CurrentUser"];
            ApplicationData app = new ApplicationData();
            app.GetApplicationByStudentID(student.StudentID);

            ApplicationStatusHistory Apphistroy = new ApplicationStatusHistory();
            Apphistroy.GetApplicationStatusHistorybyApplicationDataID(app.ApplicationDataID);

            if (uiFileUploadVisaResult.HasFile)
            {

                string path = "/files/" + Guid.NewGuid() + "_" + uiFileUploadVisaResult.FileName;
                uiFileUploadVisaResult.SaveAs(Server.MapPath("~" + path));
                Apphistroy.VisaResult = path;
                Apphistroy.Save();
                uiPanelVisaSucc.Visible = true;
                uiPanelVisaFail.Visible = false;
            }
            else
            {
                uiPanelVisaSucc.Visible = false;
                uiPanelVisaFail.Visible = true;
            }
        }
    }
}