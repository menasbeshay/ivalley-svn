using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EDU.BLL;
using Microsoft.Reporting.WebForms;

namespace EduMontreal
{
    public partial class success : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                if (Request.QueryString["trx"] != null)
                {
                    uiLabeltrx.Text = Request.QueryString["trx"].ToString();

                    Student student = (Student)Session["CurrentUser"];

                    ApplicationData app = new ApplicationData();
                    app.GetApplicationByStudentID(student.StudentID);

                    ApplicationStatusHistory history = new ApplicationStatusHistory();
                    history.GetApplicationStatusHistorybyApplicationDataID(app.ApplicationDataID);

                    EmailTemplates template = new EmailTemplates();
                    template.GetTemplateByStatusID(history.ApplicationStatusID);

                    Course course = new Course();
                    course.LoadByPrimaryKey(app.SelectedCourseID);

                    CourseLangauge lang = new CourseLangauge();
                    lang.LoadByPrimaryKey(course.CourseLangaugeID);

                    ReportParameter[] parameters = new ReportParameter[5];
                    parameters[0] = new ReportParameter("TrxID", Request.QueryString["trx"].ToString());
                    parameters[1] = new ReportParameter("Amount", Request.QueryString["a"].ToString());
                    parameters[2] = new ReportParameter("Date", Request.QueryString["d"].ToString());
                    parameters[3] = new ReportParameter("CardType", Request.QueryString["ct"].ToString());
                    parameters[4] = new ReportParameter("CardNo", Request.QueryString["cn"].ToString());
                    ReportViewer1.LocalReport.ReportPath = "Receipt.rdlc";

                    /* add payment fields */
                    history.TrxID = Request.QueryString["trx"].ToString();
                    history.PaymentAmount = Convert.ToDecimal(Request.QueryString["a"].ToString());
                    history.PaymentDate = DateTime.Parse(Request.QueryString["d"].ToString());
                    history.CardType = Request.QueryString["ct"].ToString();
                    history.CardNo = Request.QueryString["cn"].ToString();
                    history.Save();

                    /*ReportViewer1.LocalReport.DataSources.Clear();
                    ReportViewer1.LocalReport.DataSources.Add(new ReportDataSource());*/

                    ReportViewer1.LocalReport.SetParameters(parameters);
                   
                    ReportViewer1.LocalReport.Refresh();

                    if (template.RowCount > 0)
                    {
                        try
                        {
                            MailMessage msg = new MailMessage();
                            string mail = ConfigurationManager.AppSettings["StatusEMail"];
                            string mailto = student.Email;
                            msg.To.Add(mailto);
                            msg.From = new MailAddress(mail);
                            msg.Subject = template.Subject.Replace('\r', ' ').Replace('\n', ' '); 
                            msg.IsBodyHtml = true;
                            msg.BodyEncoding = System.Text.Encoding.UTF8;

                            msg.Attachments.Add(new Attachment(Server.MapPath("~/files/Refund_Policy_Agreement.pdf")));  

                            msg.Body = string.Format(Server.HtmlDecode(template.Body.Replace('\r', ' ').Replace('\n', ' ')), student.FirstName + " " + student.FamilyName, student.Email, course.CourseName + " - " + lang.Langauge);
                            
                            SmtpClient client = new SmtpClient(ConfigurationManager.AppSettings["mailserver"], 25);

                            client.UseDefaultCredentials = false;

                            client.Credentials = new System.Net.NetworkCredential(mail, ConfigurationManager.AppSettings["StatusMailpass"]);
                            client.Send(msg);

                        }
                        catch (Exception)
                        {
                            throw;
                        }
                    }
                }
            }
        }
    }
}