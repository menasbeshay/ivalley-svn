using System;
using System.Collections;
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
        public string OpenedRooms
        {
            get
            {
                return Convert.ToString(ViewState["Rooms"]);
            }
            set
            {
                ViewState["Rooms"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.IsAuthenticated)
            {
                if (!IsPostBack)
                {
                    Member member = BLL.Member.CurrentMember;
                    uiHiddenFieldCurrent.Value = member.MemberID.ToString();
                    uiHiddenFieldCurrentName.Value = member.Name;
                    uiHiddenFieldCreditPoints.Value = (!member.IsColumnNull("Credit_Point")) ? member.Credit_Point.ToString() : "0";
                    uiHiddenFieldOpenedCams.Value = 0.ToString();
                    uiHiddenFieldOpenedRooms.Value = 0.ToString();
                    int membertype = 0;
                    membertype = member.MemberType.MemberTypeSpecDuration.MemberTypeSpecID;
                    uiHiddenFieldMaxCams.Value = member.MemberType.MemberTypeSpecDuration.MemberTypeSpec.OpenedCamCount.ToString();
                    uiHiddenFieldMaxNoOfRooms.Value = member.MemberType.MemberTypeSpecDuration.MemberTypeSpec.OpenRoomCount.ToString();

                    // init friends & gifts for general gift modal
                    MemberFriend friends = new MemberFriend();
                    friends.GetAllMemberFriends(member.MemberID);
                    uiRepeaterGiftFriends.DataSource = friends.DefaultView;
                    uiRepeaterGiftFriends.DataBind();

                    Gift gifts = new Gift();
                    gifts.LoadAll();
                    uiRepeaterGeneralGifts.DataSource = gifts.DefaultView;
                    uiRepeaterGeneralGifts.DataBind();

                    Room room = new Room();
                    if (Session["TempRoomCreate"] != null)
                    {
                        room.LoadByPrimaryKey(Convert.ToInt32(Session["TempRoomCreate"].ToString()));
                        ClientScript.RegisterStartupScript(this.GetType(), "temproom", "$(document).ready(function (){ setTimeout( function(){ addChatRoom(" + room.RoomID.ToString() + ", 'غرفة مؤقتة', 'Room', true);" + @"},1500)}); ", true);
                        Session["TempRoomCreate"] = null;

                    }
                    // temp room invitation
                    else if (Request.QueryString["t"] != null)
                    {
                        try
                        {
                            room.LoadByPrimaryKey(Convert.ToInt32(Request.QueryString["t"].ToString()));
                            ClientScript.RegisterStartupScript(this.GetType(), "temproom", "$(document).ready(function (){ setTimeout( function(){ addChatRoom(" + room.RoomID.ToString() + ", 'غرفة مؤقتة', 'Room', true);" + @"},1500)}); ", true);

                        }
                        catch (Exception ex)
                        {                            
                        }
                    }

                    List<Helper.ChatRoom> openedRooms = new List<Helper.ChatRoom>();
                    foreach (var sessionInfo in Helper.Sessions.OpenedRooms)
                    {
                        if (room.LoadByPrimaryKey(sessionInfo.ID))
                        {
                            openedRooms.Add(Chat2Connect.services.Services.GetRoomInfo(sessionInfo.ID, sessionInfo.IsTemp, room));
                        }
                    }
                    OpenedRooms = Helper.JsonConverter.Serialize(openedRooms);
                    //if (Session["OpenedChatRooms"] != null)
                    //{
                    //    List<int> rooms = (List<int>)Session["OpenedChatRooms"];
                    //    string script = "";
                    //    int time = 1000;
                    //    foreach (var item in rooms)
                    //    {
                    //        Room room = new Room();
                    //        room.LoadByPrimaryKey(Convert.ToInt32(item));
                    //        script += "setTimeout( function(){addChatRoom(" + room.RoomID.ToString() + ", '" + room.Name + "', 'Room', false); },"+time+");";
                    //        time += 500;
                            
                    //    }
                    //    ClientScript.RegisterStartupScript(this.GetType(), "openrooms", "$(document).ready(function (){ "+ script + "}); ", true);    
                    //}

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

            try
            {
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
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "ErrorAddingFriend", "$(document).ready(function (){ notify('error','خطأ. حدث خطأ . من فضلك أعد المحاولة مرة أخرى أو تأكد من وجود الصديق فى قائمة الأصدقاء.');}); ", true);
            }
        }
    }
}