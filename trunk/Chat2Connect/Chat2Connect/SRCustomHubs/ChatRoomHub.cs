using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using BLL;
using Microsoft.AspNet.SignalR;
using System.Threading.Tasks;
using System.Collections;

namespace Chat2Connect.SRCustomHubs
{
    public class ChatRoomHub : Hub
    {
        public void Hello()
        {
            Clients.All.hello();
        }

        public static List<Helper.SignalRUser> ConnectedUsers = new List<Helper.SignalRUser>();

        public override Task OnConnected()
        {
            Member m = BLL.Member.CurrentMember;
            ConnectedUsers.Add(new Helper.SignalRUser { ConnectionId = Context.ConnectionId, MemberName = m.UserName, MemberID = m.MemberID, ProfilePic = m.ProfilePic, MemberTypeSpecID = m.MemberType.MemberTypeSpecDuration.MemberTypeSpecID, Rooms = new List<int>() });

            // add user to new group by his user name 
            Groups.Add(Context.ConnectionId, Context.User.Identity.Name);
            return base.OnConnected();
        }
        public override System.Threading.Tasks.Task OnDisconnected()
        {
            var item = ConnectedUsers.FirstOrDefault(x => x.ConnectionId == Context.ConnectionId);
            if (item != null)
            {
                for (int i = 0; i < item.Rooms.Count; i++)
                {
                    removeFromRoom(item.Rooms.ElementAt(i));
                }
                ConnectedUsers.Remove(item);
            }
            // remove user to new group by his user name 
            Groups.Remove(Context.ConnectionId, Context.User.Identity.Name);
            return base.OnDisconnected();
        }
        public void addToRoom(int roomid, bool isVisible)
        {
            Groups.Add(Context.ConnectionId, roomid.ToString());
            try
            {
                var item = ConnectedUsers.FirstOrDefault(x => x.ConnectionId == Context.ConnectionId);
                if (item == null)
                    return;
                RoomMember roomMember = new RoomMember();
                if (!roomMember.LoadByPrimaryKey(item.MemberID, roomid))
                {
                    roomMember.AddNew();
                    roomMember.MemberID = item.MemberID;
                    roomMember.RoomID = roomid;
                }
                roomMember.InRoom = isVisible;
                Room room = new Room();
                room.LoadByPrimaryKey(roomid);
                if (!room.IsColumnNull("CreatedBy"))
                {
                    if (room.CreatedBy == roomMember.MemberID)
                        roomMember.RoomMemberLevelID = (int)Helper.Enums.RoomMemberLevel.Owner;
                    roomMember.Save();
                }

                Helper.ChatMember member = roomMember.LoadWithSettings(roomid, roomMember.MemberID).FirstOrDefault();
                item.Rooms.Add(roomid);
                if (isVisible)
                    Clients.Group(roomid.ToString()).addNewMember(roomid.ToString(), member);
                if (roomMember.RoomMemberLevelID > (int)Helper.Enums.RoomMemberLevel.Visitor)
                    Groups.Add(Context.ConnectionId, GetRoomAdminGroupName(roomid));

                BLL.MemberLog log = new BLL.MemberLog();
                Helper.Enums.LogType lgType = Helper.Enums.LogType.EnterRoom;
                if (!isVisible)
                    lgType = Helper.Enums.LogType.EnterRoomHidden;
                log.AddNew(BLL.Member.CurrentMemberID, new BLL.Log.EnterRoom() {Type=lgType, RoomID = roomid, RoomName = room.Name }, null, roomid);

            }
            catch (Exception ex)
            {

            }
        }

        private static string GetRoomAdminGroupName(int roomID)
        {
            return String.Format("Admins_{0}", roomID);
        }
        public void removeFromRoom(int roomid)
        {
            var item = ConnectedUsers.FirstOrDefault(x => x.ConnectionId == Context.ConnectionId);
            if (item == null)
                return;
            item.Rooms.Remove(roomid);
            Clients.Group(roomid.ToString()).removeMember(item.MemberID, roomid);
            Groups.Remove(Context.ConnectionId, roomid.ToString());
            // just remove member from signalr hub and update flag InRoom to false
            try
            {
                int memberID = CurrentMemberID();
                RoomMember roomMember = new RoomMember();
                roomMember.LoadByPrimaryKey(memberID, roomid);
                roomMember.InRoom = false;
                roomMember.HasCam = false;
                roomMember.SetColumnNull(RoomMember.ColumnNames.QueueOrder);
                roomMember.Save();

                if (roomMember.RoomMemberLevelID > (int)Helper.Enums.RoomMemberLevel.Visitor)
                    Groups.Remove(Context.ConnectionId, GetRoomAdminGroupName(roomid));

            }
            catch (Exception ex)
            {
            }
        }

