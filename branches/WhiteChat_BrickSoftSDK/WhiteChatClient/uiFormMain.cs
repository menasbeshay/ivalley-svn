using System;
using System.Collections.Generic;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using WhiteChatClient.Logic;
using WhiteChatClient.UserControls;
using Bricksoft.IM.Yahoo;
using Bricksoft;
namespace WhiteChatClient
{
    public partial class uiFormMain : Form
    {
        delegate void RemoveControlsToMainFormCallback(Control control);
        delegate void AddControlsToMainFormCallback(Control control, Button _default);
        delegate void VisibleInvisibleControlCallBack(Control control, bool Visible);
        delegate void AddControlsToAControlCallback(Control parent, Control child);
        delegate void RemoveControlsFromAControlCallback(Control parent, Control child);
        delegate void ClearControlCallback(Control control);
        delegate void EnableDisableControlCallback(Control control, bool Enable);
        
        #region fields
        ArrayList CurrentChatUsers;
        ArrayList CurrentChatRooms;
        #endregion
        public uiFormMain()
        {
            InitializeComponent();
        }

        private void uiFormMain_Load(object sender, EventArgs e)
        {            
            InitializeMainForm();            
            CurrentChatUsers = new ArrayList();
            CurrentChatRooms = new ArrayList();
        }


        #region General Methods

        private void InitializeMainForm()
        {

            if (CurrentUser.Client == null || !CurrentUser.Client.Logined)
            {
                CurrentUser.Client.LicenseKey = "CE6HAYLtIetGXv/cdg==#####BSGag+aaJcphtSVv1A==#####A05ohMc7tUfrcX4DOA==#####AaWvI5QMNm3nLG3MWg==#####u/nBDjregpC7rnH7#####BOiUIl93XMdjepvl0g==#####";
                CurrentUser.Client.OnLogin += delegate(object sender, EventArgs e) { this.Invoke(new EventHandler(login_OnSignIn)); };
                CurrentUser.Client.OnLogout += delegate(object sender, EventArgs e) { this.Invoke(new EventHandler(Client_OnLogout)); };
                CurrentUser.Client.OnError += delegate(object sender, string log) { this.Invoke(new OnErrorEventHandler(Client_OnError), new object[] { sender, log }); };
                CurrentUser.Client.OnBuddyDisplayImageUpdated += delegate(object sender, string buddy) { this.Invoke(new OnBuddyEventHandle(OnBuddyDisplayImageUpdated), new object[] { sender, buddy }); };                
                CurrentUser.Client.OnAddBuddy += delegate(object sender, string buddy) { this.Invoke(new OnBuddyEventHandle(Client_OnAddBuddy), new object[] { sender, buddy }); };
                CurrentUser.Client.OnDeleteBuddy += delegate(object sender, string buddy) { this.Invoke(new OnBuddyEventHandle(Client_OnDeleteBuddy), new object[] { sender, buddy }); };
                CurrentUser.Client.OnStatusChanged += delegate(object sender, EventArgs e) { this.Invoke(new EventHandler(Client_OnStatusChanged), new object[] { sender, e }); };
                CurrentUser.Client.OnBuddyStatusChanged += delegate(object sender, string buddy) { this.Invoke(new OnBuddyEventHandle(Client_OnBuddyStatusChanged), new object[] { sender, buddy }); };
                CurrentUser.Client.OnBuddyAddYouRequest += delegate(object sender, string buddy, string requestMessage, ref bool bAccept) { this.Invoke(new OnBuddyAddYouRequestYahooEventHandler(Client_OnBuddyAddYouRequest), new object[] { sender, buddy, requestMessage, bAccept }); };
                CurrentUser.Client.OnMessage += delegate(object sender, string buddy, string message) { this.Invoke(new OnMessageEventHandler(Client_OnMessage), new object[] { sender, buddy, message }); };
                CurrentUser.Client.OnBuddyTyping += delegate(object sender, string buddy) { this.Invoke(new OnBuddyEventHandle(Client_OnBuddyTyping), new object[] { sender, buddy }); };
                
                VisibleInvisibleControl(uipanelLogin, true);
                VisibleInvisibleControl(uiflowLayoutPanelBuddies, false);
                VisibleInvisibleControl(uipanelLoading, false);
                VisibleInvisibleControl(uipanelinfo, false);
                VisibleInvisibleControl(uipanelSearch, false);
                chatRoomsToolStripMenuItem.Enabled = false;
                signOutToolStripMenuItem.Enabled = false;
                addNewContactToolStripMenuItem.Enabled = false;
                if (Properties.Settings.Default.remember == "1")
                {
                    uitextBoxUsername.Text = Properties.Settings.Default.username;
                    uitextBoxPassword.Text = Properties.Settings.Default.password;
                    uicheckBoxRemember.Checked = true;
                }
                this.AcceptButton = uibuttonSignin;

            }
        }

