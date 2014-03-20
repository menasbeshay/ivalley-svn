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

namespace Chat2Connect
{
    public partial class createTempRoom : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Member member = new Member();
                member.GetMemberByUserId(new Guid(Membership.GetUser().ProviderUserKey.ToString()));
                MemberFriend friends = new MemberFriend();
                friends.GetAllMemberFriends(member.MemberID);

                uiCheckBoxListFriends.DataSource = friends.DefaultView;
                uiCheckBoxListFriends.DataTextField = "MemberName";
                uiCheckBoxListFriends.DataValueField = "FriendID";
                uiCheckBoxListFriends.DataBind();
            }
        }

        protected void uiLinkButtonCreateTempRoom_Click(object sender, EventArgs e)
        {
            if (Request.IsAuthenticated)
            {
                IHubContext _Ncontext = GlobalHost.ConnectionManager.GetHubContext<NotificationHub>();
                Member member = new Member();
                member.GetMemberByUserId(new Guid(Membership.GetUser().ProviderUserKey.ToString()));
                Room room = new Room();
                room.AddNew();
                
                room.EnableCam = true;
                room.EnableOneMic = true;                
                room.Save();

                room.Name = room.RoomID.ToString();
                room.Save();

                Session["TempRoomCreate"] = room.RoomID;


                // notify friends with new temp room 
                
                for (int i = 0; i < uiCheckBoxListFriends.Items.Count; i++)
                {
                    if (uiCheckBoxListFriends.Items[i].Selected)
                    {
                        Member temp = new Member();
                        temp.LoadByPrimaryKey(Convert.ToInt32(uiCheckBoxListFriends.Items[i].Value));
                        MembershipUser u = Membership.GetUser(temp.UserID);
                        _Ncontext.Clients.Group(u.UserName).inviteToTempRoom(room.RoomID, member.Name);
                    }
                }

                Response.Redirect("home.aspx");
            }
        }
    }
}