        public void banMemberFromRoom(int memberid, int roomid, int banType, string adminName)
        {
            try
            {
                int memberID = CurrentMemberID();
                RoomMember member = new RoomMember();
                member.LoadByPrimaryKey(memberID, roomid);
                member.InRoom = false;
                member.Save();

            }
            catch (Exception ex)
            {
            }
            var item = ConnectedUsers.FirstOrDefault(x => x.MemberID == memberid);
            if (item == null)
                return;
            item.Rooms.Remove(roomid);
            string banTypeName = Helper.StringEnum.GetStringValue(Helper.EnumUtil.ParseEnum<Helper.Enums.BanningType>(banType));
            Clients.Group(roomid.ToString()).banMemberFromRoom(memberid, roomid, banTypeName, adminName);
        }
        public void removeBanningFromRoomMembers(int roomid, int[] members)
        {
            try
            {
                RoomMemberBanning rm = new RoomMemberBanning();
                rm.Delete(roomid, members);
            }
            catch (Exception ex)
            {
            }
        }

        private int CurrentMemberID()
        {
            int memberID = 0;
            var item = ConnectedUsers.FirstOrDefault(x => x.ConnectionId == Context.ConnectionId);
            if (item != null)
            {
                memberID = item.MemberID;
            }
            else
            {
                Member m = new Member();
                m.GetMemberByUserId(new Guid(Membership.GetUser(Context.User.Identity.Name).ProviderUserKey.ToString()));
                memberID = m.MemberID;
            }
            return memberID;
        }

        public void updateRoomTopic(int roomID, string topic)
        {
            try
            {
                Room r = new Room();
                if (r.LoadByPrimaryKey(roomID))
                {
                    r.RoomTopic = topic;
                    r.Save();

                    Clients.Group(roomID.ToString()).updateRoomTopic(roomID, topic);
                }
            }
            catch { }
        }

        public void closeRoom(int roomID, int adminID, string adminName)
        {
            RoomMember roomMember = new RoomMember();
            if (!roomMember.HasExisitingMembersExceedCurrentMemberLevel(roomID, adminID))
            {
                Room r = new Room();
                if (r.LoadByPrimaryKey(roomID))
                {
                    r.RowStatusID = (byte)Helper.Enums.RowStatus.TemporaryDisabled;
                    r.Save();
                    roomMember.OutRoomMembers(roomID);
                    Clients.Group(roomID.ToString()).closeRoom(roomID, adminName);
                }
            }
            else
            {
                throw new UnauthorizedAccessException("لا يمكن غلق الغرفة فى وجود " + Helper.TypeConverter.ToString(roomMember.GetColumn("MemberName")));
            }
        }

