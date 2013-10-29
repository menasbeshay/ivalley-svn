using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Data;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using WhiteChat.BLL;
using System.Net;
using System.Net.Sockets;
namespace WhiteChatClient.UserControls
{
    public partial class uiChatRoomWindow : UserControl
    {
        private Socket ClientSocket;
        private byte[] buffer = new byte[256];

        public uiChatRoomWindow()
        {
            InitializeComponent();            
            
            Control.CheckForIllegalCrossThreadCalls = false;            
            ConnectToServer();
        }

        public void CloseSocketConnection()
        {
            /*this.sToRemoteServer.Disconnect(false);
            this.sToRemoteServer.Close();*/
            Disconncet();
        }

        private void ConnectToServer()
        {
            try
            {
                if (ClientSocket != null && ClientSocket.Connected)
                {
                    ClientSocket.Shutdown(SocketShutdown.Both);
                    System.Threading.Thread.Sleep(10);
                    ClientSocket.Close();
                }

                ClientSocket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
                IPEndPoint Server_EndPoint = new IPEndPoint(IPAddress.Parse("192.168.1.100"), 8888);
                ClientSocket.Blocking = false;

                ClientSocket.BeginConnect(Server_EndPoint, new AsyncCallback(OnConnect), ClientSocket);

            }
            catch (Exception) { }
            /*
            try
            {
                

                // Listening Socket object 
                sToRemoteServer = null;
                

                // Resolves a host name to an IPHostEntry instance 
                IPHostEntry ipHost = Dns.GetHostEntry("");

                // Gets first IP address associated with a localhost 
                IPAddress ipAddr = ipHost.AddressList[0];

                // Creates a network endpoint 
                ipEndPoint = new IPEndPoint(ipAddr, 6740);

                // Create one Socket object to listen the incoming connection 
                sToRemoteServer = new Socket(
                    ipAddr.AddressFamily,
                    SocketType.Stream,
                    ProtocolType.Tcp
                    );

                // Associates a Socket with a local endpoint 
                sToRemoteServer.Connect(ipEndPoint);
                

            }
            catch (Exception exc) { MessageBox.Show(exc.ToString()); }*/
        }


        public void OnConnect(IAsyncResult ar)
        {
            Socket sock = (Socket)ar.AsyncState;

            try
            {
                if (sock.Connected)
                {
                    SetupRecieveCallback(sock);

                }
                else
                {
                    Disconncet();
                    MessageBox.Show("Connection Failed");
                }
            }
            catch (Exception) { }
        }

        public void OnRecievedData(IAsyncResult ar)
        {
            Socket sock = (Socket)ar.AsyncState;

            try
            {
                int nBytesRec = sock.EndReceive(ar);
                if (nBytesRec > 0)
                {
                    string sRecieved = Encoding.Unicode.GetString(buffer, 0, nBytesRec);
                    // OnAddMessage(sRecieved);
                    // View Messages here 
                    SetupRecieveCallback(sock);
                }
                else
                {
                    sock.Shutdown(SocketShutdown.Both);
                    sock.Close();
                }
            }
            catch (Exception) { }
        }

        public void SetupRecieveCallback(Socket sock)
        {
            try
            {
                AsyncCallback recieveData = new AsyncCallback(OnRecievedData);
                sock.BeginReceive(buffer, 0, buffer.Length, SocketFlags.None, recieveData, sock);
            }
            catch (Exception) { }
        }

        void Disconncet()
        {
            try
            {
                if (ClientSocket != null & ClientSocket.Connected)
                {
                    //Send_MSG("has left the room");
                    ClientSocket.Close();
                }
            }
            catch (Exception) { }

        }

        #region Commented
        Socket sToRemoteServer;
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

    }
}
