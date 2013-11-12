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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(uiChatRoomWindow));
            this.splitContainer2 = new System.Windows.Forms.SplitContainer();
            this.uiflowLayoutPanelMembers = new System.Windows.Forms.FlowLayoutPanel();
            this.splitContainer3 = new System.Windows.Forms.SplitContainer();
            this.uiRichTextBoxHistory = new System.Windows.Forms.RichTextBox();
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.uiRichTextBoxMsg = new System.Windows.Forms.RichTextBox();
            this.WaveOut = new AxVCProX.AxvcproWaveOutDeviceX();
            this.ClientX1 = new AxVCProX.AxvcproRTPConfClientX();
            this.WaveIn = new AxVCProX.AxvcproWaveInDeviceX();
            this.panel1 = new System.Windows.Forms.Panel();
            this.uitrackBarVolume = new System.Windows.Forms.TrackBar();
            this.uibuttonCall = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer2)).BeginInit();
            this.splitContainer2.Panel1.SuspendLayout();
            this.splitContainer2.Panel2.SuspendLayout();
            this.splitContainer2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer3)).BeginInit();
            this.splitContainer3.Panel1.SuspendLayout();
            this.splitContainer3.Panel2.SuspendLayout();
            this.splitContainer3.SuspendLayout();
            this.tableLayoutPanel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.WaveOut)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.ClientX1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.WaveIn)).BeginInit();
            this.panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.uitrackBarVolume)).BeginInit();
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
            this.splitContainer3.Panel2.Controls.Add(this.tableLayoutPanel1);
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
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.ColumnCount = 4;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 35.34483F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 64.65517F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 133F));
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 342F));
            this.tableLayoutPanel1.Controls.Add(this.uiRichTextBoxMsg, 0, 1);
            this.tableLayoutPanel1.Controls.Add(this.WaveOut, 1, 0);
            this.tableLayoutPanel1.Controls.Add(this.ClientX1, 2, 0);
            this.tableLayoutPanel1.Controls.Add(this.WaveIn, 0, 0);
            this.tableLayoutPanel1.Controls.Add(this.panel1, 3, 0);
            this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 2;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tableLayoutPanel1.Size = new System.Drawing.Size(572, 85);
            this.tableLayoutPanel1.TabIndex = 0;
            // 
            // uiRichTextBoxMsg
            // 
            this.tableLayoutPanel1.SetColumnSpan(this.uiRichTextBoxMsg, 4);
            this.uiRichTextBoxMsg.Dock = System.Windows.Forms.DockStyle.Fill;
            this.uiRichTextBoxMsg.Location = new System.Drawing.Point(3, 45);
            this.uiRichTextBoxMsg.Name = "uiRichTextBoxMsg";
            this.uiRichTextBoxMsg.Size = new System.Drawing.Size(566, 37);
            this.uiRichTextBoxMsg.TabIndex = 2;
            this.uiRichTextBoxMsg.Text = "";
            // 
            // WaveOut
            // 
            this.WaveOut.Enabled = true;
            this.WaveOut.Location = new System.Drawing.Point(37, 3);
            this.WaveOut.Name = "WaveOut";
            this.WaveOut.OcxState = ((System.Windows.Forms.AxHost.State)(resources.GetObject("WaveOut.OcxState")));
            this.WaveOut.Size = new System.Drawing.Size(56, 23);
            this.WaveOut.TabIndex = 4;
            this.WaveOut.Visible = false;
            // 
            // ClientX1
            // 
            this.ClientX1.Enabled = true;
            this.ClientX1.Location = new System.Drawing.Point(99, 3);
            this.ClientX1.Name = "ClientX1";
            this.ClientX1.OcxState = ((System.Windows.Forms.AxHost.State)(resources.GetObject("ClientX1.OcxState")));
            this.ClientX1.Size = new System.Drawing.Size(72, 23);
            this.ClientX1.TabIndex = 5;
            this.ClientX1.Visible = false;
            // 
            // WaveIn
            // 
            this.WaveIn.Enabled = true;
            this.WaveIn.Location = new System.Drawing.Point(3, 3);
            this.WaveIn.Name = "WaveIn";
            this.WaveIn.OcxState = ((System.Windows.Forms.AxHost.State)(resources.GetObject("WaveIn.OcxState")));
            this.WaveIn.Size = new System.Drawing.Size(28, 23);
            this.WaveIn.TabIndex = 3;
            this.WaveIn.Visible = false;
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.uitrackBarVolume);
            this.panel1.Controls.Add(this.uibuttonCall);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel1.Location = new System.Drawing.Point(232, 3);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(337, 36);
            this.panel1.TabIndex = 6;
            // 
            // uitrackBarVolume
            // 
            this.uitrackBarVolume.Location = new System.Drawing.Point(125, 3);
            this.uitrackBarVolume.Maximum = 100;
            this.uitrackBarVolume.Name = "uitrackBarVolume";
            this.uitrackBarVolume.Size = new System.Drawing.Size(120, 45);
            this.uitrackBarVolume.TabIndex = 3;
            this.uitrackBarVolume.TickStyle = System.Windows.Forms.TickStyle.None;
            this.uitrackBarVolume.Value = 50;
            this.uitrackBarVolume.Scroll += new System.EventHandler(this.uitrackBarVolume_Scroll);
            // 
            // uibuttonCall
            // 
            this.uibuttonCall.Location = new System.Drawing.Point(269, 3);
            this.uibuttonCall.Name = "uibuttonCall";
            this.uibuttonCall.Size = new System.Drawing.Size(53, 24);
            this.uibuttonCall.TabIndex = 2;
            this.uibuttonCall.Text = "Call";
            this.uibuttonCall.UseVisualStyleBackColor = true;
            this.uibuttonCall.Click += new System.EventHandler(this.uibuttonCall_Click);
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
            this.tableLayoutPanel1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.WaveOut)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.ClientX1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.WaveIn)).EndInit();
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.uitrackBarVolume)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.SplitContainer splitContainer2;
        private System.Windows.Forms.FlowLayoutPanel uiflowLayoutPanelMembers;
        private System.Windows.Forms.SplitContainer splitContainer3;
        private System.Windows.Forms.RichTextBox uiRichTextBoxHistory;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        private System.Windows.Forms.RichTextBox uiRichTextBoxMsg;
        private AxVCProX.AxvcproWaveOutDeviceX WaveOut;
        private AxVCProX.AxvcproRTPConfClientX ClientX1;
        private AxVCProX.AxvcproWaveInDeviceX WaveIn;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.TrackBar uitrackBarVolume;
        private System.Windows.Forms.Button uibuttonCall;

    }
}
