
/*
	----------------------------------------------
	  Form1.cs
	  RTP Conference Server C# sample - main form source
	----------------------------------------------
	  Copyright (c) 2010 Lake of Soft
		     All rights reserved

	  http://lakeofsoft.com/
	----------------------------------------------

	  created by:
		Lake, 02 June 2010

	  modified by:
		Lake, July 2010

	----------------------------------------------
*/

using System;
using System.Windows.Forms;

namespace RTPConfServer
{
    public partial class Form1 : Form
    {
        private const int MAX_EVENTS = 32;
        private int[] vcevents = new int[MAX_EVENTS];
        private int evindex = 0;
        private int evsetpoint = 0;

        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            server.setSrvMasterKey(c_edit_key.Text);
            server.autoRemoveRooms = c_cb_arr.Checked;
            server.Port = c_edit_port.Text;
            server.bind2ip = c_edit_b2ip.Text;
            //
            server.Active = true;
            
        }

        private void button2_Click(object sender, EventArgs e)
        {
            server.Active = false;
        }

        private void Form1_Shown(object sender, EventArgs e)
        {
            c_timer_update.Enabled = true;
        }

        private void handleEvent(int id) 
        {
            // new room was added, or some room was removed
            if (0 <= id)
            {
                //
                ListViewItem l = c_lv_rooms.Items.Add(id.ToString());
                l.SubItems.Add(server.roomGetName(id)); // name
                l.SubItems.Add("0"); // clients
                l.SubItems.Add("0 KiB/s"); // bw in
                l.SubItems.Add("0 KiB/s"); // bw out
            }
            else
            {
                id = -id;
                // find this room in listview
                ListViewItem l = c_lv_rooms.FindItemWithText(id.ToString());
                if (null != l)
                    c_lv_rooms.Items.Remove(l);
            }
        }

        private void c_timer_main_Tick(object sender, EventArgs e)
        {
            //
            while (evindex != evsetpoint)
            {
                //
                if (MAX_EVENTS <= ++evindex)
                    evindex = 0;
                handleEvent(vcevents[evindex]);
            }

            // update room infos
            for (int i = 0; i < c_lv_rooms.Items.Count; i++) 
            { 
                //
                int roomID = Convert.ToInt32(c_lv_rooms.Items[i].Text);
                if (3 <= c_lv_rooms.Items[i].SubItems.Count)
                {
                    c_lv_rooms.Items[i].SubItems[2].Text = server.roomGetUserCount(roomID).ToString();
                    c_lv_rooms.Items[i].SubItems[3].Text = (server.roomGetBW(roomID, true) >> 13) + " KiB/s";
                    c_lv_rooms.Items[i].SubItems[4].Text = (server.roomGetBW(roomID, false) >> 13) + " KiB/s";
                }
            }
        }

        private void srv_onRoomAddRemove(object sender, AxVCProX.IvcproRTPConfServerEvents_onRoomAddRemoveEvent e)
        {
            // new room was added, or some room was removed
            int newpos = evsetpoint;
            if (MAX_EVENTS <= ++newpos)
                newpos = 0;
            //
            vcevents[newpos] = e.isAdded ? e.roomID : -e.roomID;
            //
            evsetpoint = newpos;
        }

    }
}
