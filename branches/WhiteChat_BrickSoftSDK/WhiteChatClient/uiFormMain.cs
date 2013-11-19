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
        delegate void ClearControlCallback(Control control);
        #region fields
        
        #endregion
        public uiFormMain()
        {
            InitializeComponent();
        }

        private void uiFormMain_Load(object sender, EventArgs e)
        {
            
            InitializeMainForm();
           
        }


        #region General Methods

        private void InitializeMainForm()
        {

            if (CurrentUser.Client== null || !CurrentUser.Client.Logined)
            {                
                CurrentUser.Client.OnLogin += new EventHandler(login_OnSignIn);
                CurrentUser.Client.OnError +=new Bricksoft.OnErrorEventHandler(Client_OnError);
                CurrentUser.Client.OnBuddyDisplayImageUpdated += new OnBuddyEventHandle(OnBuddyDisplayImageUpdated);
                VisibleInvisibleControl(uipanelLogin, true);
                VisibleInvisibleControl(uiflowLayoutPanelBuddies, false);
                VisibleInvisibleControl(uipanelLoading, false);                
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

            foreach (DictionaryEntry item in CurrentUser.Client.BuddyList)
            {
                YahooBuddy yb = (YahooBuddy)item.Value;
                uiBuddy ucBuddy = new uiBuddy();
                ucBuddy.BuddyName = yb.Account;
                ucBuddy.Selected += new EventHandler(ucBuddy_Selected);
                ucBuddy.UnSelected += new EventHandler(ucBuddy_UnSelected);
                ucBuddy.DoubleClick += new EventHandler(ucBuddy_DoubleClick);
                ucBuddy.BuddyProfilePath = yb.DisplayImageUrl;
                AddControlsToAControl(uiflowLayoutPanelBuddies, ucBuddy);
            }
        }

        /************************** menu actions ***********************************/
        private void addNewContactToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void chatRoomsToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void signOutToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CurrentUser.Client.Logout();
            VisibleInvisibleControl(uipanelLogin, true);
            VisibleInvisibleControl(uiflowLayoutPanelBuddies, false);
            VisibleInvisibleControl(uipanelLoading, false);
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
                CurrentUser.Client.Account = uitextBoxUsername.Text;
                CurrentUser.Client.Password = uitextBoxPassword.Text;
                CurrentUser.Client.Login();
                VisibleInvisibleControl(uipanelLogin, false);
                VisibleInvisibleControl(uiflowLayoutPanelBuddies, false);
                VisibleInvisibleControl(uipanelLoading, true);                
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

            LoadBuddies();
        }

        

        void Client_OnError(object sender, string message)
        {
            
            VisibleInvisibleControl(uipanelLogin, true);
            VisibleInvisibleControl(uiflowLayoutPanelBuddies, false);
            VisibleInvisibleControl(uipanelLoading, false);
            MessageBox.Show("Error in either in Yahoo ID and/or password.", "Sign-In Problem");
        }
        
        
        #endregion

        #region BuddyList        

        void ucBuddy_DoubleClick(object sender, EventArgs e)
        {
            uiBuddy b = (uiBuddy)sender;
            MessageBox.Show(b.BuddyName);
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
        #endregion



    }
}
