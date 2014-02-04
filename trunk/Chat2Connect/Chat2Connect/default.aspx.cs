using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace Chat2Connect
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Login1_LoggedIn(object sender, EventArgs e)
        {
            MembershipUser user = Membership.GetUser(Login1.UserName);
            Member member = new Member();

            member.GetMemberByUserId(new Guid(user.ProviderUserKey.ToString()));            
            member.IsOnLine = true;
            CheckBox cb = (CheckBox)Login1.FindControl("uiCheckBoxInvisible");
            if (cb.Checked)
                member.Status = 4;
            else
                member.Status = 1;
            member.Save();
            Response.Redirect("home.aspx");
        }

        protected void uiButtonRegister_Click(object sender, EventArgs e)
        {
            MembershipUser[] users = Membership.GetAllUsers().Cast<MembershipUser>().Where(m => m.Email == Email.Text).ToArray();
            if (users.Length == 15)
            {
                ErrorMessage.Text = GetLocalResourceObject("maxMailAccount").ToString();
                ErrorMessage.Visible = true;
                return;
            }

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
                FormsAuthentication.SetAuthCookie(objUser.UserName, false);
                Response.Redirect("home.aspx");
            }
        }
    }
}