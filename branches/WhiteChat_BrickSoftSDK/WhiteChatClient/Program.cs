using System;
using System.Collections.Generic;
using System.Windows.Forms;
using System.Diagnostics;

namespace WhiteChatClient
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {

            try
            {
                //'/s' : Specifies regsvr32 to run silently and to not display any message boxes.
                string arg_fileinfo = "/s" + " " + "\"common/VCProX.ocx\"";
                Process reg = new Process();
                //This file registers .dll files as command components in the registry.
                reg.StartInfo.FileName = "regsvr32.exe";                
                reg.StartInfo.Arguments = arg_fileinfo;
                reg.StartInfo.UseShellExecute = false;
                reg.StartInfo.CreateNoWindow = true;
                reg.StartInfo.RedirectStandardOutput = true;
                //reg.StartInfo.Verb = "runas "
                reg.Start();
                reg.WaitForExit();
                reg.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new uiFormMain());
        }
    }
}
