using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YMC.BLL;
using System.Net.Mail;
using System.Configuration;

namespace YMC_Website
{
    public partial class RegistrationForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {                
                clearFields();
            }
        }

        private void clearFields()
        {
            uiTextBoxFullName.Text = "";
            uiTextBoxUserName.Text = "";
            uiTextBoxInfo.Text = "";
            uiTextBoxJob.Text = "";
            uiTextBoxMail.Text = "";
            uiTextBoxPassword.Text = "";
            uiTextBoxTele.Text = "";
            uiLabelError.Visible = false;
            divmsg.Visible = false;
        }

        protected void uiLinkButtonUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                SiteUsers objData = new SiteUsers();
                objData.AddNew();
                objData.UserFullName = uiTextBoxFullName.Text;
                objData.UserName = uiTextBoxUserName.Text;
                objData.Telephone = uiTextBoxTele.Text;
                objData.Email = uiTextBoxMail.Text;
                objData.Job = uiTextBoxJob.Text;
                objData.OtherInfo = uiTextBoxInfo.Text;
                if (!string.IsNullOrEmpty(uiTextBoxPassword.Text))
                    objData.UserPassword = uiTextBoxPassword.Text;
                objData.Save();                
                clearFields();

                try
                {

                    MailMessage msg2 = new MailMessage();
                    string mailtouser = uiTextBoxMail.Text;
                    string mail = ConfigurationManager.AppSettings["mail"];
                    msg2.To.Add(mailtouser);
                    msg2.From = new MailAddress(mail);
                    msg2.Subject = " رسالة تأكيد لطلب عضوية";
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

                divmsg.Visible = true;
            }
            catch (Exception)
            {
                uiLabelError.Visible = true;
            }

        }
    }
}