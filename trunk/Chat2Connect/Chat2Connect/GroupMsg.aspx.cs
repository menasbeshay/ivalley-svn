using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Web.Security;

namespace Chat2Connect
{
    public partial class GroupMsg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadFriends();
            }
        }

        private void LoadFriends()
        {
            Member member = new Member();
            member.GetMemberByUserId(new Guid(Membership.GetUser().ProviderUserKey.ToString()));
            MemberFriend friends = new MemberFriend();
            friends.GetAllMemberOnlineFriends(member.MemberID);
            if (friends.RowCount > 0)
            {
                uiCheckBoxListFriends.DataSource = friends.DefaultView;
                uiCheckBoxListFriends.DataTextField = "UserName";
                uiCheckBoxListFriends.DataValueField = "FriendID";
                uiCheckBoxListFriends.DataBind();
            }
            else
            {
                uiPanelNoFriendsFound.Visible = true;
                uiCheckBoxListFriends.Visible = false;
            }
        }
    }
}