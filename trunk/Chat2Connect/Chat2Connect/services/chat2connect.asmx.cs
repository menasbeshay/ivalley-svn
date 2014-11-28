using BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Data;
using Microsoft.AspNet.SignalR;
using Chat2Connect.SRCustomHubs;

namespace Chat2Connect.services
{
    /// <summary>
    /// Summary description for chat2connect
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class chat2connect : System.Web.Services.WebService
    {
        private const string defaultImg = "images/defaultavatar.png";
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetFriends(int mid)
        {
            Member member = new Member();
            member.GetFriends(mid);
            var friends = member.DefaultView.Table.AsEnumerable().Select(m =>
                new
                {
                    MemberID = m[Member.ColumnNames.MemberID],
                    Name = m[Member.ColumnNames.Name],
                    TypeSpecID = m["MemberTypeSpecID"],
                    ProfilePic = (m[Member.ColumnNames.ProfilePic] == DBNull.Value ? defaultImg : m[Member.ColumnNames.ProfilePic]),
                    IsOnline = m[Member.ColumnNames.IsOnLine],
                    StatusMsg = m[Member.ColumnNames.StatusMsg],
                    Status = Helper.EnumUtil.ParseEnum<Helper.Enums.MemberStatus>(Helper.TypeConverter.ToInt32(m[Member.ColumnNames.Status])).ToString().ToLower(),
                }
                ).ToList();

            SetContentResult(friends);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void SearchAddFriend(int mid, string q)
        {
            Member member = new Member();
            member.SearchForAddFriend(mid, q);
            var friends = member.DefaultView.Table.AsEnumerable().Select(m =>
                new
                {
                    MemberID = m[Member.ColumnNames.MemberID],
                    Name = m[Member.ColumnNames.Name],
                    TypeSpecID = m["MemberTypeSpecID"],
                    ProfilePic = (m[Member.ColumnNames.ProfilePic] == DBNull.Value ? defaultImg : m[Member.ColumnNames.ProfilePic]),
                    IsOnline = m[Member.ColumnNames.IsOnLine],
                    StatusMsg = m[Member.ColumnNames.StatusMsg],
                    Status = Helper.EnumUtil.ParseEnum<Helper.Enums.MemberStatus>(Helper.TypeConverter.ToInt32(m[Member.ColumnNames.Status])).ToString().ToLower(),
                }
                ).ToList();

            SetContentResult(friends);
        }

        private void SetContentResult(dynamic data)
        {
            string result = Newtonsoft.Json.JsonConvert.SerializeObject(data);
            HttpContext.Current.Response.ContentType = "application/json; charset=utf-8";
            HttpContext.Current.Response.Write(result);
        }

        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetHelpMembers()
        {
            Member member = new Member();
            member.GetHelpMembers();
            var friends = member.DefaultView.Table.AsEnumerable().Select(m =>
                new
                {
                    MemberID = m[Member.ColumnNames.MemberID],
                    Name = m[Member.ColumnNames.Name],
                    TypeSpecID = member.GetColumn("MemberTypeSpecID"),
                    ProfilePic = (m[Member.ColumnNames.ProfilePic] == DBNull.Value ? defaultImg : m[Member.ColumnNames.ProfilePic]),
                    IsOnline = m[Member.ColumnNames.IsOnLine],
                    StatusMsg = m[Member.ColumnNames.StatusMsg],
                    Status = Helper.EnumUtil.ParseEnum<Helper.Enums.MemberStatus>(Helper.TypeConverter.ToInt32(m[Member.ColumnNames.Status])).ToString().ToLower()
                }
                ).ToList();

            SetContentResult(friends);
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetBlockedMembers()
        {
            Member member = new Member();
            member.GetBlocked(BLL.Member.CurrentMemberID);
            var friends = member.DefaultView.Table.AsEnumerable().Select(m =>
                new
                {
                    MemberID = m[Member.ColumnNames.MemberID],
                    Name = m[Member.ColumnNames.Name],
                    TypeSpecID = m["MemberTypeSpecID"],
                    ProfilePic = (m[Member.ColumnNames.ProfilePic] == DBNull.Value ? defaultImg : m[Member.ColumnNames.ProfilePic]),
                    IsOnline = m[Member.ColumnNames.IsOnLine],
                    StatusMsg = m[Member.ColumnNames.StatusMsg],
                    Status = Helper.EnumUtil.ParseEnum<Helper.Enums.MemberStatus>(Helper.TypeConverter.ToInt32(m[Member.ColumnNames.Status])).ToString().ToLower(),
                }
                ).ToList();

            SetContentResult(friends);
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetBlockingMeMembers()
        {
            Member member = new Member();
            member.GetMembersBlockingMember(BLL.Member.CurrentMemberID);
            var lst = member.DefaultView.Table.AsEnumerable().Select(m =>
                new
                {
                    MemberID = m[Member.ColumnNames.MemberID],
                }
                ).ToList();

            SetContentResult(lst);
        }

        [WebMethod(EnableSession = true)]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void toggleBlockMember(int mid, bool block)
        {
            try
            {
                BlockedMembers blockedMembers = new BlockedMembers();
                blockedMembers.Where.BlockID.Value = mid;
                blockedMembers.Where.MemberID.Value = BLL.Member.CurrentMemberID;
                if (blockedMembers.Query.Load())
                {
                    if (!block)
                    {
                        blockedMembers.DeleteAll();
                        blockedMembers.Save();
                    }
                }
                else
                {
                    if (block)
                    {
                        blockedMembers.AddNew();
                        blockedMembers.MemberID = BLL.Member.CurrentMemberID;
                        blockedMembers.BlockID = mid;
                        blockedMembers.CreateDate = DateTime.Now;
                        blockedMembers.Save();

                        BLL.Member bllMember = new BLL.Member();
                        bllMember.LoadByPrimaryKeyWithTypeSpec(mid);
                        var member = bllMember.DefaultView.Table.AsEnumerable().Select(m =>
                        new
                        {
                            MemberID = m[Member.ColumnNames.MemberID],
                            Name = m[Member.ColumnNames.Name],
                            TypeSpecID = m["MemberTypeSpecID"],
                            ProfilePic = (m[Member.ColumnNames.ProfilePic] == DBNull.Value ? defaultImg : m[Member.ColumnNames.ProfilePic]),
                            IsOnline = m[Member.ColumnNames.IsOnLine],
                            StatusMsg = m[Member.ColumnNames.StatusMsg],
                            Status = Helper.EnumUtil.ParseEnum<Helper.Enums.MemberStatus>(Helper.TypeConverter.ToInt32(m[Member.ColumnNames.Status])).ToString().ToLower(),
                        }
                        ).FirstOrDefault();
                        SetContentResult(member);
                    }
                }

                IHubContext _Rcontext = GlobalHost.ConnectionManager.GetHubContext<ChatRoomHub>();
                var blocked = ChatRoomHub.ConnectedUsers.FirstOrDefault(u => u.MemberID == mid);
                if (blocked != null)
                {
                    _Rcontext.Clients.Client(blocked.ConnectionId).toggleBlockedFromMember(new { MemberID = BLL.Member.CurrentMemberID }, block);
                }
            }
            catch { }
        }
        [WebMethod]
        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        public void GetRooms(string localParams)
        {
            string[] myparams = null;
            if (!string.IsNullOrEmpty(localParams))
            {
                myparams = localParams.Split('&');
            }
            Room rooms = new Room();
            if (myparams.Length > 0)
            {
                if (myparams[0] == "cat=1")
                {
                    int cid = Convert.ToInt32(myparams[1].Substring(2));
                    rooms.GetRoomsByCategoryID(cid);
                }
                else if (myparams[0] == "subcat=1")
                {
                    int scid = Convert.ToInt32(myparams[1].Substring(2));
                    rooms.GetRoomsBySubCategoryID(scid);
                }
                else if (myparams[0] == "vip=1")
                {
                    rooms.GetPremiumRooms();
                }
                else if (myparams[0] == "cb=1")
                {
                    rooms.GetRoomsByCreatorID(BLL.Member.CurrentMember.MemberID);
                }
                else if (myparams[0] == "fav=1")
                {
                    rooms.GetFavoriteByMemberID(BLL.Member.CurrentMember.MemberID);
                }
                else if (myparams[0] == "s=1") // search rooms
                {
                    string filterText = myparams[1].Substring(3); // st=
                    rooms.SearchRooms(filterText);
                }

            }
            var lst = rooms.DefaultView.Table.AsEnumerable().Select(m =>
                new
                {
                    ID = m[Room.ColumnNames.RoomID],
                    Name = m[Room.ColumnNames.Name],
                    TypeSpecID = m["RoomTypeSpecID"],
                    Rate = m["RoomRate"],
                    ExistingMembers = m["ExistingMembersCount"],
                    OpenCams = m["OpenCams"]
                }
                ).ToList();

            SetContentResult(lst);
        }

        [WebMethod(EnableSession = true)]
        public void GetChatRoom(int id, bool isTemp)
        {
            string error;
            Room room;
            if (!IsValideRoom(id, isTemp, out room, out error))
            {
                var errorResult = new { Status = 0, Data = error };
                SetContentResult(errorResult);
                return;
            }

            Helper.ChatRoom roomObject = GetRoomInfo(id, isTemp, room);
            Helper.Sessions.OpenedRooms.Add(new Helper.Sessions.RoomSession() { ID = id, IsTemp = isTemp });

            var successResult = new { Status = 1, Data = roomObject };
            SetContentResult(successResult);
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

            if (!isTemp)
            {
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
                        case (int)Helper.Enums.TypeSpec.Free:
                            isValidMemberType = infoBot.AcceptedMemberTypes.Contains(Convert.ToString((int)Helper.Enums.MemberType.Free));
                            break;
                        case (int)Helper.Enums.TypeSpec.Pink1:
                        case (int)Helper.Enums.TypeSpec.Pink2:
                            isValidMemberType = infoBot.AcceptedMemberTypes.Contains(Convert.ToString((int)Helper.Enums.MemberType.Upgraded));
                            break;
                        case (int)Helper.Enums.TypeSpec.VIP:
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

            List<int> connectedIDs = ChatRoomHub.ConnectedUsers.Select(m => m.MemberID).ToList();
            roomObject.Members = roomMember.LoadWithSettings(id,roomObject.CurrentMemberID, null, connectedIDs);
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
            if (!room.IsColumnNull("CategoryID"))
            {
                cat.LoadByPrimaryKey(room.CategoryID);
                roomObject.CategoryName = cat.Name;
            }

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

    }
}
