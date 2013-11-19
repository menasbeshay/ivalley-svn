using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;

namespace WhiteChatClient
{
    public partial class AddContact : Form
    {
        public string BuddyName;
        public DialogResult Result;

        public AddContact()
        {
            InitializeComponent();
        }

        private void uibuttonOk_Click(object sender, EventArgs e)
        {
            BuddyName = uitextBoxBuddyName.Text;
            Result = System.Windows.Forms.DialogResult.OK;
            Close();
        }

        private void uibuttonCancel_Click(object sender, EventArgs e)
        {
            Result = System.Windows.Forms.DialogResult.Cancel;
            Close();
        }
    }
}