        private void VisibleInvisibleControl(Control control, bool visible)
        {
            if (!control.InvokeRequired)
            {
                control.Visible = visible;                
            }
            else
            {
                VisibleInvisibleControlCallBack b = new VisibleInvisibleControlCallBack(VisibleInvisibleControl);
                this.Invoke(b, new object[] { control, visible});
            }
        }

        private void EnableDisableControl(Control control, bool Enable)
        {
            if (!control.InvokeRequired)
            {
                control.Enabled = Enable;
            }
            else
            {
                EnableDisableControlCallback b = new EnableDisableControlCallback(EnableDisableControl);
                this.Invoke(b, new object[] { control, Enable });
            }
        }        

        private void AddControlsToAControl(Control parent, Control child)
        {
            if (!parent.InvokeRequired)
            {
                parent.Controls.Add(child);
            }
            else
            {
                AddControlsToAControlCallback b = new AddControlsToAControlCallback(AddControlsToAControl);
                this.Invoke(b, new object[] { parent, child});
            }
        }

        private void ClearControl(Control control)
        {
            if (!control.InvokeRequired)
            {
                control.Controls.Clear();
            }
            else
            {
                ClearControlCallback b = new ClearControlCallback(ClearControl);
                this.Invoke(b, new object[] { control });
            }
        }

        private void RemoveControlsFromAControl(Control parent, Control child)
        {
            if (!parent.InvokeRequired)
            {
                parent.Controls.Remove(child);
            }
            else
            {
                RemoveControlsFromAControlCallback b = new RemoveControlsFromAControlCallback(RemoveControlsFromAControl);
                this.Invoke(b, new object[] { parent, child });
            }
        }

        private bool IsValidate()
        {
            bool valid = true;
            if (string.IsNullOrEmpty(uitextBoxUsername.Text))
            {
                valid = false;
            }

            if (string.IsNullOrEmpty(uitextBoxPassword.Text))
            {
                valid = false;
            }

            return valid;
        }

        private void LoadBuddies()
        {
            ClearControl(uiflowLayoutPanelBuddies);
            foreach (DictionaryEntry item in CurrentUser.Client.BuddyList)
            {
                YahooBuddy yb = (YahooBuddy)item.Value;
                uiBuddy ucBuddy = new uiBuddy();
                ucBuddy.Width = uiflowLayoutPanelBuddies.Width;
                ucBuddy.Padding = new Padding(20, 0, 0, 0);
                ucBuddy.BuddyName = yb.Account;
                ucBuddy.Selected += new EventHandler(ucBuddy_Selected);
                ucBuddy.UnSelected += new EventHandler(ucBuddy_UnSelected);
                ucBuddy.DoubleClick += new EventHandler(ucBuddy_DoubleClick);
                ucBuddy.DeleteBuddy += new EventHandler(ucBuddy_DeleteBuddy);
                ucBuddy.Status = yb.Status;
                ucBuddy.BuddyProfilePath = yb.DisplayImageUrl;
                AddControlsToAControl(uiflowLayoutPanelBuddies, ucBuddy);
            }
        }

