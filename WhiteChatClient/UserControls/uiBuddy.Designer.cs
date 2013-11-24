namespace WhiteChatClient.UserControls
{
    partial class uiBuddy
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

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.uilabelName = new System.Windows.Forms.Label();
            this.uicontextMenuStripRightClick = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.uitoolStripMenuItemDeleteBuddy = new System.Windows.Forms.ToolStripMenuItem();
            this.uipictureBoxStatus = new System.Windows.Forms.PictureBox();
            this.uipictureBoxProfile = new System.Windows.Forms.PictureBox();
            this.uicontextMenuStripRightClick.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.uipictureBoxStatus)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.uipictureBoxProfile)).BeginInit();
            this.SuspendLayout();
            // 
            // uilabelName
            // 
            this.uilabelName.AutoSize = true;
            this.uilabelName.Location = new System.Drawing.Point(75, 5);
            this.uilabelName.Name = "uilabelName";
            this.uilabelName.Size = new System.Drawing.Size(35, 13);
            this.uilabelName.TabIndex = 1;
            this.uilabelName.Text = "label1";
            this.uilabelName.Click += new System.EventHandler(this.uiBuddy_Enter);
            this.uilabelName.DoubleClick += new System.EventHandler(this.Control_DoubleClick);
            // 
            // uicontextMenuStripRightClick
            // 
            this.uicontextMenuStripRightClick.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.uitoolStripMenuItemDeleteBuddy});
            this.uicontextMenuStripRightClick.Name = "uicontextMenuStripRightClick";
            this.uicontextMenuStripRightClick.Size = new System.Drawing.Size(108, 26);
            this.uicontextMenuStripRightClick.ItemClicked += new System.Windows.Forms.ToolStripItemClickedEventHandler(this.uicontextMenuStripRightClick_ItemClicked);
            // 
            // uitoolStripMenuItemDeleteBuddy
            // 
            this.uitoolStripMenuItemDeleteBuddy.Name = "uitoolStripMenuItemDeleteBuddy";
            this.uitoolStripMenuItemDeleteBuddy.Size = new System.Drawing.Size(107, 22);
            this.uitoolStripMenuItemDeleteBuddy.Text = "Delete";
            // 
            // uipictureBoxStatus
            // 
            this.uipictureBoxStatus.BackColor = System.Drawing.Color.Transparent;
            this.uipictureBoxStatus.Location = new System.Drawing.Point(51, 4);
            this.uipictureBoxStatus.Name = "uipictureBoxStatus";
            this.uipictureBoxStatus.Size = new System.Drawing.Size(16, 16);
            this.uipictureBoxStatus.TabIndex = 2;
            this.uipictureBoxStatus.TabStop = false;
            this.uipictureBoxStatus.Click += new System.EventHandler(this.uiBuddy_Enter);
            this.uipictureBoxStatus.DoubleClick += new System.EventHandler(this.Control_DoubleClick);
            // 
            // uipictureBoxProfile
            // 
            this.uipictureBoxProfile.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.uipictureBoxProfile.Location = new System.Drawing.Point(20, 3);
            this.uipictureBoxProfile.Name = "uipictureBoxProfile";
            this.uipictureBoxProfile.Size = new System.Drawing.Size(18, 18);
            this.uipictureBoxProfile.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.uipictureBoxProfile.TabIndex = 0;
            this.uipictureBoxProfile.TabStop = false;
            this.uipictureBoxProfile.Click += new System.EventHandler(this.uiBuddy_Enter);
            this.uipictureBoxProfile.DoubleClick += new System.EventHandler(this.Control_DoubleClick);
            // 
            // uiBuddy
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.White;
            this.ContextMenuStrip = this.uicontextMenuStripRightClick;
            this.Controls.Add(this.uipictureBoxStatus);
            this.Controls.Add(this.uilabelName);
            this.Controls.Add(this.uipictureBoxProfile);
            this.Margin = new System.Windows.Forms.Padding(0);
            this.Name = "uiBuddy";
            this.Size = new System.Drawing.Size(166, 22);
            this.Enter += new System.EventHandler(this.uiBuddy_Enter);
            this.Leave += new System.EventHandler(this.uiBuddy_Leave);
            this.uicontextMenuStripRightClick.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.uipictureBoxStatus)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.uipictureBoxProfile)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.PictureBox uipictureBoxProfile;
        private System.Windows.Forms.Label uilabelName;
        private System.Windows.Forms.PictureBox uipictureBoxStatus;
        private System.Windows.Forms.ContextMenuStrip uicontextMenuStripRightClick;
        private System.Windows.Forms.ToolStripMenuItem uitoolStripMenuItemDeleteBuddy;
    }
}
