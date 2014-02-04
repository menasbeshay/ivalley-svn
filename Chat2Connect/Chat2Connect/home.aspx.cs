using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace Chat2Connect
{
    public partial class home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.IsAuthenticated)
            {
                if (!IsPostBack)
                {
                    Member member = new Member();
                    member.GetMemberByUserId(new Guid(Membership.GetUser().ProviderUserKey.ToString()));
                    uiHiddenFieldCurrent.Value = member.MemberID.ToString();
                    uiHiddenFieldCurrentName.Value = member.Name;
                }
            }
            else
            {
                Response.Redirect("default.aspx");
            }
        }

        protected void uiLinkButtonAddFriend_Click(object sender, EventArgs e)
        {
            Member member = new Member();
            member.GetMemberByUserId(new Guid(Membership.GetUser().ProviderUserKey.ToString()));
            MemberFriend Currentfriends = new MemberFriend();
            Currentfriends.GetAllMemberFriends(member.MemberID);
            for (int i = 0; i < Currentfriends.RowCount; i++)
            {
                if (Currentfriends.FriendID == Convert.ToInt32(uiHiddenFieldFriendID.Value))
                {
                    // view error
                }
                else
                    continue;
            }

            MemberFriend newfriend = new MemberFriend();
            newfriend.AddNew();
            newfriend.MemberID = member.MemberID;
            newfriend.FriendID = Convert.ToInt32(uiHiddenFieldFriendID.Value);
            newfriend.Save();
        }
    }
}