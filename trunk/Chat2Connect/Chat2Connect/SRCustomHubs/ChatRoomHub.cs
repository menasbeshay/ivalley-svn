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
            Member m = new Member();
            m.GetMemberByUserId(new Guid(Membership.GetUser().ProviderUserKey.ToString()));
            ConnectedUsers.Add(new Helper.SignalRUser { ConnectionId = Context.ConnectionId, MemberName = m.Name, MemberID=m.MemberID,Rooms=new List<int>() });

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
                RoomMember member = new RoomMember();
                member.AddNew();
                member.MemberID = item.MemberID;
                member.RoomID = roomid;
                member.Save();

                item.Rooms.Add(roomid);

                Clients.Group(roomid.ToString()).addNewMember(item.MemberID, item.MemberName, roomid);
            }
            catch (Exception ex)
            {

            }
        }
        public void removeFromRoom(int roomid)
        {
            Groups.Remove(Context.ConnectionId, roomid.ToString());
            // just remove member from signalr hub 
            //try
            //{
            //    int memberID = CurrentMemberID();
            //    RoomMember member = new RoomMember();
            //    member.LoadByPrimaryKey(memberID, roomid);
            //    member.MarkAsDeleted();
            //    member.Save();

            //    Clients.Group(roomid.ToString()).removeMember(memberID);
            //}
            //catch (Exception ex)
            //{
            //}
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
            //Clients.Group(rid.ToString(), Context.ConnectionId).ListenMic("startMic" + rid.ToString(), memberid, rid);
            Clients.Group(rid.ToString(), Context.ConnectionId).ListenMic(rid.ToString(), memberid, rid);
        }

        public void userStopMic(int rid, int memberid)
        {
            //Clients.Group(rid.ToString(), Context.ConnectionId).StopListenMic("stopMic" + rid.ToString(), memberid, rid);
            Clients.Group(rid.ToString(), Context.ConnectionId).StopListenMic(rid.ToString(), memberid, rid);
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
            room.Save();
        }

        public void userRaisHand(int rid, int memberid)
        {
            Clients.Group(rid.ToString(), Context.ConnectionId).UserRaisHand(rid, memberid);
        }

        public void userDownHand(int rid, int memberid)
        {
            Clients.Group(rid.ToString(), Context.ConnectionId).UserDownHand(rid, memberid);
        }

    }
}