        public void updateSocialLinks(int roomID, string fbURL, string tURL, string utURL)
        {
            try
            {
                Room r = new Room();
                if (r.LoadByPrimaryKey(roomID))
                {
                    r.FbURL = fbURL;
                    r.TURL = tURL;
                    r.UtURL = utURL;
                    r.Save();

                    Clients.Group(roomID.ToString()).updateSocialLinks(roomID, fbURL, tURL, utURL);
                }
            }
            catch { }
        }
        public void sendToRoom(int roomid, int senderid, string sender, string msg, int MemberLevelID, string profileImg, int MemberTypeID)
        {
            msg = msg.Replace("<br>", "");
            /*RoomMessages messages = new RoomMessages();
            messages.AddNew();
            messages.RoomID = roomid;
            messages.Message = msg;
            messages.MemberID = senderid;
            messages.MessageDate = DateTime.Now;
            messages.MemberLevel = MemberLevelID;
            messages.Save();

            var resultMsg = new Helper.ChatMessage()
            {
                ID = messages.ID,
                FromID = messages.MemberID,
                ToID = messages.RoomID,
                FromName = sender,
                Message = messages.Message,
                MessageDate = messages.MessageDate,
                MemberLevel = MemberLevelID
            };*/


            var resultMsg = new Helper.ChatMessage()
            {
                FromID = senderid,
                ToID = roomid,
                FromName = sender,
                Message = msg,
                MessageDate = DateTime.Now,
                MemberLevel = MemberLevelID,
                FromProfileImg = profileImg,
                MemberTypeID = MemberTypeID
            };

            Clients.Group(roomid.ToString()).getMessage(roomid, resultMsg);
        }
        public void showMemberInRoom(int roomid, int memberid)
        {
            RoomMember rm = new RoomMember();
            if (rm.LoadByPrimaryKey(memberid, roomid))
            {
                rm.InRoom = true;
                rm.Save();
            }
            Clients.Group(roomid.ToString()).showMemberInRoom(roomid, memberid);
        }
        public void sendToRoomAdmins(int roomid, int senderid, string sender, string msg, string profileImg, int MemberLevelID)
        {
            msg = msg.Replace("<br>", "");
            var resultMsg = new Helper.ChatMessage()
            {
                FromID = senderid,
                ToID = roomid,
                FromName = sender,
                Message = msg,
                MessageDate = DateTime.Now,
                FromProfileImg = profileImg,
                MemberLevel = MemberLevelID
            };
            Clients.Group(GetRoomAdminGroupName(roomid)).getAdminMessage(roomid, resultMsg);
        }
        public void sendPrivateMessage(int toUserId, string message, string profileImg)
        {
            message = message.Replace("<br>", "");
            var toUser = ConnectedUsers.FirstOrDefault(x => x.MemberID == toUserId);
            var fromUser = ConnectedUsers.FirstOrDefault(x => x.ConnectionId == Context.ConnectionId);

            if (toUser != null && fromUser != null)
            {
                var resultMsg = new Helper.ChatMessage()
                {
                    FromID = fromUser.MemberID,
                    ToID = toUser.MemberID,
                    FromName = fromUser.MemberName,
                    Message = message,
                    MessageDate = DateTime.Now,
                    FromProfileImg = profileImg
                };
                // send to 
                Clients.Client(toUser.ConnectionId).getPrivateMessage(fromUser.MemberID, resultMsg);

                // send to caller user
                Clients.Caller.getPrivateMessage(toUserId, resultMsg);
            }
            else
            {
                Member friend = new Member();
                friend.LoadByPrimaryKey(toUserId);
                var resultMsg = new Helper.ChatMessage()
                {
                    FromName = "",
                    Message = "  المستخدم الذى تحاول التحدث معه الان غير موجود اونلاين" + "&nbsp;<a href='Messages.aspx?t=createmsg&u=" + friend.MemberID.ToString() + "&un=" + friend.UserName + "' class='SendMsg' target='_blank'>يمكنك ان ترسل له رساله الان</a>",
                    MessageDate = DateTime.Now,
                    FromProfileImg = profileImg
                };
                Clients.Caller.getPrivateMessage(toUserId, resultMsg);
            }

        }

        public void userStartMic(int rid, int memberid)
        {
            Clients.Group(rid.ToString(), Context.ConnectionId).ListenMic(memberid, rid);
            RoomMember roomMember = new RoomMember();
            if (roomMember.LoadByPrimaryKey(memberid, rid))
            {
                roomMember.HasMic = true;
                roomMember.Save();
            }
        }

        public void userStopMic(int rid, int memberid)
        {
            Clients.Group(rid.ToString(), Context.ConnectionId).StopListenMic(memberid, rid);
            RoomMember roomMember = new RoomMember();
            if (roomMember.LoadByPrimaryKey(memberid, rid))
            {
                roomMember.HasMic = false;
                roomMember.Save();
            }
        }

        public void userStartCam(int rid, int memberid)
        {
            Clients.Group(rid.ToString(), Context.ConnectionId).ShowCamLink(memberid, rid);
            Room room = new Room();
            room.LoadByPrimaryKey(rid);
            if (room.IsColumnNull("OpenCams"))
                room.OpenCams = 1;
            else
                room.OpenCams += 1;
            room.Save();
            RoomMember roomMember = new RoomMember();
            if (roomMember.LoadByPrimaryKey(memberid, rid))
            {
                roomMember.HasCam = true;
                roomMember.Save();
            }
        }

