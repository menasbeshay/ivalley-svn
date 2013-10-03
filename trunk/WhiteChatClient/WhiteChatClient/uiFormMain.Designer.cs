namespace WhiteChatClient
{
    partial class uiFormMain
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
            this.uiPanelMain = new System.Windows.Forms.Panel();
            this.SuspendLayout();
            // 
            // uiPanelMain
            // 
            this.uiPanelMain.Dock = System.Windows.Forms.DockStyle.Fill;
            this.uiPanelMain.Location = new System.Drawing.Point(0, 0);
            this.uiPanelMain.Name = "uiPanelMain";
            this.uiPanelMain.Size = new System.Drawing.Size(806, 555);
            this.uiPanelMain.TabIndex = 0;
            // 
            // uiFormMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(806, 555);
            this.Controls.Add(this.uiPanelMain);
            this.MaximizeBox = false;
            this.MinimumSize = new System.Drawing.Size(822, 593);
            this.Name = "uiFormMain";
            this.Text = "White Chat";
            this.Load += new System.EventHandler(this.uiFormMain_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel uiPanelMain;

    }
}

