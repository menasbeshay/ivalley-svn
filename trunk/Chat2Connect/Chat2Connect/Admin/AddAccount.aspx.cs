using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace Chat2Connect.Admin
{
    public partial class AddAccount : System.Web.UI.Page
    {
        public static List<string> PageRoles
        {
            get
            {
                List<string> lstRoles = new List<string>();
                lstRoles.Add(Helper.Enums.AdminRoles.Admin_AddVIPAccount.ToString());
                return lstRoles;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ClearFields();
                uiPanelDone.Visible = false;
                uiPanelRegister.Visible = true;
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            
            MembershipCreateStatus objstatus;
            MembershipUser objUser = Membership.CreateUser(UserName.Text, Password.Text, Email.Text, Question.Text, Answer.Text, true, out objstatus);
            bool success = true;
            switch (objstatus)
            {
                case MembershipCreateStatus.DuplicateUserName:
                    ErrorMessage.Text = GetLocalResourceObject("duplicateUsername").ToString();
                    ErrorMessage.Visible = true;
                    success = false;
                    break;
                case MembershipCreateStatus.InvalidPassword:
                    ErrorMessage.Text = GetLocalResourceObject("invalidPass").ToString();
                    ErrorMessage.Visible = true;
                    success = false;
                    break;
                case MembershipCreateStatus.ProviderError:
                case MembershipCreateStatus.UserRejected:
                    ErrorMessage.Text = GetLocalResourceObject("generalError").ToString();
                    ErrorMessage.Visible = true;
                    success = false;
                    break;
                default:
                    break;
            }
            if (success)
            {
                Member member = new Member();
                member.AddNew();
                member.Answer = Answer.Text;
                member.UserID = new Guid(objUser.ProviderUserKey.ToString());
                member.Name = objUser.UserName;
                member.IsOnLine = true;
                member.Status = 1;
                member.Save();                
                try
                {
                    MailMessage msg = new MailMessage();
                    string body = GetLocalResourceObject("body").ToString();
                    string mail = GetLocalResourceObject("mail").ToString();

                    member.ActivationCode = Guid.NewGuid();
                    member.Save();
                    string mailto = objUser.Email;
                    msg.To.Add(mailto);
                    msg.From = new MailAddress(mail);
                    msg.Subject = GetLocalResourceObject("subject").ToString();
                    msg.IsBodyHtml = true;
                    msg.BodyEncoding = System.Text.Encoding.Unicode;

                    msg.Body = string.Format(body, objUser.UserName, member.ActivationCode.ToString());

                    SmtpClient client = new SmtpClient(GetLocalResourceObject("mailserver").ToString(), 25);

                    client.UseDefaultCredentials = false;

                    client.Credentials = new System.Net.NetworkCredential(mail, GetLocalResourceObject("mailpass").ToString());
                    client.Send(msg);
                }
                catch (Exception)
                {

                }

                uiPanelDone.Visible = true;
                uiPanelRegister.Visible = false;
                ClearFields();
            }
            
        }

        protected void uiLinkButtonCreateNew_Click(object sender, EventArgs e)
        {
            ClearFields();
            uiPanelDone.Visible = false;
            uiPanelRegister.Visible = true;
            
        }

        private void ClearFields()
        {
            UserName.Text = "";
            Password.Text = "";
            ConfirmPassword.Text = "";
            Email.Text = "";
            Question.SelectedIndex = 0;
            Answer.Text = "";
            ErrorMessage.Visible = false;
        }
    }
}