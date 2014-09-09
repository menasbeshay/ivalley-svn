using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EDU.BLL;

namespace EduMontreal
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
                uiImageCurrentStatus.ImageUrl = status.StatusImg;
                uiImageCurrentStatus.AlternateText = status.Status;

                uiGridViewStatusHistory.DataSource = Apphistroy.DefaultView;
                uiGridViewStatusHistory.DataBind();

                if (status.ApplicationStatusID == 7) // Tuition  Fees
                {
                    uiLabelAmount.Text = Apphistroy.TuitionFees.ToString();
                    ClientScript.RegisterStartupScript(this.GetType(), "openPayment", "$(document).ready(function(){ $('#paymentPopup').modal('show'); });", true);
                }
            }
            else
                Response.Redirect("apply");
        }
    }
}