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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Chat2Connect.Logic.Admin.HasRole(Chat2Connect.Logic.AdminRoles.Admin_AccountInfo.ToString()))
                {
                    dtlAccountInfo.Fields[1].Visible = true;
                    dtlAccountInfo.Fields[2].Visible = true;
                    dtlAccountInfo.Fields[3].Visible = true;
                    dtlAccountInfo.Fields[4].Visible = true;
                }
            }
        }
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
            List<dynamic> dataSource = null;
            if (user != null)
            {
                BLL.Member member = new BLL.Member();
                if (member.GetMemberByUserId(new Guid(user.ProviderUserKey.ToString())))
                {
                    dataSource = new List<dynamic>()
                {
                    new {
                        UserName=user.UserName,
                        Email=user.Email,
                        Password=user.GetPassword(member.Answer),
                        PasswordQuestion=user.PasswordQuestion,
                        QuestionAnswer=member.Answer
                    }
                };
                }

            }
            dtlAccountInfo.DataSource = dataSource;
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

                BindAccountInfo();
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

        protected void btnUpdateUserName_Click(object sender, EventArgs e)
        {
            TextBox txtNewUserName = (TextBox)dtlAccountInfo.FindControl("txtUsername");
            BLL.MembershipBLL membership = new BLL.MembershipBLL();
            string msg;
            if (membership.ChangeUsername(MemberUserName, txtNewUserName.Text, Membership.ApplicationName, out msg))
            {
                Response.Redirect(Request.Url.AbsolutePath + "?search=" + txtNewUserName.Text);
            }
            else
            {
                txtNewUserName.Text = MemberUserName;
                lblErrorMessage.Text = msg;
            }
        }
    }
}