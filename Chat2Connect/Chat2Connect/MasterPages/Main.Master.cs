using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Chat2Connect.SRCustomHubs;
using Microsoft.AspNet.SignalR;

namespace Chat2Connect.MasterPages
{
    public partial class Main : System.Web.UI.MasterPage
    {
        public int MemberID
        {
            get
            {
                if (ViewState["ID"] == null)
                    ViewState["ID"] = 0;
                return Convert.ToInt32(ViewState["ID"]);
            }
            set
            {
                ViewState["ID"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.IsAuthenticated)
            {
                if (!IsPostBack)
                {
                    loadUserInfo();
                }
            }
            else
            {
                Response.Redirect("~/default.aspx");
            }
        }


        private void loadUserInfo()
        {
            Member user = new Member();
            user.GetMemberByUserId(new Guid(Membership.GetUser().ProviderUserKey.ToString()));
            MemberID = user.MemberID;
            if (!user.IsColumnNull("ProfilePic"))
                uiImageUser.ImageUrl = user.ProfilePic;
            uiLabelName.Text = Membership.GetUser().UserName;
            uiTextBoxStatus.Text = user.StatusMsg;
            uiHiddenFieldClientID.Value = user.MemberID.ToString();
            Session["Activate_session"] = 1;
        }

        protected void LoginStatus1_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            IHubContext _Ncontext = GlobalHost.ConnectionManager.GetHubContext<NotificationHub>();

            Member user = new Member();
            user.GetMemberByUserId(new Guid(Membership.GetUser().ProviderUserKey.ToString()));
            user.IsOnLine = false;
            user.Status = 4;
            user.Save();
            RoomMember rooms = new RoomMember();
            rooms.GetAllRoomsByMemberID(user.MemberID);
            if (rooms.RowCount > 0)
            {
                rooms.MarkAsDeleted();
                rooms.Save();
            }

            MemberFriend friends = new MemberFriend();
            friends.GetAllMemberFriends(user.MemberID);
            for (int i = 0; i < friends.RowCount; i++)
            {
                Member temp = new Member();
                temp.LoadByPrimaryKey(friends.FriendID);
                MembershipUser u = Membership.GetUser(temp.UserID);
                _Ncontext.Clients.Group(u.UserName).friendStatusChanged(user.MemberID, user.StatusMsg, "offline");
            }
        }
    }
}