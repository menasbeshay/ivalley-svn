using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Chat2Connect.Jobs
{
    public partial class Daily : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    SendFollowAdminBotMessages();
                }
                catch { }
            }
        }

        private void SendFollowAdminBotMessages()
        {
            BLL.Member bllBotMember = BLL.Member.GetSiteMember("بوت متابعة الإدارة");

            BLL.RoomBot bllRoomBot = new BLL.RoomBot();
            List<Info.RoomBot> lstBots = bllRoomBot.GetByBotID(Helper.Enums.Bot.FollowAdmin);
            Info.FollowAdmin infoSettings;
            string mailURL = "/RoomHistory.aspx?rid=";
            bool send = false;
            foreach (Info.RoomBot roomBot in lstBots)
            {
                mailURL += roomBot.RoomID.ToString();
                infoSettings = (Info.FollowAdmin)roomBot.Settings;
                if (infoSettings.FollowSchedule==Convert.ToString((int)Helper.Enums.FollowAdminBotSchedule.Daily))
                {
                    send = true;
                    mailURL += "&sid=" + Convert.ToString((int)Helper.Enums.FollowAdminBotSchedule.Daily);
                }
                else if (DateTime.Now.DayOfWeek == DayOfWeek.Sunday &&
                    infoSettings.FollowSchedule==Convert.ToString((int)Helper.Enums.FollowAdminBotSchedule.Week))
                {
                    send = true;
                    mailURL += "&sid=" + Convert.ToString((int)Helper.Enums.FollowAdminBotSchedule.Daily);
                }
                else if (DateTime.Now.Day == 1 &&
                    infoSettings.FollowSchedule==Convert.ToString((int) Helper.Enums.FollowAdminBotSchedule.Month))
                {
                    send = true;
                    mailURL += "&sid=" + Convert.ToString((int)Helper.Enums.FollowAdminBotSchedule.Daily);
                }
                if (send)
                {
                    mailURL += "&l=" + String.Join(",", infoSettings.FollowMemberLevels);
                    mailURL = Request.Url.OriginalString.ToLower().Replace("/jobs/daily.aspx", "") + mailURL;

                    SendBotMsg(mailURL, roomBot,bllBotMember.MemberID);
                }
            }
        }

        private void SendBotMsg(string mailURL, Info.RoomBot roomBot,int senderID)
        {
            System.Net.WebClient wClient = new System.Net.WebClient();
            wClient.Encoding = System.Text.Encoding.UTF8;
            string msgBody = wClient.DownloadString(mailURL);

            BLL.Room bllRoom = new BLL.Room();
            bllRoom.LoadByPrimaryKey(roomBot.RoomID);

            BLL.Message msg = new BLL.Message();
            msg.AddNew();
            msg.Body = msgBody;
            msg.SenderID = senderID;
            msg.Subject = "بوت متابعة إدارة الغرفة - " + bllRoom.Name;
            msg.ToMembers = bllRoom.CreatedByMember.Name;
            msg.Save();

            BLL.MemberMessage memberMsg = new BLL.MemberMessage();
            //add to member sent items
            //add to room owner
            memberMsg.AddNew();
            memberMsg.MemberID = bllRoom.CreatedBy;
            memberMsg.MessageID = msg.ID;
            memberMsg.Save();

            //send mail notifications
            Chat2Connect.SRCustomHubs.NotificationHub notifications = new Chat2Connect.SRCustomHubs.NotificationHub();
            notifications.SendMailNotifications(bllRoom.CreatedBy);
        }
    }
}