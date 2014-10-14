using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace Chat2Connect
{
    public partial class activate : System.Web.UI.Page
    {
        public string ActivationCode
        {
            get
            {
                if (Request.QueryString["ac"] != null)
                {
                    return Request.QueryString["ac"].ToString();
                }

                return "";
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(ActivationCode))
                {
                    Guid ac;
                    Guid.TryParse(ActivationCode, out ac);
                    if (ac != Guid.Empty)
                    {
                        Member currentmember = Member.CurrentMember;
                        Member account = new Member();
                        account.GetMemberByActivationCode(ac);

                        if (account.MemberID == currentmember.MemberID)
                        {

                            account.IsMailActivated = true;
                            account.Save();
                            uiPanelActivationForm.Visible = false;
                            uiPanelMailSent.Visible = false;
                            uiPanelActivated.Visible = true;
                        }
                        else
                        {
                            uiPanelActivationForm.Visible = true;
                            uiPanelMailSent.Visible = false;
                            uiPanelActivated.Visible = false;
                        }

                    }
                    else
                    {
                        uiPanelActivationForm.Visible = true;
                        uiPanelMailSent.Visible = false;
                        uiPanelActivated.Visible = false;
                    }
                }
                else
                {
                    uiPanelActivationForm.Visible = true;
                    uiPanelMailSent.Visible = false;
                    uiPanelActivated.Visible = false;
                }
            }
        }

        protected void uiLinkButtonSend_Click(object sender, EventArgs e)
        {
            try
            {
                MailMessage msg = new MailMessage();
                string mail = GetLocalResourceObject("mail").ToString();
                Member currentmember = Member.CurrentMember;
                currentmember.ActivationCode = Guid.NewGuid();
                currentmember.Save();
                string mailto = currentmember.Email;
                msg.To.Add(mailto);
                msg.From = new MailAddress(mail);
                msg.Subject = GetLocalResourceObject("subject").ToString();
                msg.IsBodyHtml = true;
                msg.BodyEncoding = System.Text.Encoding.UTF8;

                msg.Body = string.Format(GetLocalResourceObject("body").ToString(), currentmember.UserName , currentmember.ActivationCode.ToString());

                SmtpClient client = new SmtpClient( GetLocalResourceObject("mailserver").ToString(), 25);

                client.UseDefaultCredentials = false;

                client.Credentials = new System.Net.NetworkCredential(mail,  GetLocalResourceObject("mailpass").ToString());
                client.Send(msg);
                uiPanelMailSent.Visible = true;
            }
            catch (Exception)
            {

            }
        }

       
    }
}