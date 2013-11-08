namespace WhiteChatClient.UserControls
{
    partial class uiChatRoomWindow
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
            this.splitContainer2 = new System.Windows.Forms.SplitContainer();
            this.uiflowLayoutPanelMembers = new System.Windows.Forms.FlowLayoutPanel();
            this.splitContainer3 = new System.Windows.Forms.SplitContainer();
            this.uiRichTextBoxHistory = new System.Windows.Forms.RichTextBox();
            this.uiRichTextBoxMsg = new System.Windows.Forms.RichTextBox();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer2)).BeginInit();
            this.splitContainer2.Panel1.SuspendLayout();
            this.splitContainer2.Panel2.SuspendLayout();
            this.splitContainer2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer3)).BeginInit();
            this.splitContainer3.Panel1.SuspendLayout();
            this.splitContainer3.Panel2.SuspendLayout();
            this.splitContainer3.SuspendLayout();
            this.SuspendLayout();
            // 
            // splitContainer2
            // 
            this.splitContainer2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainer2.Location = new System.Drawing.Point(0, 0);
            this.splitContainer2.Name = "splitContainer2";
            // 
            // splitContainer2.Panel1
            // 
            this.splitContainer2.Panel1.Controls.Add(this.uiflowLayoutPanelMembers);
            // 
            // splitContainer2.Panel2
            // 
            this.splitContainer2.Panel2.Controls.Add(this.splitContainer3);
            this.splitContainer2.Size = new System.Drawing.Size(806, 555);
            this.splitContainer2.SplitterDistance = 230;
            this.splitContainer2.TabIndex = 1;
            // 
            // uiflowLayoutPanelMembers
            // 
            this.uiflowLayoutPanelMembers.AutoScroll = true;
            this.uiflowLayoutPanelMembers.BackColor = System.Drawing.Color.White;
            this.uiflowLayoutPanelMembers.Dock = System.Windows.Forms.DockStyle.Fill;
            this.uiflowLayoutPanelMembers.FlowDirection = System.Windows.Forms.FlowDirection.TopDown;
            this.uiflowLayoutPanelMembers.Location = new System.Drawing.Point(0, 0);
            this.uiflowLayoutPanelMembers.Name = "uiflowLayoutPanelMembers";
            this.uiflowLayoutPanelMembers.Size = new System.Drawing.Size(230, 555);
            this.uiflowLayoutPanelMembers.TabIndex = 0;
            // 
            // splitContainer3
            // 
            this.splitContainer3.BackColor = System.Drawing.SystemColors.InactiveBorder;
            this.splitContainer3.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainer3.Location = new System.Drawing.Point(0, 0);
            this.splitContainer3.Name = "splitContainer3";
            this.splitContainer3.Orientation = System.Windows.Forms.Orientation.Horizontal;
            // 
            // splitContainer3.Panel1
            // 
            this.splitContainer3.Panel1.BackColor = System.Drawing.Color.White;
            this.splitContainer3.Panel1.Controls.Add(this.uiRichTextBoxHistory);
            // 
            // splitContainer3.Panel2
            // 
            this.splitContainer3.Panel2.BackColor = System.Drawing.Color.White;
            this.splitContainer3.Panel2.Controls.Add(this.uiRichTextBoxMsg);
            this.splitContainer3.Size = new System.Drawing.Size(572, 555);
            this.splitContainer3.SplitterDistance = 466;
            this.splitContainer3.TabIndex = 1;
            // 
            // uiRichTextBoxHistory
            // 
            this.uiRichTextBoxHistory.BackColor = System.Drawing.Color.White;
            this.uiRichTextBoxHistory.Dock = System.Windows.Forms.DockStyle.Fill;
            this.uiRichTextBoxHistory.Location = new System.Drawing.Point(0, 0);
            this.uiRichTextBoxHistory.Name = "uiRichTextBoxHistory";
            this.uiRichTextBoxHistory.ReadOnly = true;
            this.uiRichTextBoxHistory.Size = new System.Drawing.Size(572, 466);
            this.uiRichTextBoxHistory.TabIndex = 0;
            this.uiRichTextBoxHistory.Text = "";
            // 
            // uiRichTextBoxMsg
            // 
            this.uiRichTextBoxMsg.Dock = System.Windows.Forms.DockStyle.Fill;
            this.uiRichTextBoxMsg.Location = new System.Drawing.Point(0, 0);
            this.uiRichTextBoxMsg.Name = "uiRichTextBoxMsg";
            this.uiRichTextBoxMsg.Size = new System.Drawing.Size(572, 85);
            this.uiRichTextBoxMsg.TabIndex = 0;
            this.uiRichTextBoxMsg.Text = "";
            this.uiRichTextBoxMsg.KeyDown += new System.Windows.Forms.KeyEventHandler(this.uiRichTextBoxMsg_KeyDown);
            // 
            // uiChatRoomWindow
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.splitContainer2);
            this.MinimumSize = new System.Drawing.Size(806, 555);
            this.Name = "uiChatRoomWindow";
            this.Size = new System.Drawing.Size(806, 555);
            this.splitContainer2.Panel1.ResumeLayout(false);
            this.splitContainer2.Panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer2)).EndInit();
            this.splitContainer2.ResumeLayout(false);
            this.splitContainer3.Panel1.ResumeLayout(false);
            this.splitContainer3.Panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer3)).EndInit();
            this.splitContainer3.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.SplitContainer splitContainer2;
        private System.Windows.Forms.FlowLayoutPanel uiflowLayoutPanelMembers;
        private System.Windows.Forms.SplitContainer splitContainer3;
        private System.Windows.Forms.RichTextBox uiRichTextBoxHistory;
        private System.Windows.Forms.RichTextBox uiRichTextBoxMsg;

    }
}
