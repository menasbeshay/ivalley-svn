using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using WhiteChatClient.Logic;
namespace WhiteChatClient
{
    public partial class uiFormMain : Form
    {
        #region fields
        CurrentUser LoggedInUser;
        #endregion
        public uiFormMain()
        {
            InitializeComponent();
        }

        private void uiFormMain_Load(object sender, EventArgs e)
        {
            LoggedInUser = new CurrentUser();
            LoadControls();
        }

        private void LoadControls()
        {
            if (!LoggedInUser.IsOnLine)
            {
                UserControls.Login login = new UserControls.Login ();
                AddControlsToMainForm(login, login.DefaultButton);
            }
        }

        private void AddControlsToMainForm(Control control, Button DefaultButton)
        {
            uiPanelMain.Controls.Add(control);
            this.AcceptButton = DefaultButton;
        }


       
    }
}
