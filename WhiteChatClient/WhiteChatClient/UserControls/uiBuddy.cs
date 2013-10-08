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
        public uiBuddy()
        {
            InitializeComponent();
        }

        public StatusType Status
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
        }

        public string BuddyName { set { uilabelName.Text = value; } }

        public string BuddyProfilePath { set { uipictureBoxProfile.ImageLocation = value; } }
    }
}
