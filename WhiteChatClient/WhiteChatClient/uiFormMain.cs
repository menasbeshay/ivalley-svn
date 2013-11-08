using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using WhiteChatClient.Logic;
using WhiteChatClient.UserControls;
using System.Threading;
namespace WhiteChatClient
{
    public partial class uiFormMain : Form
    {
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


        #region LoginControl
        void login_OnSignIn(object sender, UserControls.Login.SignInEventArgs e)
        {
            CurrentUser.Client = e.Client;
           
            
            if (CurrentUser.Client.IsOnline())
            {
                RemoveControlsToMainForm(uiPanelMain.Controls.Find("login", false)[0]);
                uiChatWindow chatwindow = new uiChatWindow();
                chatwindow.init();
                AddControlsToMainForm(chatwindow, null);
            }
        }

        #endregion

        #region General Methods

        private void InitializeMainForm()
        {

            if (CurrentUser.Client== null || !CurrentUser.Client.IsOnline())
            {
                UserControls.Login login = new UserControls.Login();
                login.OnSignIn += new UserControls.Login.SignIn(login_OnSignIn);
                AddControlsToMainForm(login, login.DefaultButton);
            }
        }

        private void AddControlsToMainForm(Control control, Button DefaultButton)
        {
            uiPanelMain.Controls.Add(control);
            control.Dock = DockStyle.Fill;
            this.AcceptButton = DefaultButton;
        }

        private void RemoveControlsToMainForm(Control control)
        {
            foreach (Control item in  uiPanelMain.Controls.Find(control.Name, false))
            {
                item.Dispose();
            }            
        }
        #endregion

        private void chatRoomsToolStripMenuItem_Click(object sender, EventArgs e)
        {
            uiFormBrowseChatRooms chatroom = new uiFormBrowseChatRooms();
            chatroom.ShowDialog();
        }

    }
}
