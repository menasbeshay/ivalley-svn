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
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                ctrlAccountInfo.Visible = false;
                ctrlAccountRoles.Visible = false;
                ctrlAdminRoles.Visible = false;
            }
        }

        protected void lnkMemberSearch_Click(object sender, EventArgs e)
        {
            MembershipUser user = Membership.GetUser(txtMemberSearch.Text);
            if (user != null)
            {
                if(Logic.Admin.HasRole(Logic.AdminRoles.Admin_Accounts.ToString()))
                {
                    ctrlAccountInfo.Visible = true;
                    ctrlAccountInfo.MemberUserName = user.UserName;
                }
                if (Logic.Admin.HasRole(Logic.AdminRoles.Admin_AdminRoles.ToString()))
                {
                    ctrlAdminRoles.Visible = true;
                    ctrlAdminRoles.MemberUserName = user.UserName;
                }
                if (Logic.Admin.HasRole(Logic.AdminRoles.Admin_MemberRole.ToString()))
                {
                    ctrlAccountRoles.Visible = true;
                    ctrlAccountRoles.MemberUserName = user.UserName;
                }
            }
            
        }
    }
}