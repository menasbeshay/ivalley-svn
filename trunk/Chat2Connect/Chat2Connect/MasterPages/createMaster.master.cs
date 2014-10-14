using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Chat2Connect.MasterPages
{
    public partial class createMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.IsAuthenticated)
            {
               
            }
            else
            {
                Response.Redirect("default.aspx");
            }

            uiTextBoxBody.Text = string.Format(GetLocalResourceObject("inviteMailBody").ToString(), Member.CurrentMember.UserName);
        }

        protected void uiLinkButtonSend_Click(object sender, EventArgs e)
        {
            if (uiTextBoxMail.Text != "" && uiTextBoxBody.Text != "")
            {
                try
                {
                    MailMessage msg = new MailMessage();
                    string mail = GetLocalResourceObject("mail").ToString();
                    
                    string mailto = uiTextBoxMail.Text;
                    msg.To.Add(mailto);
                    msg.From = new MailAddress(mail);
                    msg.Subject = GetLocalResourceObject("inviteSubject").ToString();
                    msg.IsBodyHtml = true;
                    msg.BodyEncoding = System.Text.Encoding.UTF8;

                    msg.Body = uiTextBoxBody.Text;

                    SmtpClient client = new SmtpClient(GetLocalResourceObject("mailserver").ToString(), 25);

                    client.UseDefaultCredentials = false;

                    client.Credentials = new System.Net.NetworkCredential(mail, GetLocalResourceObject("mailpass").ToString());
                    client.Send(msg);
                    
                }
                catch (Exception)
                {

                }
            }
        }
    }
}