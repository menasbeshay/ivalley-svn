namespace WhiteChatClient
{
    partial class AddContact
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
            this.uibuttonOk = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.uitextBoxBuddyName = new System.Windows.Forms.TextBox();
            this.uibuttonCancel = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // uibuttonOk
            // 
            this.uibuttonOk.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(67)))), ((int)(((byte)(100)))));
            this.uibuttonOk.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.uibuttonOk.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(244)))), ((int)(((byte)(147)))), ((int)(((byte)(32)))));
            this.uibuttonOk.FlatAppearance.MouseDownBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(19)))), ((int)(((byte)(18)))));
            this.uibuttonOk.FlatAppearance.MouseOverBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(101)))), ((int)(((byte)(149)))));
            this.uibuttonOk.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.uibuttonOk.Font = new System.Drawing.Font("Corbel", 12F, System.Drawing.FontStyle.Bold);
            this.uibuttonOk.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(244)))), ((int)(((byte)(147)))), ((int)(((byte)(32)))));
            this.uibuttonOk.Location = new System.Drawing.Point(177, 54);
            this.uibuttonOk.Name = "uibuttonOk";
            this.uibuttonOk.Size = new System.Drawing.Size(79, 28);
            this.uibuttonOk.TabIndex = 1;
            this.uibuttonOk.Text = "Add";
            this.uibuttonOk.UseVisualStyleBackColor = false;
            this.uibuttonOk.Click += new System.EventHandler(this.uibuttonOk_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.Transparent;
            this.label1.Font = new System.Drawing.Font("Corbel", 14.25F, System.Drawing.FontStyle.Bold);
            this.label1.Location = new System.Drawing.Point(12, 19);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(128, 23);
            this.label1.TabIndex = 2;
            this.label1.Text = "Messenger ID:";
            // 
            // uitextBoxBuddyName
            // 
            this.uitextBoxBuddyName.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(238)))), ((int)(((byte)(221)))));
            this.uitextBoxBuddyName.Location = new System.Drawing.Point(146, 23);
            this.uitextBoxBuddyName.Name = "uitextBoxBuddyName";
            this.uitextBoxBuddyName.Size = new System.Drawing.Size(191, 20);
            this.uitextBoxBuddyName.TabIndex = 3;
            // 
            // uibuttonCancel
            // 
            this.uibuttonCancel.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(67)))), ((int)(((byte)(100)))));
            this.uibuttonCancel.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Center;
            this.uibuttonCancel.FlatAppearance.BorderColor = System.Drawing.Color.FromArgb(((int)(((byte)(244)))), ((int)(((byte)(147)))), ((int)(((byte)(32)))));
            this.uibuttonCancel.FlatAppearance.MouseDownBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(19)))), ((int)(((byte)(18)))));
            this.uibuttonCancel.FlatAppearance.MouseOverBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(101)))), ((int)(((byte)(149)))));
            this.uibuttonCancel.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.uibuttonCancel.Font = new System.Drawing.Font("Corbel", 12F, System.Drawing.FontStyle.Bold);
            this.uibuttonCancel.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(244)))), ((int)(((byte)(147)))), ((int)(((byte)(32)))));
            this.uibuttonCancel.Location = new System.Drawing.Point(258, 54);
            this.uibuttonCancel.Name = "uibuttonCancel";
            this.uibuttonCancel.Size = new System.Drawing.Size(79, 28);
            this.uibuttonCancel.TabIndex = 4;
            this.uibuttonCancel.Text = "Cancel";
            this.uibuttonCancel.UseVisualStyleBackColor = false;
            this.uibuttonCancel.Click += new System.EventHandler(this.uibuttonCancel_Click);
            // 
            // AddContact
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(216)))), ((int)(((byte)(235)))), ((int)(((byte)(253)))));
            this.BackgroundImage = global::WhiteChatClient.Properties.Resources.sky_blue_background_hd_desktop_wallpaper1;
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.ClientSize = new System.Drawing.Size(347, 89);
            this.Controls.Add(this.uibuttonCancel);
            this.Controls.Add(this.uitextBoxBuddyName);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.uibuttonOk);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "AddContact";
            this.Text = "Add Contact";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button uibuttonOk;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox uitextBoxBuddyName;
        private System.Windows.Forms.Button uibuttonCancel;

    }
}