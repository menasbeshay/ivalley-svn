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
    public partial class SendPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void uiLinkButtonUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                uiLabelError.Visible = false;
                uiLabelMsg.Visible = false;
                SiteUsers user = new SiteUsers();
                uiLabelError.Visible = false;
                user.GetUserByEmail(uiTextBoxEmail.Text);
                if (user.RowCount == 0)
                {
                    uiLabelError.Visible = true;
                }
                else
                {
                    MailMessage msg = new MailMessage();
                    string mail = ConfigurationManager.AppSettings["mail"];
                    msg.To.Add(user.Email);
                    msg.From = new MailAddress(mail);
                    msg.Subject = " User password for YBC";
                    msg.IsBodyHtml = true;
                    msg.BodyEncoding = System.Text.Encoding.Unicode;

                    msg.Body = "username : " + user.UserName;
                    msg.Body += "<br/>password : " + user.UserPassword;

                    SmtpClient client = new SmtpClient(ConfigurationManager.AppSettings["mailserver"], 25);
                    //SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
                    //client.EnableSsl = true;
                    client.UseDefaultCredentials = false;

                    client.Credentials = new System.Net.NetworkCredential(mail, ConfigurationManager.AppSettings["mailpass"]);
                    client.Send(msg);
                    uiLabelMsg.Visible = true;                    
                }
            }
            catch (Exception)
            {
                uiLabelError.Visible = true;
            }
        }
    }
}