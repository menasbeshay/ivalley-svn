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
            ((System.ComponentModel.ISupportInitialize)(this.uisplitContainerMain)).BeginInit();
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
            // 
            // uisplitContainerMain.Panel2
            // 
            this.uisplitContainerMain.Panel2.AutoScroll = true;
            this.uisplitContainerMain.Size = new System.Drawing.Size(822, 593);
            this.uisplitContainerMain.SplitterDistance = 274;
            this.uisplitContainerMain.TabIndex = 0;
            // 
            // uiChatWindow
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.uisplitContainerMain);
            this.MinimumSize = new System.Drawing.Size(822, 593);
            this.Name = "uiChatWindow";
            this.Size = new System.Drawing.Size(822, 593);
            ((System.ComponentModel.ISupportInitialize)(this.uisplitContainerMain)).EndInit();
            this.uisplitContainerMain.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.SplitContainer uisplitContainerMain;
    }
}
