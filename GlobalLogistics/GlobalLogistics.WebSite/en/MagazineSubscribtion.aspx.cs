using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Configuration;

namespace GlobalLogistics.WebSite
{
    public partial class MagazineSubscribtion : System.Web.UI.Page
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
                msg.Subject = " Magazine Subscribtion request";
                msg.IsBodyHtml = true;
                msg.BodyEncoding = System.Text.Encoding.UTF8;

                msg.Body = "Name : " + uiTextBoxName.Text;
                msg.Body += "<br/> Email : " + uiTextBoxEmail.Text;
                msg.Body += "<br/> Mobile : " + uiTextBoxMobile.Text;
                msg.Body += "<br/> Company : " + uiTextBoxCompany.Text;


                SmtpClient client = new SmtpClient(ConfigurationManager.AppSettings["mailserver"], 25);
                //SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                //client.EnableSsl = true;
                client.UseDefaultCredentials = false;

                client.Credentials = new System.Net.NetworkCredential(mail, ConfigurationManager.AppSettings["mailpass"]);
                client.Send(msg);
                uiLabelMessage.Visible = true;
                uiLabelMessage.Text = "your subscribtion has been sent successfully.";
            }
            catch (Exception ex)
            {
                uiLabelMessage.Visible = true;
                uiLabelMessage.Text = "An error occurred. please try again.";
            }
        }
    }
}