        public void userStopCam(int rid, int memberid)
        {
            Clients.Group(rid.ToString(), Context.ConnectionId).HideCamLink(memberid, rid);
            Room room = new Room();
            room.LoadByPrimaryKey(rid);
            if (room.IsColumnNull("OpenCams"))
                room.OpenCams = 0;
            else
                room.OpenCams -= 1;
            if (room.OpenCams < 0)
                room.OpenCams = 0;
            RoomMember roomMember = new RoomMember();
            if (roomMember.LoadByPrimaryKey(memberid, rid))
            {
                roomMember.HasCam = false;
                roomMember.Save();
            }
            room.Save();
        }

        /* private chat cam/mic handlers */
        public void userStartMic_Private(int rid, int memberid)
        {
            var toUser = ConnectedUsers.FirstOrDefault(x => x.MemberID == rid);
            var fromUser = ConnectedUsers.FirstOrDefault(x => x.ConnectionId == Context.ConnectionId);

            // send to 
            Clients.Client(toUser.ConnectionId).ListenMic_Private(memberid);
        }

        public void userStopMic_Private(int rid, int memberid)
        {
            var toUser = ConnectedUsers.FirstOrDefault(x => x.MemberID == rid);
            var fromUser = ConnectedUsers.FirstOrDefault(x => x.ConnectionId == Context.ConnectionId);

            // send to 
            Clients.Client(toUser.ConnectionId).StopListenMic_Private(memberid);
        }

        public void userStartCam_Private(int rid, int memberid)
        {
            var toUser = ConnectedUsers.FirstOrDefault(x => x.MemberID == rid);
            var fromUser = ConnectedUsers.FirstOrDefault(x => x.ConnectionId == Context.ConnectionId);

            // send to 
            Clients.Client(toUser.ConnectionId).StartCam_Private(memberid);
        }

        public void userStopCam_Private(int rid, int memberid)
        {
            var toUser = ConnectedUsers.FirstOrDefault(x => x.MemberID == rid);
            var fromUser = ConnectedUsers.FirstOrDefault(x => x.ConnectionId == Context.ConnectionId);

            // send to 
            Clients.Client(toUser.ConnectionId).StopCam_Private(memberid);
        }

        public void userRaisHand(int rid, int memberid, int queueOrder)
        {
            Clients.Group(rid.ToString(), Context.ConnectionId).UserRaisHand(rid, memberid, queueOrder);
        }

        public void userDownHand(int rid, int memberid)
        {
            Clients.Group(rid.ToString(), Context.ConnectionId).UserDownHand(rid, memberid);
        }

        public void updateRoomMemberSettings(int roomid, int memberid, bool canWrite, bool canAccessMic, bool canAccessCam, string banDays)
        {
            try
            {
                RoomMemberBanning banning = new RoomMemberBanning();
                if (!banning.LoadByPrimaryKey(roomid, memberid))
                {
                    banning.AddNew();
                    banning.RoomID = roomid;
                    banning.MemberID = memberid;
                }
                if (String.IsNullOrEmpty(banDays))
                {
                    banning.MarkAsDeleted();
                    try
                    {
                        if (banning.RowState() != System.Data.DataRowState.Added)
                        {
                            //deleted ban from member
                            BLL.Member member = new Member();
                            member.LoadByPrimaryKey(memberid);
                            BLL.MemberLog log = new BLL.MemberLog();
                            log.AddNew(BLL.Member.CurrentMemberID, new BLL.Log.UnBanRoomMember() { MemberName = member.Name }, member.MemberID, roomid);
                        }
                    }
                    catch { }
                }
                else
                {
                    int days = Convert.ToInt32(banDays);
                    if (days == 0)
                    {
                        banning.SetColumnNull(RoomMemberBanning.ColumnNames.EndDate);
                    }
                    else
                    {
                        banning.EndDate = DateTime.Now.AddDays(days);
                    }

                    try
                    {
                        BLL.Member member = new Member();
                        member.LoadByPrimaryKey(memberid);
                        BLL.MemberLog log = new BLL.MemberLog();
                        BLL.Log.BanRoomMember infoLog = new BLL.Log.BanRoomMember() { MemberName = member.Name };
                        if (days > 0)
                        {
                            infoLog.BanningDays = days;
                            infoLog.EndDate = banning.EndDate;
                        }
                        log.AddNew(BLL.Member.CurrentMemberID, infoLog, member.MemberID, roomid);
                    }
                    catch { }
                }
                banning.Save();
                //room member settings
                RoomMember rm = new RoomMember();
                if (!rm.LoadByPrimaryKey(memberid, roomid))
                {
                    rm.AddNew();
                    rm.RoomID = roomid;
                    rm.MemberID = memberid;
                }
                rm.CanAccessCam = canAccessCam;
                rm.CanAccessMic = canAccessMic;
                rm.CanWrite = canWrite;
                if (!String.IsNullOrEmpty(banDays))
                    rm.InRoom = false;
                rm.Save();
                //update clients
                Clients.Group(roomid.ToString()).updateRoomMemberSettings(roomid, memberid, canWrite, canAccessMic, canAccessCam, banDays);

            }
            catch { }

        }

