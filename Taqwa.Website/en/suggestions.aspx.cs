using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

namespace Taqwa.Website.en
{
    public partial class suggestions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void uiButtonUpload_Click(object sender, EventArgs e)
        {
            try
            {

                MailMessage msg = new MailMessage();
                msg.To.Add("info@altaqwaschools.com");
                msg.From = new MailAddress("info@altaqwaschools.com");
                msg.Subject = " Email from suggestions page";
                msg.IsBodyHtml = true;
                msg.BodyEncoding = System.Text.Encoding.Unicode;

                msg.Body = "Name : " + uiTextBoxName.Text;
                msg.Body += "<br/> Email : " + uiTextBoxEmail.Text;
                msg.Body += "<br/> Suggestion : " + uiTextBoxSugg.Text;

                SmtpClient client = new SmtpClient("mail.altaqwaschools.com", 25);
                //SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                //client.EnableSsl = true;
                client.UseDefaultCredentials = false;

                client.Credentials = new System.Net.NetworkCredential("info@altaqwaschools.com", "password");
                client.Send(msg);
                uiLabelMessage.Visible = true;
                uiLabelMessage.Text = "Suggestion sent successfully.";
            }
            catch (Exception ex)
            {
                uiLabelMessage.Visible = true;
                uiLabelMessage.Text = "An error occurred.Try again.";
            }
        }
    }
}