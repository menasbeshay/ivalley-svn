using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net.Sockets;
using System.Net;

namespace WhiteChatServer
{
    public class SocketCoderTextServer
    {
        
        static Socket Listener_Socket;
        static SocketCoderClient Newclient;
        // (1) Establish The Server
        public static string Start_Text_Server(int Port)
        {
            try
            {
                IPAddress[] AddressAr = null;
                String ServerHostName = "";
                try
                {
                    ServerHostName = Dns.GetHostName();
                    IPHostEntry ipEntry = Dns.GetHostEntry(ServerHostName);
                    AddressAr = ipEntry.AddressList;
                }
                catch (Exception) { }

                if (AddressAr == null || AddressAr.Length < 1)
                {
                    return "Unable to get local address ... Error";
                }

                Listener_Socket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);

                Listener_Socket.Bind(new IPEndPoint(AddressAr[2], Port));
                Listener_Socket.Listen(10);

                Listener_Socket.BeginAccept(new AsyncCallback(EndAccept), Listener_Socket);

                return ("Listening On Port " + Port + "... OK");

            }
            catch (Exception ex) { return ex.Message; }
        }

        // (2) Accept Clients Conncetion
        private static void EndAccept(IAsyncResult ar)
        {
            try
            {
                Listener_Socket = (Socket)ar.AsyncState;
                AddClient(Listener_Socket.EndAccept(ar));
                Listener_Socket.BeginAccept(new AsyncCallback(EndAccept), Listener_Socket);
            }
            catch (Exception) { }
        }

        // (3) Create a Socket for Each Client and add his Socket to The ArrayList 
        private static void AddClient(Socket sockClient)
        {
            Newclient = new SocketCoderClient(sockClient);
           // ClientsList.Add(Newclient);

            // client.Sock.RemoteEndPoint - " has joined the room"

           /* Byte[] byteDateLine = System.Text.Encoding.Unicode.GetBytes(" - Welcome to Our Room - ");
            Newclient.ReadOnlySocket.Send(byteDateLine, byteDateLine.Length, 0);*/
            Newclient.SetupRecieveCallback();
        }

        // (4) Send The Recieved Data to All Clients in The Room
        private static void OnRecievedData(IAsyncResult ar)
        {
            SocketCoderClient client = (SocketCoderClient)ar.AsyncState;
            byte[] aryRet = client.GetRecievedData(ar);

            if (aryRet.Length < 1)
            {
                // client.Sock.RemoteEndPoint - "has left the room"
                client.ReadOnlySocket.Close();
            //    ClientsList.Remove(client);
                return;
            }
         /*   foreach (SocketCoderClient clientSend in ClientsList)
            {
                try
                {
                    clientSend.ReadOnlySocket.Send(aryRet);
                }
                catch
                {
                    clientSend.ReadOnlySocket.Close();
                    ClientsList.Remove(client);
                    return;
                }
            }*/
            client.SetupRecieveCallback();
        }

        public static string ShutDown()
        {
            try
            {
                Listener_Socket.Close();
                GC.Collect();
                GC.WaitForPendingFinalizers();
                return ("Shutdown ... OK");
            }
            catch (Exception ex) { return (ex.Message); }

        }

        internal class SocketCoderClient
        {
            // To create a new socket for each client 

            private Socket New_Socket;
            private byte[] buffer = new byte[50];

            public SocketCoderClient(Socket PassedSock)
            {
                New_Socket = PassedSock;
            }

            public Socket ReadOnlySocket
            {
                get { return New_Socket; }
            }

            public void SetupRecieveCallback()
            {
                try
                {
                    AsyncCallback recieveData = new AsyncCallback(SocketCoderTextServer.OnRecievedData);
                    New_Socket.BeginReceive(buffer, 0, buffer.Length, SocketFlags.None, recieveData, this);
                }
                catch (Exception)
                {
                }
            }
            public byte[] GetRecievedData(IAsyncResult ar)
            {
                int nBytesRec = 0;
                try
                {
                    nBytesRec = New_Socket.EndReceive(ar);
                }
                catch { }
                byte[] byReturn = new byte[nBytesRec];
                Array.Copy(buffer, byReturn, nBytesRec);
                return byReturn;
            }
        }

    }
}
