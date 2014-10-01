using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using BLL;
using Microsoft.AspNet.SignalR;
using Chat2Connect.SRCustomHubs;
namespace Chat2Connect
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            if (Membership.GetUser(Helper.Admin.Defaults.UserName) == null)
            {
                MembershipBLL memberShip = new MembershipBLL();
                MembershipCreateStatus objStatus;
                memberShip.RegisterMember(Helper.Admin.Defaults.UserName, Helper.Admin.Defaults.Password, Helper.Admin.Defaults.Email, Helper.Admin.Defaults.Question, Helper.Admin.Defaults.Answer, out objStatus);
            }

            timerTricks = 0;
            System.Timers.Timer scheduleTimer = new System.Timers.Timer();
            scheduleTimer.Interval = 1000 * 60 * 2; //5 minutes
            scheduleTimer.AutoReset = true;
            scheduleTimer.Elapsed += new System.Timers.ElapsedEventHandler(scheduleTimer_Elapsed);
            scheduleTimer.Enabled = true; 
        }

        public int timerTricks;
        public void scheduleTimer_Elapsed(object source, System.Timers.ElapsedEventArgs e)
        {
            timerTricks++;
            SubmitRoomLawBotSchedule();
            SubmitRoomProgramBotSchedule();
        }

        private void SubmitRoomLawBotSchedule()
        {
            BLL.RoomBot bllRoomBot = new RoomBot();
            List<Info.RoomBot> lstBots = bllRoomBot.GetByBotID(Helper.Enums.Bot.RoomLaw);
            Info.RoomLaw infoSetting;
            bool isSend;
            foreach (var infoBot in lstBots)
            {
                isSend = false;
                infoSetting = (Info.RoomLaw)infoBot.Settings;
                if (infoSetting.LawSchedule == Helper.Enums.RoomBotSchedule.FiveMinutes)
                {
                    isSend = true;
                }
                else if (infoSetting.LawSchedule == Helper.Enums.RoomBotSchedule.TenMinutes && timerTricks % 2 == 0)
                {
                    isSend = true;
                }
                else if (infoSetting.LawSchedule == Helper.Enums.RoomBotSchedule.FifteenMinutes && timerTricks % 3 == 0)
                {
                    isSend = true;
                }
                else if (infoSetting.LawSchedule == Helper.Enums.RoomBotSchedule.ThirtyMinutes && timerTricks % 6 == 0)
                {
                    isSend = true;
                }
                else if (infoSetting.LawSchedule == Helper.Enums.RoomBotSchedule.FifteenMinutes && timerTricks % 12 == 0)
                {
                    isSend = true;
                }
                if (isSend)
                {
                    Chat2Connect.services.Services.SubmitLaw(infoBot);
                }
            }
        }
        private void SubmitRoomProgramBotSchedule()
        {
            BLL.RoomBot bllRoomBot = new RoomBot();
            List<Info.RoomBot> lstBots = bllRoomBot.GetByBotID(Helper.Enums.Bot.RoomProgram);
            Info.RoomProgram infoSetting;
            bool isSend;
            foreach (var infoBot in lstBots)
            {
                isSend = false;
                infoSetting = (Info.RoomProgram)infoBot.Settings;
                if (infoSetting.ProgramSchedule == Helper.Enums.RoomBotSchedule.FiveMinutes)
                {
                    isSend = true;
                }
                else if (infoSetting.ProgramSchedule == Helper.Enums.RoomBotSchedule.TenMinutes && timerTricks % 2 == 0)
                {
                    isSend = true;
                }
                else if (infoSetting.ProgramSchedule == Helper.Enums.RoomBotSchedule.FifteenMinutes && timerTricks % 3 == 0)
                {
                    isSend = true;
                }
                else if (infoSetting.ProgramSchedule == Helper.Enums.RoomBotSchedule.ThirtyMinutes && timerTricks % 6 == 0)
                {
                    isSend = true;
                }
                else if (infoSetting.ProgramSchedule == Helper.Enums.RoomBotSchedule.FifteenMinutes && timerTricks % 12 == 0)
                {
                    isSend = true;
                }
                if (isSend)
                {
                    Chat2Connect.services.Services.SubmitProgram(infoBot);
                }
            }
        }
        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {
            IHubContext _Rcontext = GlobalHost.ConnectionManager.GetHubContext<ChatRoomHub>();
            IHubContext _Ncontext = GlobalHost.ConnectionManager.GetHubContext<NotificationHub>();

            if (Membership.GetUser() != null)
            {
                // uupdate status to offline 
                Member user = new Member();
                user.GetMemberByUserId(new Guid(Membership.GetUser().ProviderUserKey.ToString()));
                user.IsOnLine = false;
                user.Status = 4;
                user.Save();

                // remove user from rooms 
                RoomMember rooms = new RoomMember();
                rooms.GetAllRoomsByMemberID(user.MemberID);
                if (rooms.RowCount > 0)
                {
                    for (int i = 0; i < rooms.RowCount; i++)
                    {
                        _Rcontext.Clients.Group(rooms.RoomID.ToString()).removeMember(user.MemberID);                       
                        rooms.MoveNext();
                    }
                    rooms.Save();
                }

                // notify friends with new status 
                MemberFriend friends = new MemberFriend();
                friends.GetAllMemberFriends(user.MemberID);
                for (int i = 0; i < friends.RowCount; i++)
                {
                    Member temp = new Member();
                    temp.LoadByPrimaryKey(friends.FriendID);
                    MembershipUser u = Membership.GetUser(temp.UserID);
                    _Ncontext.Clients.Group(u.UserName).friendStatusChanged(user.MemberID, user.StatusMsg, "offline");
                }
            }
        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}