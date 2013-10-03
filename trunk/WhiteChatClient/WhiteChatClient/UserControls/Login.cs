using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace WhiteChatClient.UserControls
{
    public partial class Login : UserControl
    {
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
            { }
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

    }
}
