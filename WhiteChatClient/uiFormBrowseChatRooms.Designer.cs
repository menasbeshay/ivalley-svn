namespace WhiteChatClient
{
    partial class uiFormBrowseChatRooms
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(uiFormBrowseChatRooms));
            this.uibackgroundWorkerLoadCats = new System.ComponentModel.BackgroundWorker();
            this.flowLayoutPanel1 = new System.Windows.Forms.FlowLayoutPanel();
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.panel1 = new System.Windows.Forms.Panel();
            this.uibuttonCancel = new System.Windows.Forms.Button();
            this.uibuttonJoin = new System.Windows.Forms.Button();
            this.splitContainer1 = new System.Windows.Forms.SplitContainer();
            this.uitreeViewCats = new System.Windows.Forms.TreeView();
            this.flowLayoutPanel2 = new System.Windows.Forms.FlowLayoutPanel();
            this.uitreeViewRooms = new System.Windows.Forms.TreeView();
            this.uipanelLoadingRooms = new System.Windows.Forms.Panel();
            this.label1 = new System.Windows.Forms.Label();
            this.pictureBox2 = new System.Windows.Forms.PictureBox();
            this.uipanelLoaddingCats = new System.Windows.Forms.Panel();
            this.label2 = new System.Windows.Forms.Label();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.uibackgroundWorkerLoadRooms = new System.ComponentModel.BackgroundWorker();
            this.flowLayoutPanel1.SuspendLayout();
            this.tableLayoutPanel1.SuspendLayout();
            this.panel1.SuspendLayout();
            this.splitContainer1.Panel1.SuspendLayout();
            this.splitContainer1.Panel2.SuspendLayout();
            this.splitContainer1.SuspendLayout();
            this.flowLayoutPanel2.SuspendLayout();
            this.uipanelLoadingRooms.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).BeginInit();
            this.uipanelLoaddingCats.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // uibackgroundWorkerLoadCats
            // 
            this.uibackgroundWorkerLoadCats.DoWork += new System.ComponentModel.DoWorkEventHandler(this.uibackgroundWorkerLoadCats_DoWork);
            this.uibackgroundWorkerLoadCats.RunWorkerCompleted += new System.ComponentModel.RunWorkerCompletedEventHandler(this.uibackgroundWorkerLoadCats_RunWorkerCompleted);
            // 
            // flowLayoutPanel1
            // 
            this.flowLayoutPanel1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(216)))), ((int)(((byte)(235)))), ((int)(((byte)(253)))));
            this.flowLayoutPanel1.Controls.Add(this.tableLayoutPanel1);
            this.flowLayoutPanel1.Controls.Add(this.uipanelLoaddingCats);
            this.flowLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.flowLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.flowLayoutPanel1.Name = "flowLayoutPanel1";
            this.flowLayoutPanel1.Size = new System.Drawing.Size(486, 429);
            this.flowLayoutPanel1.TabIndex = 0;
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(216)))), ((int)(((byte)(235)))), ((int)(((byte)(253)))));
            this.tableLayoutPanel1.ColumnCount = 1;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tableLayoutPanel1.Controls.Add(this.panel1, 0, 1);
            this.tableLayoutPanel1.Controls.Add(this.splitContainer1, 0, 0);
            this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Top;
            this.tableLayoutPanel1.Location = new System.Drawing.Point(3, 3);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 2;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 89.68059F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 10.31941F));
            this.tableLayoutPanel1.Size = new System.Drawing.Size(478, 426);
            this.tableLayoutPanel1.TabIndex = 2;
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.uibuttonCancel);
            this.panel1.Controls.Add(this.uibuttonJoin);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel1.Location = new System.Drawing.Point(3, 385);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(472, 38);
            this.panel1.TabIndex = 3;
            // 
            // uibuttonCancel
            // 
            this.uibuttonCancel.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.uibuttonCancel.Location = new System.Drawing.Point(257, 5);
            this.uibuttonCancel.Name = "uibuttonCancel";
            this.uibuttonCancel.Size = new System.Drawing.Size(75, 23);
            this.uibuttonCancel.TabIndex = 1;
            this.uibuttonCancel.Text = "Cancel";
            this.uibuttonCancel.UseVisualStyleBackColor = true;
            this.uibuttonCancel.Click += new System.EventHandler(this.uibuttonCancel_Click);
            // 
            // uibuttonJoin
            // 
            this.uibuttonJoin.Location = new System.Drawing.Point(363, 5);
            this.uibuttonJoin.Name = "uibuttonJoin";
            this.uibuttonJoin.Size = new System.Drawing.Size(75, 23);
            this.uibuttonJoin.TabIndex = 0;
            this.uibuttonJoin.Text = "Join room";
            this.uibuttonJoin.UseVisualStyleBackColor = true;
            this.uibuttonJoin.Click += new System.EventHandler(this.uibuttonJoin_Click);
            // 
            // splitContainer1
            // 
            this.splitContainer1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainer1.IsSplitterFixed = true;
            this.splitContainer1.Location = new System.Drawing.Point(3, 3);
            this.splitContainer1.Name = "splitContainer1";
            // 
            // splitContainer1.Panel1
            // 
            this.splitContainer1.Panel1.Controls.Add(this.uitreeViewCats);
            // 
            // splitContainer1.Panel2
            // 
            this.splitContainer1.Panel2.Controls.Add(this.flowLayoutPanel2);
            this.splitContainer1.Size = new System.Drawing.Size(472, 376);
            this.splitContainer1.SplitterDistance = 210;
            this.splitContainer1.TabIndex = 2;
            // 
            // uitreeViewCats
            // 
            this.uitreeViewCats.Dock = System.Windows.Forms.DockStyle.Fill;
            this.uitreeViewCats.Location = new System.Drawing.Point(0, 0);
            this.uitreeViewCats.Name = "uitreeViewCats";
            this.uitreeViewCats.Size = new System.Drawing.Size(210, 376);
            this.uitreeViewCats.TabIndex = 1;
            this.uitreeViewCats.AfterSelect += new System.Windows.Forms.TreeViewEventHandler(this.uitreeViewCats_AfterSelect);
            // 
            // flowLayoutPanel2
            // 
            this.flowLayoutPanel2.Controls.Add(this.uitreeViewRooms);
            this.flowLayoutPanel2.Controls.Add(this.uipanelLoadingRooms);
            this.flowLayoutPanel2.Dock = System.Windows.Forms.DockStyle.Fill;
            this.flowLayoutPanel2.Location = new System.Drawing.Point(0, 0);
            this.flowLayoutPanel2.Margin = new System.Windows.Forms.Padding(0);
            this.flowLayoutPanel2.Name = "flowLayoutPanel2";
            this.flowLayoutPanel2.Size = new System.Drawing.Size(258, 376);
            this.flowLayoutPanel2.TabIndex = 0;
            // 
            // uitreeViewRooms
            // 
            this.uitreeViewRooms.Dock = System.Windows.Forms.DockStyle.Top;
            this.uitreeViewRooms.Location = new System.Drawing.Point(0, 0);
            this.uitreeViewRooms.Margin = new System.Windows.Forms.Padding(0);
            this.uitreeViewRooms.Name = "uitreeViewRooms";
            this.uitreeViewRooms.Size = new System.Drawing.Size(258, 374);
            this.uitreeViewRooms.TabIndex = 3;
            this.uitreeViewRooms.NodeMouseDoubleClick += new System.Windows.Forms.TreeNodeMouseClickEventHandler(this.uitreeViewRooms_NodeMouseDoubleClick);
            // 
            // uipanelLoadingRooms
            // 
            this.uipanelLoadingRooms.Controls.Add(this.label1);
            this.uipanelLoadingRooms.Controls.Add(this.pictureBox2);
            this.uipanelLoadingRooms.Dock = System.Windows.Forms.DockStyle.Top;
            this.uipanelLoadingRooms.Location = new System.Drawing.Point(3, 377);
            this.uipanelLoadingRooms.Name = "uipanelLoadingRooms";
            this.uipanelLoadingRooms.Size = new System.Drawing.Size(252, 500);
            this.uipanelLoadingRooms.TabIndex = 4;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Tahoma", 8F, System.Drawing.FontStyle.Bold);
            this.label1.Location = new System.Drawing.Point(81, 160);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(99, 13);
            this.label1.TabIndex = 2;
            this.label1.Text = "Loading rooms...";
            // 
            // pictureBox2
            // 
            this.pictureBox2.ImageLocation = "images/ajax-loader.gif";
            this.pictureBox2.Location = new System.Drawing.Point(63, 20);
            this.pictureBox2.Name = "pictureBox2";
            this.pictureBox2.Size = new System.Drawing.Size(128, 128);
            this.pictureBox2.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox2.TabIndex = 1;
            this.pictureBox2.TabStop = false;
            // 
            // uipanelLoaddingCats
            // 
            this.uipanelLoaddingCats.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(216)))), ((int)(((byte)(235)))), ((int)(((byte)(253)))));
            this.uipanelLoaddingCats.Controls.Add(this.label2);
            this.uipanelLoaddingCats.Controls.Add(this.pictureBox1);
            this.uipanelLoaddingCats.Dock = System.Windows.Forms.DockStyle.Top;
            this.uipanelLoaddingCats.Location = new System.Drawing.Point(3, 435);
            this.uipanelLoaddingCats.Name = "uipanelLoaddingCats";
            this.uipanelLoaddingCats.Size = new System.Drawing.Size(475, 500);
            this.uipanelLoaddingCats.TabIndex = 3;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Tahoma", 8F, System.Drawing.FontStyle.Bold);
            this.label2.Location = new System.Drawing.Point(178, 231);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(99, 13);
            this.label2.TabIndex = 3;
            this.label2.Text = "Loading rooms...";
            // 
            // pictureBox1
            // 
            this.pictureBox1.ImageLocation = "images/ajax-loader.gif";
            this.pictureBox1.Location = new System.Drawing.Point(163, 62);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(128, 128);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 0;
            this.pictureBox1.TabStop = false;
            // 
            // uibackgroundWorkerLoadRooms
            // 
            this.uibackgroundWorkerLoadRooms.DoWork += new System.ComponentModel.DoWorkEventHandler(this.uibackgroundWorkerLoadRooms_DoWork);
            this.uibackgroundWorkerLoadRooms.RunWorkerCompleted += new System.ComponentModel.RunWorkerCompletedEventHandler(this.uibackgroundWorkerLoadRooms_RunWorkerCompleted);
            // 
            // uiFormBrowseChatRooms
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(486, 429);
            this.Controls.Add(this.flowLayoutPanel1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.Name = "uiFormBrowseChatRooms";
            this.Text = "Join Room";
            this.flowLayoutPanel1.ResumeLayout(false);
            this.tableLayoutPanel1.ResumeLayout(false);
            this.panel1.ResumeLayout(false);
            this.splitContainer1.Panel1.ResumeLayout(false);
            this.splitContainer1.Panel2.ResumeLayout(false);
            this.splitContainer1.ResumeLayout(false);
            this.flowLayoutPanel2.ResumeLayout(false);
            this.uipanelLoadingRooms.ResumeLayout(false);
            this.uipanelLoadingRooms.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).EndInit();
            this.uipanelLoaddingCats.ResumeLayout(false);
            this.uipanelLoaddingCats.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.ComponentModel.BackgroundWorker uibackgroundWorkerLoadCats;
        private System.Windows.Forms.FlowLayoutPanel flowLayoutPanel1;
        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Button uibuttonCancel;
        private System.Windows.Forms.Button uibuttonJoin;
        private System.Windows.Forms.SplitContainer splitContainer1;
        private System.Windows.Forms.TreeView uitreeViewCats;
        private System.Windows.Forms.Panel uipanelLoaddingCats;
        private System.Windows.Forms.FlowLayoutPanel flowLayoutPanel2;
        private System.Windows.Forms.TreeView uitreeViewRooms;
        private System.Windows.Forms.Panel uipanelLoadingRooms;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.PictureBox pictureBox2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.ComponentModel.BackgroundWorker uibackgroundWorkerLoadRooms;
    }
}