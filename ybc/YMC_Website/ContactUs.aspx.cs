using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Configuration;

namespace YMC_Website
{
    public partial class ContactUs : System.Web.UI.Page
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
                msg.Subject = " Contact Us request";
                msg.IsBodyHtml = true;
                msg.BodyEncoding = System.Text.Encoding.Unicode;

                msg.Body = "<div style='direction:rtl;'>";
                msg.Body = "الأسم : " + uiTextBoxName.Text;
                msg.Body += "<br/> البريد الإلكترونى : " + uiTextBoxEmail.Text;
                msg.Body += "<br/> الموبايل : " + uiTextBoxMobile.Text;                
                msg.Body += "<br/> التفاصيل : " + uiTextBoxComments.Text;
                msg.Body += "</div>";

                SmtpClient client = new SmtpClient(ConfigurationManager.AppSettings["mailserver"], 25);
                //SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                //client.EnableSsl = true;
                client.UseDefaultCredentials = false;

                client.Credentials = new System.Net.NetworkCredential(mail, ConfigurationManager.AppSettings["mailpass"]);
                client.Send(msg);

                try
                {

                    MailMessage msg2 = new MailMessage();
                    string mailtouser = uiTextBoxEmail.Text;
                    msg2.To.Add(mailtouser);
                    msg2.From = new MailAddress(mail);
                    msg2.Subject = " رسالة تأكيد";
                    msg2.IsBodyHtml = true;
                    msg2.BodyEncoding = System.Text.Encoding.Unicode;

                    msg2.Body = "<div style='direction:rtl;'>";
                    msg2.Body = "تم إرسال طلبك لنا وسوف يتم الرد عليك قريباً .";
                    msg2.Body += "</div>";

                    SmtpClient client2 = new SmtpClient(ConfigurationManager.AppSettings["mailserver"], 25);
                    //SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                    //client.EnableSsl = true;
                    client2.UseDefaultCredentials = false;

                    client2.Credentials = new System.Net.NetworkCredential(mail, ConfigurationManager.AppSettings["mailpass"]);
                    client2.Send(msg2);
                    divmsg.Visible = true;
                }
                catch (Exception ex)
                {
                    //uiLabelMessage.Visible = true;
                    //uiLabelMessage.Text = "حدث خطأ . من فضلك حاول مرة أخرى .";
                }               

            }
            catch (Exception ex)
            {
                uiLabelMessage.Visible = true;
                uiLabelMessage.Text = "حدث خطأ . من فضلك حاول مرة أخرى .";
            }
        }
    }
}