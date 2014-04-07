using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Chat2Connect.Admin.UserControls
{
    public partial class AccountStatus : System.Web.UI.UserControl
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
            BLL.Member member = new BLL.Member();
            MembershipUser user = Membership.GetUser(MemberUserName);
            if (user != null)
            {
                member.GetMemberByUserId(new Guid(user.ProviderUserKey.ToString()));
                //drpAccountStatus.SelectedValue = member.s_RowStatus;
            }

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var lstStatus = Logic.EnumUtil.GetValues<Logic.RowStatus>().Select(r => new
                {
                    ID = (int)r,
                    Name = Logic.StringEnum.GetStringValue(r)
                }).ToList();
                drpAccountStatus.DataSource = lstStatus;
                drpAccountStatus.DataValueField = "ID";
                drpAccountStatus.DataTextField = "Name";
                drpAccountStatus.DataBind();
            }
        }

        protected void btnUpdateAccountStatus_Click(object sender, EventArgs e)
        {
            BLL.Member member = new BLL.Member();
            MembershipUser user = Membership.GetUser(MemberUserName);
            if (user != null)
            {
                //member.GetMemberByUserId(new Guid(user.ProviderUserKey.ToString()));
                //if (drpAccountStatus.SelectedValue != member.s_RowStatusID)
                //{
                //    member.RowStatusID = Convert.ToInt32(drpAccountStatus.SelectedValue);
                //    member.Save();
                //}
            }
        }
    }
}