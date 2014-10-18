using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Chat2Connect.Admin
{
    public partial class ManageAccount : System.Web.UI.Page
    {
        public static List<string> PageRoles
        {
            get
            {
                List<string> lstRoles = new List<string>();
                lstRoles.Add(Helper.Enums.AdminRoles.Admin_AccountInfo.ToString());
                lstRoles.Add(Helper.Enums.AdminRoles.Admin_AdminRoles.ToString());
                lstRoles.Add(Helper.Enums.AdminRoles.Admin_ChangeUsername.ToString());
                lstRoles.Add(Helper.Enums.AdminRoles.Admin_MemberRole.ToString());
                lstRoles.Add(Helper.Enums.AdminRoles.Admin_UpdateAccountStatus.ToString());
                lstRoles.Add(Helper.Enums.AdminRoles.Admin_UpdateAccountType.ToString());
                return lstRoles;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                HideControls();
                if (!String.IsNullOrEmpty(Request.QueryString["search"]))
                {
                    txtMemberSearch.Text = Request.QueryString["search"];
                    BindSelectedUser();
                }
            }
        }

        private void HideControls()
        {
            ctrlAccountInfo.Visible = false;
            ctrlAccountRoles.Visible = false;
            ctrlAdminRoles.Visible = false;
            ctrlAccountStatus.Visible = false;
        }

        protected void lnkMemberSearch_Click(object sender, EventArgs e)
        {
            BindSelectedUser();

        }

        private void BindSelectedUser()
        {
            MembershipUser user = Membership.GetUser(txtMemberSearch.Text);
            if (user != null)
            {
                if (Helper.Admin.HasRole(Helper.Enums.AdminRoles.Admin_AccountInfo.ToString()) || Helper.Admin.HasRole(Helper.Enums.AdminRoles.Admin_ChangeUsername.ToString()))
                {
                    ctrlAccountInfo.Visible = true;
                    ctrlAccountInfo.MemberUserName = user.UserName;
                }
                if (Helper.Admin.HasRole(Helper.Enums.AdminRoles.Admin_AdminRoles.ToString()))
                {
                    ctrlAdminRoles.Visible = true;
                    ctrlAdminRoles.MemberUserName = user.UserName;
                }
                if (Helper.Admin.HasRole(Helper.Enums.AdminRoles.Admin_MemberRole.ToString()))
                {
                    ctrlAccountRoles.Visible = true;
                    ctrlAccountRoles.MemberUserName = user.UserName;
                }
                if (Helper.Admin.HasRole(Helper.Enums.AdminRoles.Admin_UpdateAccountStatus.ToString()))
                {
                    ctrlAccountStatus.Visible = true;
                    ctrlAccountStatus.MemberUserName = user.UserName;
                }
            }
            else
            {
                HideControls();
            }
        }
    }
}