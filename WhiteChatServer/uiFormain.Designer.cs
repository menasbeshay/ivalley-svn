namespace WhiteChatServer
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
            this.panel1 = new System.Windows.Forms.Panel();
            this.panel2 = new System.Windows.Forms.Panel();
            this.uiTextBoxLog = new System.Windows.Forms.TextBox();
            this.panel2.SuspendLayout();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.Dock = System.Windows.Forms.DockStyle.Top;
            this.panel1.Location = new System.Drawing.Point(8, 8);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(522, 171);
            this.panel1.TabIndex = 0;
            // 
            // panel2
            // 
            this.panel2.Controls.Add(this.uiTextBoxLog);
            this.panel2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel2.Location = new System.Drawing.Point(8, 179);
            this.panel2.Name = "panel2";
            this.panel2.Size = new System.Drawing.Size(522, 213);
            this.panel2.TabIndex = 1;
            // 
            // uiTextBoxLog
            // 
            this.uiTextBoxLog.Dock = System.Windows.Forms.DockStyle.Fill;
            this.uiTextBoxLog.Location = new System.Drawing.Point(0, 0);
            this.uiTextBoxLog.Multiline = true;
            this.uiTextBoxLog.Name = "uiTextBoxLog";
            this.uiTextBoxLog.Size = new System.Drawing.Size(522, 213);
            this.uiTextBoxLog.TabIndex = 0;
            // 
            // uiFormMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(538, 400);
            this.Controls.Add(this.panel2);
            this.Controls.Add(this.panel1);
            this.Name = "uiFormMain";
            this.Text = "White Chat Server";
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.uiFormMain_FormClosed);            
            this.panel2.ResumeLayout(false);
            this.panel2.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Panel panel2;
        private System.Windows.Forms.TextBox uiTextBoxLog;
    }
}

