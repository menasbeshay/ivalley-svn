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
    public partial class activate : System.Web.UI.Page
    {
        public string ActivationCode 
        { 
            get 
            {                
                if (Request.QueryString["ac"] != null)
                {
                    return Request.QueryString["ac"].ToString();
                }

                return "";
            } 
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.PageTitle = "Activate your account";
            }
            if (!string.IsNullOrEmpty(ActivationCode))
            {
                Guid ac;
                Guid.TryParse(ActivationCode, out ac);
                if (ac != Guid.Empty)
                {
                    Student student = new Student();
                    student.GetStudentByActivationCode(ac);
                    if (student.RowCount > 0)
                    {
                        student.IsActive = true;
                        student.Save();
                        EmailTemplates template = new EmailTemplates();
                        template.GetTemplateByStatusID(2); // send international studies info
                        try
                        {
                            MailMessage msg = new MailMessage();
                            string mail = ConfigurationManager.AppSettings["ActivationEMail"];
                            string mailto = student.Email;
                            msg.To.Add(mailto);
                            msg.From = new MailAddress(mail);
                            msg.Subject = template.Subject;
                            msg.IsBodyHtml = true;
                            msg.BodyEncoding = System.Text.Encoding.Unicode;

                            msg.Body = string.Format(Server.HtmlDecode(template.Body), student.FirstName + " " + student.FamilyName);

                            SmtpClient client = new SmtpClient(ConfigurationManager.AppSettings["mailserver"], 25);

                            client.UseDefaultCredentials = false;

                            client.Credentials = new System.Net.NetworkCredential(mail, ConfigurationManager.AppSettings["ActivationMailpass"]);
                            client.Send(msg);
                        }
                        catch (Exception)
                        {

                        }
                        uiPanelReActivate.Visible = false;
                        uiPanelActivated.Visible = true;
                        Session["CurrentUser"] = student;
                    }
                    else
                    {
                        uiPanelReActivate.Visible = true;
                        uiPanelActivated.Visible = false;
                    }

                }
                else
                {
                    uiPanelReActivate.Visible = true;
                    uiPanelActivated.Visible = false;
                }
            }
            else
            {
                uiPanelReActivate.Visible = true;
                uiPanelActivated.Visible = false;
            }


        }

        protected void uiLinkButtonActivate_Click(object sender, EventArgs e)
        {
            Student student = new Student();
            student.GetStudentByEmail(uiTextBoxEmail.Text);
            if (student.RowCount > 0)
            {
                uiLabelUserError.Visible = false;

                EmailTemplates template = new EmailTemplates();
                template.GetTemplateByStatusID(1); // activation required
                try
                {
                    MailMessage msg = new MailMessage();
                    string mail = ConfigurationManager.AppSettings["ActivationEMail"];
                    string mailto = uiTextBoxEmail.Text;
                    msg.To.Add(mailto);
                    msg.From = new MailAddress(mail);
                    msg.Subject = template.Subject;
                    msg.IsBodyHtml = true;
                    msg.BodyEncoding = System.Text.Encoding.Unicode;

                    msg.Body = string.Format(Server.HtmlDecode(template.Body), ConfigurationManager.AppSettings["ActivationURL"] + student.ActivationCode.ToString());

                    SmtpClient client = new SmtpClient(ConfigurationManager.AppSettings["mailserver"], 25);

                    client.UseDefaultCredentials = false;

                    client.Credentials = new System.Net.NetworkCredential(mail, ConfigurationManager.AppSettings["ActivationMailpass"]);
                    client.Send(msg);
                    Response.Redirect("activate");
                }
                catch (Exception)
                {

                }
            }
            else
            {
                uiLabelUserError.Visible = true;
            }
        }
    }
}