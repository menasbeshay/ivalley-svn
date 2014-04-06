using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace Chat2Connect.Admin.UserControls
{
    public partial class AccountInfo : System.Web.UI.UserControl
    {
        public string MemberUserName
        {
            get
            {
                return Convert.ToString(ViewState["userName"]);
            }
            set
            {
                ViewState["userName"] = value;
                BindAccountInfo();
            }
        }
        private void BindAccountInfo()
        {
            MembershipUser user = Membership.GetUser(MemberUserName);

            dtlAccountInfo.DataSource = new List<MembershipUser>() { user };
            dtlAccountInfo.DataBind();
        }

        protected void btnChangePassword_Click(object sender, EventArgs e)
        {
            MembershipUser user = Membership.GetUser(MemberUserName);
            if (user != null)
            {
                BLL.Member member = new BLL.Member();
                member.GetMemberByUserId(new Guid(user.ProviderUserKey.ToString()));
                user.ChangePassword(user.GetPassword(member.Answer), txtPassword.Text);
            }
        }

        protected void btnChangeQuestion_Click(object sender, EventArgs e)
        {
            MembershipUser user = Membership.GetUser(MemberUserName);
            if (user != null)
            {
                BLL.Member member = new BLL.Member();
                member.GetMemberByUserId(new Guid(user.ProviderUserKey.ToString()));
                if (user.ChangePasswordQuestionAndAnswer(user.GetPassword(member.Answer), drpQuestions.SelectedValue, txtQuestionAnswer.Text))
                {
                    member.Answer = txtQuestionAnswer.Text;
                    member.Save();

                    BindAccountInfo();
                }
            }
        }
    }
}