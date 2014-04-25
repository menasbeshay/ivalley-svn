using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Security;
using System.Web.Services;
using BLL;
using Chat2Connect.SRCustomHubs;
using Microsoft.AspNet.SignalR;

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
        public bool SendMsg(int sender, string ToMember, string subject, string content)
        {
            string[] ToMembers = ToMember.Split(',');
            Guid operationID = Guid.NewGuid();
            MemberMessage message = new MemberMessage();
            foreach (string item in ToMembers)
            {
                if (!string.IsNullOrEmpty(item))
                {
                    int recipientID = Convert.ToInt32(item);
                    if (recipientID > 0)
                    {
                        SendMsg(sender, subject, content, message, recipientID,operationID);
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
                                SendMsg(sender, subject, content, message, aliasMembers.MemberID, operationID);
                            } while (aliasMembers.MoveNext());
                        }
                    }
                }
            }

            message.Save();
            return true;
        }

        private static void SendMsg(int sender, string subject, string content, MemberMessage message, int recipientID,Guid operationID)
        {
            message.AddNew();
            message.SendDate = DateTime.Now;
            message.SenderID = sender;
            message.MemberID = recipientID;
            message.MessageSubject = subject;
            message.MessageContent = content;
            message.IsRead = false;
            message.OperationID = operationID;
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

    }
}
