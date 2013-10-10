namespace WhiteChatClient.UserControls
{
    partial class uiChatWindow
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
            this.uisplitContainerMain = new System.Windows.Forms.SplitContainer();
            this.uiflowLayoutPanelBuddies = new System.Windows.Forms.FlowLayoutPanel();
            this.splitContainer1 = new System.Windows.Forms.SplitContainer();
            this.uiRichTextBoxHistory = new System.Windows.Forms.RichTextBox();
            this.uiRichTextBoxMsg = new System.Windows.Forms.RichTextBox();
            ((System.ComponentModel.ISupportInitialize)(this.uisplitContainerMain)).BeginInit();
            this.uisplitContainerMain.Panel1.SuspendLayout();
            this.uisplitContainerMain.Panel2.SuspendLayout();
            this.uisplitContainerMain.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).BeginInit();
            this.splitContainer1.Panel1.SuspendLayout();
            this.splitContainer1.Panel2.SuspendLayout();
            this.splitContainer1.SuspendLayout();
            this.SuspendLayout();
            // 
            // uisplitContainerMain
            // 
            this.uisplitContainerMain.Dock = System.Windows.Forms.DockStyle.Fill;
            this.uisplitContainerMain.Location = new System.Drawing.Point(0, 0);
            this.uisplitContainerMain.Name = "uisplitContainerMain";
            // 
            // uisplitContainerMain.Panel1
            // 
            this.uisplitContainerMain.Panel1.AutoScroll = true;
            this.uisplitContainerMain.Panel1.BackColor = System.Drawing.SystemColors.Window;
            this.uisplitContainerMain.Panel1.Controls.Add(this.uiflowLayoutPanelBuddies);
            // 
            // uisplitContainerMain.Panel2
            // 
            this.uisplitContainerMain.Panel2.AutoScroll = true;
            this.uisplitContainerMain.Panel2.BackColor = System.Drawing.SystemColors.Window;
            this.uisplitContainerMain.Panel2.Controls.Add(this.splitContainer1);
            this.uisplitContainerMain.Size = new System.Drawing.Size(822, 593);
            this.uisplitContainerMain.SplitterDistance = 274;
            this.uisplitContainerMain.TabIndex = 0;
            // 
            // uiflowLayoutPanelBuddies
            // 
            this.uiflowLayoutPanelBuddies.AutoScroll = true;
            this.uiflowLayoutPanelBuddies.Dock = System.Windows.Forms.DockStyle.Fill;
            this.uiflowLayoutPanelBuddies.FlowDirection = System.Windows.Forms.FlowDirection.TopDown;
            this.uiflowLayoutPanelBuddies.Location = new System.Drawing.Point(0, 0);
            this.uiflowLayoutPanelBuddies.Name = "uiflowLayoutPanelBuddies";
            this.uiflowLayoutPanelBuddies.Size = new System.Drawing.Size(274, 593);
            this.uiflowLayoutPanelBuddies.TabIndex = 1;
            this.uiflowLayoutPanelBuddies.WrapContents = false;
            // 
            // splitContainer1
            // 
            this.splitContainer1.BackColor = System.Drawing.SystemColors.InactiveBorder;
            this.splitContainer1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainer1.Location = new System.Drawing.Point(0, 0);
            this.splitContainer1.Name = "splitContainer1";
            this.splitContainer1.Orientation = System.Windows.Forms.Orientation.Horizontal;
            // 
            // splitContainer1.Panel1
            // 
            this.splitContainer1.Panel1.BackColor = System.Drawing.Color.White;
            this.splitContainer1.Panel1.Controls.Add(this.uiRichTextBoxHistory);
            // 
            // splitContainer1.Panel2
            // 
            this.splitContainer1.Panel2.BackColor = System.Drawing.Color.White;
            this.splitContainer1.Panel2.Controls.Add(this.uiRichTextBoxMsg);
            this.splitContainer1.Size = new System.Drawing.Size(544, 593);
            this.splitContainer1.SplitterDistance = 500;
            this.splitContainer1.TabIndex = 0;
            // 
            // uiRichTextBoxHistory
            // 
            this.uiRichTextBoxHistory.BackColor = System.Drawing.Color.White;
            this.uiRichTextBoxHistory.Dock = System.Windows.Forms.DockStyle.Fill;
            this.uiRichTextBoxHistory.Location = new System.Drawing.Point(0, 0);
            this.uiRichTextBoxHistory.Name = "uiRichTextBoxHistory";
            this.uiRichTextBoxHistory.ReadOnly = true;
            this.uiRichTextBoxHistory.Size = new System.Drawing.Size(544, 500);
            this.uiRichTextBoxHistory.TabIndex = 0;
            this.uiRichTextBoxHistory.Text = "";
            // 
            // uiRichTextBoxMsg
            // 
            this.uiRichTextBoxMsg.Dock = System.Windows.Forms.DockStyle.Fill;
            this.uiRichTextBoxMsg.Location = new System.Drawing.Point(0, 0);
            this.uiRichTextBoxMsg.Name = "uiRichTextBoxMsg";
            this.uiRichTextBoxMsg.Size = new System.Drawing.Size(544, 89);
            this.uiRichTextBoxMsg.TabIndex = 0;
            this.uiRichTextBoxMsg.Text = "";
            this.uiRichTextBoxMsg.KeyDown += new System.Windows.Forms.KeyEventHandler(this.uiRichTextBoxMsg_KeyDown);
            // 
            // uiChatWindow
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.uisplitContainerMain);
            this.MinimumSize = new System.Drawing.Size(822, 593);
            this.Name = "uiChatWindow";
            this.Size = new System.Drawing.Size(822, 593);
            this.uisplitContainerMain.Panel1.ResumeLayout(false);
            this.uisplitContainerMain.Panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.uisplitContainerMain)).EndInit();
            this.uisplitContainerMain.ResumeLayout(false);
            this.splitContainer1.Panel1.ResumeLayout(false);
            this.splitContainer1.Panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).EndInit();
            this.splitContainer1.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.SplitContainer uisplitContainerMain;
        private System.Windows.Forms.FlowLayoutPanel uiflowLayoutPanelBuddies;
        private System.Windows.Forms.SplitContainer splitContainer1;
        private System.Windows.Forms.RichTextBox uiRichTextBoxHistory;
        private System.Windows.Forms.RichTextBox uiRichTextBoxMsg;
    }
}
