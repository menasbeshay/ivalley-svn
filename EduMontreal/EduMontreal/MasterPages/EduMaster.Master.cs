using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EDU.BLL;

namespace EduMontreal.MasterPages
{
    public partial class EduMaster : System.Web.UI.MasterPage
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
                        uiLabelApplication.Text = "Follow your application";
                    }
                    else
                    {
                        uiLabelApplication.Text = "Start your application";
                    }
                }
                else
                {
                    uiLabelApplication.Text = "Start your application";
                }

            }
        }

        protected void uiLinkButtonAr_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/ar/" + Request.RawUrl);
        }
    }
}