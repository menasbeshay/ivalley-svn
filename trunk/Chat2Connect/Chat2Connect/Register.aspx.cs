using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
namespace Chat2Connect
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master._pageTitle = GetLocalResourceObject("Title").ToString();
            }
            

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
                Member member = new Member ();
                member.AddNew();
                member.UserID = new Guid(objUser.ProviderUserKey.ToString());
                member.Name = objUser.UserName;
                member.Save();
                FormsAuthentication.SetAuthCookie(objUser.Email, false);
                Response.Redirect("Account.aspx");
            }
        }

       
    }
}