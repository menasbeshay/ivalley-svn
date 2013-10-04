using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Configuration;

namespace website
{
    public partial class Inquiry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void uiButtonSubmit_Click(object sender, EventArgs e)
        {
            try
            {

                MailMessage msg = new MailMessage();
                msg.To.Add(ConfigurationManager.AppSettings["mailTo"].ToString());
                msg.From = new MailAddress(ConfigurationManager.AppSettings["mail"].ToString());
                msg.Subject = " Email from Inquiry page";
                msg.IsBodyHtml = true;
                msg.BodyEncoding = System.Text.Encoding.UTF8;

                msg.Body = "<br/> Name : " + uiTextBoxName.Text;
                msg.Body += "<br/> Email : " + uiTextBoxMail.Text;
                msg.Body += "<br/> Message : " + uiTextBoxSubject.Text;

                SmtpClient client = new SmtpClient(ConfigurationManager.AppSettings["mailserver"].ToString(), 25);
                client.UseDefaultCredentials = false;

                client.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["mail"].ToString(), ConfigurationManager.AppSettings["mailpass"].ToString());

                client.Send(msg);
                uiLabelMessage.Visible = true;
            }
            catch (Exception ex)
            {
                uiLabelMessage.Visible = true;
                uiLabelMessage.Text = ex.Message;
            }
        }
    }
}