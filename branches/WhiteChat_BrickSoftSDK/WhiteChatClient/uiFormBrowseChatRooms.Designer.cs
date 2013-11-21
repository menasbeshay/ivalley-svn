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
            this.tableLayoutPanel1 = new System.Windows.Forms.TableLayoutPanel();
            this.panel1 = new System.Windows.Forms.Panel();
            this.uibuttonCancel = new System.Windows.Forms.Button();
            this.uibuttonJoin = new System.Windows.Forms.Button();
            this.splitContainer1 = new System.Windows.Forms.SplitContainer();
            this.uitreeViewCats = new System.Windows.Forms.TreeView();
            this.uitreeViewRooms = new System.Windows.Forms.TreeView();
            this.tableLayoutPanel1.SuspendLayout();
            this.panel1.SuspendLayout();
            this.splitContainer1.Panel1.SuspendLayout();
            this.splitContainer1.Panel2.SuspendLayout();
            this.splitContainer1.SuspendLayout();
            this.SuspendLayout();
            // 
            // tableLayoutPanel1
            // 
            this.tableLayoutPanel1.ColumnCount = 1;
            this.tableLayoutPanel1.ColumnStyles.Add(new System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50F));
            this.tableLayoutPanel1.Controls.Add(this.panel1, 0, 1);
            this.tableLayoutPanel1.Controls.Add(this.splitContainer1, 0, 0);
            this.tableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tableLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.tableLayoutPanel1.Name = "tableLayoutPanel1";
            this.tableLayoutPanel1.RowCount = 2;
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 89.68059F));
            this.tableLayoutPanel1.RowStyles.Add(new System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 10.31941F));
            this.tableLayoutPanel1.Size = new System.Drawing.Size(478, 424);
            this.tableLayoutPanel1.TabIndex = 1;
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.uibuttonCancel);
            this.panel1.Controls.Add(this.uibuttonJoin);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panel1.Location = new System.Drawing.Point(3, 383);
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
            this.splitContainer1.Panel2.Controls.Add(this.uitreeViewRooms);
            this.splitContainer1.Size = new System.Drawing.Size(472, 374);
            this.splitContainer1.SplitterDistance = 210;
            this.splitContainer1.TabIndex = 2;
            // 
            // uitreeViewCats
            // 
            this.uitreeViewCats.Dock = System.Windows.Forms.DockStyle.Fill;
            this.uitreeViewCats.Location = new System.Drawing.Point(0, 0);
            this.uitreeViewCats.Name = "uitreeViewCats";
            this.uitreeViewCats.Size = new System.Drawing.Size(210, 374);
            this.uitreeViewCats.TabIndex = 1;
            this.uitreeViewCats.AfterSelect += new System.Windows.Forms.TreeViewEventHandler(this.uitreeViewCats_AfterSelect);
            // 
            // uitreeViewRooms
            // 
            this.uitreeViewRooms.Dock = System.Windows.Forms.DockStyle.Fill;
            this.uitreeViewRooms.Location = new System.Drawing.Point(0, 0);
            this.uitreeViewRooms.Name = "uitreeViewRooms";
            this.uitreeViewRooms.Size = new System.Drawing.Size(258, 374);
            this.uitreeViewRooms.TabIndex = 2;
            // 
            // uiFormBrowseChatRooms
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(478, 424);
            this.Controls.Add(this.tableLayoutPanel1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MaximizeBox = false;
            this.Name = "uiFormBrowseChatRooms";
            this.Text = "Join Room";
            this.tableLayoutPanel1.ResumeLayout(false);
            this.panel1.ResumeLayout(false);
            this.splitContainer1.Panel1.ResumeLayout(false);
            this.splitContainer1.Panel2.ResumeLayout(false);
            this.splitContainer1.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TableLayoutPanel tableLayoutPanel1;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Button uibuttonCancel;
        private System.Windows.Forms.Button uibuttonJoin;
        private System.Windows.Forms.SplitContainer splitContainer1;
        private System.Windows.Forms.TreeView uitreeViewCats;
        private System.Windows.Forms.TreeView uitreeViewRooms;
    }
}