using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Configuration;

namespace Website.ar.services
{
    public partial class CMSWizard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                try
                {

                    MailMessage msg = new MailMessage();
                    string mail = ConfigurationManager.AppSettings["mail"];
                    string mailto = ConfigurationManager.AppSettings["mailTo"];
                    msg.To.Add(mailto);
                    msg.From = new MailAddress(mail);
                    msg.Subject = " New Client Request";
                    msg.IsBodyHtml = true;
                    msg.BodyEncoding = System.Text.Encoding.Unicode;

                    msg.Body = "Name : " + uiTextBoxName.Text;
                    msg.Body += "<br /> Email : " + uiTextBoxMail.Text;
                    msg.Body += "<br /> land line : " + uiTextBoxLand.Text;
                    msg.Body += "<br /> Mobile : " + uiTextBoxTele.Text;
                    msg.Body += "<br /> Company : " + uiTextBoxCompany.Text;
                    msg.Body += "<br /> Template : " + HiddenFieldTemplateID.Value;
                    msg.Body += "<br /> Price plan : " + HiddenFieldPricePlanName.Value;

                    SmtpClient client = new SmtpClient(ConfigurationManager.AppSettings["mailserver"], 25);
                    client.UseDefaultCredentials = false;

                    client.Credentials = new System.Net.NetworkCredential(mail, ConfigurationManager.AppSettings["mailpass"]);
                    client.Send(msg);
                    Response.Redirect("success.aspx");
                }
                catch (Exception ex)
                {

                }
            }
        }
    }
}