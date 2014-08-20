using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EDU.BLL;

namespace EduMontreal.MasterPages
{
    public partial class AREduMaster : System.Web.UI.MasterPage
    {
        
        public string PageTitle { get { return uiLabelTitle.Text; } set { uiLabelTitle.Text = uiLabelPath.Text = value; } }

        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CurrentUser"] != null)
                {
                    Student student = (Student)Session["CurrentUser"];
                    uiLabelUserName.Text = student.Email;

                    ApplicationData app = new ApplicationData();
                    app.GetApplicationByStudentID(student.StudentID);
                    if (app.RowCount > 0)
                    {
                        uiLabelApplication.Text = "تابع طلبك";
                    }
                    else
                    {
                        uiLabelApplication.Text = "إبدأ ملء طلبك";
                    }
                }
                else
                {
                    uiLabelApplication.Text = "إبدأ ملء طلبك";
                }
            }
           
        }

        protected void uiLinkButtonEn_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl.Replace("/ar", ""));
        }


    }
}