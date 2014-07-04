using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Security;
using System.Web.Services;
using BLL;
using Chat2Connect.SRCustomHubs;
using Microsoft.AspNet.SignalR;
using Microsoft.AspNet.SignalR.Hubs;
using System.Dynamic;
using System.Collections;

namespace Chat2Connect.services
{
    /// <summary>
    /// Summary description for Services
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class Services : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public bool changeMail(string question, string answer, string mail)
        {
            MembershipUser user = Membership.GetUser();
            Member member = new Member();

            member.GetMemberByUserId(new Guid(user.ProviderUserKey.ToString()));
            if (user.PasswordQuestion == question && member.Answer == answer)
            {
                MembershipUser[] users = Membership.GetAllUsers().Cast<MembershipUser>().Where(m => m.Email == mail).ToArray();
                if (users.Length < 15)
                {
                    user.Email = mail;
                    Membership.UpdateUser(user);
                }

                else
                    return false;
            }
            else
            {
                return false;
            }
            return true;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public bool changePass(string oldpass, string question, string answer, string pass)
        {
            bool update = false;
            MembershipUser user = Membership.GetUser();
            Member member = new Member();

            member.GetMemberByUserId(new Guid(user.ProviderUserKey.ToString()));
            if (user.PasswordQuestion == question && member.Answer == answer)
            {
                string Oldpass = oldpass;
                update = user.ChangePassword(Oldpass, pass);
                if (update)
                    Membership.UpdateUser(user);
            }
            else
            {
                return update;
            }
            return update;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public bool changeStatusMsg(string status)
        {
            MembershipUser user = Membership.GetUser();
            Member member = new Member();

            member.GetMemberByUserId(new Guid(user.ProviderUserKey.ToString()));
            member.StatusMsg = status;
            member.Save();
            return true;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public bool changeStatus(int status)
        {
            MembershipUser user = Membership.GetUser();
            Member member = new Member();

            member.GetMemberByUserId(new Guid(user.ProviderUserKey.ToString()));
            member.Status = status;
            member.Save();
            return true;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public bool SendMsg(int sender, string ToMember, string subject, string toName, string content)
        {
            List<int> recipients = new List<int>();
            string[] ToMembers = ToMember.Split(',');
            BLL.Message msg = new BLL.Message();
            msg.AddNew();
            msg.Body = content;
            msg.SenderID = sender;
            msg.Subject = subject;
            msg.ToMembers = toName;
            msg.Save();
            MemberMessage memberMsg = new MemberMessage();
            //add to member sent items
            memberMsg.AddNew();
            memberMsg.MessageID = msg.ID;
            memberMsg.IsRead = true;
            foreach (string item in ToMembers)
            {
                if (!string.IsNullOrEmpty(item))
                {
                    int recipientID = Convert.ToInt32(item);
                    if (recipientID > 0 && !recipients.Contains(recipientID))
                    {
                        recipients.Add(recipientID);
                        memberMsg.AddNew();
                        memberMsg.MemberID = recipientID;
                        memberMsg.MessageID = msg.ID;
                    }
                    else
                    {
                        recipientID = recipientID * -1;
                        if (Enum.IsDefined(typeof(Helper.Enums.AdminMailAddressAlias), recipientID))
                        {
                            Member aliasMembers = new Member();
                            aliasMembers.GetByAliase((Helper.Enums.AdminMailAddressAlias)recipientID);
                            do
                            {
                                if (!recipients.Contains(aliasMembers.MemberID))
                                {
                                    recipients.Add(aliasMembers.MemberID);
                                    memberMsg.AddNew();
                                    memberMsg.MemberID = aliasMembers.MemberID;
                                    memberMsg.MessageID = msg.ID;
                                }
                            } while (aliasMembers.MoveNext());
                        }
                    }
                }
            }

            memberMsg.Save();
            if (recipients.Count > 0)
            {
                NotificationHub notifications = new NotificationHub();
                for (int i = 0; i < recipients.Count; i++)
                {
                    notifications.SendMailNotifications(recipients[i]);
                }
            }
            return true;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string[] SearchMembers(string query)
        {
            List<string> listString = new List<string>();
            Member member = new Member();
            member.SearchMembers(query);


            if (member.RowCount > 0)
            {
                for (int i = 0; i < member.RowCount; i++)
                {
                    listString.Add(member.MemberID + "##" + member.Name);
                    //ItemsJSON += "{'Name': '" + items.ItemCode + " - " + items.Name + "' , 'ItemID': '" + items.ItemID + "'}";
                    member.MoveNext();
                }
            }

            string[] str = listString.ToArray();
            return str;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public string[] SearchMembersExceptFriends(string query, string MemberID)
        {
            List<string> listString = new List<string>();
            Member member = new Member();
            member.SearchMembersExceptFriends(query, Convert.ToInt32(MemberID));


            if (member.RowCount > 0)
            {
                for (int i = 0; i < member.RowCount; i++)
                {
                    listString.Add(member.MemberID + "##" + member.Name);
                    //ItemsJSON += "{'Name': '" + items.ItemCode + " - " + items.Name + "' , 'ItemID': '" + items.ItemID + "'}";
                    member.MoveNext();
                }
            }

            string[] str = listString.ToArray();
            return str;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void SearchMailMembers(int memberID, string q)
        {
            List<dynamic> friends = new List<dynamic>();
            Member member = new Member();
            member.SearchMembersExceptFriends(q, memberID);
            if (member.RowCount > 0)
            {
                for (int i = 0; i < member.RowCount; i++)
                {
                    friends.Add(new { id = member.MemberID, name = member.Name });
                    member.MoveNext();
                }
            }
            if (Helper.Admin.IsAdmin() && Helper.Admin.HasRole(Helper.Enums.AdminRoles.Admin_SendMessgae.ToString()))
            {
                friends.AddRange(Helper.EnumUtil.GetValues<Helper.Enums.AdminMailAddressAlias>().Select(r => new
                {
                    id = ((int)r) * -1,
                    name = Helper.StringEnum.GetStringValue(r)
                }));
            }
            string result = Newtonsoft.Json.JsonConvert.SerializeObject(friends);
            HttpContext.Current.Response.ContentType = "application/json; charset=utf-8";
            HttpContext.Current.Response.Write(result);
            //return result;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void SearchMembersFriends(int memberID, string q)
        {
            List<dynamic> friends = new List<dynamic>();
            Member member = new Member();
            member.SearchMembersFriends(q, memberID);
            if (member.RowCount > 0)
            {
                for (int i = 0; i < member.RowCount; i++)
                {
                    friends.Add(new { id = member.MemberID, name = member.Name });
                    member.MoveNext();
                }
            }

            string result = Newtonsoft.Json.JsonConvert.SerializeObject(friends);
            HttpContext.Current.Response.ContentType = "application/json; charset=utf-8";
            HttpContext.Current.Response.Write(result);
            //return result;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public int GetQueueOrder(int memberID, int roomID)
        {
            int value = 0;
            RoomMember member = new RoomMember();
            member.LoadByPrimaryKey(memberID, roomID);
            RoomMember order = new RoomMember();
            order.GetMaxQueueOrderByRoomID(roomID);
            if (member.IsColumnNull("QueueOrder"))
            {
                member.QueueOrder = Convert.ToInt32(order.GetColumn("MaxQueueOrder")) + 1;
                value = member.QueueOrder;
            }
            else
                member.SetColumnNull("QueueOrder");

            member.Save();

            return value;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public bool AddRoomToFav(string rid)
        {
            try
            {
                BLL.Member member = BLL.Member.CurrentMember;
                RoomMember rm = new RoomMember();
                if (!rm.LoadByPrimaryKey(member.MemberID, Convert.ToInt32(rid)))
                {
                    rm.AddNew();
                    rm.MemberID = member.MemberID;
                    rm.RoomID = Convert.ToInt32(rid);
                }
                rm.IsFavorite = true;
                rm.Save();
                return true;
            }
            catch (Exception ex)
            {
                return false;
            }

        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public bool MarkMembers(string rid, bool CanWrite, bool mark)
        {

            Room room = new Room();
            room.LoadByPrimaryKey(Convert.ToInt32(rid));

            RoomMember members = new RoomMember();
            members.GetAllMembersByRoomID(room.RoomID);

            try
            {
                for (int i = 0; i < members.RowCount; i++)
                {
                    members.IsMarked = mark;
                    members.CanWrite = CanWrite;
                    members.Save();

                    Member m = new Member();
                    m.LoadByPrimaryKey(members.MemberID);
                    MembershipUser u = Membership.GetUser(m.UserID);

                    IHubContext _Rcontext = GlobalHost.ConnectionManager.GetHubContext<ChatRoomHub>();
                    if (mark)
                        _Rcontext.Clients.Group(room.RoomID.ToString()).UserMarked(room.RoomID, members.MemberID, CanWrite);
                    else
                        _Rcontext.Clients.Group(room.RoomID.ToString()).UserUnMarked(room.RoomID, members.MemberID, CanWrite);
                    members.MoveNext();
                }
            }
            catch (Exception ex)
            {
                return false;
            }
            return true;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public bool MarkMemberOnLogin(string rid, bool CanWrite, bool mark)
        {
            Room room = new Room();
            room.LoadByPrimaryKey(Convert.ToInt32(rid));

            try
            {
                if (CanWrite)
                    room.MarkOnLoginWithWrite = mark;
                else
                    room.MarkOnLoginWithoutWrite = mark;
                room.Save();
            }
            catch (Exception ex)
            {
                return false;
            }
            return true;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public bool DisableCams(bool mark, string rid)
        {
            Room room = new Room();
            room.LoadByPrimaryKey(Convert.ToInt32(rid));

            try
            {
                room.EnableCam = !mark;
                room.Save();
            }
            catch (Exception ex)
            {
                return false;
            }
            return true;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public bool EnableMic(bool mark, string rid, bool adminsonly)
        {
            Room room = new Room();
            room.LoadByPrimaryKey(Convert.ToInt32(rid));

            try
            {
                if (adminsonly)
                {
                    room.EnableMicForAdminsOnly = mark;
                    room.EnableMic = false;
                }
                else
                {
                    room.EnableMic = mark;
                    room.EnableMicForAdminsOnly = false;
                }
                room.Save();
            }
            catch (Exception ex)
            {
                return false;
            }
            return true;
        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public bool RateRoom(string rid, string rate)
        {

            MembershipUser user = Membership.GetUser();
            Member member = new Member();

            member.GetMemberByUserId(new Guid(user.ProviderUserKey.ToString()));

            RoomMember Rmember = new RoomMember();
            Rmember.LoadByPrimaryKey(member.MemberID, Convert.ToInt32(rid));

            try
            {
                Rmember.UserRate = Convert.ToInt16(rate);
                Rmember.Save();
            }
            catch (Exception ex)
            {
                return false;
            }
            return true;
        }
        //UpdateRoomSetting
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public bool UpdateRoomMemberSetting(int rid, int mid, string setting, bool newValue)
        {
            try
            {
                RoomMember rSetting = new RoomMember();
                if (!rSetting.LoadByPrimaryKey(mid, rid))
                {
                    rSetting.AddNew();
                    rSetting.RoomID = rid;
                    rSetting.MemberID = mid;
                }
                rSetting.SetColumn(setting, newValue);
                rSetting.Save();
            }
            catch (Exception ex)
            {
                return false;
            }
            return true;
        }

        [WebMethod(EnableSession = true)]
        public void GetChatRoom(int id, bool isTemp)
        {
            HttpContext.Current.Response.ContentType = "application/json; charset=utf-8";
            string error;
            Room room;
            if(!IsValideRoom(id,isTemp,out room,out error))
            {
                HttpContext.Current.Response.Write(String.Format("{\"Status\":0,\"Data\":\"{0}\"}",error));
                return;
            }

            Helper.ChatRoom roomObject = GetRoomInfo(id, isTemp, room);
            Helper.Sessions.OpenedRooms.Add(new Helper.Sessions.RoomSession() { ID = id, IsTemp = isTemp });

            string result = Newtonsoft.Json.JsonConvert.SerializeObject(roomObject);
            HttpContext.Current.Response.Write("{\"Status\":1,\"Data\":" + result + "}");
            //return result;
        }

        private static bool IsValideRoom(int id,bool isTemp,out Room room,out string message)
        {
            message = "";
            room = new Room();
            if (!isTemp)
            {
                RoomMemberBanning ban = new RoomMemberBanning();
                if (ban.LoadByPrimaryKey(id, BLL.Member.CurrentMemberID))
                {
                    if (ban.IsColumnNull(RoomMemberBanning.ColumnNames.EndDate) || ban.EndDate > DateTime.Now)
                    {
                        message = "تم طردك من هذه الغرفة ";
                        if (ban.IsColumnNull(RoomMemberBanning.ColumnNames.EndDate))
                            message = message + "نهائيا ولن تتمكن من الدخول مرة أخرى";
                        else
                            message = message + "لن تتمكن من دحول هذه الغرفة قبل هذا الوفت: " + Helper.Date.ToDateTimeString(ban.EndDate);

                        return false;
                    }
                }
            }
            //Room Info
            if (!room.LoadByPrimaryKey(id))
            {
                message = "غرفة غير متاحة";
                return false;
            }
            if (room.RowStatusID != (int)Helper.Enums.RowStatus.Enabled)
            {
                message = "هذه الغرفة مغلقة حاليا";
                return false;
            }

            return true;
        }
        public static Helper.ChatRoom GetRoomInfo(int id, bool isTemp, Room room)
        {
            Helper.ChatRoom roomObject = new Helper.ChatRoom();
            roomObject.ID = id;
            roomObject.Type = "Room";
            roomObject.IsTemp = isTemp;
            roomObject.Message = "";
            roomObject.AdminMessage = "";

            //Room info
            roomObject.Name = room.Name;
            roomObject.RoomTopic = room.RoomTopic;
            roomObject.fbURL = room.FbURL;
            roomObject.tURL = room.TURL;
            roomObject.utURL = room.UtURL;
            roomObject.OpenCams = room.OpenCams;
            if (!room.IsColumnNull("CreatedBy"))
                roomObject.CreatedBy = room.CreatedBy;
            roomObject.WelcomeMsg = room.WelcomeText;

            if (!room.IsColumnNull("CreatedDate"))
                roomObject.CreatedDate = room.CreatedDate;

            //Room settings
            roomObject.Settings.EnableCam = room.EnableCam;
            roomObject.Settings.EnableMic = room.EnableMic;
            roomObject.Settings.MarkOnLoginWithoutWrite = room.MarkOnLoginWithoutWrite;
            roomObject.Settings.MarkOnLoginWithWrite = room.MarkOnLoginWithWrite;
            roomObject.Settings.EnableMicForAdminsOnly = room.EnableMicForAdminsOnly;
            roomObject.Settings.CamCount = room.RoomType.RoomTypeSpecDuration.RoomTypeSpec.MicCount;
            roomObject.Settings.MaxMic = room.RoomType.RoomTypeSpecDuration.RoomTypeSpec.MicCount;
            //Room Members
            RoomMember roomMember = new RoomMember();
            if (!roomMember.LoadByPrimaryKey(BLL.Member.CurrentMember.MemberID, id))
            {
                roomMember.AddNew();
                roomMember.MemberID = BLL.Member.CurrentMember.MemberID;
                roomMember.RoomID = id;
            }
            roomMember.InRoom = true;
            if (BLL.Member.CurrentMember.Status == (int)Helper.Enums.MemberStatus.Offline && Helper.Admin.HasRole(Helper.Enums.MemberRoles.InvisibleInRoom.ToString()))
                roomMember.InRoom = false;
            if (!room.IsColumnNull("CreatedBy"))
            {
                if (roomMember.MemberID == room.CreatedBy)
                    roomMember.RoomMemberLevelID = (int)Helper.Enums.RoomMemberLevel.Owner;
            }
            roomMember.Save();
            roomObject.CurrentMemberID = BLL.Member.CurrentMemberID;

            roomObject.Members = roomMember.LoadWithSettings(id, null);
            var currentMemberSettings = roomObject.Members.First(m => m.MemberID == roomObject.CurrentMemberID);
            if (currentMemberSettings != null)
            {
                if (room.MarkOnLoginWithWrite)
                {
                    currentMemberSettings.IsMarked = true;
                    currentMemberSettings.CanWrite = true;
                }
                if (room.MarkOnLoginWithoutWrite)
                {
                    currentMemberSettings.IsMarked = true;
                    currentMemberSettings.CanWrite = false;
                }
            }
            // load owner / admins 
            roomObject.Admins = roomMember.GetAdminsMembersByRoomID(id);

            // load cat & subcat
            Category cat = new Category();
            cat.LoadByPrimaryKey(room.CategoryID);
            roomObject.CategoryName = cat.Name;

            SubCategory scat = new SubCategory();
            if (!room.IsColumnNull("SubCategoryID"))
            {
                scat.LoadByPrimaryKey(room.SubCategoryID);
                roomObject.SubCategoryName = scat.Name;
            }
            else
            {
                roomObject.SubCategoryName = "لا يوجد";
            }

            //member level change
            roomObject.MemberLevels = Helper.EnumUtil.GetValues<Helper.Enums.RoomMemberLevel>().Where(l => (int)l <= currentMemberSettings.MemberLevelID).Select(l => new
            {
                ID = (int)l,
                Name = Helper.StringEnum.GetStringValue(l)
            }).ToList();
            //messages
            roomObject.MessageHistory = new RoomMessages().GetLatestMessags(id, 0);
            ///////////////////////////
            Gift allgifts = new Gift();
            allgifts.LoadAll();
            roomObject.Gifts = allgifts.DefaultView.Table.AsEnumerable().Select(m => new { giftid = m["GiftID"], name = m["Name"], price = m["Price_Point"], picPath = m["PicPath"] }).ToList();

            return roomObject;
        }

        [WebMethod]
        public void BanRoomMember(int memberID, int roomID, int type, int adminID)
        {
            RoomMemberBanning ban = new RoomMemberBanning();
            if (!ban.LoadByPrimaryKey(roomID, memberID))
            {
                ban.AddNew();
                ban.RoomID = roomID;
                ban.MemberID = memberID;
            }

            ban.CreatedByMemberID = adminID;
            ban.CreateDate = DateTime.Now;
            ban.StartDate = DateTime.Now;
            switch (type)
            {
                case (int)Helper.Enums.BanningType.Day:
                    ban.EndDate = DateTime.Now.AddDays(1);
                    break;
                case (int)Helper.Enums.BanningType.Month:
                    ban.EndDate = DateTime.Now.AddMonths(1);
                    break;
                case (int)Helper.Enums.BanningType.Week:
                    ban.EndDate = DateTime.Now.AddDays(7);
                    break;
                case (int)Helper.Enums.BanningType.Permanent:
                    ban.SetColumnNull(RoomMemberBanning.ColumnNames.EndDate);
                    break;
            }

            ban.Save();

        }

        [WebMethod]
        public void RemoveBanningFromRoomMembers(int roomID, int[] membersID)
        {
            RoomMemberBanning ban = new RoomMemberBanning();
            ban.Delete(roomID, membersID);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public bool InviteFriends(string memberName, int roomID, string roomName, string friendsIDs)
        {
            string[] ToMembers = friendsIDs.Split(',');

            foreach (string item in ToMembers)
            {
                if (!string.IsNullOrEmpty(item))
                {
                    int recipientID = Convert.ToInt32(item);
                    Member m = new Member();
                    m.LoadByPrimaryKey(recipientID);
                    MembershipUser u = Membership.GetUser(m.UserID);

                    IHubContext _Ncontext = GlobalHost.ConnectionManager.GetHubContext<NotificationHub>();
                    _Ncontext.Clients.Group(u.UserName).InviteToRoomByFriend(roomID, roomName, memberName);
                }
            }


            return true;
        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public bool SendGift(string memberName, int roomID, string roomName, Helper.Item[] friends, int giftid)
        {
            MembershipUser user = Membership.GetUser();
            Member member = new Member();

            member.GetMemberByUserId(new Guid(user.ProviderUserKey.ToString()));
            Gift srcgift = new Gift();
            srcgift.LoadByPrimaryKey(giftid);

            if (!(member.Credit_Point >= srcgift.Price_Point * friends.Length))
                return false;
            foreach (Helper.Item item in friends)
            {
                MemberGift gift = new MemberGift();
                gift.AddNew();
                gift.MemberID = item.ID;
                gift.SenderID = member.MemberID;
                gift.SendDate = DateTime.Now;
                gift.GiftID = giftid;
                gift.Save();

                member.Credit_Point = member.Credit_Point - srcgift.Price_Point;
                member.Save();

                // check if in room or send to friend
                if (roomID != 0)
                {
                    IHubContext _Ncontext = GlobalHost.ConnectionManager.GetHubContext<ChatRoomHub>();
                    _Ncontext.Clients.Group(roomID.ToString()).GiftSentInRoom(roomID, memberName, item.Name, srcgift.Name, item.ID, srcgift.PicPath);
                }

            }

            return true;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetGifts()
        {
            List<dynamic> gifts = new List<dynamic>();
            Gift allgifts = new Gift();
            allgifts.LoadAll();
            if (allgifts.RowCount > 0)
            {
                for (int i = 0; i < allgifts.RowCount; i++)
                {
                    gifts.Add(new { giftid = allgifts.GiftID, name = allgifts.Name, price = allgifts.IsColumnNull("Price_Point") ? "0" : allgifts.Price_Point.ToString(), picPath = allgifts.PicPath });
                    allgifts.MoveNext();
                }
            }

            string result = Newtonsoft.Json.JsonConvert.SerializeObject(gifts);
            HttpContext.Current.Response.ContentType = "application/json; charset=utf-8";
            HttpContext.Current.Response.Write(result);
            //return result;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetOnlineFriends()
        {
            List<dynamic> friends = new List<dynamic>();
            MembershipUser user = Membership.GetUser();
            Member member = new Member();
            member.GetMemberByUserId(new Guid(user.ProviderUserKey.ToString()));

            Member online = new Member();
            online.GetMemberFriendsByStatus(member.MemberID, true);
            if (online.RowCount > 0)
            {
                for (int i = 0; i < online.RowCount; i++)
                {
                    friends.Add(new { id = online.MemberID, name = online.GetColumn("UserName"), IsSelected = false });
                    online.MoveNext();
                }
            }

            string result = Newtonsoft.Json.JsonConvert.SerializeObject(friends);
            HttpContext.Current.Response.ContentType = "application/json; charset=utf-8";
            HttpContext.Current.Response.Write(result);
            //return result;
        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public bool SendPrivateMsg(string toIds, string msg)
        {
            string[] ToMembers = toIds.Split(',');
            IHubContext _Rcontext = GlobalHost.ConnectionManager.GetHubContext<ChatRoomHub>();

            try
            {
                for (int i = 0; i < ToMembers.Length; i++)
                {
                    Member m = new Member();
                    m.LoadByPrimaryKey(Convert.ToInt32(ToMembers[i]));
                    MembershipUser user = Membership.GetUser(m.UserID);
                    _Rcontext.Clients.Group(user.UserName).getPrivateMessage(Member.CurrentMemberID, Member.CurrentMember.UserName, msg);
                }
            }
            catch (Exception ex)
            {
                return false;
            }
            return true;
        }


        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetRoomOlderMessages(int roomid, int oldestMsgID)
        {
            string result = Helper.JsonConverter.Serialize(new RoomMessages().GetLatestMessags(roomid, oldestMsgID));
            HttpContext.Current.Response.ContentType = "application/json; charset=utf-8";
            HttpContext.Current.Response.Write(result);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void AddRemoveFriend(int mid, int fid, bool isFriend)
        {
            try
            {
                BLL.MemberFriend friend = new MemberFriend();
                Member friendMember = new Member();
                friendMember.LoadByPrimaryKey(fid);
                if (!isFriend)
                {
                    friend.AddNew();
                    friend.MemberID = mid;
                    friend.FriendID = fid;
                    friend.Save();
                    // logging
                    BLL.MemberLog log = new BLL.MemberLog();
                    log.AddNew(mid, new BLL.Log.AddFriend() { FriendID = fid, FriendName = friendMember.Name }, fid, null);
                }
                else
                {
                    friend.DeleteFriend(mid, fid);
                    // logging
                    BLL.MemberLog log = new BLL.MemberLog();
                    log.AddNew(mid, new BLL.Log.DeleteFriend() { FriendID = fid, FriendName = friendMember.Name }, fid, null);
                }


            }
            catch { }
        }

        [WebMethod(EnableSession = true)]
        public void closeChatRoom(int id)
        {
            var roomSession = Helper.Sessions.OpenedRooms.FirstOrDefault(r => r.ID == id);
            if (roomSession != null)
                Helper.Sessions.OpenedRooms.Remove(roomSession);
        }

    }
}
