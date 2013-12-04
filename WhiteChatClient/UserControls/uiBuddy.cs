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
        public event EventHandler DeleteBuddy;
        private int _status;

        public uiBuddy()
        {
            InitializeComponent();              
        }

        public int Status
        {
            set
            {
                _status = value;
                switch (value)
                {

                    // away 
                    
                    case YahooStatus.YAHOO_STATUS_BRB:
                    case YahooStatus.YAHOO_STATUS_IDLE:
                    case YahooStatus.YAHOO_STATUS_STEPPEDOUT:
                    case YahooStatus.YAHOO_STATUS_OUTTOLUNCH:
                    case YahooStatus.YAHOO_STATUS_ONVACATION:                    
                    case YahooStatus.YAHOO_STATUS_NOTATHOME:
                    case YahooStatus.YAHOO_STATUS_NOTATDESK:
                    case YahooStatus.YAHOO_STATUS_NOTINOFFICE:
                        uipictureBoxStatus.ImageLocation = "Images/Status_Small_Busy.png";
                        break;

                    //busy 
                    case YahooStatus.YAHOO_STATUS_BUSY:
                    case YahooStatus.YAHOO_STATUS_ONPHONE:
                    case YahooStatus.YAHOO_STATUS_CUSTOM:
                        uipictureBoxStatus.ImageLocation = "Images/Status_Small_Busy.png";
                        break;
                    
                    // offline                    
                    case YahooStatus.YAHOO_STATUS_OFFLINE:
                    case YahooStatus.YAHOO_STATUS_INVISIBLE:
                        uipictureBoxStatus.ImageLocation = "Images/Status_Small_Offline.png";
                        break;
                    
                    default:
                        uipictureBoxStatus.ImageLocation = "Images/Status_Small_Online.png";
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

        public void setContextMenu()
        {
            this.ContextMenuStrip = uicontextMenuStripRightClick;
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

        private void uicontextMenuStripRightClick_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {
            if (e.ClickedItem.Text == "Delete")
            {
                if(MessageBox.Show("Are you sure to delete this account from your buddy list?","Confirm",MessageBoxButtons.OKCancel,MessageBoxIcon.Question) == DialogResult.OK)
                    DeleteBuddy(this, e);
            }
        }

    }
}
