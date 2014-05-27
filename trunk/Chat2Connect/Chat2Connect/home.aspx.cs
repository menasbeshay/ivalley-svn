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
                    uiHiddenFieldOpenedCams.Value = 0.ToString();
                    uiHiddenFieldOpenedRooms.Value = 0.ToString();
                    int membertype = 0;
                    membertype = member.MemberType.MemberTypeSpecDuration.MemberTypeSpecID;
                    switch (membertype)
                    {
                        case 1: // black
                            uiHiddenFieldMaxCams.Value = 1.ToString();
                            uiHiddenFieldMaxNoOfRooms.Value = 2.ToString();
                            break;
                        case 2: // zety 
                            uiHiddenFieldMaxCams.Value = 4.ToString();
                            uiHiddenFieldMaxNoOfRooms.Value = 4.ToString();
                            break;
                        case 3: // purple
                            uiHiddenFieldMaxCams.Value = 100.ToString();
                            uiHiddenFieldMaxNoOfRooms.Value = 6.ToString();
                            break;
                        case 4: // premium 
                            uiHiddenFieldMaxCams.Value = 100.ToString();
                            uiHiddenFieldMaxNoOfRooms.Value = 8.ToString();
                            break;
                        default:
                            uiHiddenFieldMaxCams.Value = 1.ToString();
                            uiHiddenFieldMaxNoOfRooms.Value = 2.ToString();
                            break;
                    }

                    if (Session["TempRoomCreate"] != null)
                    {
                        Room room = new Room ();
                        room.LoadByPrimaryKey(Convert.ToInt32(Session["TempRoomCreate"].ToString()));
                        ClientScript.RegisterStartupScript(this.GetType(), "temproom", "$(document).ready(function (){ setTimeout( function(){ addChatRoom(" + room.RoomID.ToString() + ", 'غرفة مؤقتة', 'Room');" + @"},2000)}); ", true);
                        Session["TempRoomCreate"] = null;

                    }
                    // temp room invitation
                    else if (Request.QueryString["t"] != null)
                    {
                        try
                        {
                            Room room = new Room();
                            room.LoadByPrimaryKey(Convert.ToInt32(Request.QueryString["t"].ToString()));
                            ClientScript.RegisterStartupScript(this.GetType(), "temproom", "$(document).ready(function (){ setTimeout( function(){ addChatRoom(" + room.RoomID.ToString() + ", 'غرفة مؤقتة', 'Room');" + @"},2000)}); ", true);

                        }
                        catch (Exception ex)
                        {                            
                        }
                    }                     

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

            Member memberfriend = new Member();
            memberfriend.LoadByPrimaryKey(newfriend.FriendID);

            // logging
            BLL.MemberLog log = new BLL.MemberLog();
            log.AddNew(BLL.Member.CurrentMemberID, new BLL.Log.AddFriend() { FriendID = newfriend.FriendID, FriendName = memberfriend.Name }, newfriend.FriendID, null);
        }
    }
}