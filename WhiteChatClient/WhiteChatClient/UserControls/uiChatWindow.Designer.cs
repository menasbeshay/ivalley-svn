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
            ((System.ComponentModel.ISupportInitialize)(this.uisplitContainerMain)).BeginInit();
            this.uisplitContainerMain.Panel1.SuspendLayout();
            this.uisplitContainerMain.SuspendLayout();
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
            this.uisplitContainerMain.Size = new System.Drawing.Size(822, 593);
            this.uisplitContainerMain.SplitterDistance = 274;
            this.uisplitContainerMain.TabIndex = 0;
            // 
            // uiflowLayoutPanelBuddies
            // 
            this.uiflowLayoutPanelBuddies.AutoScroll = true;
            this.uiflowLayoutPanelBuddies.FlowDirection = System.Windows.Forms.FlowDirection.TopDown;
            this.uiflowLayoutPanelBuddies.Location = new System.Drawing.Point(3, 144);
            this.uiflowLayoutPanelBuddies.Name = "uiflowLayoutPanelBuddies";
            this.uiflowLayoutPanelBuddies.Size = new System.Drawing.Size(268, 446);
            this.uiflowLayoutPanelBuddies.TabIndex = 1;
            this.uiflowLayoutPanelBuddies.WrapContents = false;
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
            ((System.ComponentModel.ISupportInitialize)(this.uisplitContainerMain)).EndInit();
            this.uisplitContainerMain.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.SplitContainer uisplitContainerMain;
        private System.Windows.Forms.FlowLayoutPanel uiflowLayoutPanelBuddies;
    }
}