        public void updateMemberLevel(int roomid, int memberid, int level)
        {
            try
            {
                RoomMember rm = new RoomMember();
                if (rm.LoadByPrimaryKey(memberid, roomid))
                {
                    rm.RoomMemberLevelID = level;
                    rm.Save();
                }
                //update clients
                Clients.Group(roomid.ToString(), Context.ConnectionId).updateMemberLevel(roomid, memberid, level);
            }
            catch { }
        }
        public void sendHamsa(int roomid, int memberid, string hamsa, string fromName)
        {
            var toUser = ConnectedUsers.FirstOrDefault(x => x.MemberID == memberid);
            if (toUser != null)
            {
                // send to 
                Clients.Client(toUser.ConnectionId).getHamsa(fromName, hamsa);
            }
        }
        // logging 
        public void enterPrivateChatLog(int FriendID, string FriendName)
        {
            BLL.MemberLog log = new BLL.MemberLog();
            log.AddNew(BLL.Member.CurrentMemberID, new BLL.Log.EnterPrivateChate() { FriendID = FriendID, FriendName = FriendName }, FriendID, null);
        }



        #region Room supervisor

        public void ClearQueue(int rid)
        {
            RoomMember rm = new RoomMember();
            rm.ClearQueue(rid);

            Clients.Group(rid.ToString()).clearQueue(rid);
        }
        public void UpdateRoomSetting(int rid, string setting, bool newValue)
        {
            Room room = new Room();
            if (room.LoadByPrimaryKey(rid))
            {
                room.SetColumn(setting, newValue);
                room.Save();
            }
            Clients.Group(rid.ToString()).updateRoomSetting(rid, setting, newValue);
        }

        public void MarkAllWithWrite(int rid, bool isMarked, int adminID)
        {
            Clients.Group(rid.ToString()).markAllWithWrite(rid, isMarked, adminID);
        }
        public void MarkAllWithoutWrite(int rid, bool isMarked, int adminID)
        {
            Clients.Group(rid.ToString()).markAllWithoutWrite(rid, isMarked, adminID);
        }

        /// <summary>
        /// Eskat or Cancel Eskat of room member
        /// </summary>
        /// <param name="rid"></param>
        /// <param name="isMarked"></param>
        /// <param name="memberid"></param>
        public void ToggleUserMark(int rid, bool isMarked, int memberid)
        {
            if (isMarked)
                Clients.Group(rid.ToString()).UserMarked(rid, memberid);
            else
                Clients.Group(rid.ToString()).UserUnMarked(rid, memberid);
            try
            {
                BLL.Member member = new Member();
                member.LoadByPrimaryKey(memberid);
                BLL.MemberLog log = new BLL.MemberLog();
                if (isMarked)
                {
                    log.AddNew(BLL.Member.CurrentMemberID, new BLL.Log.MarkRoomMember() { MemberID = memberid, MemberName = member.Name }, memberid, rid);
                }
                else
                {
                    log.AddNew(BLL.Member.CurrentMemberID, new BLL.Log.UnMarkRoomMember() { MemberID = memberid, MemberName = member.Name }, memberid, rid);
                }
                RoomMember rm = new RoomMember();
                if (rm.LoadByPrimaryKey(memberid, rid))
                {
                    rm.CanWrite = isMarked;
                    rm.IsMarked = isMarked;
                    rm.Save();
                }
            }
            catch { }
        }
        #endregion
    }
}