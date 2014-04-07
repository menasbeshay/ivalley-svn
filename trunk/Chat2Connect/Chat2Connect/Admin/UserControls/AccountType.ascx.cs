using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Chat2Connect.Admin.UserControls
{
    public partial class AccountType : System.Web.UI.UserControl
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
                drpAccountType.SelectedValue = member.s_MemberTypeID;
            }

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BLL.MemberType memberType = new BLL.MemberType();
                memberType.LoadAll();
                drpAccountType.DataSource = memberType.DefaultView;
                drpAccountType.DataValueField = BLL.MemberType.ColumnNames.MemberTypeID;
                drpAccountType.DataTextField = BLL.MemberType.ColumnNames.Name;
                drpAccountType.DataBind();
            }
        }

        protected void btnUpdateAccountType_Click(object sender, EventArgs e)
        {
            BLL.Member member = new BLL.Member();
            MembershipUser user = Membership.GetUser(MemberUserName);
            if (user != null)
            {
                member.GetMemberByUserId(new Guid(user.ProviderUserKey.ToString()));
                if (drpAccountType.SelectedValue != member.s_MemberTypeID)
                {
                    if (!String.IsNullOrEmpty(drpAccountType.SelectedValue))
                        member.MemberTypeID = Convert.ToInt32(drpAccountType.SelectedValue);
                    else
                        member.SetColumnNull(BLL.Member.ColumnNames.MemberTypeID);
                    member.Save();
                }

            }
        }
    }
}