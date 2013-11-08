using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Net.Sockets;
using System.Net;
using System.Threading;

namespace WhiteChatServer
{
    public partial class uiFormMain : Form
    {
        delegate void HandleAddLogCallback(string text);

        public uiFormMain()
        {
            InitializeComponent();            
            string text = SocketCoderTextServer.Start_Text_Server(8888);
            SocketCoderTextServer.OnLogText += new SocketCoderTextServer.LogText(LogText);
            addlog(text);
        }

        private void addlog(string text)
        {
            if (!uiTextBoxLog.InvokeRequired)
            {
                uiTextBoxLog.Text += text + Environment.NewLine;
            }
            else
            {
                HandleAddLogCallback b = new HandleAddLogCallback(addlog);
                this.Invoke(b, new object[] {text});
            }
        }

        private void LogText(object sender, EventArgs e,string msg)
        {                        
            addlog(msg);
        }


        #region Commented
        SocketPermission permission;
        Socket sListener;
        IPEndPoint ipEndPoint;
        Socket handler;
        public void AcceptCallback(IAsyncResult ar)
        {
            Socket listener = null;

            // A new Socket to handle remote host communication 
            Socket handler = null;
            try
            {
                // Receiving byte array 
                byte[] buffer = new byte[1024];
                // Get Listening Socket object 
                listener = (Socket)ar.AsyncState;
                // Create a new socket 
                handler = listener.EndAccept(ar);

                // Using the Nagle algorithm 
                handler.NoDelay = false;

                // Creates one object array for passing data 
                object[] obj = new object[2];
                obj[0] = buffer;
                obj[1] = handler;

                // Begins to asynchronously receive data 
                handler.BeginReceive(
                    buffer,        // An array of type Byt for received data 
                    0,             // The zero-based position in the buffer  
                    buffer.Length, // The number of bytes to receive 
                    SocketFlags.None,// Specifies send and receive behaviors 
                    new AsyncCallback(ReceiveCallback),//An AsyncCallback delegate 
                    obj            // Specifies infomation for receive operation 
                    );

                // Begins an asynchronous operation to accept an attempt 
                AsyncCallback aCallback = new AsyncCallback(AcceptCallback);
                listener.BeginAccept(aCallback, listener);
            }
            catch (Exception exc) { MessageBox.Show(exc.ToString()); }
        }
        public void ReceiveCallback(IAsyncResult ar)
        {
            try
            {
                // Fetch a user-defined object that contains information 
                object[] obj = new object[2];
                obj = (object[])ar.AsyncState;

                // Received byte array 
                byte[] buffer = (byte[])obj[0];

                // A Socket to handle remote host communication. 
                handler = (Socket)obj[1];

                // Received message 
                string content = string.Empty;


                // The number of bytes received. 
                int bytesRead = handler.EndReceive(ar);

                if (bytesRead > 0)
                {
                    content += Encoding.Unicode.GetString(buffer, 0,
                        bytesRead);

                    
                        // Continues to asynchronously receive data
                        byte[] buffernew = new byte[1024];
                        obj[0] = buffernew;
                        obj[1] = handler;
                        handler.BeginReceive(buffernew, 0, buffernew.Length,
                            SocketFlags.None,
                            new AsyncCallback(ReceiveCallback), obj);
                   
                    /*
                    this.Dispatcher.BeginInvoke(DispatcherPriority.Normal, (ThreadStart)delegate()
                    {
                        tbAux.Text = content;
                    }
                    );*/
                }
            }
            catch (Exception exc) { MessageBox.Show(exc.ToString()); }
        }
        #endregion

        private void uiFormMain_FormClosed(object sender, FormClosedEventArgs e)
        {
            string text = SocketCoderTextServer.ShutDown();
            addlog(text);
        }


    }
}
