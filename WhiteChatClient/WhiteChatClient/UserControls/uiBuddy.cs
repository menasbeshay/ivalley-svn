using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using JBuddy;

namespace WhiteChatClient.UserControls
{
    public partial class uiBuddy : UserControl
    {
        public event EventHandler Selected;
        public event EventHandler UnSelected;
        private StatusType _status;
        public uiBuddy()
        {
            InitializeComponent();
        }

        public StatusType Status
        {
            set 
            {
                _status = value;
                switch (value)
                {
                    
                    // away 
                    case StatusType.STATUS_ATLUNCH:                                                
                    case StatusType.STATUS_AWAY:                       
                    case StatusType.STATUS_BRB:
                    case StatusType.STATUS_ONPHONE:
                    case StatusType.STATUS_NA:                        
                    case StatusType.STATUS_NOT_AT_DESK:                        
                    case StatusType.STATUS_NOT_AT_HOME:                        
                    case StatusType.STATUS_NOT_IN_OFFICE:
                    case StatusType.STATUS_ON_VACATION:                        
                    case StatusType.STATUS_STEPPED_OUT:
                    case StatusType.STATUS_CUSTOM_AWAY:                        
                    case StatusType.STATUS_IDLE:                        
                        uipictureBoxStatus.ImageLocation = "Images/away.gif";
                        break;
                        
                    //busy 
                    case StatusType.STATUS_BUSY:
                        uipictureBoxStatus.ImageLocation = "Images/busy.gif";
                        break;
                    /*
                    case StatusType.STATUS_DND:
                        break;
                    */
                    
                    
                    // offline
                    case StatusType.STATUS_OCCUPIED:                        
                    case StatusType.STATUS_OFFLINE:                        
                    case StatusType.STATUS_INVISIBLE:
                        uipictureBoxStatus.ImageLocation = "Images/offline.gif";
                        break;
                    // online
                    case StatusType.STATUS_ONLINE:                        
                    case StatusType.STATUS_FREE_TO_CHAT:
                        uipictureBoxStatus.ImageLocation = "Images/online.gif";
                        break;
                    
                    
                    default:
                        break;
                }
            }
            get { return _status; }
        }

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
            //SetSelected(true);
            this.Focus();
        }

        private void uiBuddy_Leave(object sender, EventArgs e)
        {
            UnSelected(this, e);
            //SetSelected(false);
        }
    }
}
