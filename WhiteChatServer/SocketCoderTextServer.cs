using System;
using System.Collections.Generic;
using System.Collections;
using System.Text;
using System.Net.Sockets;
using System.Net;
using BLL;
using System.IO;
using System.Runtime.Serialization.Formatters.Binary;
using System.Windows.Forms;
using WhiteChat.BLL;
using System.Configuration;

namespace WhiteChatServer
{
    public class SocketCoderTextServer
    {
        static Dictionary<int, ArrayList> Clients = new Dictionary<int , ArrayList >();
        static Socket Listener_Socket;
        static SocketCoderClient Newclient;
        public static event LogText OnLogText;
        public delegate void LogText(object sender, EventArgs e, string text);
        // (1) Establish The Server
        public static string Start_Text_Server(int Port)
        {
            try
            {
                /*IPAddress[] AddressAr = null;
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
                }*/

                Listener_Socket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
                IPAddress ip;
                IPAddress.TryParse(ConfigurationManager.AppSettings["ServerIp"].ToString(), out ip);
                Listener_Socket.Bind(new IPEndPoint(ip, Port));
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
                client.ReadOnlySocket.Shutdown(SocketShutdown.Both);
                client.ReadOnlySocket.Close();
            //    ClientsList.Remove(client);
                return;
            }

            try
            {
                MemoryStream msgStream = new MemoryStream();
                ClientCommand msgCommand = new ClientCommand();
                msgStream.Write(aryRet, 0, aryRet.Length);
                BinaryFormatter deserializer = new BinaryFormatter();
                msgStream.Position = 0;
                msgCommand = (ClientCommand)deserializer.Deserialize(msgStream);
                switch (msgCommand.MessageType)
                {
                    case ClientCommand.msgType.JoinRoom:
                        //OnLogText(null, new EventArgs(), "new join - " + msgCommand.Sender);    
                        ArrayList RoomMembers;
                        if (Clients.ContainsKey(msgCommand.ChatRoomID))
                        {
                            RoomMembers = Clients[msgCommand.ChatRoomID];
                            client.username = msgCommand.Sender;
                            RoomMembers.Add(client);
                            Clients[msgCommand.ChatRoomID] = RoomMembers;
                        }
                        else
                        {
                            RoomMembers = new ArrayList();
                            client.username = msgCommand.Sender;
                            RoomMembers.Add(client);                            
                            Clients.Add(msgCommand.ChatRoomID, RoomMembers);
                        }
                        try
                        {
                            Member member = new Member();
                            member.AddNew();
                            member.ChatRoomID = msgCommand.ChatRoomID;
                            member.MemberID = msgCommand.Sender;
                            member.Save();
                        }
                        catch (Exception ex)
                        {
                            
                        }
                       
                        ArrayList Members1 = Clients[msgCommand.ChatRoomID];
                        for (int i = 0; i < Members1.Count; i++)
                        {
                            string name = "";
                            try
                            {

                                SocketCoderClient Current = (SocketCoderClient)Members1[i];
                                name = Current.username;
                                Current.ReadOnlySocket.Send(aryRet);
                                
                            }
                            catch (Exception ex)
                            {
                                OnLogText(null, new EventArgs(), "Members1_user : " + name + " has some errors on access socket." + msgCommand.ChatRoomID.ToString());
                            }
                        }
                        //OnLogText(null, new EventArgs(), "user : " + msgCommand.Sender + " has joined room : " + msgCommand.ChatRoomID.ToString());
                        break;
                    case ClientCommand.msgType.LeaveRoom:
                        try
                        {
                            Member memberToLeave = new Member();
                            memberToLeave.LoadByPrimaryKey(msgCommand.Sender, msgCommand.ChatRoomID);
                            memberToLeave.MarkAsDeleted();
                            memberToLeave.Save();
                        }
                        catch (Exception ex)
                        {
                            
                        }
                        ArrayList Members2 = Clients[msgCommand.ChatRoomID];
                        for (int i = 0; i < Members2.Count; i++)
                        {
                            SocketCoderClient Current = (SocketCoderClient)Members2[i];
                            if (Current.username != msgCommand.Sender)
                            {
                                
                                try
                                {
                                    Current.ReadOnlySocket.Send(aryRet);
                                }
                                catch (Exception ex)
                                {
                                    OnLogText(null, new EventArgs(), "Members2_user : " + Current.username + " has some errors on access socket." + msgCommand.ChatRoomID.ToString());
                                }
                            }
                        }

                        ArrayList MemberToRemove = Clients[msgCommand.ChatRoomID];
                        for (int i = 0; i < MemberToRemove.Count; i++)
                        {
                            SocketCoderClient Current = (SocketCoderClient)MemberToRemove[i];
                            if (Current.username != msgCommand.Sender)
                                continue;
                            else
                            {
                                MemberToRemove.Remove(Current);
                               // Current.ReadOnlySocket.Shutdown(SocketShutdown.Both);
                                // prevent setup recieve call back for removed client 
                                return;
                               // break;
                            }
                        }
                        break;
                    case ClientCommand.msgType.Message:                        
                        ArrayList Members = Clients[msgCommand.ChatRoomID];
                        for (int i = 0; i < Members.Count; i++)
                        {
                            string name = "";
                            try
                            {
                                SocketCoderClient Current = (SocketCoderClient)Members[i];
                                name = Current.username;
                                Current.ReadOnlySocket.Send(aryRet);
                            }
                            catch (Exception ex)
                            {
                                OnLogText(null, new EventArgs(), "Members_User : " + name + " has some errors on access socket." + msgCommand.ChatRoomID.ToString());
                            }
                        }
                        break;
                    default:
                        break;
                }
            }
            catch (Exception ex)
            {
               // MessageBox.Show("OnRecievedData - " + ex.Message);
                OnLogText(null, new EventArgs(), "OnRecievedData - " + ex.Message);                
            }
            //client.Send(msgStream.ToArray());

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
            private byte[] buffer { get; set;}
            public string username { get; set; }

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
                    if (buffer == null)
                    {
                        buffer = new byte[1024];
                    }
                        AsyncCallback recieveData = new AsyncCallback(SocketCoderTextServer.OnRecievedData);
                        New_Socket.BeginReceive(buffer, 0, buffer.Length, SocketFlags.None, recieveData, this);
                    
                }
                catch (Exception ex)
                {
                    //MessageBox.Show("SetupRecieveCallback - " + ex.Message);
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
                if (buffer == null)
                    buffer = new byte[nBytesRec];
                Array.Copy(buffer, byReturn, nBytesRec);
                return byReturn;
            }
        }

    }
}
