using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EDU.BLL;

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

                    Student student = (Student)Session["CurrentStudent"];

                    ApplicationData app = new ApplicationData();
                    app.GetApplicationByStudentID(student.StudentID);

                    ApplicationStatusHistory history = new ApplicationStatusHistory();
                    history.GetApplicationStatusHistorybyApplicationDataID(app.ApplicationDataID);

                    EmailTemplates template = new EmailTemplates();
                    template.GetTemplateByStatusID(history.ApplicationStatusID);

                    if (template.RowCount > 0)
                    {
                        try
                        {
                            MailMessage msg = new MailMessage();
                            string mail = ConfigurationManager.AppSettings["StatusEMail"];
                            string mailto = app.Email;
                            msg.To.Add(mailto);
                            msg.From = new MailAddress(mail);
                            msg.Subject = template.Subject;
                            msg.IsBodyHtml = true;
                            msg.BodyEncoding = System.Text.Encoding.UTF8;

                            msg.Body = string.Format(Server.HtmlDecode(template.Body), student.FirstName + " " + student.FamilyName, student.Email);
                            
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