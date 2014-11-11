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
                BLL.Member member = new BLL.Member();
                member.GetMemberByUserId(new Guid(user.ProviderUserKey.ToString()));
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
                            {
                                Roles.AddUserToRole(user.UserName, txtRoleName.Text);
                                if (String.Equals(txtRoleName.Text, Helper.Enums.AdminRoles.Admin_SiteHelper.ToString()))
                                {
                                    NotifyNewHelpMember(member);
                                }
                            }
                        }
                        else
                        {
                            if (Roles.IsUserInRole(user.UserName, txtRoleName.Text))
                            {
                                Roles.RemoveUserFromRole(user.UserName, txtRoleName.Text);
                                if (String.Equals(txtRoleName.Text, Helper.Enums.AdminRoles.Admin_SiteHelper.ToString()))
                                {
                                    NotifyRemoveHelpMember(member);
                                }
                            }
                        }
                    }
                }
            }
        }

        private static void NotifyNewHelpMember(BLL.Member member)
        {
            var helpMember = new
            {
                MemberID = member.MemberID,
                Name = member.Name,
                TypeSpecID = member.MemberType.MemberTypeSpecDuration.MemberTypeSpecID,
                ProfilePic = (member.IsColumnNull(BLL.Member.ColumnNames.ProfilePic) ? "images/defaultavatar.png" : member.ProfilePic),
                IsOnline = member.IsOnLine,
                StatusMsg = member.s_StatusMsg,
                Status = member.s_Status
            };

            Microsoft.AspNet.SignalR.IHubContext _Rcontext = Microsoft.AspNet.SignalR.GlobalHost.ConnectionManager.GetHubContext<Chat2Connect.SRCustomHubs.ChatRoomHub>();
            _Rcontext.Clients.All.addNewHelpMember(helpMember);
        }

        private static void NotifyRemoveHelpMember(BLL.Member member)
        {
            Microsoft.AspNet.SignalR.IHubContext _Rcontext = Microsoft.AspNet.SignalR.GlobalHost.ConnectionManager.GetHubContext<Chat2Connect.SRCustomHubs.ChatRoomHub>();
            _Rcontext.Clients.All.removeHelpMember(member.MemberID);
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