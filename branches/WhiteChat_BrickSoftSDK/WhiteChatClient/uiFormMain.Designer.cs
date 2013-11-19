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
            this.flowLayoutPanel1 = new System.Windows.Forms.FlowLayoutPanel();
            this.uimenuStripMain = new System.Windows.Forms.MenuStrip();
            this.messengerToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.chatRoomsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.addNewContactToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.signOutToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.exitToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.uipanelLogin = new System.Windows.Forms.Panel();
            this.uicheckBoxInvisible = new System.Windows.Forms.CheckBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.uibuttonSignin = new System.Windows.Forms.Button();
            this.uicheckBoxRemember = new System.Windows.Forms.CheckBox();
            this.uitextBoxPassword = new System.Windows.Forms.TextBox();
            this.uitextBoxUsername = new System.Windows.Forms.TextBox();
            this.uipanelLoading = new System.Windows.Forms.Panel();
            this.label3 = new System.Windows.Forms.Label();
            this.uiflowLayoutPanelBuddies = new System.Windows.Forms.FlowLayoutPanel();
            this.flowLayoutPanel1.SuspendLayout();
            this.uimenuStripMain.SuspendLayout();
            this.uipanelLogin.SuspendLayout();
            this.uipanelLoading.SuspendLayout();
            this.SuspendLayout();
            // 
            // flowLayoutPanel1
            // 
            this.flowLayoutPanel1.Controls.Add(this.uimenuStripMain);
            this.flowLayoutPanel1.Controls.Add(this.uipanelLogin);
            this.flowLayoutPanel1.Controls.Add(this.uipanelLoading);
            this.flowLayoutPanel1.Controls.Add(this.uiflowLayoutPanelBuddies);
            this.flowLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.flowLayoutPanel1.Location = new System.Drawing.Point(0, 0);
            this.flowLayoutPanel1.Name = "flowLayoutPanel1";
            this.flowLayoutPanel1.Size = new System.Drawing.Size(284, 742);
            this.flowLayoutPanel1.TabIndex = 0;
            // 
            // uimenuStripMain
            // 
            this.uimenuStripMain.AutoSize = false;
            this.uimenuStripMain.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.messengerToolStripMenuItem});
            this.uimenuStripMain.Location = new System.Drawing.Point(0, 0);
            this.uimenuStripMain.Name = "uimenuStripMain";
            this.uimenuStripMain.Size = new System.Drawing.Size(281, 24);
            this.uimenuStripMain.TabIndex = 7;
            this.uimenuStripMain.Text = "menuStrip1";
            // 
            // messengerToolStripMenuItem
            // 
            this.messengerToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.chatRoomsToolStripMenuItem,
            this.addNewContactToolStripMenuItem,
            this.signOutToolStripMenuItem,
            this.exitToolStripMenuItem});
            this.messengerToolStripMenuItem.Name = "messengerToolStripMenuItem";
            this.messengerToolStripMenuItem.Size = new System.Drawing.Size(76, 20);
            this.messengerToolStripMenuItem.Text = "Messenger";
            // 
            // chatRoomsToolStripMenuItem
            // 
            this.chatRoomsToolStripMenuItem.Name = "chatRoomsToolStripMenuItem";
            this.chatRoomsToolStripMenuItem.Size = new System.Drawing.Size(148, 22);
            this.chatRoomsToolStripMenuItem.Text = "Chat rooms";
            this.chatRoomsToolStripMenuItem.Click += new System.EventHandler(this.chatRoomsToolStripMenuItem_Click);
            // 
            // addNewContactToolStripMenuItem
            // 
            this.addNewContactToolStripMenuItem.Name = "addNewContactToolStripMenuItem";
            this.addNewContactToolStripMenuItem.Size = new System.Drawing.Size(148, 22);
            this.addNewContactToolStripMenuItem.Text = "Add a contact";
            this.addNewContactToolStripMenuItem.Click += new System.EventHandler(this.addNewContactToolStripMenuItem_Click);
            // 
            // signOutToolStripMenuItem
            // 
            this.signOutToolStripMenuItem.Name = "signOutToolStripMenuItem";
            this.signOutToolStripMenuItem.Size = new System.Drawing.Size(148, 22);
            this.signOutToolStripMenuItem.Text = "Sign out";
            this.signOutToolStripMenuItem.Click += new System.EventHandler(this.signOutToolStripMenuItem_Click);
            // 
            // exitToolStripMenuItem
            // 
            this.exitToolStripMenuItem.Name = "exitToolStripMenuItem";
            this.exitToolStripMenuItem.Size = new System.Drawing.Size(148, 22);
            this.exitToolStripMenuItem.Text = "Exit";
            this.exitToolStripMenuItem.Click += new System.EventHandler(this.exitToolStripMenuItem_Click);
            // 
            // uipanelLogin
            // 
            this.uipanelLogin.Controls.Add(this.uicheckBoxInvisible);
            this.uipanelLogin.Controls.Add(this.label2);
            this.uipanelLogin.Controls.Add(this.label1);
            this.uipanelLogin.Controls.Add(this.uibuttonSignin);
            this.uipanelLogin.Controls.Add(this.uicheckBoxRemember);
            this.uipanelLogin.Controls.Add(this.uitextBoxPassword);
            this.uipanelLogin.Controls.Add(this.uitextBoxUsername);
            this.uipanelLogin.Dock = System.Windows.Forms.DockStyle.Top;
            this.uipanelLogin.Location = new System.Drawing.Point(3, 27);
            this.uipanelLogin.Name = "uipanelLogin";
            this.uipanelLogin.Size = new System.Drawing.Size(281, 600);
            this.uipanelLogin.TabIndex = 0;
            // 
            // uicheckBoxInvisible
            // 
            this.uicheckBoxInvisible.AutoSize = true;
            this.uicheckBoxInvisible.Location = new System.Drawing.Point(56, 311);
            this.uicheckBoxInvisible.Name = "uicheckBoxInvisible";
            this.uicheckBoxInvisible.Size = new System.Drawing.Size(173, 17);
            this.uicheckBoxInvisible.TabIndex = 6;
            this.uicheckBoxInvisible.Text = "Sign in as invisible to everyone";
            this.uicheckBoxInvisible.UseVisualStyleBackColor = true;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(53, 222);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(57, 13);
            this.label2.TabIndex = 5;
            this.label2.Text = "Password:";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(53, 166);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(55, 13);
            this.label1.TabIndex = 4;
            this.label1.Text = "Yahoo ID:";
            // 
            // uibuttonSignin
            // 
            this.uibuttonSignin.Location = new System.Drawing.Point(86, 358);
            this.uibuttonSignin.Name = "uibuttonSignin";
            this.uibuttonSignin.Size = new System.Drawing.Size(97, 29);
            this.uibuttonSignin.TabIndex = 3;
            this.uibuttonSignin.Text = "Sign in";
            this.uibuttonSignin.UseVisualStyleBackColor = true;
            this.uibuttonSignin.Click += new System.EventHandler(this.uibuttonSignin_Click);
            // 
            // uicheckBoxRemember
            // 
            this.uicheckBoxRemember.AutoSize = true;
            this.uicheckBoxRemember.Location = new System.Drawing.Point(56, 288);
            this.uicheckBoxRemember.Name = "uicheckBoxRemember";
            this.uicheckBoxRemember.Size = new System.Drawing.Size(167, 17);
            this.uicheckBoxRemember.TabIndex = 2;
            this.uicheckBoxRemember.Text = "Remember my ID && password";
            this.uicheckBoxRemember.UseVisualStyleBackColor = true;
            // 
            // uitextBoxPassword
            // 
            this.uitextBoxPassword.Location = new System.Drawing.Point(56, 244);
            this.uitextBoxPassword.Name = "uitextBoxPassword";
            this.uitextBoxPassword.PasswordChar = '*';
            this.uitextBoxPassword.Size = new System.Drawing.Size(160, 20);
            this.uitextBoxPassword.TabIndex = 1;
            // 
            // uitextBoxUsername
            // 
            this.uitextBoxUsername.Location = new System.Drawing.Point(56, 192);
            this.uitextBoxUsername.Name = "uitextBoxUsername";
            this.uitextBoxUsername.Size = new System.Drawing.Size(160, 20);
            this.uitextBoxUsername.TabIndex = 0;
            // 
            // uipanelLoading
            // 
            this.uipanelLoading.Controls.Add(this.label3);
            this.uipanelLoading.Dock = System.Windows.Forms.DockStyle.Top;
            this.uipanelLoading.Location = new System.Drawing.Point(3, 633);
            this.uipanelLoading.Name = "uipanelLoading";
            this.uipanelLoading.Size = new System.Drawing.Size(281, 600);
            this.uipanelLoading.TabIndex = 1;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(86, 92);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(91, 13);
            this.label3.TabIndex = 1;
            this.label3.Text = "Loading ...........";
            // 
            // uiflowLayoutPanelBuddies
            // 
            this.uiflowLayoutPanelBuddies.Dock = System.Windows.Forms.DockStyle.Top;
            this.uiflowLayoutPanelBuddies.Location = new System.Drawing.Point(3, 1239);
            this.uiflowLayoutPanelBuddies.Name = "uiflowLayoutPanelBuddies";
            this.uiflowLayoutPanelBuddies.Size = new System.Drawing.Size(281, 600);
            this.uiflowLayoutPanelBuddies.TabIndex = 2;
            // 
            // uiFormMain
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(284, 742);
            this.Controls.Add(this.flowLayoutPanel1);
            this.MainMenuStrip = this.uimenuStripMain;
            this.MaximizeBox = false;
            this.MinimumSize = new System.Drawing.Size(300, 600);
            this.Name = "uiFormMain";
            this.Text = "White Chat";
            this.Load += new System.EventHandler(this.uiFormMain_Load);
            this.flowLayoutPanel1.ResumeLayout(false);
            this.uimenuStripMain.ResumeLayout(false);
            this.uimenuStripMain.PerformLayout();
            this.uipanelLogin.ResumeLayout(false);
            this.uipanelLogin.PerformLayout();
            this.uipanelLoading.ResumeLayout(false);
            this.uipanelLoading.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.FlowLayoutPanel flowLayoutPanel1;
        private System.Windows.Forms.Panel uipanelLogin;
        private System.Windows.Forms.Panel uipanelLoading;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button uibuttonSignin;
        private System.Windows.Forms.CheckBox uicheckBoxRemember;
        private System.Windows.Forms.TextBox uitextBoxPassword;
        private System.Windows.Forms.TextBox uitextBoxUsername;
        private System.Windows.Forms.CheckBox uicheckBoxInvisible;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.FlowLayoutPanel uiflowLayoutPanelBuddies;
        private System.Windows.Forms.MenuStrip uimenuStripMain;
        private System.Windows.Forms.ToolStripMenuItem messengerToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem addNewContactToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem signOutToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem exitToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem chatRoomsToolStripMenuItem;


    }
}

