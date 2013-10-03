namespace WhiteChatClient.UserControls
{
    partial class Login
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
            this.uibuttonSignin = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.uitextBoxUsername = new System.Windows.Forms.TextBox();
            this.uitextBoxPassword = new System.Windows.Forms.TextBox();
            this.uicheckBoxRemember = new System.Windows.Forms.CheckBox();
            this.uierrorProviderUsername = new System.Windows.Forms.ErrorProvider(this.components);
            this.uierrorProviderPassword = new System.Windows.Forms.ErrorProvider(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.uierrorProviderUsername)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.uierrorProviderPassword)).BeginInit();
            this.SuspendLayout();
            // 
            // uibuttonSignin
            // 
            this.uibuttonSignin.Font = new System.Drawing.Font("Comic Sans MS", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.uibuttonSignin.Location = new System.Drawing.Point(387, 254);
            this.uibuttonSignin.Name = "uibuttonSignin";
            this.uibuttonSignin.Size = new System.Drawing.Size(99, 37);
            this.uibuttonSignin.TabIndex = 5;
            this.uibuttonSignin.Text = "Sign in";
            this.uibuttonSignin.UseVisualStyleBackColor = true;
            this.uibuttonSignin.Click += new System.EventHandler(this.uibuttonSignin_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Comic Sans MS", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(117, 205);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(76, 23);
            this.label2.TabIndex = 2;
            this.label2.Text = "Password";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Comic Sans MS", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(117, 139);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(85, 23);
            this.label3.TabIndex = 0;
            this.label3.Text = "User name";
            // 
            // uitextBoxUsername
            // 
            this.uitextBoxUsername.Font = new System.Drawing.Font("Comic Sans MS", 16F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.uitextBoxUsername.Location = new System.Drawing.Point(212, 134);
            this.uitextBoxUsername.Margin = new System.Windows.Forms.Padding(3, 3, 10, 3);
            this.uitextBoxUsername.Name = "uitextBoxUsername";
            this.uitextBoxUsername.Size = new System.Drawing.Size(274, 37);
            this.uitextBoxUsername.TabIndex = 1;
            // 
            // uitextBoxPassword
            // 
            this.uitextBoxPassword.Font = new System.Drawing.Font("Comic Sans MS", 16F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.uitextBoxPassword.Location = new System.Drawing.Point(212, 197);
            this.uitextBoxPassword.Margin = new System.Windows.Forms.Padding(3, 3, 10, 3);
            this.uitextBoxPassword.Name = "uitextBoxPassword";
            this.uitextBoxPassword.PasswordChar = '*';
            this.uitextBoxPassword.Size = new System.Drawing.Size(274, 37);
            this.uitextBoxPassword.TabIndex = 3;
            // 
            // uicheckBoxRemember
            // 
            this.uicheckBoxRemember.AutoSize = true;
            this.uicheckBoxRemember.Font = new System.Drawing.Font("Comic Sans MS", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.uicheckBoxRemember.Location = new System.Drawing.Point(212, 260);
            this.uicheckBoxRemember.Name = "uicheckBoxRemember";
            this.uicheckBoxRemember.Size = new System.Drawing.Size(132, 27);
            this.uicheckBoxRemember.TabIndex = 4;
            this.uicheckBoxRemember.Text = "Remember me!";
            this.uicheckBoxRemember.UseVisualStyleBackColor = true;
            // 
            // uierrorProviderUsername
            // 
            this.uierrorProviderUsername.ContainerControl = this;
            // 
            // uierrorProviderPassword
            // 
            this.uierrorProviderPassword.ContainerControl = this;
            // 
            // Login
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.uicheckBoxRemember);
            this.Controls.Add(this.uitextBoxPassword);
            this.Controls.Add(this.uitextBoxUsername);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.uibuttonSignin);
            this.Name = "Login";
            this.Size = new System.Drawing.Size(697, 466);
            ((System.ComponentModel.ISupportInitialize)(this.uierrorProviderUsername)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.uierrorProviderPassword)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button uibuttonSignin;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox uitextBoxUsername;
        private System.Windows.Forms.TextBox uitextBoxPassword;
        private System.Windows.Forms.CheckBox uicheckBoxRemember;
        private System.Windows.Forms.ErrorProvider uierrorProviderUsername;
        private System.Windows.Forms.ErrorProvider uierrorProviderPassword;
    }
}
