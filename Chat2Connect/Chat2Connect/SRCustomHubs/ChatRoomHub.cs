﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using BLL;
using Microsoft.AspNet.SignalR;

namespace Chat2Connect.SRCustomHubs
{
    public class ChatRoomHub : Hub
    {
        public void Hello()
        {
            Clients.All.hello();
        }

        public void addToRoom(int roomid)
        {
            Groups.Add(Context.ConnectionId, roomid.ToString());
            Member m = new Member();
            m.GetMemberByUserId(new Guid(Membership.GetUser(Context.User.Identity.Name).ProviderUserKey.ToString()));
            try
            {
                
                RoomMember member = new RoomMember();
                member.AddNew();
                member.MemberID = m.MemberID;
                member.RoomID = roomid;
                member.Save();
            }
            catch (Exception ex)
            {
                
            }
            Clients.Group(roomid.ToString()).addNewMember(m.MemberID, m.Name, roomid);
        }

        public void removeFromRoom(int roomid)
        {
            Groups.Remove(Context.ConnectionId, roomid.ToString());
            Member m = new Member();
            m.GetMemberByUserId(new Guid(Membership.GetUser(Context.User.Identity.Name).ProviderUserKey.ToString()));
            try
            {
                
                RoomMember member = new RoomMember();
                member.LoadByPrimaryKey(m.MemberID, roomid);
                member.MarkAsDeleted();
                member.Save();
            }
            catch (Exception ex)
            {
            }
            Clients.Group(roomid.ToString()).removeMember(m.MemberID);
        }


        public void sendToRoom(int roomid, string sender, string msg)
        {
            Clients.Group(roomid.ToString()).getMessage(roomid, sender, msg);
        }
    }
}