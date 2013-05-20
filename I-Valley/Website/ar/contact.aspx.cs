using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Configuration;

namespace Website.ar
{
    public partial class contact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void uiButtonsubmit_Click(object sender, EventArgs e)
        {
            try
            {

                MailMessage msg = new MailMessage();
                string mail = ConfigurationManager.AppSettings["mail"];
                string mailto = ConfigurationManager.AppSettings["mailTo"];
                msg.To.Add(mailto);
                msg.From = new MailAddress(mail);
                msg.Subject = " Contact Us request";
                msg.IsBodyHtml = true;
                msg.BodyEncoding = System.Text.Encoding.Unicode;

                msg.Body = "Name : " + uiTextBoxName.Text;
                msg.Body += "<br/> Email : " + uiTextBoxMail.Text;
                msg.Body += "<br/> Message : " + uiTextBoxMsg.Text;

                SmtpClient client = new SmtpClient(ConfigurationManager.AppSettings["mailserver"], 25);
                //SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                //client.EnableSsl = true;
                client.UseDefaultCredentials = false;

                client.Credentials = new System.Net.NetworkCredential(mail, ConfigurationManager.AppSettings["mailpass"]);
                client.Send(msg);
                Response.Redirect("services/success.aspx");
            }
            catch (Exception ex)
            {

            }
        }
    }
}