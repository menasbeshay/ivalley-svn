using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Configuration;

namespace Taqwa.Website
{
    public partial class Suggestions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void uiButtonUpload_Click(object sender, EventArgs e)
        {
            try
            {
                
                MailMessage msg = new MailMessage();
                msg.To.Add(ConfigurationManager.AppSettings["SuggestMail"]);
                msg.From = new MailAddress(ConfigurationManager.AppSettings["FromMail"]);
                msg.Subject = " Email from suggestions page";
                msg.IsBodyHtml = true;
                msg.BodyEncoding = System.Text.Encoding.Unicode;

                msg.Body = "Name : " + uiTextBoxName.Text;                
                msg.Body += "<br/> Email : " + uiTextBoxEmail.Text;                
                msg.Body += "<br/> Suggestion : " + uiTextBoxSugg.Text;

                SmtpClient client = new SmtpClient(ConfigurationManager.AppSettings["Server"], 25);
                //SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                //client.EnableSsl = true;
                client.UseDefaultCredentials = false;

                client.Credentials = new System.Net.NetworkCredential(ConfigurationManager.AppSettings["FromMail"], ConfigurationManager.AppSettings["FromPass"]);                
                client.Send(msg);
                uiLabelMessage.Visible = true;
                uiLabelMessage.Text = "تم إرسال إقتراحك بنجاح";
            }
            catch (Exception ex)
            {
                uiLabelMessage.Visible = true;
                uiLabelMessage.Text = "حدث خطأ غير متوقع ، من فضلك حاول مرة أخرى";
            }
        }
    }
}