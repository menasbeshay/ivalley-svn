using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Chat2Connect.Admin.UserControls
{
    public partial class AdminRoles : System.Web.UI.UserControl
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
                BindData();
            }
        }

        protected void btnUpdateRoles_Click(object sender, EventArgs e)
        {
            MembershipUser user = Membership.GetUser(MemberUserName);
            if (user != null)
            {
                foreach (GridViewRow row in grdAdminRoles.Rows)
                {
                    if (row.RowType == DataControlRowType.DataRow)
                    {
                        TextBox txtRoleName = (TextBox)row.FindControl("txtRoleName");
                        CheckBox chkInclude = (CheckBox)row.FindControl("chkInclude");
                        if (!Roles.RoleExists(txtRoleName.Text))
                        {
                            Roles.CreateRole(txtRoleName.Text);
                        }
                        if (chkInclude.Checked)
                        {
                            if (!Roles.IsUserInRole(user.UserName, txtRoleName.Text))
                                Roles.AddUserToRole(user.UserName, txtRoleName.Text);
                        }
                        else
                        {
                            if (Roles.IsUserInRole(user.UserName, txtRoleName.Text))
                                Roles.RemoveUserFromRole(user.UserName, txtRoleName.Text);
                        }
                    }
                }
            }
        }

        private void BindData()
        {
            MembershipUser user = Membership.GetUser(MemberUserName);
            if (user != null)
            {
                var roles = Helper.EnumUtil.GetValues<Helper.Enums.AdminRoles>().Select(r => new
                {
                    RoleName = r.ToString(),
                    RoleDisplayName = Helper.StringEnum.GetStringValue(r),
                    InUserRoles = Roles.IsUserInRole(user.UserName, r.ToString())
                }).ToList();

                grdAdminRoles.DataSource = roles;
                grdAdminRoles.DataBind();
            }
            else
            {
                grdAdminRoles.DataSource = null;
                grdAdminRoles.DataBind();
            }
        }
    }
}