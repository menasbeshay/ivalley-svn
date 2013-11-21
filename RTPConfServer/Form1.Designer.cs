using System.Collections.Generic;
using System.Collections.ObjectModel;

namespace RTPConfServer
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            this.server = new AxVCProX.AxvcproRTPConfServerX();
            this.c_edit_port = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.c_edit_b2ip = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.c_edit_key = new System.Windows.Forms.TextBox();
            this.c_cb_acr = new System.Windows.Forms.CheckBox();
            this.c_cb_arr = new System.Windows.Forms.CheckBox();
            this.c_button_start = new System.Windows.Forms.Button();
            this.c_button_stop = new System.Windows.Forms.Button();
            this.c_lv_rooms = new System.Windows.Forms.ListView();
            this.c_ch_roomID = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.c_ch_roomName = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.c_ch_numClients = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.c_ch_bwIn = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.c_ch_bwOut = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.c_timer_update = new System.Windows.Forms.Timer(this.components);
            this.label4 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.server)).BeginInit();
            this.SuspendLayout();
            // 
            // server
            // 
            this.server.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.server.Enabled = true;
            this.server.Location = new System.Drawing.Point(12, 164);
            this.server.Name = "server";
            this.server.OcxState = ((System.Windows.Forms.AxHost.State)(resources.GetObject("server.OcxState")));
            this.server.Size = new System.Drawing.Size(378, 67);
            this.server.TabIndex = 0;
            this.server.onRoomAddRemove += new AxVCProX.IvcproRTPConfServerEvents_onRoomAddRemoveEventHandler(this.srv_onRoomAddRemove);
            // 
            // c_edit_port
            // 
            this.c_edit_port.Location = new System.Drawing.Point(131, 40);
            this.c_edit_port.Name = "c_edit_port";
            this.c_edit_port.Size = new System.Drawing.Size(100, 20);
            this.c_edit_port.TabIndex = 1;
            this.c_edit_port.Text = "5555";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(128, 24);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(31, 13);
            this.label1.TabIndex = 2;
            this.label1.Text = "Port:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(234, 24);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(57, 13);
            this.label2.TabIndex = 4;
            this.label2.Text = "Bind to IP:";
            // 
            // c_edit_b2ip
            // 
            this.c_edit_b2ip.Location = new System.Drawing.Point(237, 40);
            this.c_edit_b2ip.Name = "c_edit_b2ip";
            this.c_edit_b2ip.Size = new System.Drawing.Size(137, 20);
            this.c_edit_b2ip.TabIndex = 3;
            this.c_edit_b2ip.Text = "192.168.1.100";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(128, 65);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(65, 13);
            this.label3.TabIndex = 6;
            this.label3.Text = "Master Key:";
            // 
            // c_edit_key
            // 
            this.c_edit_key.Location = new System.Drawing.Point(131, 81);
            this.c_edit_key.Name = "c_edit_key";
            this.c_edit_key.PasswordChar = '*';
            this.c_edit_key.Size = new System.Drawing.Size(243, 20);
            this.c_edit_key.TabIndex = 5;
            this.c_edit_key.Text = "123456";
            // 
            // c_cb_acr
            // 
            this.c_cb_acr.AutoSize = true;
            this.c_cb_acr.Checked = true;
            this.c_cb_acr.CheckState = System.Windows.Forms.CheckState.Checked;
            this.c_cb_acr.Enabled = false;
            this.c_cb_acr.Location = new System.Drawing.Point(131, 107);
            this.c_cb_acr.Name = "c_cb_acr";
            this.c_cb_acr.Size = new System.Drawing.Size(156, 17);
            this.c_cb_acr.TabIndex = 7;
            this.c_cb_acr.Text = "Automatically create rooms";
            this.c_cb_acr.UseVisualStyleBackColor = true;
            // 
            // c_cb_arr
            // 
            this.c_cb_arr.AutoSize = true;
            this.c_cb_arr.Checked = true;
            this.c_cb_arr.CheckState = System.Windows.Forms.CheckState.Checked;
            this.c_cb_arr.Location = new System.Drawing.Point(131, 130);
            this.c_cb_arr.Name = "c_cb_arr";
            this.c_cb_arr.Size = new System.Drawing.Size(161, 17);
            this.c_cb_arr.TabIndex = 8;
            this.c_cb_arr.Text = "Automatically remove rooms";
            this.c_cb_arr.UseVisualStyleBackColor = true;
            // 
            // c_button_start
            // 
            this.c_button_start.Location = new System.Drawing.Point(28, 52);
            this.c_button_start.Name = "c_button_start";
            this.c_button_start.Size = new System.Drawing.Size(75, 23);
            this.c_button_start.TabIndex = 9;
            this.c_button_start.Text = "Start";
            this.c_button_start.UseVisualStyleBackColor = true;
            this.c_button_start.Click += new System.EventHandler(this.button1_Click);
            // 
            // c_button_stop
            // 
            this.c_button_stop.Location = new System.Drawing.Point(28, 90);
            this.c_button_stop.Name = "c_button_stop";
            this.c_button_stop.Size = new System.Drawing.Size(75, 23);
            this.c_button_stop.TabIndex = 10;
            this.c_button_stop.Text = "Stop";
            this.c_button_stop.UseVisualStyleBackColor = true;
            this.c_button_stop.Click += new System.EventHandler(this.button2_Click);
            // 
            // c_lv_rooms
            // 
            this.c_lv_rooms.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.c_lv_rooms.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.c_ch_roomID,
            this.c_ch_roomName,
            this.c_ch_numClients,
            this.c_ch_bwIn,
            this.c_ch_bwOut});
            this.c_lv_rooms.FullRowSelect = true;
            this.c_lv_rooms.GridLines = true;
            this.c_lv_rooms.Location = new System.Drawing.Point(12, 237);
            this.c_lv_rooms.Name = "c_lv_rooms";
            this.c_lv_rooms.Size = new System.Drawing.Size(378, 227);
            this.c_lv_rooms.TabIndex = 12;
            this.c_lv_rooms.UseCompatibleStateImageBehavior = false;
            this.c_lv_rooms.View = System.Windows.Forms.View.Details;
            // 
            // c_ch_roomID
            // 
            this.c_ch_roomID.Text = "ID";
            this.c_ch_roomID.Width = 40;
            // 
            // c_ch_roomName
            // 
            this.c_ch_roomName.Text = "Name";
            this.c_ch_roomName.Width = 80;
            // 
            // c_ch_numClients
            // 
            this.c_ch_numClients.Text = "Clients";
            // 
            // c_ch_bwIn
            // 
            this.c_ch_bwIn.Text = "BW In";
            this.c_ch_bwIn.Width = 80;
            // 
            // c_ch_bwOut
            // 
            this.c_ch_bwOut.Text = "BW Out";
            this.c_ch_bwOut.Width = 80;
            // 
            // c_timer_update
            // 
            this.c_timer_update.Interval = 400;
            this.c_timer_update.Tick += new System.EventHandler(this.c_timer_main_Tick);
            // 
            // label4
            // 
            this.label4.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Bottom | System.Windows.Forms.AnchorStyles.Right)));
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(293, 481);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(108, 13);
            this.label4.TabIndex = 13;
            this.label4.Text = "(c) 2012 Lake of Soft";
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(412, 503);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.c_lv_rooms);
            this.Controls.Add(this.c_button_stop);
            this.Controls.Add(this.c_button_start);
            this.Controls.Add(this.c_cb_arr);
            this.Controls.Add(this.c_cb_acr);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.c_edit_key);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.c_edit_b2ip);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.c_edit_port);
            this.Controls.Add(this.server);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MinimumSize = new System.Drawing.Size(404, 432);
            this.Name = "Form1";
            this.Text = "VCX Library - RTP Conference Server sample";
            this.Shown += new System.EventHandler(this.Form1_Shown);
            ((System.ComponentModel.ISupportInitialize)(this.server)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private AxVCProX.AxvcproRTPConfServerX server;
        private System.Windows.Forms.TextBox c_edit_port;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox c_edit_b2ip;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox c_edit_key;
        private System.Windows.Forms.CheckBox c_cb_acr;
        private System.Windows.Forms.CheckBox c_cb_arr;
        private System.Windows.Forms.Button c_button_start;
        private System.Windows.Forms.Button c_button_stop;
        private System.Windows.Forms.ListView c_lv_rooms;
        private System.Windows.Forms.ColumnHeader c_ch_roomID;
        private System.Windows.Forms.ColumnHeader c_ch_roomName;
        private System.Windows.Forms.ColumnHeader c_ch_numClients;
        private System.Windows.Forms.ColumnHeader c_ch_bwIn;
        private System.Windows.Forms.Timer c_timer_update;
        private System.Windows.Forms.ColumnHeader c_ch_bwOut;
        private System.Windows.Forms.Label label4;
    }
}

