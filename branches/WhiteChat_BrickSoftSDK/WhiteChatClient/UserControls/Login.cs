using System;
using System.Collections.Specialized;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Text;
using System.Windows.Forms;
using Bricksoft;
using Bricksoft.IM.Yahoo;
using WhiteChatClient.Logic;
namespace WhiteChatClient.UserControls
{
    public partial class Login : UserControl
    {
        #region Events and event args classes
        public event SignIn OnSignIn;
        public delegate void SignIn(object sender, SignInEventArgs e);
        public class SignInEventArgs : EventArgs
        {
            YahooClient _client;
            string _errorMsg = null;

            public YahooClient Client { get { return _client; } }
            public string ErrorMsg { get { return _errorMsg; } }

            public SignInEventArgs(YahooClient client, string errormsg)
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
                CurrentUser.Client.Account = uitextBoxUsername.Text;
                CurrentUser.Client.Password = uitextBoxPassword.Text;                             
                CurrentUser.Client.Login();                
            }
        }

        
        #endregion

        #region methods
       

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

        private void OnLog(object sender, string log)
        {
           
        }

        private void OnLogin(object sender, EventArgs e)
        {
            //SignInEventArgs args = new SignInEventArgs(client, "");
            //OnSignIn(this, args);
        }
    }
}
