﻿using System;
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
            GlobalHost.Configuration.DisconnectTimeout = TimeSpan.FromSeconds(180);
            GlobalHost.Configuration.KeepAlive = TimeSpan.FromSeconds(10);

            if (Membership.GetUser(Helper.Admin.Defaults.UserName) == null)
            {
                MembershipBLL memberShip = new MembershipBLL();
                MembershipCreateStatus objStatus;
                memberShip.RegisterMember(Helper.Admin.Defaults.UserName, Helper.Admin.Defaults.Password, Helper.Admin.Defaults.Email, Helper.Admin.Defaults.Question, Helper.Admin.Defaults.Answer, out objStatus);
            }

            timerTricks = 0;
            System.Timers.Timer scheduleTimer = new System.Timers.Timer();
            scheduleTimer.Interval = 1000 * 60 * 5; //5 minutes
            scheduleTimer.AutoReset = true;
            scheduleTimer.Elapsed += new System.Timers.ElapsedEventHandler(scheduleTimer_Elapsed);
            scheduleTimer.Enabled = true;

           /* System.Timers.Timer scheduleTimerForMailAds = new System.Timers.Timer();
            scheduleTimerForMailAds.Interval = 1000 * 60 * 60; //60 minutes (1 hour)
            scheduleTimerForMailAds.AutoReset = true;
            scheduleTimerForMailAds.Elapsed += new System.Timers.ElapsedEventHandler(scheduleTimerForMailAds_Elapsed);
            scheduleTimerForMailAds.Enabled = true;*/
        }

        private void scheduleTimerForMailAds_Elapsed(object sender, System.Timers.ElapsedEventArgs e)
        {
            // run mail ads
            SendScheduleAds();
        }

        private void SendScheduleAds()
        {
            BLL.MailAds bllMailAds = new BLL.MailAds();
            bllMailAds.SendScheduledAds();
        }

        public int timerTricks;
        public void scheduleTimer_Elapsed(object source, System.Timers.ElapsedEventArgs e)
        {
            timerTricks++;
            SubmitRoomLawBotSchedule();
            SubmitRoomProgramBotSchedule();
            // remove stuck members from rooms
            //CleanRooms();

            
        }

        private void CleanRooms()
        {
            BLL.RoomMember members = new RoomMember();
            members.CleanRooms();
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
            int loggedInMemberID = Helper.TypeConverter.ToInt32(Session[SessionManager.loggedInMemberID]);
            if (loggedInMemberID > 0)
            {
                var user = ChatRoomHub.ConnectedUsers.FirstOrDefault(u => u.MemberID == loggedInMemberID);
                ChatRoomHub.ConnectedUsers.Remove(user);
                IHubContext _Ncontext = GlobalHost.ConnectionManager.GetHubContext<NotificationHub>();
                _Ncontext.Clients.All.updateMember(loggedInMemberID, "IsOnline", false);

                BLL.Member bllMember = new Member();
                bllMember.SetOffline(loggedInMemberID);
            }
            Session.Abandon();
            //FormsAuthentication.SignOut();
        }

        protected void Application_End(object sender, EventArgs e)
        {

        }        
    }
}