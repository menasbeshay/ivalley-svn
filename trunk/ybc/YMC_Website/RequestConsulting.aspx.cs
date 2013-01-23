using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Configuration;
using System.Text;

namespace YMC_Website
{
    public partial class RequestConsulting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void uiButtonSend_Click(object sender, EventArgs e)
        {
            try
            {
                MailMessage msg = new MailMessage();
                string mail = ConfigurationManager.AppSettings["mail"];
                string mailto = ConfigurationManager.AppSettings["mailto"];
                msg.To.Add(mailto);
                msg.From = new MailAddress(mail);
                msg.Subject = " Email from Consulting page";
                msg.IsBodyHtml = true;
                msg.BodyEncoding = Encoding.UTF8;

                msg.Body = "<div style='direction:rtl;'>";
                msg.Body += "<br/> اللجنة : " + uiDropDownListCommitte.Text;
                msg.Body += "<br/> نوع الإستشارة : " + uiDropDownListType.Text;
                msg.Body += "<br/> الإسم : " + uiTextBoxName.Text;
                msg.Body += "<br/> البريد الإلكترونى : " + uiTextBoxMail.Text;
                msg.Body += "<br/> رقم الإتصال : " + uiTextBoxTele.Text;
                msg.Body += "<br/> الشركة : " + uiTextBoxCompany.Text;
                msg.Body += "<br/> عنوان الإستشارة : " + uiTextBoxTele.Text;
                msg.Body += "<br/> نص الإستشارة : " + uiTextBoxCompany.Text;                
                msg.Body += "</div>";
                SmtpClient client = new SmtpClient(ConfigurationManager.AppSettings["mailserver"], 25);
                //SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                //client.EnableSsl = true;
                client.UseDefaultCredentials = false;
                //client.EnableSsl = true;
                client.Credentials = new System.Net.NetworkCredential(mail, ConfigurationManager.AppSettings["mailpass"]);                
                client.Send(msg);
                //uiLabelSuccess.Visible = true;  
                try
                {

                    MailMessage msg2 = new MailMessage();
                    string mailtouser = uiTextBoxMail.Text;
                    msg2.To.Add(mailtouser);
                    msg2.From = new MailAddress(mail);
                    msg2.Subject = " رسالة تأكيد لطلب إستشارة";
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
                uiLabelMsg.Visible = true;                
            }
        }
    }
}