        private void HandleAddContact()
        {
            if (CurrentUser.Client.Logined)
            {
                AddContact frmInput = new AddContact();
                frmInput.ShowDialog();
                if ((frmInput.Result == DialogResult.OK) && (frmInput.BuddyName != ""))
                    CurrentUser.Client.AddBuddy("Friends", frmInput.BuddyName, "");
            }
        }

        /************************** menu actions ***********************************/
        private void addNewContactToolStripMenuItem_Click(object sender, EventArgs e)
        {
            HandleAddContact();
        }

        private void chatRoomsToolStripMenuItem_Click(object sender, EventArgs e)
        {
            uiFormBrowseChatRooms browse = new uiFormBrowseChatRooms();
            browse.ShowDialog();
        }

        private void signOutToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CurrentUser.Client.Logout();
            VisibleInvisibleControl(uipanelLogin, true);
            VisibleInvisibleControl(uiflowLayoutPanelBuddies, false);
            VisibleInvisibleControl(uipanelLoading, false);
            VisibleInvisibleControl(uipanelinfo, false);
            VisibleInvisibleControl(uipanelSearch, false);
            chatRoomsToolStripMenuItem.Enabled = false;
            signOutToolStripMenuItem.Enabled = false;
            addNewContactToolStripMenuItem.Enabled = false;
        }

        private void exitToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
        #endregion

        #region Login
        private void uibuttonSignin_Click(object sender, EventArgs e)
        {
            if (IsValidate())
            {
                if (uicheckBoxRemember.Checked)
                {
                    Properties.Settings.Default.username = uitextBoxUsername.Text;
                    Properties.Settings.Default.password = uitextBoxPassword.Text;
                    Properties.Settings.Default.remember = "1";
                }
                else
                {
                    Properties.Settings.Default.remember = "0";
                }
                Properties.Settings.Default.Save();

                CurrentUser.Client.Account = uitextBoxUsername.Text;
                CurrentUser.Client.Password = uitextBoxPassword.Text;
                if (uicheckBoxInvisible.Checked)
                    CurrentUser.Client.Status = YahooStatus.YAHOO_STATUS_INVISIBLE;
                CurrentUser.Client.Login();
                VisibleInvisibleControl(uipanelLogin, false);
                VisibleInvisibleControl(uiflowLayoutPanelBuddies, false);
                VisibleInvisibleControl(uipanelLoading, true);
                VisibleInvisibleControl(uipanelinfo, false);
                VisibleInvisibleControl(uipanelSearch, false);
                uilabelLogging.Text = "Logging as " + uitextBoxUsername.Text;
                this.AcceptButton = null;
            }
            else
            {
                MessageBox.Show("You must enter an ID and password.", "Sign-In Problem");
            }
        }

        void login_OnSignIn(object sender, EventArgs e)
        {
            VisibleInvisibleControl(uipanelLogin, false);
            VisibleInvisibleControl(uiflowLayoutPanelBuddies, true);
            VisibleInvisibleControl(uipanelLoading, false);
            VisibleInvisibleControl(uipanelinfo, true);
            VisibleInvisibleControl(uipanelSearch, true);
            uilabelBuddyName.Text = CurrentUser.Client.Account;
            chatRoomsToolStripMenuItem.Enabled = true;
            signOutToolStripMenuItem.Enabled = true;
            addNewContactToolStripMenuItem.Enabled = true;
            LoadBuddies();
            CurrentUser.LoadEmotions();
        }

        private void Client_OnLogout(object sender, EventArgs e)
        {
            VisibleInvisibleControl(uipanelLogin, true);
            VisibleInvisibleControl(uiflowLayoutPanelBuddies, false);
            VisibleInvisibleControl(uipanelLoading, false);
            VisibleInvisibleControl(uipanelinfo, false);
            VisibleInvisibleControl(uipanelSearch, false);
        }

