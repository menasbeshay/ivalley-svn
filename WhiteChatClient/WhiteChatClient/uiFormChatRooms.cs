using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Net.Sockets;
using System.Net;

namespace WhiteChatClient
{
    public partial class uiFormChatRooms : Form
    {
        public int Category { get; set; }
        public int SubCat { get; set; }
        public int Room { get; set; }
        public uiFormChatRooms(int cat, int subcat, int room)
        {
            InitializeComponent();
            Category = cat;
            subcat = SubCat;
            Room = room;
        }

        public void init()
        {
            uiChatRoomWindow1.Init(Category,SubCat,Room);
        }
        private void uiFormChatRooms_FormClosed(object sender, FormClosedEventArgs e)
        {
            uiChatRoomWindow1.CloseSocketConnection();
        }
    }
}
