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
using System.Net.Mail;
using Newtonsoft.Json;

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
        public bool SendRoomFriendsBotMsg(int roomID, string message)
        {
            BLL.Room bllRoom = new Room();
            if (!bllRoom.LoadByPrimaryKey(roomID))
                return false;
            BLL.RoomMember bllRoomMember = new RoomMember();
            if (!bllRoomMember.GetRoomFriends(roomID))
                return false;
            message.Replace("\r\n", "</br>");
            List<int> recipients = bllRoomMember.DefaultView.Table.AsEnumerable().Select(m => Helper.TypeConverter.ToInt32(m[BLL.RoomMember.ColumnNames.MemberID])).ToList();
            BLL.Message msg = new BLL.Message();
            msg.AddNew();
            msg.Body = message;
            msg.SenderID = BLL.Member.CurrentMemberID;
            msg.Subject = "بوت أصدقاء الغرفة";
            msg.ToMembers = "أصدقاء غرفة -" + bllRoom.Name;
            msg.Save();
            MemberMessage memberMsg = new MemberMessage();
            //add to member sent items
            memberMsg.AddNew();
            memberMsg.MessageID = msg.ID;
            memberMsg.IsRead = true;
            foreach (int recipientID in recipients)
            {
                memberMsg.AddNew();
                memberMsg.MemberID = recipientID;
                memberMsg.MessageID = msg.ID;
            }
            memberMsg.Save();

            //send mail notifications
            NotificationHub notifications = new NotificationHub();
            for (int i = 0; i < recipients.Count; i++)
            {
                notifications.SendMailNotifications(recipients[i]);
            }

            return true;
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public bool SendEmailOwnerBotMsg(int roomID, string message)
        {
            BLL.Room bllRoom = new Room();
            if (!bllRoom.LoadByPrimaryKey(roomID))
                return false;
            message = message.Replace("\r\n", "</br>");
            return SendMsg(BLL.Member.CurrentMemberID, bllRoom.s_CreatedBy, "بوت بريد المالك", "مالك الغرفة", message);
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
        public void SearchRoomsForTypes(string q)
        {
            Room bllRooms = new Room();
            int? createdBy;
            if (Helper.Admin.IsAdmin() && Helper.Admin.HasRole(Helper.Enums.AdminRoles.Admin_RoomType.ToString()))
            {
                createdBy=null;
            }
            else
            {
                createdBy=BLL.Member.CurrentMemberID;
            }
            bllRooms.SearchRooms(q,createdBy);
            var rooms = bllRooms.DefaultView.Table.AsEnumerable().Select(m => new { id = m[BLL.Room.ColumnNames.RoomID], name = m[BLL.Room.ColumnNames.Name] }).ToList();
            string result = Newtonsoft.Json.JsonConvert.SerializeObject(rooms);
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
        public bool ToggleFav(string rid)
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

                if (rm.IsFavorite == true)
                    rm.IsFavorite = false;
                else
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
            if (!IsValideRoom(id, isTemp, out room, out error))
            {
                var errorResult = new { Status = 0, Data = error };
                HttpContext.Current.Response.Write(Helper.JsonConverter.Serialize(errorResult));
                return;
            }

            Helper.ChatRoom roomObject = GetRoomInfo(id, isTemp, room);
            Helper.Sessions.OpenedRooms.Add(new Helper.Sessions.RoomSession() { ID = id, IsTemp = isTemp });

            var successResult = new { Status = 1, Data = roomObject };
            HttpContext.Current.Response.Write(Helper.JsonConverter.Serialize(successResult));
            //return result;
        }

        private static bool IsValideRoom(int id, bool isTemp, out Room room, out string message)
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

            if (room.CreatedBy != BLL.Member.CurrentMember.MemberID)
            {
                //check member type bot
                string acceptedType;
                if (!ValidateMemberLoginTypeBot(id, out acceptedType))
                {
                    message = "عفوا هذه الغرفة تقبل الأعضاء من الفئات (" + acceptedType + ") فقط";
                    return false;
                }
            }
            return true;
        }

        private static bool ValidateMemberLoginTypeBot(int id, out string acceptedTypes)
        {
            bool isValidMemberType = true;
            acceptedTypes = "";
            BLL.RoomBot bllbot = new BLL.RoomBot();
            List<Info.RoomBot> lstBots = bllbot.GetByRoomIDandBotID(id, Helper.Enums.Bot.MemberTypeLogin);
            if (lstBots.Count > 0)
            {
                Info.MemberTypeLogin infoBot = lstBots.FirstOrDefault().Settings as Info.MemberTypeLogin;
                if (infoBot != null)
                {
                    List<string> typeNames = (from s in infoBot.AcceptedMemberTypes
                                              select Helper.StringEnum.GetStringValue(Helper.EnumUtil.ParseEnum<Helper.Enums.MemberType>(Convert.ToInt32(s)))).ToList();
                    acceptedTypes = String.Join(",", typeNames);
                    switch (BLL.Member.CurrentMember.MemberType.MemberTypeSpecDuration.MemberTypeSpecID)
                    {
                        case (int)Helper.Enums.MemberTypeSpec.Free:
                            isValidMemberType = infoBot.AcceptedMemberTypes.Contains(Convert.ToString((int)Helper.Enums.MemberType.Free));
                            break;
                        case (int)Helper.Enums.MemberTypeSpec.Pink1:
                        case (int)Helper.Enums.MemberTypeSpec.Pink2:
                            isValidMemberType = infoBot.AcceptedMemberTypes.Contains(Convert.ToString((int)Helper.Enums.MemberType.Upgraded));
                            break;
                        case (int)Helper.Enums.MemberTypeSpec.VIP:
                            isValidMemberType = infoBot.AcceptedMemberTypes.Contains(Convert.ToString((int)Helper.Enums.MemberType.VIP));
                            break;
                    }
                }
            }
            return isValidMemberType;
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

            RoomBot Allbots = new RoomBot();
            roomObject.RoomBots = Allbots.GetByRoomID(id);

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
            roomObject.Settings.TypeID = room.RoomType.RoomTypeSpecDuration.RoomTypeSpecID;
            roomObject.Settings.Color = room.RoomType.RoomTypeSpecDuration.RoomTypeSpec.Color;
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
            //roomObject.Admins = roomMember.GetAdminsMembersByRoomID(id);

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
            //roomObject.MessageHistory = new RoomMessages().GetLatestMessags(id, 0);            
            roomObject.MessageHistory = new List<Helper.ChatMessage>() { };
            ///////////////////////////



            Gift allgifts = new Gift();
            allgifts.LoadAll();
            roomObject.Gifts = allgifts.DefaultView.Table.AsEnumerable().Select(m => new { giftid = m["GiftID"], name = m["Name"], price = m["Price_Point"], picPath = m["PicPath"], AudioPath = m["AudioPath"] }).ToList();

            //bots
            RoomBot bllRoomBot = new BLL.RoomBot();
            //welcome bot
            List<Info.RoomBot> bots = bllRoomBot.GetByRoomIDandBotID(id, Helper.Enums.Bot.Welcome);
            if (bots.Count > 0)
            {
                Info.WelcomeBot infoWelcomeBot = (Info.WelcomeBot)bots.First().Settings;
                roomObject.WelcomeBot = infoWelcomeBot;
            }

            return roomObject;
        }

        [WebMethod]
        public List<dynamic> SearchMembers_AddFriends(int mid, string stext)
        {

            List<dynamic> people = new List<dynamic>();
            Member members = new Member();

            members.Proc_SearchMembers(mid, stext);

            for (int i = 0; i < members.RowCount; i++)
            {
                people.Add(new { MemberID = members.MemberID, MemberName = members.GetColumn("UserName").ToString(), ProfileImg = members.ProfilePic, FriendsCount = (int)members.GetColumn("FriendsCount") });
                members.MoveNext();
            }
            if (people.Count > 0)
            {
                return people;
            }
            else
                return null;


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
                    _Ncontext.Clients.Group(roomID.ToString()).GiftSentInRoom(roomID, memberName, item.Name, srcgift.Name, item.ID, srcgift.PicPath, srcgift.AudioPath);
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
                    gifts.Add(new { giftid = allgifts.GiftID, name = allgifts.Name, price = allgifts.IsColumnNull("Price_Point") ? "0" : allgifts.Price_Point.ToString(), picPath = allgifts.PicPath, AudioPath = allgifts.AudioPath });
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
                    var resultMsg = new Helper.ChatMessage()
                    {
                        FromID = Member.CurrentMemberID,
                        ToID = m.MemberID,
                        FromName = Member.CurrentMember.UserName,
                        Message = msg,
                        MessageDate = DateTime.Now,
                        FromProfileImg = Member.CurrentMember.ProfilePic
                    };
                    _Rcontext.Clients.Group(user.UserName).getPrivateMessage(Member.CurrentMemberID, resultMsg);
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

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetMemberNode(int mid)
        {

            Member member = new Member();
            member.LoadByPrimaryKey(mid);

            string memberdiv = @"<div class='Altodd friend-link' id='usernode-{0}' data-name='{1}'>
                                    <img src='images/defaultavatar.png' id='user-{0}' class='friendpic {5}'/>
                                    <a href='#' class='type_{2}'>{1}
                                    </a>
                            <div class='clearfix' style='height: 1px;'></div>
                            <span id='user-status-{0}'>
                             {4}
                                </span>
                            <div class='clearfix' style='height: 1px;'></div>
                                <div class='friendSubMenu' >
                                <div class='popup-menu profileMenu' data-for='usernode-{0}' >
                                        <div class='col-lg-3 pull-right'>
                                        <div class=' thumbnail'>
                                            <img src='{3}'/>
                                            
                                        </div>
                                            <div class='clearfix' style='height:1px;'>
                                            </div>
                                            <div style='text-align:right;'>
                                            {1}
                                                </div>
                                            </div>
                                        <div class='col-lg-9 pull-right'>
                                        <div class='col-lg-6 pull-right'>
                                            <ul>
                                                <li><a class='jslink' onclick=" + "\"addChatRoom({0}, " + "'{1}', 'Private');\"" + @"><span class='awesome'>&#xf0e6;</span> محادثة خاصة</a></li>
                                                <li><a class='jslink' href='userprofile.aspx?uid={0}' target='_blank'><span class='awesome'>&#xf08e;</span> عرض البروفايل</a></li>
                                                <li><a class='jslink'><span class='awesome'>&#xf00d;</span> حذف من الأصدقاء</a></li>
                                            </ul>
                                        </div>
                                        <div class='col-lg-6 pull-right'>
                                            <ul>
                                                <li><a class='jslink openGiftModal' data-mid='{0}'><span class='awesome'>&#xf06b;</span> أرسل هدية</a></li>
                                        <li><a href='Messages.aspx?t=createmsg&u={0}&un={1}' target='_blank'><span class='awesome'>&#xf003;</span> أرسل رسالة</a></li>
                                        
                                        <li><a class='jslink'><span class='awesome'>&#xf05e;</span> حجب</a></li>
                                        
                                            </ul>
                                        </div>
                                      </div>
                                        <div class='clear' style='height: 1px;'></div>
                                    </div>
                                    </div>                                
                                </div>";

            string result = string.Format(memberdiv, member.MemberID, member.UserName, Helper.Defaults.MemberTypeSpecDurationID, member.ProfilePic, member.StatusMsg, (member.IsOnLine) ? "online" : "offline");
            HttpContext.Current.Response.ContentType = "application/json; charset=utf-8";
            result = Newtonsoft.Json.JsonConvert.SerializeObject(result);
            HttpContext.Current.Response.Write(result);
            //return result;
        }

        [WebMethod(EnableSession = true)]
        public void HandleClose()
        {
            Member user = new Member();
            user.GetMemberByUserId(new Guid(Membership.GetUser().ProviderUserKey.ToString()));
            user.IsOnLine = false;
            user.Status = 4;
            user.Save();

            RoomMember rooms = new RoomMember();
            rooms.GetAllRoomsByMemberID(user.MemberID);
            if (rooms.RowCount > 0)
            {
                rooms.InRoom = false;
                if (rooms.HasCam)
                {
                    rooms.HasCam = false;
                    Room room = new Room();
                    room.LoadByPrimaryKey(rooms.RoomID);
                    room.OpenCams -= 1;
                    if (room.OpenCams < 0)
                        room.OpenCams = 0;
                    room.Save();
                    IHubContext _Rcontext = GlobalHost.ConnectionManager.GetHubContext<ChatRoomHub>();
                    _Rcontext.Clients.Group(rooms.RoomID.ToString()).HideCamLink(rooms.MemberID, rooms.RoomID);
                }
                rooms.Save();


            }

            MemberFriend friends = new MemberFriend();
            friends.GetAllMemberFriends(user.MemberID);
            for (int i = 0; i < friends.RowCount; i++)
            {
                Member temp = new Member();
                temp.LoadByPrimaryKey(friends.FriendID);
                MembershipUser u = Membership.GetUser(temp.UserID);
                IHubContext _Ncontext = GlobalHost.ConnectionManager.GetHubContext<NotificationHub>();
                _Ncontext.Clients.Group(u.UserName).friendStatusChanged(user.MemberID, user.StatusMsg, "offline");
            }

            // clear all session vars
            Session.Abandon();
        }


        /************* profile functions ***********************/
        #region Profile
        [WebMethod]
        public bool ClearProfileImg(int mid)
        {

            Member member = new Member();
            member.LoadByPrimaryKey(mid);
            member.ProfilePic = "/images/defaultavatar.png";
            member.Save();
            return true;

        }

        [WebMethod]
        public bool SelectProfileImg(int mid, int pid)
        {

            Member member = new Member();
            member.LoadByPrimaryKey(mid);

            MemberPic pic = new MemberPic();
            pic.LoadByPrimaryKey(pid);
            member.ProfilePic = pic.PicPath;
            member.Save();
            return true;

        }


        [WebMethod]
        public int ToggleProfileLike(int mid, int pid)
        {
            ProfileLike like = new ProfileLike();
            like.LoadByPrimaryKey(mid, pid);
            if (like.RowCount > 0)
            {
                like.MarkAsDeleted();
                like.Save();
                return 2;
            }
            else
            {
                like.AddNew();
                like.MemberID = mid;
                like.ProfileMemberID = pid;
                like.Save();
                return 1;
            }

            return 0;

        }
        #endregion

        #region Admin
        [WebMethod]
        public bool SaveSocials(string fb, string tw, string gp, string yt)
        {
            try
            {
                SiteSettings setting = new SiteSettings();
                setting.LoadByPrimaryKey(1); // fb
                setting.URL = fb;
                setting.Save();

                setting.LoadByPrimaryKey(2); // TWITTER
                setting.URL = tw;
                setting.Save();

                setting.LoadByPrimaryKey(3); // youtube
                setting.URL = yt;
                setting.Save();

                setting.LoadByPrimaryKey(4); // google
                setting.URL = gp;
                setting.Save();
            }
            catch (Exception ex)
            {
                return false;
            }

            return true;

        }

        [WebMethod]
        public bool SavePrivacy(string privacy)
        {
            try
            {
                SiteSettings setting = new SiteSettings();
                setting.LoadByPrimaryKey(6); // privacy
                setting.Content = Server.HtmlEncode(privacy);
                setting.Save();

            }
            catch (Exception ex)
            {
                return false;
            }

            return true;

        }

        [WebMethod]
        public bool SaveTerms(string terms)
        {
            try
            {
                SiteSettings setting = new SiteSettings();
                setting.LoadByPrimaryKey(5); // terms
                setting.Content = Server.HtmlEncode(terms);
                setting.Save();

            }
            catch (Exception ex)
            {
                return false;
            }

            return true;

        }

        [WebMethod]
        public bool SaveFaq(string Faq)
        {
            try
            {
                SiteSettings setting = new SiteSettings();
                setting.LoadByPrimaryKey(7); // faq
                setting.Content = Server.HtmlEncode(Faq);
                setting.Save();

            }
            catch (Exception ex)
            {
                return false;
            }

            return true;

        }
        #endregion

        #region resetPass

        [WebMethod]
        public List<dynamic> SearchAccountsByMail(string email)
        {

            List<dynamic> people = new List<dynamic>();
            Member members = new Member();
            members.Proc_SearchMembersByMail(email);

            for (int i = 0; i < members.RowCount; i++)
            {
                people.Add(new { MemberID = members.MemberID, MemberName = members.GetColumn("UserName").ToString(), ProfileImg = members.ProfilePic, IsPassReseted = false });
                members.MoveNext();
            }
            if (people.Count > 0)
            {
                return people;
            }
            else
                return null;


        }

        [WebMethod]
        public bool ResetPass(string Email)
        {

            Member members = new Member();
            members.Proc_SearchMembersByMail(Email);

            if (members.RowCount == 0)
                return false;

            string accounts = "";
            for (int i = 0; i < members.RowCount; i++)
            {
                accounts += string.Format("<li><a href='http://chat2connect.com/resetpass.aspx?rc={0}'>{1}</a></li>", Helper.General.EncryptString("mid=" + members.MemberID.ToString() + "&email=" + members.Email), members.GetColumn("UserName"));
                members.MoveNext();
            }


            try
            {
                MailMessage msg = new MailMessage();
                string mail = HttpContext.GetGlobalResourceObject("Global", "Mail").ToString();
                string mailto = Email;
                msg.To.Add(mailto);
                msg.From = new MailAddress(mail);
                msg.Subject = HttpContext.GetGlobalResourceObject("Global", "ResetSubject").ToString();
                msg.IsBodyHtml = true;
                msg.BodyEncoding = System.Text.Encoding.Unicode;

                msg.Body = string.Format(HttpContext.GetGlobalResourceObject("Global", "ResetPassBody").ToString(), accounts);

                SmtpClient client = new SmtpClient(HttpContext.GetGlobalResourceObject("Global", "server").ToString(), 25);

                client.UseDefaultCredentials = false;

                client.Credentials = new System.Net.NetworkCredential(mail, HttpContext.GetGlobalResourceObject("Global", "Password").ToString());
                client.Send(msg);

            }
            catch (Exception ex)
            {
                return false;
            }
            return true;

        }

        #endregion

        #region Bots

        [System.Web.Services.WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void LoadBots()
        {
            BLL.Bot bot = new Bot();
            var lst = bot.GetAll();

            string result = Newtonsoft.Json.JsonConvert.SerializeObject(lst);
            HttpContext.Current.Response.ContentType = "application/json; charset=utf-8";
            HttpContext.Current.Response.Write(result);
        }

        [System.Web.Services.WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void LoadRoomBots(int roomId)
        {
            BLL.RoomBot rmBots = new BLL.RoomBot();
            List<Info.RoomBot> lst = rmBots.GetByRoomID(roomId);

            string result = Newtonsoft.Json.JsonConvert.SerializeObject(lst);
            HttpContext.Current.Response.ContentType = "application/json; charset=utf-8";
            HttpContext.Current.Response.Write(result);
        }

        [System.Web.Services.WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void SaveRoomBots(string roomBots)
        {
            BLL.RoomBot rmBots = new BLL.RoomBot();
            string result = "";
            try
            {
                List<Info.RoomBot> lst = Helper.JsonConverter.Deserialize<List<Info.RoomBot>>(roomBots);
                rmBots.Save(lst);
                var resultObj = new { status = true, error = "", bots = lst };
                result = Newtonsoft.Json.JsonConvert.SerializeObject(resultObj);
            }
            catch (Exception ex)
            {
                var resultObj = new { status = false, error = ex.Message };
                result = Newtonsoft.Json.JsonConvert.SerializeObject(resultObj);
            }
            HttpContext.Current.Response.ContentType = "application/json; charset=utf-8";
            HttpContext.Current.Response.Write(result);
        }

        [System.Web.Services.WebMethod]
        public void ShowRoomLaw(int roomId)
        {
            BLL.RoomBot rmBots = new BLL.RoomBot();
            List<Info.RoomBot> lst = rmBots.GetByRoomIDandBotID(roomId, Helper.Enums.Bot.RoomLaw);
            if (lst.Count == 0)
                return;

            SubmitLaw(lst.FirstOrDefault());
        }

        public static void SubmitLaw(Info.RoomBot infoBot)
        {
            Info.RoomLaw infoSetting = infoBot.Settings as Info.RoomLaw;
            string msg = "<h4 class='listInRoom'>قانون الغرفة</h4><ul class='listInRoom'>";
            int i = 1;
            foreach (var p in infoSetting.Laws)
            {
                if (p.IsActive)
                {
                    msg += string.Format("<li>{0} - {1}</li>", i, p.Law);
                    i++;
                }
            }
            msg += "</ul>";
            IHubContext _Rcontext = GlobalHost.ConnectionManager.GetHubContext<ChatRoomHub>();
            _Rcontext.Clients.Group(infoBot.RoomID.ToString()).getBotMsg(infoBot.RoomID, msg, infoBot.Bot.IconPath);
        }

        [System.Web.Services.WebMethod]
        public void ShowRoomProgram(int roomId)
        {
            BLL.RoomBot rmBots = new BLL.RoomBot();
            List<Info.RoomBot> lst = rmBots.GetByRoomIDandBotID(roomId, Helper.Enums.Bot.RoomProgram);
            if (lst.Count == 0)
                return;

            SubmitProgram(lst.FirstOrDefault());
        }
        public static void SubmitProgram(Info.RoomBot infoBot)
        {
            Info.RoomProgram infoSetting = infoBot.Settings as Info.RoomProgram;
            string msg = "<h4 class='listInRoom'>برنامج الغرفة</h4><ul class='listInRoom'>";
            int i = 1;
            foreach (var p in infoSetting.Programms)
            {
                if (p.IsActive)
                {
                    msg += string.Format("<li>{0} - {1}</li>", i, p.Program);
                    i++;
                }
            }
            msg += "</ul>";
            IHubContext _Rcontext = GlobalHost.ConnectionManager.GetHubContext<ChatRoomHub>();
            _Rcontext.Clients.Group(infoBot.RoomID.ToString()).getBotMsg(infoBot.RoomID, msg, infoBot.Bot.IconPath);
        }
        #endregion
    }
}
