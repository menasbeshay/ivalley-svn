using System;
using System.Collections.Specialized;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using JBuddy;
namespace WhiteChatClient.UserControls
{
    public partial class Login : UserControl
    {
        #region Events and event args classes
        public event SignIn OnSignIn;
        public delegate void SignIn(object sender, SignInEventArgs e);
        public class SignInEventArgs : EventArgs
        {
            Client _client;
            string _errorMsg = null;

            public Client Client { get { return _client; } }
            public string ErrorMsg { get { return _errorMsg; } }

            public SignInEventArgs(Client client, string errormsg)
                : base()
            {
                _client = client;
                _errorMsg = errormsg;
            }
        }
        #endregion
        

        public Login()
        {
            InitializeComponent();
        }

        #region properties
        public Button DefaultButton { get { return uibuttonSignin; } }
        #endregion

        #region Events

        private void uibuttonSignin_Click(object sender, EventArgs e)
        {
            if (IsValidate())
            {
                JBuddyClass Jbuddy = new JBuddyClass();
                Client client = (Client)Jbuddy.ClientFactory(ProtocolType.PROTOCOL_YIM, uitextBoxUsername.Text, uitextBoxPassword.Text);                
                client.ConnectionLost += new _IClientEvents_ConnectionLostEventHandler(this.OnConnectionLost);
                client.Connect();
                while (!client.IsOnline())
                {
                    continue;
                }
                SignInEventArgs args = new SignInEventArgs (client,"");
                OnSignIn(this, args);
            }
        }

        private void OnConnectionLost(string sMsg)
        {
            
        }
        #endregion

        #region methods
        private void ProcessMessage(IMessage oMessage)
        {
            bool bMsg = true;
            string sMsg = oMessage.Message;
            string sType = "";


            switch (oMessage.Type)
            {
                case MessageType.MESSAGE_AUTH_ACCEPT: 
                    sType = "Auth Accept"; 
                    break;
                case MessageType.MESSAGE_AUTH_DECLINE: 
                    sType = "Auth Decline"; 
                    break;
                case MessageType.MESSAGE_AUTH_REQUEST: 
                    sType = "Auth Request"; 
                    break;
                case MessageType.MESSAGE_AUTO_RESPONSE: 
                    sType = "Auth Response"; 
                    break;
                case MessageType.MESSAGE_CUSTOM_AWAY: 
                    sType = "Custom Away"; 
                    break;
                case MessageType.MESSAGE_ERROR: 
                    sType = "Error"; 
                    break;
                case MessageType.MESSAGE_IM: 
                    sType = "IM"; break;
                case MessageType.MESSAGE_IM_OFFLINE: 
                    sType = "IM Offline"; 
                    break;
                case MessageType.MESSAGE_TYPING: 
                    bMsg = false; 
                    sMsg = "Typing..."; break;
                case MessageType.MESSAGE_TYPING_OFF: 
                    bMsg = false; 
                    sMsg = ""; break;
                case MessageType.MESSAGE_WARNING: 
                    bMsg = false; 
                    break;
            }

            /*if (bMsg == true)
            {
                txtHistory.Text += oMessage.Sender + "(" + sType + ") :" + sMsg + Environment.NewLine;
                sbStatus.Panels[0].Text = "";
            }
            else
                sbStatus.Panels[0].Text = sMsg;*/
        }

        private bool IsValidate()
        {
            bool valid = true;
            if (string.IsNullOrEmpty(uitextBoxUsername.Text))
            {
                uierrorProviderUsername.SetError(uitextBoxUsername, "Please enter username");
                valid = false;
            }
            else
            {
                uierrorProviderUsername.SetError(uitextBoxUsername, "");
            }
            if (string.IsNullOrEmpty(uitextBoxPassword.Text))
            {
                uierrorProviderPassword.SetError(uitextBoxPassword, "Please enter password");
                valid = false;
            }
            else
            {
                uierrorProviderPassword.SetError(uitextBoxPassword, "");
            }
            return valid;
        }
        #endregion

    }
}
