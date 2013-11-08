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
            this.components = new System.ComponentModel.Container();
            this.uisplitContainerMain = new System.Windows.Forms.SplitContainer();
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.uiflowLayoutPanelBuddies = new System.Windows.Forms.FlowLayoutPanel();
            this.panel1 = new System.Windows.Forms.Panel();
            this.uilabelDisplayName = new System.Windows.Forms.Label();
            this.uibuttonChangeStatus = new System.Windows.Forms.Button();
            this.splitContainer1 = new System.Windows.Forms.SplitContainer();
            this.uiRichTextBoxHistory = new System.Windows.Forms.RichTextBox();
            this.uiRichTextBoxMsg = new System.Windows.Forms.RichTextBox();
            this.uicontextMenuStripStatus = new System.Windows.Forms.ContextMenuStrip(this.components);
            this.onlineToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.BusyToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.awayToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.offlineToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            ((System.ComponentModel.ISupportInitialize)(this.uisplitContainerMain)).BeginInit();
            this.uisplitContainerMain.Panel1.SuspendLayout();
            this.uisplitContainerMain.Panel2.SuspendLayout();
            this.uisplitContainerMain.SuspendLayout();
            this.tableLayoutPanel1.SuspendLayout();
            this.panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).BeginInit();
            this.splitContainer1.Panel1.SuspendLayout();
            this.splitContainer1.Panel2.SuspendLayout();
            this.splitContainer1.SuspendLayout();
            this.uicontextMenuStripStatus.SuspendLayout();
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
            this.uisplitContainerMain.Panel1.Controls.Add(this.tableLayoutPanel1);
            // 
            // uisplitContainerMain.Panel2
            // 
            this.uisplitContainerMain.Panel2.AutoScroll = true;
            this.uisplitContainerMain.Panel2.BackColor = System.Drawing.SystemColors.Window;
            this.uisplitContainerMain.Panel2.Controls.Add(this.splitContainer1);
            this.uisplitContainerMain.Size = new System.Drawing.Size(806, 555);
            this.uisplitContainerMain.SplitterDistance = 268;
            this.uisplitContainerMain.TabIndex = 0;
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.ColumnCount = 1;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tableLayoutPanel1.Controls.Add(this.uiflowLayoutPanelBuddies, 0, 2);
            this.tableLayoutPanel1.Controls.Add(this.panel1, 0, 0);
            this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 3;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 48.24561F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 51.75439F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Absolute, 440F));
            this.tableLayoutPanel1.Size = new System.Drawing.Size(268, 555);
            this.tableLayoutPanel1.TabIndex = 2;
            // 
            // uiflowLayoutPanelBuddies
            // 
            this.uiflowLayoutPanelBuddies.AutoScroll = true;
            this.uiflowLayoutPanelBuddies.Dock = System.Windows.Forms.DockStyle.Fill;
            this.uiflowLayoutPanelBuddies.FlowDirection = System.Windows.Forms.FlowDirection.TopDown;
            this.uiflowLayoutPanelBuddies.Location = new System.Drawing.Point(3, 117);
            this.uiflowLayoutPanelBuddies.Name = "uiflowLayoutPanelBuddies";
            this.uiflowLayoutPanelBuddies.Size = new System.Drawing.Size(262, 435);
            this.uiflowLayoutPanelBuddies.TabIndex = 2;
            this.uiflowLayoutPanelBuddies.WrapContents = false;
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.uilabelDisplayName);
            this.panel1.Controls.Add(this.uibuttonChangeStatus);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel1.Location = new System.Drawing.Point(3, 3);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(262, 49);
            this.panel1.TabIndex = 3;
            // 
            // uilabelDisplayName
            // 
            this.uilabelDisplayName.AutoSize = true;
            this.uilabelDisplayName.Font = new System.Drawing.Font("Times New Roman", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.uilabelDisplayName.Location = new System.Drawing.Point(67, 14);
            this.uilabelDisplayName.Name = "uilabelDisplayName";
            this.uilabelDisplayName.Size = new System.Drawing.Size(59, 22);
            this.uilabelDisplayName.TabIndex = 1;
            this.uilabelDisplayName.Text = "label1";
            // 
            // uibuttonChangeStatus
            // 
            this.uibuttonChangeStatus.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.uibuttonChangeStatus.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.uibuttonChangeStatus.ForeColor = System.Drawing.Color.White;
            this.uibuttonChangeStatus.Image = global::WhiteChatClient.Properties.Resources.online_arrow;
            this.uibuttonChangeStatus.Location = new System.Drawing.Point(3, 3);
            this.uibuttonChangeStatus.Name = "uibuttonChangeStatus";
            this.uibuttonChangeStatus.Size = new System.Drawing.Size(58, 43);
            this.uibuttonChangeStatus.TabIndex = 0;
            this.uibuttonChangeStatus.UseVisualStyleBackColor = false;
            this.uibuttonChangeStatus.Click += new System.EventHandler(this.uibuttonChangeStatus_Click);
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
            this.splitContainer1.Size = new System.Drawing.Size(534, 555);
            this.splitContainer1.SplitterDistance = 466;
            this.splitContainer1.TabIndex = 0;
            // 
            // uiRichTextBoxHistory
            // 
            this.uiRichTextBoxHistory.BackColor = System.Drawing.Color.White;
            this.uiRichTextBoxHistory.Dock = System.Windows.Forms.DockStyle.Fill;
            this.uiRichTextBoxHistory.Location = new System.Drawing.Point(0, 0);
            this.uiRichTextBoxHistory.Name = "uiRichTextBoxHistory";
            this.uiRichTextBoxHistory.ReadOnly = true;
            this.uiRichTextBoxHistory.Size = new System.Drawing.Size(534, 466);
            this.uiRichTextBoxHistory.TabIndex = 0;
            this.uiRichTextBoxHistory.Text = "";
            // 
            // uiRichTextBoxMsg
            // 
            this.uiRichTextBoxMsg.Dock = System.Windows.Forms.DockStyle.Fill;
            this.uiRichTextBoxMsg.Location = new System.Drawing.Point(0, 0);
            this.uiRichTextBoxMsg.Name = "uiRichTextBoxMsg";
            this.uiRichTextBoxMsg.Size = new System.Drawing.Size(534, 85);
            this.uiRichTextBoxMsg.TabIndex = 0;
            this.uiRichTextBoxMsg.Text = "";
            this.uiRichTextBoxMsg.KeyDown += new System.Windows.Forms.KeyEventHandler(this.uiRichTextBoxMsg_KeyDown);
            // 
            // uicontextMenuStripStatus
            // 
            this.uicontextMenuStripStatus.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.onlineToolStripMenuItem,
            this.BusyToolStripMenuItem,
            this.awayToolStripMenuItem,
            this.offlineToolStripMenuItem});
            this.uicontextMenuStripStatus.Name = "uicontextMenuStripStatus";
            this.uicontextMenuStripStatus.Size = new System.Drawing.Size(111, 92);
            this.uicontextMenuStripStatus.ItemClicked += new System.Windows.Forms.ToolStripItemClickedEventHandler(this.uicontextMenuStripStatus_ItemClicked);
            // 
            // onlineToolStripMenuItem
            // 
            this.onlineToolStripMenuItem.Image = global::WhiteChatClient.Properties.Resources.online;
            this.onlineToolStripMenuItem.Name = "onlineToolStripMenuItem";
            this.onlineToolStripMenuItem.Size = new System.Drawing.Size(110, 22);
            this.onlineToolStripMenuItem.Text = "Online";
            // 
            // BusyToolStripMenuItem
            // 
            this.BusyToolStripMenuItem.Image = global::WhiteChatClient.Properties.Resources.busy;
            this.BusyToolStripMenuItem.Name = "BusyToolStripMenuItem";
            this.BusyToolStripMenuItem.Size = new System.Drawing.Size(110, 22);
            this.BusyToolStripMenuItem.Text = "Busy";
            // 
            // awayToolStripMenuItem
            // 
            this.awayToolStripMenuItem.Image = global::WhiteChatClient.Properties.Resources.away;
            this.awayToolStripMenuItem.Name = "awayToolStripMenuItem";
            this.awayToolStripMenuItem.Size = new System.Drawing.Size(110, 22);
            this.awayToolStripMenuItem.Text = "Away";
            // 
            // offlineToolStripMenuItem
            // 
            this.offlineToolStripMenuItem.Image = global::WhiteChatClient.Properties.Resources.offline;
            this.offlineToolStripMenuItem.Name = "offlineToolStripMenuItem";
            this.offlineToolStripMenuItem.Size = new System.Drawing.Size(110, 22);
            this.offlineToolStripMenuItem.Text = "Offline";
            // 
            // uiChatWindow
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.uisplitContainerMain);
            this.MinimumSize = new System.Drawing.Size(806, 555);
            this.Name = "uiChatWindow";
            this.Size = new System.Drawing.Size(806, 555);            
            this.uisplitContainerMain.Panel1.ResumeLayout(false);
            this.uisplitContainerMain.Panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.uisplitContainerMain)).EndInit();
            this.uisplitContainerMain.ResumeLayout(false);
            this.tableLayoutPanel1.ResumeLayout(false);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.splitContainer1.Panel1.ResumeLayout(false);
            this.splitContainer1.Panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).EndInit();
            this.splitContainer1.ResumeLayout(false);
            this.uicontextMenuStripStatus.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.SplitContainer uisplitContainerMain;
        private System.Windows.Forms.SplitContainer splitContainer1;
        private System.Windows.Forms.RichTextBox uiRichTextBoxHistory;
        private System.Windows.Forms.RichTextBox uiRichTextBoxMsg;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        private System.Windows.Forms.FlowLayoutPanel uiflowLayoutPanelBuddies;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label uilabelDisplayName;
        private System.Windows.Forms.Button uibuttonChangeStatus;
        private System.Windows.Forms.ContextMenuStrip uicontextMenuStripStatus;
        private System.Windows.Forms.ToolStripMenuItem onlineToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem BusyToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem awayToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem offlineToolStripMenuItem;
    }
}
