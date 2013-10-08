using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using WhiteChatClient.Logic;
using JBuddy;

namespace WhiteChatClient.UserControls
{
    public partial class uiChatWindow : UserControl
    {
        public uiChatWindow()
        {
            InitializeComponent();
            LoadBuddies();
            //
            CurrentUser.Client.AdminMessage += new _IClientEvents_AdminMessageEventHandler(this.OnAdminMessage);
            CurrentUser.Client.IncomingMessage += new _IClientEvents_IncomingMessageEventHandler(this.OnIncomingMessage);
            CurrentUser.Client.IncomingBuddy += new _IClientEvents_IncomingBuddyEventHandler(this.OnIncomingBuddy);
            CurrentUser.Client.ConnectionLost += new _IClientEvents_ConnectionLostEventHandler(this.OnConnectionLost);
        }

        public void LoadBuddies()
        {
            if (CurrentUser.Client.IsOnline())
            {
                for (int i = 0; i < CurrentUser.Client.BuddyList.Buddies.Count; i++ )
                {
                    JBuddy.IBuddy buddy = (JBuddy.IBuddy)CurrentUser.Client.BuddyList.Buddies[i];
                    //buddy.IProperties
                    uiBuddy ucBuddy = new uiBuddy();
                    ucBuddy.BuddyName = buddy.Name;
                    
                    //ucBuddy.BuddyProfilePath = buddy.Properties.
                    uiflowLayoutPanelBuddies.Controls.Add(ucBuddy);
                } 
            }
        }

        private void OnAdminMessage(IMessage oMessage)
        {
           // ProcessMessage(oMessage);
        }

        private void OnIncomingMessage(IMessage oMessage)
        {
           // ProcessMessage(oMessage);
        }

        private void OnIncomingBuddy(IBuddy oBuddy)
        {
           // listBox1.Items.Add(oBuddy.NickName);
        }

        private void OnConnectionLost(string sMsg)
        {
           
        }

    }
}
