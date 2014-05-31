using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using BLL;
using Microsoft.AspNet.SignalR;
using System.Threading.Tasks;

namespace Chat2Connect.SRCustomHubs
{
    public class ChatRoomHub : Hub
    {
        public void Hello()
        {
            Clients.All.hello();
        }

        static List<Helper.SignalRUser> ConnectedUsers = new List<Helper.SignalRUser>();

        public override Task OnConnected()
        {
            Member m = BLL.Member.CurrentMember;
            ConnectedUsers.Add(new Helper.SignalRUser { ConnectionId = Context.ConnectionId, MemberName = m.UserName, MemberID = m.MemberID,ProfilePic=m.ProfilePic,MemberTypeSpecID=m.MemberType.MemberTypeSpecDuration.MemberTypeSpecID, Rooms = new List<int>() });

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
            return base.OnDisconnected();
        }
        public void addToRoom(int roomid)
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
                roomMember.InRoom = true;
                Room room = new Room();
                room.LoadByPrimaryKey(roomid);
                if (room.CreatedBy == roomMember.MemberID)
                    roomMember.RoomMemberLevelID = (int)Helper.Enums.RoomMemberLevel.Owner;
                roomMember.Save();

                Helper.ChatMember member=roomMember.LoadWithSettings(roomid,roomMember.MemberID).FirstOrDefault();
                item.Rooms.Add(roomid);
                Clients.Group(roomid.ToString()).addNewMember(roomid.ToString(), member);

                BLL.MemberLog log = new BLL.MemberLog();
                log.AddNew(BLL.Member.CurrentMemberID, new BLL.Log.EnterRoom() { RoomID = roomid, RoomName = room.Name }, null, roomid);
            }
            catch (Exception ex)
            {

            }
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
                RoomMember member = new RoomMember();
                member.LoadByPrimaryKey(memberID, roomid);
                member.InRoom = false;
                member.SetColumnNull(RoomMember.ColumnNames.QueueOrder);
                member.Save();

            }
            catch (Exception ex)
            {
            }
        }

        public void banMemberFromRoom(int memberid, int roomid,int banType,string adminName)
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

                    Clients.Group(roomID.ToString()).updateRoomTopic(roomID,topic);
                }
            }
            catch { }
        }

        public void closeRoom(int roomID, string adminName)
        {
            try
            {
                Room r = new Room();
                if (r.LoadByPrimaryKey(roomID))
                {
                    r.RowStatusID = (byte)Helper.Enums.RowStatus.TemporaryDisabled;
                    r.Save();
                    RoomMember roomMember = new RoomMember();
                    roomMember.OutRoomMembers(roomID);
                    Clients.Group(roomID.ToString()).closeRoom(roomID, adminName);
                }
            }
            catch { }
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
        public void sendToRoom(int roomid, string sender, string msg)
        {
            Clients.Group(roomid.ToString()).getMessage(roomid, sender, msg);
        }
        public void sendPrivateMessage(int toUserId, string message)
        {
            var toUser = ConnectedUsers.FirstOrDefault(x => x.MemberID == toUserId);
            var fromUser = ConnectedUsers.FirstOrDefault(x => x.ConnectionId == Context.ConnectionId);

            if (toUser != null && fromUser != null)
            {
                // send to 
                Clients.Client(toUser.ConnectionId).getPrivateMessage(fromUser.MemberID, fromUser.MemberName, message);

                // send to caller user
                Clients.Caller.getPrivateMessage(toUserId, fromUser.MemberName, message);
            }
            else
            {
                Clients.Caller.getPrivateMessage(toUserId, "System", "Message not delivered, user may went offline");
            }

        }

        public void sendVideoToRoom(int roomid, string sender, string url)
        {
            Clients.Group(roomid.ToString()).getVideoMessage(roomid, sender, url);
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
            RoomMember roomMember = new RoomMember();
            if (roomMember.LoadByPrimaryKey(memberid, rid))
            {
                roomMember.HasCam = false;
                roomMember.Save();
            }
            room.Save();
        }

        public void userRaisHand(int rid, int memberid,int queueOrder)
        {
            Clients.Group(rid.ToString(), Context.ConnectionId).UserRaisHand(rid, memberid,queueOrder);
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

        // logging 
        public void enterPrivateChatLog(int FriendID, string FriendName)
        {
            BLL.MemberLog log = new BLL.MemberLog();
            log.AddNew(BLL.Member.CurrentMemberID, new BLL.Log.EnterPrivateChate() { FriendID = FriendID, FriendName = FriendName}, FriendID, null);
        }

    }
}