using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Chat2Connect.usercontrols.bot
{
    public partial class WelcomeBot : System.Web.UI.UserControl,IBotUserControl
    {
        private Info.WelcomeBot DataSource
        {
            get
            {
                return (Info.WelcomeBot)ViewState["Source"];
            }
            set
            {
                ViewState["Source"] = value;
            }
        }
        public void DataBind(Info.RoomBot infoSource)
        {
            DataSource = (Info.WelcomeBot)infoSource;
            string[] messages = DataSource.LoginMessage.Split(new string[] { "$Member$" }, StringSplitOptions.RemoveEmptyEntries);
            if (messages!=null && messages.Length > 0)
            {
                txtLoginMessagePart1.Text = messages[0];
                txtLoginMessagePart2.Text = messages[1];
            }
            messages = DataSource.LogoutMessage.Split(new string[] { "$Member$" }, StringSplitOptions.RemoveEmptyEntries);
            if (messages != null && messages.Length > 0)
            {
                txtLogoutMessagePart1.Text = messages[0];
                txtLogoutMessagePart2.Text = messages[1];
            }
            if (DataSource.IsActive)
                rdStatus.SelectedValue = "1";
            else
                rdStatus.SelectedValue = "0";
        }

        public Info.RoomBot GetDataObject()
        {
            Info.WelcomeBot info = DataSource;
            info.LoginMessage = String.Format("{0}$Member${1}", txtLoginMessagePart1.Text, txtLoginMessagePart2.Text);
            info.LogoutMessage = String.Format("{0}$Member${1}", txtLogoutMessagePart1.Text, txtLogoutMessagePart2.Text);
            info.IsActive = (rdStatus.SelectedValue == "1" ? true : false);
            return info;
        }

        public int BotID
        {
            get
            {
                return (int)Helper.Enums.Bot.Welcome;
            }
        }

        public string ValidationGroup
        {
            get;
            set;
        }
    }
}