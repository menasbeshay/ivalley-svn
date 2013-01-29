using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Configuration;

namespace GlobalLogistics.WebSite.Arabic
{
    public partial class ContactUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BLL.Pages page = new BLL.Pages();
                page.LoadByPrimaryKey(2);
                uiLiteralContent.Text = Server.HtmlDecode(page.ArContent);
            }
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

                msg.Body = "Name : " + uiTextBoxName.Text;
                msg.Body += "<br/> Email : " + uiTextBoxEmail.Text;
                msg.Body += "<br/> Mobile : " + uiTextBoxMobile.Text;
                msg.Body += "<br/> Company : " + uiTextBoxCompany.Text;
                msg.Body += "<br/> Website : " + uiTextBoxWebsite.Text;
                msg.Body += "<br/> Address : " + uiTextBoxAddress.Text;
                msg.Body += "<br/> Tele : " + uiTextBoxTele.Text;
                msg.Body += "<br/> Fax : " + uiTextBoxFax.Text;
                msg.Body += "<br/> Comments : " + uiTextBoxComments.Text;

                SmtpClient client = new SmtpClient(ConfigurationManager.AppSettings["mailserver"], 25);
                //SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                //client.EnableSsl = true;
                client.UseDefaultCredentials = false;

                client.Credentials = new System.Net.NetworkCredential(mail, ConfigurationManager.AppSettings["mailpass"]);
                client.Send(msg);
                uiLabelMessage.Visible = true;
                uiLabelMessage.Text = "تم إرسال طلبك  بنجاح.";
            }
            catch (Exception ex)
            {
                uiLabelMessage.Visible = true;
                uiLabelMessage.Text = "حدث خطأ . من فضلك حاول مرة أخرى .";
            }
        }
    }
}