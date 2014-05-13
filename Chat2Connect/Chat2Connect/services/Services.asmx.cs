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
using System.Dynamic;

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
        public bool SendMsg(int sender,string ToMember, string subject,string toName, string content)
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
            MembershipUser user = Membership.GetUser();
            Member member = new Member();

            member.GetMemberByUserId(new Guid(user.ProviderUserKey.ToString()));
            try
            {
                FavRoom favroom = new FavRoom();
                favroom.LoadByPrimaryKey(member.MemberID, Convert.ToInt32(rid));
                if (favroom.RowCount > 0)
                    return true;
                else
                {
                    favroom.AddNew();
                    favroom.MemberID = member.MemberID;
                    favroom.RoomID = Convert.ToInt32(rid);
                    favroom.Save();
                    return true;
                }
            }
            catch (Exception ex)
            {
                return false;
            }

        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public bool ClearQueue(string rid)
        {

            Room room = new Room();
            room.LoadByPrimaryKey(Convert.ToInt32(rid));

            RoomMember members = new RoomMember();
            members.GetAllMembersByRoomIDInQueue(room.RoomID);

            try
            {
                for (int i = 0; i < members.RowCount; i++)
                {
                    members.SetColumnNull("QueueOrder");
                    members.Save();

                    Member m = new Member();
                    m.LoadByPrimaryKey(members.MemberID);
                    MembershipUser u = Membership.GetUser(m.UserID);

                    IHubContext _Rcontext = GlobalHost.ConnectionManager.GetHubContext<ChatRoomHub>();
                    _Rcontext.Clients.Group(room.RoomID.ToString()).UserDownHand(room.RoomID, members.MemberID);
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
        public bool UpdateRoomSetting(int rid, int mid, string setting, bool newValue)
        {
            try
            {
                RoomMemberSetting rSetting = new RoomMemberSetting();
                if (!rSetting.LoadByPrimaryKey(rid, mid))
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

        [WebMethod]
        public void GetChatRoom(int id, bool isTemp)
        {
            Helper.ChatRoom roomObject = new Helper.ChatRoom();
            roomObject.ID = id;
            roomObject.Type = "Room";
            roomObject.IsTemp = isTemp;
            roomObject.Message = "";
            roomObject.MessageHistory = "";
            roomObject.CurrentMemberSettings.IsMicOpened = false;
            roomObject.CurrentMemberSettings.IsCamOpened = false;
            //Room Info
            Room rooms = new Room();
            rooms.LoadByPrimaryKey(id);

            roomObject.Name = rooms.Name;

            if (!rooms.IsColumnNull("OpenCams"))
                roomObject.OpenCams = rooms.OpenCams;
            else
                roomObject.OpenCams = 0;

            roomObject.Settings.EnableCam = rooms.EnableCam;
            roomObject.Settings.EnableMic = rooms.EnableMic;


            Member member = new Member();
            member.LoadByPrimaryKey(rooms.CreatedBy);
            roomObject.AdminName = member.Name;

            Member CurrentMember = new Member();
            CurrentMember.GetMemberByUserId(new Guid(Membership.GetUser().ProviderUserKey.ToString()));
            roomObject.CurrentMemberSettings.MemberID = CurrentMember.MemberID;
            if (CurrentMember.MemberID != member.MemberID)
            {
                roomObject.CurrentMemberSettings.IsAdmin = false;
            }
            else
            {
                roomObject.CurrentMemberSettings.IsAdmin = true;
            }

            roomObject.Settings.CamCount = 1;
            roomObject.Settings.MaxMic = 1;
            if (!String.IsNullOrEmpty(rooms.s_RoomTypeID))
            {
                switch (rooms.RoomTypeID)
                {
                    case 1: // black
                        roomObject.Settings.CamCount = 1;
                        roomObject.Settings.MaxMic = 1;
                        break;
                    case 2: // zety 
                        roomObject.Settings.CamCount = 4;
                        roomObject.Settings.MaxMic = 2;
                        break;
                    case 3: // purple
                        roomObject.Settings.CamCount = 100;
                        roomObject.Settings.MaxMic = 3;
                        break;
                    case 4: // premium 
                        roomObject.Settings.CamCount = 100;
                        roomObject.Settings.MaxMic = 4;
                        break;
                }
            }

            // add to favourite link
            FavRoom fav = new FavRoom();
            fav.LoadByPrimaryKey(CurrentMember.MemberID, id);
            if (fav.RowCount > 0 || isTemp)
                roomObject.CurrentMemberSettings.IsFav = true;
            else
            {
                roomObject.CurrentMemberSettings.IsFav = false;
            }
            //Member
            roomObject.CurrentMemberSettings.UserRate = 0;

            RoomMember roomMember = new RoomMember();
            roomMember.LoadByPrimaryKey(CurrentMember.MemberID, id);
            if (roomMember.RowCount == 0)
            {
                roomMember.AddNew();
                roomMember.MemberID = CurrentMember.MemberID;
                roomMember.RoomID = id;
                roomMember.InRoom = true;
                roomMember.Save();
            }
            else
            {
                roomMember.InRoom = true;
                roomMember.Save();
                if (!roomMember.IsColumnNull(RoomMember.ColumnNames.UserRate))
                    roomObject.CurrentMemberSettings.UserRate = roomMember.UserRate;
            }
            roomObject.CurrentMemberSettings.CanAccessCam = roomMember.CanAccessCam;
            roomObject.CurrentMemberSettings.CanAccessMic = roomMember.CanAccessMic;
            roomObject.CurrentMemberSettings.CanWrite = roomMember.CanWrite;
            roomObject.CurrentMemberSettings.IsBanned = roomMember.IsBanned;
            roomObject.CurrentMemberSettings.IsMarked = roomMember.IsMarked;
            RoomMemberSetting sett = new RoomMemberSetting();
            if (sett.LoadByPrimaryKey(id, CurrentMember.MemberID))
            {
                roomObject.CurrentMemberSettings.NotifyOnCloseCam = sett.NotifyOnCloseCam;
                roomObject.CurrentMemberSettings.NotifyOnFriendsLogOff = sett.NotifyOnFriendsLogOff;
                roomObject.CurrentMemberSettings.NotifyOnFriendsLogOn = sett.NotifyOnFriendsLogOn;
                roomObject.CurrentMemberSettings.NotifyOnMicOff = sett.NotifyOnMicOff;
                roomObject.CurrentMemberSettings.NotifyOnMicOn = sett.NotifyOnMicOn;
                roomObject.CurrentMemberSettings.NotifyOnOpenCam = sett.NotifyOnOpenCam;
            }
            RoomMember Allmembers = new RoomMember();
            Allmembers.GetOnlineMembersByRoomID(id);
            roomObject.MemberCount = Allmembers.RowCount;

            RoomMember members = new RoomMember();
            members.GetAllMembersByRoomIDNoQueue(id);
            RoomMember InQueueMembers = new RoomMember();
            InQueueMembers.GetAllMembersByRoomIDInQueue(id);
            roomObject.RoomMembers = members.DefaultView.Table.AsEnumerable().Select(m => new Helper.ChatMember() { MemberID = m["MemberID"], MemberName = m["Name"], MemberTypeID = m["MemberTypeID"] }).ToList();
            roomObject.QueueMembers = InQueueMembers.DefaultView.Table.AsEnumerable().Select(m => new Helper.ChatMember() { MemberID = m["MemberID"], MemberName = m["Name"], MemberTypeID = m["MemberTypeID"] }).ToList();

            Allmembers.LoadAllRoomMembersWithSettings(id);
            roomObject.AllMembersSettings = Allmembers.DefaultView.Table.AsEnumerable().Select(m => new { MemberID = m["MemberID"], MemberName = m["MemberName"], CanAccessCam = m["CanAccessCam"], CanAccessMic = m["CanAccessMic"], CanWrite = m["CanWrite"], IsMemberBanned = m["IsMemberBanned"], BanDays = (Convert.ToBoolean(m["IsMemberBanned"])? m["BanDays"] : null) }).ToList();
            
            Gift allgifts = new Gift();
            allgifts.LoadAll();            
            roomObject.Gifts = allgifts.DefaultView.Table.AsEnumerable().Select(m => new { id = m["GiftID"], name = m["Name"], price = m["Price_Point"], picPath = m["PicPath"] }).ToList();

            string result = Newtonsoft.Json.JsonConvert.SerializeObject(roomObject);
            HttpContext.Current.Response.ContentType = "application/json; charset=utf-8";
            HttpContext.Current.Response.Write(result);
            //return result;
        }

        [WebMethod]
        public void BanRoomMember(int memberID, int roomID, int? days)
        {
            RoomMemberBanning ban = new RoomMemberBanning();
            if (!ban.LoadByPrimaryKey(roomID, memberID))
            {
                ban.AddNew();
                ban.RoomID = roomID;
                ban.MemberID = memberID;
            }
            Member currentMember = new Member();
            if (currentMember.LoadCurrentMember())
                ban.CreatedByMemberID = currentMember.MemberID;
            ban.CreateDate = DateTime.Now;
            ban.StartDate = DateTime.Now;
            if (days.HasValue)
                ban.EndDate = DateTime.Now.AddDays(days.Value);
            else
                ban.SetColumnNull(RoomMemberBanning.ColumnNames.EndDate);
            ban.Save();

            
        }

        [WebMethod]
        public void RemoveBanedRoomMember(int memberID, int roomID)
        {
            RoomMemberBanning ban = new RoomMemberBanning();
            if (ban.LoadByPrimaryKey(roomID, memberID))
            {
                ban.MarkAsDeleted();
                ban.Save();
            }
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public bool InviteFriends(string memberName, int roomID,string roomName, string friendsIDs)
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
        public void GetGifts()
        {
            List<dynamic> gifts = new List<dynamic>();
            Gift allgifts = new Gift();
            allgifts.LoadAll();
            if (allgifts.RowCount > 0)
            {
                for (int i = 0; i < allgifts.RowCount; i++)
                {
                    gifts.Add(new { id = allgifts.GiftID, name = allgifts.Name, price = allgifts.IsColumnNull("Price_Point") ? "0" : allgifts.Price_Point.ToString() , picPath = allgifts.PicPath });
                    allgifts.MoveNext();
                }
            }
            
            string result = Newtonsoft.Json.JsonConvert.SerializeObject(gifts);
            HttpContext.Current.Response.ContentType = "application/json; charset=utf-8";
            HttpContext.Current.Response.Write(result);
            //return result;
        }




    }
}