        void Client_OnError(object sender, string message)
        {
            
            VisibleInvisibleControl(uipanelLogin, true);
            VisibleInvisibleControl(uiflowLayoutPanelBuddies, false);
            VisibleInvisibleControl(uipanelLoading, false);
            VisibleInvisibleControl(uipanelinfo, false);
            VisibleInvisibleControl(uipanelSearch, false);
            MessageBox.Show("Error in either in Yahoo ID and/or password.", "Sign-In Problem");
        }
        
        #endregion

        #region BuddyList        

        void ucBuddy_DoubleClick(object sender, EventArgs e)
        {
            uiBuddy b = (uiBuddy)sender;
            uiFormChat chatwindow = new uiFormChat();
            chatwindow.Text = b.BuddyName;
            chatwindow.AdjustGraphicsImp();
            chatwindow.FormClosed += new FormClosedEventHandler(chatwindow_FormClosed);  
            CurrentChatUsers.Add(chatwindow);            
            chatwindow.Show();
        }

        private void ucBuddy_UnSelected(object sender, EventArgs e)
        {
            uiBuddy b = (uiBuddy)sender;
            b.SetSelected(false);
        }

        private void ucBuddy_Selected(object sender, EventArgs e)
        {
            uiBuddy b = (uiBuddy)sender;
            b.SetSelected(true);
        }

        private void ucBuddy_DeleteBuddy(object sender, EventArgs e)
        {
            uiBuddy b = (uiBuddy)sender;
            YahooBuddy buddy =  (YahooBuddy)CurrentUser.Client.BuddyList[b.BuddyName];
            RemoveControlsFromAControl(uiflowLayoutPanelBuddies, b);
            CurrentUser.Client.DeleteBuddy(buddy);
        }

        private void OnBuddyDisplayImageUpdated(object sender, string buddy)
        {
            YahooBuddy yb = (YahooBuddy)CurrentUser.Client.BuddyList[buddy];

            foreach (Control item in uiflowLayoutPanelBuddies.Controls)
            {
                uiBuddy c = (uiBuddy)item;
                if (c.BuddyName == yb.Account)
                    c.BuddyProfilePath = yb.DisplayImageUrl;
            }
        }

        private void Client_OnAddBuddy(object sender, string buddy)
        {
            YahooBuddy yb = (YahooBuddy)CurrentUser.Client.BuddyList[buddy];
            uiBuddy ucBuddy = new uiBuddy();
            ucBuddy.BuddyName = yb.Account;
            ucBuddy.Selected += new EventHandler(ucBuddy_Selected);
            ucBuddy.UnSelected += new EventHandler(ucBuddy_UnSelected);
            ucBuddy.DoubleClick += new EventHandler(ucBuddy_DoubleClick);
            ucBuddy.DeleteBuddy += new EventHandler(ucBuddy_DeleteBuddy);
            ucBuddy.BuddyProfilePath = yb.DisplayImageUrl;
            AddControlsToAControl(uiflowLayoutPanelBuddies, ucBuddy);
        }

        private void Client_OnBuddyAddYouRequest(object sender, string buddy, string requestMessage, ref bool accept)
        {
            if (CurrentUser.Client.BuddyList[buddy] == null)
            {
                if (MessageBox.Show("\"" + buddy + "\" added you. Do you want to \"" + buddy + "\" to see you?", "Confirmation", MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {
                    accept = true;
                }
                else
                    accept = false;
            }
        }

        private void Client_OnDeleteBuddy(object sender, string buddy)
        {
            foreach (Control item in uiflowLayoutPanelBuddies.Controls)
            {
                uiBuddy b = (uiBuddy)item;
                if (b.BuddyName == buddy)
                {
                    RemoveControlsFromAControl(uiflowLayoutPanelBuddies, b);
                }
            }
        }

        private void Client_OnBuddyStatusChanged(object sender, string buddy)
        {
            YahooBuddy yb = (YahooBuddy)CurrentUser.Client.BuddyList[buddy];
            foreach (Control item in uiflowLayoutPanelBuddies.Controls)
            {
                uiBuddy b = (uiBuddy)item;
                if (b.BuddyName == buddy)
                {
                    b.Status = yb.Status;
                    break;
                }
            }
        }

        private void uitextBoxSearch_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter && !string.IsNullOrEmpty(uitextBoxSearch.Text))
            {
                MessageBox.Show("Open Chat window - " + uitextBoxSearch.Text);
            }
        }

