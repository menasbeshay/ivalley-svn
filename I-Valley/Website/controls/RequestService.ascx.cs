using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Configuration;

namespace Website.controls
{
    public partial class RequestService : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                uiPanelDone.Visible = false;
                uiPanelRequest.Visible = true;
            }
        }

        protected void uiButtonSend_Click(object sender, EventArgs e)
        {
            try
            {

                MailMessage msg = new MailMessage();
                string mail = ConfigurationManager.AppSettings["mail"];
                string mailto = ConfigurationManager.AppSettings["mailTo"];
                msg.To.Add(mailto);
                msg.From = new MailAddress(mail);
                msg.Subject = " New Service Request";
                msg.IsBodyHtml = true;
                msg.BodyEncoding = System.Text.Encoding.Unicode;

                msg.Body = "Name : " + uiTextBoxName.Text;
                msg.Body += "<br /> Email : " + uiTextBoxMail.Text;
                msg.Body += "<br /> land line : " + uiTextBoxLand.Text;                
                msg.Body += "<br /> Company : " + uiTextBoxCompany.Text;
                msg.Body += "<br /> Service : " + uiDropDownListService.SelectedValue;
                

                SmtpClient client = new SmtpClient(ConfigurationManager.AppSettings["mailserver"], 25);
                client.UseDefaultCredentials = false;

                client.Credentials = new System.Net.NetworkCredential(mail, ConfigurationManager.AppSettings["mailpass"]);
                client.Send(msg);
                uiPanelDone.Visible = true;
                uiPanelRequest.Visible = false;
            }
            catch (Exception ex)
            {

            }
        }

        public void resetControls()
        {
            uiPanelDone.Visible = false;
            uiPanelRequest.Visible = true;
            uiTextBoxName.Text= "";
            uiTextBoxMail.Text = "";
            uiTextBoxLand.Text="";
            uiTextBoxCompany.Text="";
            uiDropDownListService.SelectedIndex = 0; 
        }
    }
}