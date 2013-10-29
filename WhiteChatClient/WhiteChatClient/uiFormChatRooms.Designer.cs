namespace WhiteChatClient
{
    partial class uiFormChatRooms
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
            this.uiChatRoomWindow1 = new WhiteChatClient.UserControls.uiChatRoomWindow();
            this.SuspendLayout();
            // 
            // uiChatRoomWindow1
            // 
            this.uiChatRoomWindow1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.uiChatRoomWindow1.Location = new System.Drawing.Point(0, 0);
            this.uiChatRoomWindow1.MinimumSize = new System.Drawing.Size(806, 555);
            this.uiChatRoomWindow1.Name = "uiChatRoomWindow1";
            this.uiChatRoomWindow1.Size = new System.Drawing.Size(806, 555);
            this.uiChatRoomWindow1.TabIndex = 0;
            // 
            // uiFormChatRooms
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(806, 555);
            this.Controls.Add(this.uiChatRoomWindow1);
            this.MinimumSize = new System.Drawing.Size(822, 593);
            this.Name = "uiFormChatRooms";
            this.Text = "Chat Rooms";
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.uiFormChatRooms_FormClosed);
            this.ResumeLayout(false);

        }

        #endregion      

        private UserControls.uiChatRoomWindow uiChatRoomWindow1;

    }
}