        private void uibuttonAdd_Click(object sender, EventArgs e)
        {
            HandleAddContact();
            
        }

        private void Client_OnStatusChanged(object sender, EventArgs e)
        {

            switch (CurrentUser.Client.Status)
            {
                case YahooStatus.YAHOO_STATUS_BRB:
                case YahooStatus.YAHOO_STATUS_IDLE:
                case YahooStatus.YAHOO_STATUS_STEPPEDOUT:
                case YahooStatus.YAHOO_STATUS_OUTTOLUNCH:
                case YahooStatus.YAHOO_STATUS_ONVACATION:
                case YahooStatus.YAHOO_STATUS_NOTATHOME:
                case YahooStatus.YAHOO_STATUS_NOTATDESK:
                case YahooStatus.YAHOO_STATUS_NOTINOFFICE:
                    uicomboBoxStatus.SelectedIndex = 1;
                    break;
                case YahooStatus.YAHOO_STATUS_BUSY:
                case YahooStatus.YAHOO_STATUS_ONPHONE:
                case YahooStatus.YAHOO_STATUS_CUSTOM:        
                    uicomboBoxStatus.SelectedIndex = 2;
                    break;
                case YahooStatus.YAHOO_STATUS_OFFLINE:
                case YahooStatus.YAHOO_STATUS_INVISIBLE:
                    uicomboBoxStatus.SelectedIndex = 3;
                    break;
                default:
                    uicomboBoxStatus.SelectedIndex = 0;
                    break;
               
            }
        }
        #endregion

        #region HandleMessage
        private void Client_OnMessage(object sender, string buddy, string Message)
        {
            int count = 0;
            foreach (uiFormChat item in CurrentChatUsers)
            {
                if (item.Text == buddy)
                {
                    item.GetMessage(Message);
                    break;
                }
                count++;
            }
            if(count == CurrentChatUsers.Count || CurrentChatUsers.Count == 0)
            {
                uiFormChat chatwindow = new uiFormChat();
                chatwindow.Text = buddy;
                chatwindow.AdjustGraphicsImp();
                chatwindow.FormClosed += new FormClosedEventHandler(chatwindow_FormClosed);
                CurrentChatUsers.Add(chatwindow);
                chatwindow.Show();
                chatwindow.GetMessage(Message);
            }
        }

        private void Client_OnBuddyTyping(object sender, string buddy)
        {
            foreach (uiFormChat item in CurrentChatUsers)
            {
                if (item.Text == buddy)
                {
                    item.GetMessage("");
                    break;
                }
            }
        }
        #endregion 

        #region Actions
        private void uicomboBoxStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            /*
             Online
             Away
             Busy
             Offline
             */
            switch (uicomboBoxStatus.SelectedIndex)
            {
                case 0:
                    CurrentUser.Client.ChangeStatus(YahooStatus.YAHOO_STATUS_AVAILABLE, "");
                    break;
                case 1:
                    CurrentUser.Client.ChangeStatus(YahooStatus.YAHOO_STATUS_STEPPEDOUT, "");
                    break;
                case 2:
                    CurrentUser.Client.ChangeStatus(YahooStatus.YAHOO_STATUS_BUSY, "");
                    break;
                case 3:
                    CurrentUser.Client.ChangeStatus(YahooStatus.YAHOO_STATUS_INVISIBLE, "");
                    break;

                default:
                    CurrentUser.Client.ChangeStatus(YahooStatus.YAHOO_STATUS_BRB, "");
                    break;
            }
        }

        void chatwindow_FormClosed(object sender, FormClosedEventArgs e)
        {
            CurrentChatUsers.Remove(sender);
        }
        #endregion 

    }
}
