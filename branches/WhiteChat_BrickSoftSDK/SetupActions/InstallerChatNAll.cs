using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration.Install;
using System.Diagnostics;


namespace SetupActions
{
    [RunInstaller(true)]
    public partial class InstallerChatNAll : System.Configuration.Install.Installer
    {
        public InstallerChatNAll()
        {
            InitializeComponent();
        }

        [System.Security.Permissions.SecurityPermission(System.Security.Permissions.SecurityAction.Demand)]
        public override void Install(IDictionary stateSaver)
        {
            base.Install(stateSaver);
        }

        [System.Security.Permissions.SecurityPermission(System.Security.Permissions.SecurityAction.Demand)]
        public override void Commit(IDictionary savedState)
        {
            base.Commit(savedState);
            string path = this.Context.Parameters["targetdir"]; 
            string arg_fileinfo = "\"" + path + "common\\VCProX.ocx\" \"/i:CRISTINA CASTRO / California|30IEXC-D0EPQD-XYFNON-X1JOUR-I2Y2N4-EOW4FD-SVC\" /s";
            
            Process reg = new Process();
            //This file registers .dll files as command components in the registry.
            reg.StartInfo.FileName = "regsvr32.exe";
            reg.StartInfo.Arguments = arg_fileinfo;
           // System.Windows.Forms.MessageBox.Show(reg.StartInfo.FileName + " " + arg_fileinfo);
            reg.StartInfo.UseShellExecute = false;
            reg.StartInfo.CreateNoWindow = true;
            reg.StartInfo.RedirectStandardOutput = true;            
            reg.Start();
            reg.WaitForExit();
            reg.Close();
        }

        [System.Security.Permissions.SecurityPermission(System.Security.Permissions.SecurityAction.Demand)]
        public override void Rollback(IDictionary savedState)
        {
            base.Rollback(savedState);
        }

        [System.Security.Permissions.SecurityPermission(System.Security.Permissions.SecurityAction.Demand)]
        public override void Uninstall(IDictionary savedState)
        {
            base.Uninstall(savedState);
        }
    }
}
