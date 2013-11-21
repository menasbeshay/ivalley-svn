namespace WhiteChatClient
{
    partial class uiFormChat
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
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.splitContainer1 = new System.Windows.Forms.SplitContainer();
            this.uiRichTextBoxHistory = new Khendys.Controls.ExRichTextBox();
            this.tableLayoutPanel2 = new System.Windows.Forms.TableLayoutPanel();
            this.uiRichTextBoxMsg = new Khendys.Controls.ExRichTextBox();
            this.tableLayoutPanel3 = new System.Windows.Forms.TableLayoutPanel();
            this.uibuttonSend = new System.Windows.Forms.Button();
            this.panel1 = new System.Windows.Forms.Panel();
            this.uilabelTyping = new System.Windows.Forms.Label();
            this.tableLayoutPanel4 = new System.Windows.Forms.TableLayoutPanel();
            this.uicomboBoxFont = new System.Windows.Forms.ComboBox();
            this.uicomboBoxFontSize = new System.Windows.Forms.ComboBox();
            this.uibuttonColor = new System.Windows.Forms.Button();
            this.uicheckBoxBold = new System.Windows.Forms.CheckBox();
            this.uicheckBoxItalic = new System.Windows.Forms.CheckBox();
            this.uicheckBoxUnderline = new System.Windows.Forms.CheckBox();
            this.colorDialog1 = new System.Windows.Forms.ColorDialog();
            this.tableLayoutPanel1.SuspendLayout();
            this.splitContainer1.Panel1.SuspendLayout();
            this.splitContainer1.Panel2.SuspendLayout();
            this.splitContainer1.SuspendLayout();
            this.tableLayoutPanel2.SuspendLayout();
            this.tableLayoutPanel3.SuspendLayout();
            this.panel1.SuspendLayout();
            this.tableLayoutPanel4.SuspendLayout();
            this.SuspendLayout();
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.ColumnCount = 1;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tableLayoutPanel1.Controls.Add(this.splitContainer1, 0, 1);
            this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 2;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 6.111111F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 93.88889F));
            this.tableLayoutPanel1.Size = new System.Drawing.Size(675, 374);
            this.tableLayoutPanel1.TabIndex = 0;
            // 
            // splitContainer1
            // 
            this.splitContainer1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainer1.Location = new System.Drawing.Point(3, 25);
            this.splitContainer1.Name = "splitContainer1";
            this.splitContainer1.Orientation = System.Windows.Forms.Orientation.Horizontal;
            // 
            // splitContainer1.Panel1
            // 
            this.splitContainer1.Panel1.Controls.Add(this.uiRichTextBoxHistory);
            // 
            // splitContainer1.Panel2
            // 
            this.splitContainer1.Panel2.Controls.Add(this.tableLayoutPanel2);
            this.splitContainer1.Size = new System.Drawing.Size(669, 346);
            this.splitContainer1.SplitterDistance = 186;
            this.splitContainer1.SplitterWidth = 2;
            this.splitContainer1.TabIndex = 0;
            // 
            // uiRichTextBoxHistory
            // 
            this.uiRichTextBoxHistory.BackColor = System.Drawing.Color.White;
            this.uiRichTextBoxHistory.Cursor = System.Windows.Forms.Cursors.Arrow;
            this.uiRichTextBoxHistory.Dock = System.Windows.Forms.DockStyle.Fill;
            this.uiRichTextBoxHistory.HiglightColor = Khendys.Controls.RtfColor.White;
            this.uiRichTextBoxHistory.Location = new System.Drawing.Point(0, 0);
            this.uiRichTextBoxHistory.Margin = new System.Windows.Forms.Padding(3, 3, 3, 0);
            this.uiRichTextBoxHistory.Name = "uiRichTextBoxHistory";
            this.uiRichTextBoxHistory.ReadOnly = true;
            this.uiRichTextBoxHistory.Size = new System.Drawing.Size(669, 186);
            this.uiRichTextBoxHistory.TabIndex = 0;
            this.uiRichTextBoxHistory.Text = global::WhiteChatClient.Properties.Resources.username;
            this.uiRichTextBoxHistory.TextColor = Khendys.Controls.RtfColor.Black;
            // 
            // tableLayoutPanel2
            // 
            this.tableLayoutPanel2.ColumnCount = 2;
            this.tableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tableLayoutPanel2.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 80F));
            this.tableLayoutPanel2.Controls.Add(this.uiRichTextBoxMsg, 0, 2);
            this.tableLayoutPanel2.Controls.Add(this.tableLayoutPanel3, 1, 2);
            this.tableLayoutPanel2.Controls.Add(this.panel1, 0, 0);
            this.tableLayoutPanel2.Controls.Add(this.tableLayoutPanel4, 0, 1);
            this.tableLayoutPanel2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel2.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel2.Margin = new System.Windows.Forms.Padding(0);
            this.tableLayoutPanel2.Name = "tableLayoutPanel2";
            this.tableLayoutPanel2.RowCount = 3;
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 20F));
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 20.89552F));
            this.tableLayoutPanel2.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 79.10448F));
            this.tableLayoutPanel2.Size = new System.Drawing.Size(669, 158);
            this.tableLayoutPanel2.TabIndex = 0;
            // 
            // uiRichTextBoxMsg
            // 
            this.uiRichTextBoxMsg.Dock = System.Windows.Forms.DockStyle.Fill;
            this.uiRichTextBoxMsg.HiglightColor = Khendys.Controls.RtfColor.White;
            this.uiRichTextBoxMsg.Location = new System.Drawing.Point(3, 51);
            this.uiRichTextBoxMsg.Name = "uiRichTextBoxMsg";
            this.uiRichTextBoxMsg.Size = new System.Drawing.Size(583, 104);
            this.uiRichTextBoxMsg.TabIndex = 0;
            this.uiRichTextBoxMsg.Text = global::WhiteChatClient.Properties.Resources.username;
            this.uiRichTextBoxMsg.TextColor = Khendys.Controls.RtfColor.Black;
            this.uiRichTextBoxMsg.KeyDown += new System.Windows.Forms.KeyEventHandler(this.uiRichTextBoxMsg_KeyDown);
            // 
            // tableLayoutPanel3
            // 
            this.tableLayoutPanel3.ColumnCount = 1;
            this.tableLayoutPanel3.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 74F));
            this.tableLayoutPanel3.Controls.Add(this.uibuttonSend, 0, 1);
            this.tableLayoutPanel3.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel3.Location = new System.Drawing.Point(592, 51);
            this.tableLayoutPanel3.Name = "tableLayoutPanel3";
            this.tableLayoutPanel3.RowCount = 3;
            this.tableLayoutPanel3.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 20F));
            this.tableLayoutPanel3.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 60F));
            this.tableLayoutPanel3.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 20F));
            this.tableLayoutPanel3.Size = new System.Drawing.Size(74, 104);
            this.tableLayoutPanel3.TabIndex = 1;
            // 
            // uibuttonSend
            // 
            this.uibuttonSend.Location = new System.Drawing.Point(3, 23);
            this.uibuttonSend.Name = "uibuttonSend";
            this.uibuttonSend.Size = new System.Drawing.Size(65, 47);
            this.uibuttonSend.TabIndex = 2;
            this.uibuttonSend.Text = "Send";
            this.uibuttonSend.UseVisualStyleBackColor = true;
            this.uibuttonSend.Click += new System.EventHandler(this.uibuttonSend_Click);
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.uilabelTyping);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel1.Location = new System.Drawing.Point(0, 0);
            this.panel1.Margin = new System.Windows.Forms.Padding(0);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(589, 20);
            this.panel1.TabIndex = 2;
            // 
            // uilabelTyping
            // 
            this.uilabelTyping.AutoSize = true;
            this.uilabelTyping.Font = new System.Drawing.Font("Tahoma", 8F, System.Drawing.FontStyle.Italic);
            this.uilabelTyping.Location = new System.Drawing.Point(7, 4);
            this.uilabelTyping.Name = "uilabelTyping";
            this.uilabelTyping.Size = new System.Drawing.Size(0, 13);
            this.uilabelTyping.TabIndex = 0;
            this.uilabelTyping.Visible = false;
            // 
            // tableLayoutPanel4
            // 
            this.tableLayoutPanel4.ColumnCount = 8;
            this.tableLayoutPanel4.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 17F));
            this.tableLayoutPanel4.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 39F));
            this.tableLayoutPanel4.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 41F));
            this.tableLayoutPanel4.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 40F));
            this.tableLayoutPanel4.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 79F));
            this.tableLayoutPanel4.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 138F));
            this.tableLayoutPanel4.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 52F));
            this.tableLayoutPanel4.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Absolute, 183F));
            this.tableLayoutPanel4.Controls.Add(this.uicomboBoxFont, 5, 0);
            this.tableLayoutPanel4.Controls.Add(this.uicomboBoxFontSize, 6, 0);
            this.tableLayoutPanel4.Controls.Add(this.uibuttonColor, 4, 0);
            this.tableLayoutPanel4.Controls.Add(this.uicheckBoxBold, 1, 0);
            this.tableLayoutPanel4.Controls.Add(this.uicheckBoxItalic, 2, 0);
            this.tableLayoutPanel4.Controls.Add(this.uicheckBoxUnderline, 3, 0);
            this.tableLayoutPanel4.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel4.Location = new System.Drawing.Point(0, 20);
            this.tableLayoutPanel4.Margin = new System.Windows.Forms.Padding(0);
            this.tableLayoutPanel4.Name = "tableLayoutPanel4";
            this.tableLayoutPanel4.RowCount = 1;
            this.tableLayoutPanel4.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 100F));
            this.tableLayoutPanel4.Size = new System.Drawing.Size(589, 28);
            this.tableLayoutPanel4.TabIndex = 3;
            // 
            // uicomboBoxFont
            // 
            this.uicomboBoxFont.FormattingEnabled = true;
            this.uicomboBoxFont.Location = new System.Drawing.Point(219, 3);
            this.uicomboBoxFont.Name = "uicomboBoxFont";
            this.uicomboBoxFont.Size = new System.Drawing.Size(124, 21);
            this.uicomboBoxFont.TabIndex = 4;
            this.uicomboBoxFont.SelectedIndexChanged += new System.EventHandler(this.uicomboBoxFont_SelectedIndexChanged);
            // 
            // uicomboBoxFontSize
            // 
            this.uicomboBoxFontSize.FormattingEnabled = true;
            this.uicomboBoxFontSize.Items.AddRange(new object[] {
            "6",
            "7",
            "8",
            "9",
            "10",
            "11",
            "12",
            "13",
            "14",
            "15",
            "16",
            "17",
            "18",
            "19",
            "20",
            "21",
            "22",
            "23",
            "24",
            "25",
            "26",
            "27",
            "28",
            "29",
            "30",
            "31",
            "32"});
            this.uicomboBoxFontSize.Location = new System.Drawing.Point(357, 3);
            this.uicomboBoxFontSize.Name = "uicomboBoxFontSize";
            this.uicomboBoxFontSize.Size = new System.Drawing.Size(38, 21);
            this.uicomboBoxFontSize.TabIndex = 5;
            this.uicomboBoxFontSize.SelectedIndexChanged += new System.EventHandler(this.uicomboBoxFontSize_SelectedIndexChanged);
            // 
            // uibuttonColor
            // 
            this.uibuttonColor.Location = new System.Drawing.Point(140, 3);
            this.uibuttonColor.Name = "uibuttonColor";
            this.uibuttonColor.Size = new System.Drawing.Size(45, 22);
            this.uibuttonColor.TabIndex = 6;
            this.uibuttonColor.Text = "Color";
            this.uibuttonColor.UseVisualStyleBackColor = true;
            this.uibuttonColor.Click += new System.EventHandler(this.uibuttonColor_Click);
            // 
            // uicheckBoxBold
            // 
            this.uicheckBoxBold.Appearance = System.Windows.Forms.Appearance.Button;
            this.uicheckBoxBold.AutoSize = true;
            this.uicheckBoxBold.FlatAppearance.BorderSize = 0;
            this.uicheckBoxBold.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.uicheckBoxBold.Font = new System.Drawing.Font("Tahoma", 8F, System.Drawing.FontStyle.Bold);
            this.uicheckBoxBold.Location = new System.Drawing.Point(20, 3);
            this.uicheckBoxBold.Name = "uicheckBoxBold";
            this.uicheckBoxBold.Size = new System.Drawing.Size(24, 22);
            this.uicheckBoxBold.TabIndex = 7;
            this.uicheckBoxBold.Text = "B";
            this.uicheckBoxBold.UseVisualStyleBackColor = true;
            this.uicheckBoxBold.CheckedChanged += new System.EventHandler(this.uicheckBoxBold_CheckedChanged);
            // 
            // uicheckBoxItalic
            // 
            this.uicheckBoxItalic.Appearance = System.Windows.Forms.Appearance.Button;
            this.uicheckBoxItalic.AutoSize = true;
            this.uicheckBoxItalic.FlatAppearance.BorderSize = 0;
            this.uicheckBoxItalic.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.uicheckBoxItalic.Font = new System.Drawing.Font("Tahoma", 8F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))));
            this.uicheckBoxItalic.Location = new System.Drawing.Point(59, 3);
            this.uicheckBoxItalic.Name = "uicheckBoxItalic";
            this.uicheckBoxItalic.Size = new System.Drawing.Size(22, 22);
            this.uicheckBoxItalic.TabIndex = 8;
            this.uicheckBoxItalic.Text = "I";
            this.uicheckBoxItalic.UseVisualStyleBackColor = true;
            this.uicheckBoxItalic.CheckedChanged += new System.EventHandler(this.uicheckBoxItalic_CheckedChanged);
            // 
            // uicheckBoxUnderline
            // 
            this.uicheckBoxUnderline.Appearance = System.Windows.Forms.Appearance.Button;
            this.uicheckBoxUnderline.AutoSize = true;
            this.uicheckBoxUnderline.FlatAppearance.BorderSize = 0;
            this.uicheckBoxUnderline.FlatAppearance.CheckedBackColor = System.Drawing.SystemColors.ScrollBar;
            this.uicheckBoxUnderline.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.uicheckBoxUnderline.Font = new System.Drawing.Font("Tahoma", 8F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Underline))));
            this.uicheckBoxUnderline.Location = new System.Drawing.Point(100, 3);
            this.uicheckBoxUnderline.Name = "uicheckBoxUnderline";
            this.uicheckBoxUnderline.Size = new System.Drawing.Size(25, 22);
            this.uicheckBoxUnderline.TabIndex = 9;
            this.uicheckBoxUnderline.Text = "U";
            this.uicheckBoxUnderline.UseVisualStyleBackColor = true;
            this.uicheckBoxUnderline.CheckedChanged += new System.EventHandler(this.uicheckBoxUnderline_CheckedChanged);
            // 
            // uiFormChat
            // 
            this.AcceptButton = this.uibuttonSend;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(675, 374);
            this.Controls.Add(this.tableLayoutPanel1);
            this.Name = "uiFormChat";
            this.Text = "uiFormChat";
            this.tableLayoutPanel1.ResumeLayout(false);
            this.splitContainer1.Panel1.ResumeLayout(false);
            this.splitContainer1.Panel2.ResumeLayout(false);
            this.splitContainer1.ResumeLayout(false);
            this.tableLayoutPanel2.ResumeLayout(false);
            this.tableLayoutPanel3.ResumeLayout(false);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.tableLayoutPanel4.ResumeLayout(false);
            this.tableLayoutPanel4.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        private System.Windows.Forms.SplitContainer splitContainer1;
        private Khendys.Controls.ExRichTextBox uiRichTextBoxHistory;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel2;
        private Khendys.Controls.ExRichTextBox uiRichTextBoxMsg;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel3;
        private System.Windows.Forms.Button uibuttonSend;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label uilabelTyping;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel4;
        private System.Windows.Forms.ComboBox uicomboBoxFont;
        private System.Windows.Forms.ComboBox uicomboBoxFontSize;
        private System.Windows.Forms.Button uibuttonColor;
        private System.Windows.Forms.ColorDialog colorDialog1;
        private System.Windows.Forms.CheckBox uicheckBoxBold;
        private System.Windows.Forms.CheckBox uicheckBoxItalic;
        private System.Windows.Forms.CheckBox uicheckBoxUnderline;
    }
}