using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Configuration;

namespace website
{
    public partial class Careers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            try
            {

                MailMessage msg = new MailMessage();
                string mail = ConfigurationManager.AppSettings["mail"];
                string mailto = ConfigurationManager.AppSettings["mailTo"];
                msg.To.Add(mailto);
                msg.From = new MailAddress(mail);
                msg.Subject = " Career request";
                msg.IsBodyHtml = true;
                msg.BodyEncoding = System.Text.Encoding.Unicode;

                msg.Body = "Name : " + uiTextBoxName.Text;
                msg.Body += "<br/> Surname : " + uiTextBoxSurname.Text;
                msg.Body += "<br/> Date of birth : " + uiTextBoxDOB.Text;
                msg.Body += "<br/> Email : " + uiTextBoxEmail.Text;
                msg.Body += "<br/> city : " + uiTextBoxCity.Text;
                msg.Body += "<br/> Tele : " + uiTextBoxTele.Text;
                msg.Body += "<br/> Qualifications : " + uiTextBoxQual.Text;
                msg.Body += "<br/> Languages : " + uiTextBoxLang.Text;
                msg.Body += "<br/> Applying for: " + uiDropDownListDept.SelectedItem.Text;
                if (uiFileUploadCV.HasFile)
                    msg.Attachments.Add(new Attachment(uiFileUploadCV.FileContent, uiFileUploadCV.FileName));

                SmtpClient client = new SmtpClient(ConfigurationManager.AppSettings["mailserver"], 25);
                //SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                //client.EnableSsl = true;
                client.UseDefaultCredentials = false;

                client.Credentials = new System.Net.NetworkCredential(mail, ConfigurationManager.AppSettings["mailpass"]);
                client.Send(msg);
                uiLabelMessage.Visible = true;
                
            }
            catch (Exception ex)
            {
                uiLabelError.Visible = true;
                
            }
        }
    }
}