using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Text;
using System.Windows.Forms;
using Bricksoft;
using Bricksoft.IM.Yahoo;

namespace WhiteChatClient.UserControls
{
    public partial class uiBuddy : UserControl
    {
        public event EventHandler Selected;
        public event EventHandler UnSelected;        
        public uiBuddy()
        {
            InitializeComponent();              
        }

        /*public StatusType Status
        {
            set 
            {
                switch (value)
                {
                    case StatusType.STATUS_ATLUNCH:
                        break;
                    case StatusType.STATUS_AWAY:
                        break;
                    case StatusType.STATUS_BRB:
                        break;
                    case StatusType.STATUS_BUSY:
                        break;
                    case StatusType.STATUS_CUSTOM_AWAY:
                        break;
                    case StatusType.STATUS_DND:
                        break;
                    case StatusType.STATUS_FREE_TO_CHAT:
                        break;
                    case StatusType.STATUS_IDLE:
                        break;
                    case StatusType.STATUS_INVISIBLE:
                        break;
                    case StatusType.STATUS_NA:
                        break;
                    case StatusType.STATUS_NOT_AT_DESK:
                        break;
                    case StatusType.STATUS_NOT_AT_HOME:
                        break;
                    case StatusType.STATUS_NOT_IN_OFFICE:
                        break;
                    case StatusType.STATUS_OCCUPIED:
                        break;
                    case StatusType.STATUS_OFFLINE:
                        break;
                    case StatusType.STATUS_ONLINE:
                        break;
                    case StatusType.STATUS_ONPHONE:
                        break;
                    case StatusType.STATUS_ON_VACATION:
                        break;
                    case StatusType.STATUS_STEPPED_OUT:
                        break;
                    default:
                        break;
                }
            }
        }*/

        public string BuddyName { set { uilabelName.Text = value; } get { return uilabelName.Text; } }

        public string BuddyProfilePath { set { uipictureBoxProfile.ImageLocation = value; } }

        public void SetSelected(bool selected)
        {
            BackColor = selected ? Color.FromArgb(0, 149, 204) : Color.White;
            uilabelName.ForeColor = selected ? Color.White : Color.Black;
        }

        private void uiBuddy_Enter(object sender, EventArgs e)
        {            
            Selected(this, e);
            this.Focus();
        }

        private void uiBuddy_Leave(object sender, EventArgs e)
        {
            UnSelected(this, e);
        }

        private void Control_DoubleClick(object sender, EventArgs e)
        {
            this.OnDoubleClick(e);                        
        }

    }
}
