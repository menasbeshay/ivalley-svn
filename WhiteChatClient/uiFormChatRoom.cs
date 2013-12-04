using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Net.Sockets;
using Khendys.Controls;
using System.IO;
using System.Drawing.Imaging;
using System.Runtime.InteropServices;
using System.Collections.Specialized;
using WhiteChatClient.Logic;
using WhiteChat.BLL;
using WhiteChatClient.UserControls;
using Bricksoft.IM.Yahoo;
using BLL;
using System.Runtime.Serialization.Formatters.Binary;
using System.Net;
using System.Configuration;
using System.Threading;

namespace WhiteChatClient
{
    public partial class uiFormChatRoom : Form
    {
        private Socket ClientSocket;
        private byte[] buffer;
        public int ChatRoomID { get; set; }
        public int CategoryID { get; set; }
        public int SubCategoryID { get; set; }
        public bool InCall { get; set; }
        public uiFormMain Main { get; set; }

        delegate void HandleOnRecievedDataCallBack(IAsyncResult ar);

        public uiFormChatRoom()
        {
            InitializeComponent();
        }

        public void Init(int category, int subcategory, int chatroom)
        {
            if (!DesignMode)
            {
                ChatRoomID = chatroom;
                CategoryID = category;
                SubCategoryID = subcategory;
                // Initialize the dictionary mapping color codes to definitions
                rtfColor = new HybridDictionary();
                rtfColor.Add(RtfColor.Aqua, RtfColorDef.Aqua);
                rtfColor.Add(RtfColor.Black, RtfColorDef.Black);
                rtfColor.Add(RtfColor.Blue, RtfColorDef.Blue);
                rtfColor.Add(RtfColor.Fuchsia, RtfColorDef.Fuchsia);
                rtfColor.Add(RtfColor.Gray, RtfColorDef.Gray);
                rtfColor.Add(RtfColor.Green, RtfColorDef.Green);
                rtfColor.Add(RtfColor.Lime, RtfColorDef.Lime);
                rtfColor.Add(RtfColor.Maroon, RtfColorDef.Maroon);
                rtfColor.Add(RtfColor.Navy, RtfColorDef.Navy);
                rtfColor.Add(RtfColor.Olive, RtfColorDef.Olive);
                rtfColor.Add(RtfColor.Purple, RtfColorDef.Purple);
                rtfColor.Add(RtfColor.Red, RtfColorDef.Red);
                rtfColor.Add(RtfColor.Silver, RtfColorDef.Silver);
                rtfColor.Add(RtfColor.Teal, RtfColorDef.Teal);
                rtfColor.Add(RtfColor.White, RtfColorDef.White);
                rtfColor.Add(RtfColor.Yellow, RtfColorDef.Yellow);

                // Initialize the dictionary mapping default Framework font families to
                // RTF font families
                rtfFontFamily = new HybridDictionary();
                rtfFontFamily.Add(FontFamily.GenericMonospace.Name, RtfFontFamilyDef.Modern);
                rtfFontFamily.Add(FontFamily.GenericSansSerif, RtfFontFamilyDef.Swiss);
                rtfFontFamily.Add(FontFamily.GenericSerif, RtfFontFamilyDef.Roman);
                rtfFontFamily.Add(FF_UNKNOWN, RtfFontFamilyDef.Unknown);

                AdjustGraphicsImp();
               
                ConnectToServer(CategoryID, SubCategoryID, ChatRoomID);
                LoadMembers();

                uicomboBoxFontSize.SelectedIndex = 3;
                List<string> fonts = new List<string>();

                foreach (FontFamily font in System.Drawing.FontFamily.Families)
                {
                    fonts.Add(font.Name);
                }
                uicomboBoxFont.DataSource = fonts;
                uicomboBoxFont.SelectedItem = "Arial";

                RichTextBox temp = new RichTextBox();
                temp.Text = "You are in \"" + this.Text + "\"";
                temp.Select(0, temp.Text.LastIndexOf("\""));
                temp.SelectionFont = new System.Drawing.Font(temp.SelectionFont.FontFamily, temp.Font.Size, FontStyle.Bold);
                temp.SelectionColor = Color.Green;
                uiRichTextBoxHistory.SelectedRtf = temp.Rtf;
                temp.Dispose();

                uiRichTextBoxMsg.Focus();
                InCall = false;
            }
        }

        private void LoadMembers()
        {
            uiflowLayoutPanelBuddies.Controls.Clear();
            Member members = new Member();
            members.GetMembersByChatRoomID(ChatRoomID);
            for (int i = 0; i < members.RowCount; i++)
            {
                uiBuddy ucBuddy = new uiBuddy();
                ucBuddy.BuddyName = members.MemberID;
                ucBuddy.Selected += new EventHandler(ucBuddy_Selected);
                ucBuddy.UnSelected += new EventHandler(ucBuddy_UnSelected);
                ucBuddy.DoubleClick += new EventHandler(ucBuddy_DoubleClick);
                ucBuddy.Status = YahooStatus.YAHOO_STATUS_AVAILABLE;
                ucBuddy.Width = uiflowLayoutPanelBuddies.Width;                                
                uiflowLayoutPanelBuddies.Controls.Add(ucBuddy);
                ucBuddy.ContextMenu = null;
                members.MoveNext();
            }
        }

        private void ucBuddy_UnSelected(object sender, EventArgs e)
        {
            uiBuddy b = (uiBuddy)sender;
            b.SetSelected(false);
        }

        private void ucBuddy_Selected(object sender, EventArgs e)
        {
            uiBuddy b = (uiBuddy)sender;
            b.SetSelected(true);
        }

        void ucBuddy_DoubleClick(object sender, EventArgs e)
        {
            uiBuddy b = (uiBuddy)sender;
            Main.OpenChatWindow(b.BuddyName);
            /*uiFormChat chatwindow = new uiFormChat();
            chatwindow.Text = b.BuddyName;
            chatwindow.showHideAddPanel(false);
            chatwindow.AdjustGraphicsImp();
            chatwindow.FormClosed += new FormClosedEventHandler(chatwindow_FormClosed);
            CurrentChatUsers.Add(chatwindow);
            chatwindow.Show();*/
        }

        private void uiRichTextBoxMsg_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.KeyCode == Keys.Enter)
            {
                e.SuppressKeyPress = true;
              /*  if (e.Shift)
                {
                    uiRichTextBoxMsg.Text += Environment.NewLine;
                }
                else
                {*/
                    SendMsg();
               // }
            }            

        }

        private void uibuttonSend_Click(object sender, EventArgs e)
        {
            SendMsg();
        }

        private void SendMsg()
        {
            //CurrentUser.Client.SendMessage(this.Text, uiRichTextBoxMsg.Text);

            MemoryStream msgStream = new MemoryStream();
            ClientCommand msgCommand = new ClientCommand();
            msgCommand.ChatRoomID = ChatRoomID;
            msgCommand.CategoryId = CategoryID;
            msgCommand.SubCategoryId = SubCategoryID;
            msgCommand.Sender = CurrentUser.Client.Account;
            msgCommand.Message = uiRichTextBoxMsg.Text;
            msgCommand.MessageType = ClientCommand.msgType.Message;
            BinaryFormatter serializer = new BinaryFormatter();
            serializer.Serialize(msgStream, msgCommand);
            msgStream.Seek(0, SeekOrigin.Begin);

            uiRichTextBoxMsg.Text = CurrentUser.Client.Account + " : " + uiRichTextBoxMsg.Text;
            uiRichTextBoxMsg.Select(0, uiRichTextBoxMsg.Text.IndexOf(" : ") + 3);
            uiRichTextBoxMsg.SelectionFont = new System.Drawing.Font(new FontFamily("Arial"), 8, FontStyle.Bold);
            uiRichTextBoxMsg.SelectionColor = Color.Black;
            foreach (var item in CurrentUser.Emotions)
            {
                int _index;
                if ((_index = uiRichTextBoxMsg.Find(item.Key)) > -1)
                {
                    uiRichTextBoxMsg.Select(_index, item.Key.Length);
                    InsertImage(new Bitmap(item.Value), uiRichTextBoxMsg);
                }
            }
            uiRichTextBoxHistory.SelectionStart = uiRichTextBoxHistory.TextLength;
            uiRichTextBoxHistory.SelectedRtf = uiRichTextBoxMsg.Rtf;
            uiRichTextBoxHistory.ScrollToCaret();            
            uiRichTextBoxMsg.Clear();
            uiRichTextBoxMsg.Text = string.Empty;                       
            ClientSocket.Send(msgStream.ToArray());
        }

        public void AdjustGraphicsImp()
        {
            using (Graphics _graphics = this.CreateGraphics())
            {
                xDpi = _graphics.DpiX;
                yDpi = _graphics.DpiY;

            }
           
        }

        private void uicheckBoxBold_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                if (uiRichTextBoxMsg.SelectionLength != 0)
                    uiRichTextBoxMsg.SelectionFont = new Font(uiRichTextBoxMsg.SelectionFont.FontFamily, float.Parse(uicomboBoxFontSize.Text), (uicheckBoxBold.Checked) ? FontStyle.Bold | uiRichTextBoxMsg.SelectionFont.Style : uiRichTextBoxMsg.SelectionFont.Style & ~FontStyle.Bold);
                else
                    uiRichTextBoxMsg.Font = new Font(uiRichTextBoxMsg.SelectionFont.FontFamily, float.Parse(uicomboBoxFontSize.Text), (uicheckBoxBold.Checked) ? FontStyle.Bold | uiRichTextBoxMsg.SelectionFont.Style : uiRichTextBoxMsg.SelectionFont.Style & ~FontStyle.Bold);
            }
            catch (Exception)
            {
                
            }
        }

        private void uicheckBoxItalic_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                if (uiRichTextBoxMsg.SelectionLength != 0)
                    uiRichTextBoxMsg.SelectionFont = new Font(uiRichTextBoxMsg.SelectionFont.FontFamily, float.Parse(uicomboBoxFontSize.Text), (uicheckBoxItalic.Checked) ? FontStyle.Italic | uiRichTextBoxMsg.SelectionFont.Style : uiRichTextBoxMsg.SelectionFont.Style & ~FontStyle.Italic);
                else
                    uiRichTextBoxMsg.Font = new Font(uiRichTextBoxMsg.SelectionFont.FontFamily, float.Parse(uicomboBoxFontSize.Text), (uicheckBoxItalic.Checked) ? FontStyle.Italic | uiRichTextBoxMsg.SelectionFont.Style : uiRichTextBoxMsg.SelectionFont.Style & ~FontStyle.Italic);

            }
            catch (Exception)
            {
            }
        }

        private void uicheckBoxUnderline_CheckedChanged(object sender, EventArgs e)
        {
            try
            {
                if (uiRichTextBoxMsg.SelectionLength != 0)
                    uiRichTextBoxMsg.SelectionFont = new Font(uiRichTextBoxMsg.SelectionFont.FontFamily, float.Parse(uicomboBoxFontSize.Text), (uicheckBoxUnderline.Checked) ? FontStyle.Underline | uiRichTextBoxMsg.SelectionFont.Style : uiRichTextBoxMsg.SelectionFont.Style & ~FontStyle.Underline);
                else
                    uiRichTextBoxMsg.Font = new Font(uiRichTextBoxMsg.SelectionFont.FontFamily, float.Parse(uicomboBoxFontSize.Text), (uicheckBoxUnderline.Checked) ? FontStyle.Underline | uiRichTextBoxMsg.SelectionFont.Style : uiRichTextBoxMsg.SelectionFont.Style & ~FontStyle.Underline);
            }
            catch (Exception)
            {
                
            }
        }
        
        private void uibuttonColor_Click(object sender, EventArgs e)
        {
            if (colorDialog1.ShowDialog() == System.Windows.Forms.DialogResult.OK)
            {
                if (uiRichTextBoxMsg.SelectionLength != 0)
                    uiRichTextBoxMsg.SelectionColor = colorDialog1.Color;
                else
                    uiRichTextBoxMsg.ForeColor = colorDialog1.Color;
            }

        }

        private void uicomboBoxFont_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (uiRichTextBoxMsg.SelectionLength != 0)
                    uiRichTextBoxMsg.SelectionFont = new Font(uicomboBoxFont.Text, float.Parse(uicomboBoxFontSize.Text));
                else
                    uiRichTextBoxMsg.Font = new Font(uicomboBoxFont.Text, float.Parse(uicomboBoxFontSize.Text));
            }
            catch (Exception)
            {
                
            }
        }

        private void uicomboBoxFontSize_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (uiRichTextBoxMsg.SelectionLength != 0)
                    uiRichTextBoxMsg.SelectionFont = new Font(uicomboBoxFont.Text, float.Parse(uicomboBoxFontSize.Text));
                else
                    uiRichTextBoxMsg.Font = new Font(uicomboBoxFont.Text, float.Parse(uicomboBoxFontSize.Text));                
            }
            catch (Exception)
            {
                                
            }
        }

        private void toolStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {
            string icon = e.ClickedItem.Name.Substring(e.ClickedItem.Name.IndexOf("toolStripButton") + 15);
            switch (icon)
            {
                case "20":
                    uiRichTextBoxMsg.Text += ":((";
                    break;
                case "21":
                    uiRichTextBoxMsg.Text += ":))";
                    break;
                case "22":
                    uiRichTextBoxMsg.Text += ":|";
                    break;
                case "23":
                    uiRichTextBoxMsg.Text += "/:)";
                    break;
                case "19":
                    uiRichTextBoxMsg.Text += ">:)";
                    break;
                case "5":
                    uiRichTextBoxMsg.Text += ";;)";
                    break;
                case "1":
                    uiRichTextBoxMsg.Text += ":)";
                    break;
                case "2":
                    uiRichTextBoxMsg.Text += ":(";
                    break;
                case "3":
                    uiRichTextBoxMsg.Text += ";)";
                    break;
                case "4":
                    uiRichTextBoxMsg.Text += ":D";
                    break;
                case "6":
                    uiRichTextBoxMsg.Text += ">:D<";
                    break;
                case "7":
                    uiRichTextBoxMsg.Text += ":-/";
                    break;
                case "8":
                    uiRichTextBoxMsg.Text += ":x";
                    break;
                case "9":
                    uiRichTextBoxMsg.Text += ":\">";
                    break;
                case "10":
                    uiRichTextBoxMsg.Text += ":P";
                    break;
                case "11":
                    uiRichTextBoxMsg.Text += ":-*";
                    break;
                case "12":
                    uiRichTextBoxMsg.Text += "=((";
                    break;
                case "13":
                    uiRichTextBoxMsg.Text += ":-O";
                    break;
                case "14":
                    uiRichTextBoxMsg.Text += "X(";
                    break;
                case "15":
                    uiRichTextBoxMsg.Text += ":>";
                    break;
                case "16":
                    uiRichTextBoxMsg.Text += "B-)";
                    break;
                case "17":
                    uiRichTextBoxMsg.Text += ":-S";
                    break;
                case "18":
                    uiRichTextBoxMsg.Text += "#:-S";
                    break;
                case "24":
                    uiRichTextBoxMsg.Text += "=))";
                    break;
                case "25":
                    uiRichTextBoxMsg.Text += "O:-)";
                    break;
                case "26":
                    uiRichTextBoxMsg.Text += ":-B";
                    break;
                case "27":
                    uiRichTextBoxMsg.Text += "=;";
                    break;
            }
        }

        private void uiFormChatRoom_FormClosed(object sender, FormClosedEventArgs e)
        {
            this.Hide();
            Disconncet();
        }

        #region Connection 
        
        public void CloseSocketConnection()
        {           
            Disconncet();
        }

        private void ConnectToServer(int category, int subcategory, int chatroom)
        {
            try
            {
                if (ClientSocket != null && ClientSocket.Connected)
                {
                    ClientSocket.Shutdown(SocketShutdown.Both);
                    System.Threading.Thread.Sleep(5);
                    ClientSocket.Close();
                }

                ClientSocket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.Tcp);
                IPEndPoint Server_EndPoint = new IPEndPoint(IPAddress.Parse(ConfigurationManager.AppSettings["ServerIP"]), 8888);
                ClientSocket.Blocking = false;
                ClientSocket.BeginConnect(Server_EndPoint, new AsyncCallback(OnConnect), ClientSocket);


            }
            catch (Exception) { }
            
        }

        public void OnConnect(IAsyncResult ar)
        {
            Socket sock = (Socket)ar.AsyncState;

            try
            {
                if (sock.Connected)
                {
                    SetupRecieveCallback(sock);
                    MemoryStream msgStream = new MemoryStream();
                    ClientCommand msgCommand = new ClientCommand();
                    msgCommand.ChatRoomID = ChatRoomID;
                    msgCommand.CategoryId = CategoryID;
                    msgCommand.SubCategoryId = SubCategoryID;
                    msgCommand.Sender = CurrentUser.Client.Account;
                    msgCommand.Message = "";
                    msgCommand.MessageType = ClientCommand.msgType.JoinRoom;
                    BinaryFormatter serializer = new BinaryFormatter();
                    serializer.Serialize(msgStream, msgCommand);
                    msgStream.Seek(0, SeekOrigin.Begin);
                    sock.Send(msgStream.ToArray());
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
            if (!uiRichTextBoxHistory.InvokeRequired)
            {
                try
                {
                    int nBytesRec = sock.EndReceive(ar);
                    if (nBytesRec > 0)
                    {
                        //string sRecieved = Encoding.Unicode.GetString(buffer, 0, nBytesRec);
                        if (buffer == null)
                            buffer = new byte[nBytesRec];

                        MemoryStream msgStream = new MemoryStream();
                        ClientCommand msgCommand = new ClientCommand();
                        msgStream.Write(buffer, 0, nBytesRec);
                        BinaryFormatter deserializer = new BinaryFormatter();
                        msgStream.Position = 0;
                        msgCommand = (ClientCommand)deserializer.Deserialize(msgStream);
                        // OnAddMessage(sRecieved);
                        // View Messages here 
                        if (msgCommand.MessageType == ClientCommand.msgType.JoinRoom || msgCommand.MessageType == ClientCommand.msgType.LeaveRoom)
                        {
                            LoadMembers();
                            if (msgCommand.Sender != CurrentUser.Client.Account)
                            {
                                RichTextBox temp = new RichTextBox();
                                if (msgCommand.MessageType == ClientCommand.msgType.JoinRoom)
                                {
                                    temp.Text = msgCommand.Sender + " are in \"" + this.Text + "\"";
                                    temp.SelectionColor = Color.Green;
                                }
                                else if (msgCommand.MessageType == ClientCommand.msgType.LeaveRoom)
                                {
                                    temp.Text = msgCommand.Sender + " are left \"" + this.Text + "\"";
                                    temp.SelectionColor = Color.Purple;
                                }
                                temp.Select(0, temp.Text.LastIndexOf("\""));
                                temp.SelectionFont = new System.Drawing.Font(temp.SelectionFont.FontFamily, temp.Font.Size, FontStyle.Bold);

                                uiRichTextBoxHistory.SelectedRtf = temp.Rtf;
                                temp.Dispose();
                            }
                        }

                        else if (msgCommand.Sender != CurrentUser.Client.Account)
                        {
                            RichTextBox temp = new RichTextBox();
                            temp.Text = msgCommand.Sender + " : " + msgCommand.Message;
                            temp.Select(0, temp.Text.IndexOf(" : ") + 3);
                            temp.SelectionFont = new System.Drawing.Font(temp.SelectionFont.FontFamily, temp.Font.Size, FontStyle.Bold);
                            foreach (var item in CurrentUser.Emotions)
                            {
                                int _index;
                                if ((_index = temp.Find(item.Key)) > -1)
                                {
                                    temp.Select(_index, item.Key.Length);
                                    InsertImage(new Bitmap(item.Value), temp);
                                }
                            }
                            uiRichTextBoxHistory.SelectionStart = uiRichTextBoxHistory.TextLength;
                            uiRichTextBoxHistory.SelectedRtf = temp.Rtf;
                            temp.Dispose();
                        }
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
            else
            {
                HandleOnRecievedDataCallBack b = new HandleOnRecievedDataCallBack(OnRecievedData);
                this.Invoke(b, new object[] { ar });
            }
        }

        public void SetupRecieveCallback(Socket sock)
        {
            try
            {
                if (buffer == null)
                {
                    buffer = new byte[1024];
                }
                AsyncCallback recieveData = new AsyncCallback(OnRecievedData);
                sock.BeginReceive(buffer, 0, buffer.Length, SocketFlags.None, recieveData, sock);
            }
            catch (Exception) { }
        }

        void Disconncet()
        {
            ClientX1.disconnect_client();
            try
            {
                if (ClientSocket != null & ClientSocket.Connected)
                {
                    //Send_MSG("has left the room");
                    MemoryStream msgStream = new MemoryStream();
                    ClientCommand msgCommand = new ClientCommand();
                    msgCommand.ChatRoomID = ChatRoomID;
                    msgCommand.CategoryId = CategoryID;
                    msgCommand.SubCategoryId = SubCategoryID;
                    msgCommand.Sender = CurrentUser.Client.Account;
                    msgCommand.Message = "";
                    msgCommand.MessageType = ClientCommand.msgType.LeaveRoom;
                    BinaryFormatter serializer = new BinaryFormatter();
                    serializer.Serialize(msgStream, msgCommand);
                    msgStream.Seek(0, SeekOrigin.Begin);
                    ClientSocket.Send(msgStream.ToArray());
                    //Thread.Sleep(3000);
                    ClientSocket.Shutdown(SocketShutdown.Both);
                    //ClientSocket.Close();

                }
            }
            catch (Exception) { }



        }

        #endregion

        #region Call


        private void uibuttonCall_Click(object sender, EventArgs e)
        {
            if (!InCall)
            {
                WaveIn.addConsumer2(ClientX1.asConsumer());
                ClientX1.addConsumer2(WaveOut.asConsumer());
                ClientX1.setSrvMasterKey("123456");

                ClientX1.setStreamEnabled(true, true);
                ClientX1.setVolumeModify(false, 50);
                ClientX1.setVolumeModify(true, 100);
                ClientX1.setEncoding(106, 32000);
                ClientX1.URI = "rtp://" + CurrentUser.Client.Account + "@" + ConfigurationManager.AppSettings["ServerIp"].ToString() + ":" + ConfigurationManager.AppSettings["ServerPort"].ToString() + "/" + ChatRoomID.ToString();

                WaveIn.Active = true;
                WaveOut.Active = true;
                uibuttonCall.Text = "Close Voice";
            }
            else
            {
                ClientX1.disconnect_client();
                uibuttonCall.Text = "Call";
            }

        }


        private void uicheckBoxMute_CheckedChanged(object sender, EventArgs e)
        {
            if (uicheckBoxMute.Checked)
            {
                ClientX1.setVolumeModify(false, 0);
            }
            else
            {
                ClientX1.setVolumeModify(false, uitrackBarVolume.Value);
            }
        }

        private void uitrackBarVolume_Scroll(object sender, EventArgs e)
        {
            ClientX1.setVolumeModify(false, uitrackBarVolume.Value);
        }

        private void uicheckBoxHandfree_CheckedChanged(object sender, EventArgs e)
        {
           // WaveIn.Active = uicheckBoxHandfree.Checked;
            if (uicheckBoxHandfree.Checked)
                ClientX1.setVolumeModify(true, 100);
            else
                ClientX1.setVolumeModify(true, 0);
            uibuttonTalk.Enabled = !uicheckBoxHandfree.Checked;
        }

        private void uibuttonTalk_MouseDown(object sender, MouseEventArgs e)
        {
            //WaveIn.Active = true;
            ClientX1.setVolumeModify(true, 100);
        }

        private void uibuttonTalk_MouseUp(object sender, MouseEventArgs e)
        {
           // WaveIn.Active = false;
            ClientX1.setVolumeModify(true, 0);
        }

        #endregion

        [DllImport("user32.dll")]
        static extern bool HideCaret(IntPtr hWnd);
        public void HideCaret()
        {
            HideCaret(uiRichTextBoxHistory.Handle);
        }

        #region Image Insertion in RTB
        #region My Constants

        // Not used in this application.  Descriptions can be found with documentation
        // of Windows GDI function SetMapMode
        private const int MM_TEXT = 1;
        private const int MM_LOMETRIC = 2;
        private const int MM_HIMETRIC = 3;
        private const int MM_LOENGLISH = 4;
        private const int MM_HIENGLISH = 5;
        private const int MM_TWIPS = 6;

        // Ensures that the metafile maintains a 1:1 aspect ratio
        private const int MM_ISOTROPIC = 7;

        // Allows the x-coordinates and y-coordinates of the metafile to be adjusted
        // independently
        private const int MM_ANISOTROPIC = 8;

        // Represents an unknown font family
        private const string FF_UNKNOWN = "UNKNOWN";

        // The number of hundredths of millimeters (0.01 mm) in an inch
        // For more information, see GetImagePrefix() method.
        private const int HMM_PER_INCH = 2540;

        // The number of twips in an inch
        // For more information, see GetImagePrefix() method.
        private const int TWIPS_PER_INCH = 1440;

        private const string RTF_HEADER = @"{\rtf1\ansi\ansicpg1252\deff0\deflang1033";
        private const string RTF_DOCUMENT_PRE = @"\viewkind4\uc1\pard\cf1\f0\fs20";
        private const string RTF_DOCUMENT_POST = @"\cf0\fs17}";
        private string RTF_IMAGE_POST = @"}";
        #endregion

        #region My Enums

        // Specifies the flags/options for the unmanaged call to the GDI+ method
        // Metafile.EmfToWmfBits().
        private enum EmfToWmfBitsFlags
        {

            // Use the default conversion
            EmfToWmfBitsFlagsDefault = 0x00000000,

            // Embedded the source of the EMF metafiel within the resulting WMF
            // metafile
            EmfToWmfBitsFlagsEmbedEmf = 0x00000001,

            // Place a 22-byte header in the resulting WMF file.  The header is
            // required for the metafile to be considered placeable.
            EmfToWmfBitsFlagsIncludePlaceable = 0x00000002,

            // Don't simulate clipping by using the XOR operator.
            EmfToWmfBitsFlagsNoXORClip = 0x00000004
        };

        #endregion

        #region My Privates

        // The default text color
        private RtfColor textColor;

        // The default text background color
        private RtfColor highlightColor;

        // Dictionary that maps color enums to RTF color codes
        private HybridDictionary rtfColor;

        // Dictionary that mapas Framework font families to RTF font families
        private HybridDictionary rtfFontFamily;

        // The horizontal resolution at which the control is being displayed
        private float xDpi;

        // The vertical resolution at which the control is being displayed
        private float yDpi;

        #endregion

        #region My Structs

        // Definitions for colors in an RTF document
        private struct RtfColorDef
        {
            public const string Black = @"\red0\green0\blue0";
            public const string Maroon = @"\red128\green0\blue0";
            public const string Green = @"\red0\green128\blue0";
            public const string Olive = @"\red128\green128\blue0";
            public const string Navy = @"\red0\green0\blue128";
            public const string Purple = @"\red128\green0\blue128";
            public const string Teal = @"\red0\green128\blue128";
            public const string Gray = @"\red128\green128\blue128";
            public const string Silver = @"\red192\green192\blue192";
            public const string Red = @"\red255\green0\blue0";
            public const string Lime = @"\red0\green255\blue0";
            public const string Yellow = @"\red255\green255\blue0";
            public const string Blue = @"\red0\green0\blue255";
            public const string Fuchsia = @"\red255\green0\blue255";
            public const string Aqua = @"\red0\green255\blue255";
            public const string White = @"\red255\green255\blue255";
        }

        // Control words for RTF font families
        private struct RtfFontFamilyDef
        {
            public const string Unknown = @"\fnil";
            public const string Roman = @"\froman";
            public const string Swiss = @"\fswiss";
            public const string Modern = @"\fmodern";
            public const string Script = @"\fscript";
            public const string Decor = @"\fdecor";
            public const string Technical = @"\ftech";
            public const string BiDirect = @"\fbidi";
        }

        #endregion


        #region Insert Image

        public void InsertImage(Image _image, RichTextBox text)
        {

            StringBuilder _rtf = new StringBuilder();

            // Append the RTF header
            _rtf.Append(RTF_HEADER);

            // Create the font table using the RichTextBox's current font and append
            // it to the RTF string
            _rtf.Append(GetFontTable(this.Font));

            // Create the image control string and append it to the RTF string
            _rtf.Append(GetImagePrefix(_image));

            // Create the Windows Metafile and append its bytes in HEX format
            _rtf.Append(GetRtfImage(_image));

            // Close the RTF image control string
            _rtf.Append(RTF_IMAGE_POST);

            text.SelectedRtf = _rtf.ToString();
        }

        private string GetImagePrefix(Image _image)
        {

            StringBuilder _rtf = new StringBuilder();

            // Calculate the current width of the image in (0.01)mm
            int picw = (int)Math.Round((_image.Width / xDpi) * HMM_PER_INCH);

            // Calculate the current height of the image in (0.01)mm
            int pich = (int)Math.Round((_image.Height / yDpi) * HMM_PER_INCH);

            // Calculate the target width of the image in twips
            int picwgoal = (int)Math.Round((_image.Width / xDpi) * TWIPS_PER_INCH);

            // Calculate the target height of the image in twips
            int pichgoal = (int)Math.Round((_image.Height / yDpi) * TWIPS_PER_INCH);

            // Append values to RTF string
            _rtf.Append(@"{\pict\wmetafile8");
            _rtf.Append(@"\picw");
            _rtf.Append(picw);
            _rtf.Append(@"\pich");
            _rtf.Append(pich);
            _rtf.Append(@"\picwgoal");
            _rtf.Append(picwgoal);
            _rtf.Append(@"\pichgoal");
            _rtf.Append(pichgoal);
            _rtf.Append(" ");

            return _rtf.ToString();
        }

        [DllImportAttribute("gdiplus.dll")]
        private static extern uint GdipEmfToWmfBits(IntPtr _hEmf, uint _bufferSize,
            byte[] _buffer, int _mappingMode, EmfToWmfBitsFlags _flags);

        private string GetRtfImage(Image _image)
        {

            StringBuilder _rtf = null;

            // Used to store the enhanced metafile
            MemoryStream _stream = null;

            // Used to create the metafile and draw the image
            Graphics _graphics = null;

            // The enhanced metafile
            Metafile _metaFile = null;

            // Handle to the device context used to create the metafile
            IntPtr _hdc;

            try
            {
                _rtf = new StringBuilder();
                _stream = new MemoryStream();

                // Get a graphics context from the RichTextBox
                using (_graphics = this.CreateGraphics())
                {

                    // Get the device context from the graphics context
                    _hdc = _graphics.GetHdc();

                    // Create a new Enhanced Metafile from the device context
                    _metaFile = new Metafile(_stream, _hdc);

                    // Release the device context
                    _graphics.ReleaseHdc(_hdc);
                }

                // Get a graphics context from the Enhanced Metafile
                using (_graphics = Graphics.FromImage(_metaFile))
                {

                    // Draw the image on the Enhanced Metafile
                    _graphics.DrawImage(_image, new Rectangle(0, 0, _image.Width, _image.Height));

                }

                // Get the handle of the Enhanced Metafile
                IntPtr _hEmf = _metaFile.GetHenhmetafile();

                // A call to EmfToWmfBits with a null buffer return the size of the
                // buffer need to store the WMF bits.  Use this to get the buffer
                // size.
                uint _bufferSize = GdipEmfToWmfBits(_hEmf, 0, null, MM_ANISOTROPIC,
                    EmfToWmfBitsFlags.EmfToWmfBitsFlagsDefault);

                // Create an array to hold the bits
                byte[] _buffer = new byte[_bufferSize];

                // A call to EmfToWmfBits with a valid buffer copies the bits into the
                // buffer an returns the number of bits in the WMF.  
                uint _convertedSize = GdipEmfToWmfBits(_hEmf, _bufferSize, _buffer, MM_ANISOTROPIC,
                    EmfToWmfBitsFlags.EmfToWmfBitsFlagsDefault);

                // Append the bits to the RTF string
                for (int i = 0; i < _buffer.Length; ++i)
                {
                    _rtf.Append(String.Format("{0:X2}", _buffer[i]));
                }

                return _rtf.ToString();
            }
            finally
            {
                if (_graphics != null)
                    _graphics.Dispose();
                if (_metaFile != null)
                    _metaFile.Dispose();
                if (_stream != null)
                    _stream.Close();
            }
        }

        #endregion


        #region RTF Helpers

        /// <summary>
        /// Creates a font table from a font object.  When an Insert or Append 
        /// operation is performed a font is either specified or the default font
        /// is used.  In any case, on any Insert or Append, only one font is used,
        /// thus the font table will always contain a single font.  The font table
        /// should have the form ...
        /// 
        /// {\fonttbl{\f0\[FAMILY]\fcharset0 [FONT_NAME];}
        /// </summary>
        /// <param name="_font"></param>
        /// <returns></returns>
        private string GetFontTable(Font _font)
        {

            StringBuilder _fontTable = new StringBuilder();

            // Append table control string
            _fontTable.Append(@"{\fonttbl{\f0");
            _fontTable.Append(@"\");

            // If the font's family corresponds to an RTF family, append the
            // RTF family name, else, append the RTF for unknown font family.
            if (rtfFontFamily.Contains(_font.FontFamily.Name))
                _fontTable.Append(rtfFontFamily[_font.FontFamily.Name]);
            else
                _fontTable.Append(rtfFontFamily[FF_UNKNOWN]);

            // \fcharset specifies the character set of a font in the font table.
            // 0 is for ANSI.
            _fontTable.Append(@"\fcharset0 ");

            // Append the name of the font
            _fontTable.Append(_font.Name);

            // Close control string
            _fontTable.Append(@";}}");

            return _fontTable.ToString();
        }

        /// <summary>
        /// Creates a font table from the RtfColor structure.  When an Insert or Append
        /// operation is performed, _textColor and _backColor are either specified
        /// or the default is used.  In any case, on any Insert or Append, only three
        /// colors are used.  The default color of the RichTextBox (signified by a
        /// semicolon (;) without a definition), is always the first color (index 0) in
        /// the color table.  The second color is always the text color, and the third
        /// is always the highlight color (color behind the text).  The color table
        /// should have the form ...
        /// 
        /// {\colortbl ;[TEXT_COLOR];[HIGHLIGHT_COLOR];}
        /// 
        /// </summary>
        /// <param name="_textColor"></param>
        /// <param name="_backColor"></param>
        /// <returns></returns>
        private string GetColorTable(RtfColor _textColor, RtfColor _backColor)
        {

            StringBuilder _colorTable = new StringBuilder();

            // Append color table control string and default font (;)
            _colorTable.Append(@"{\colortbl ;");

            // Append the text color
            _colorTable.Append(rtfColor[_textColor]);
            _colorTable.Append(@";");

            // Append the highlight color
            _colorTable.Append(rtfColor[_backColor]);
            _colorTable.Append(@";}\n");

            return _colorTable.ToString();
        }

        /// <summary>
        /// Called by overrided RichTextBox.Rtf accessor.
        /// Removes the null character from the RTF.  This is residue from developing
        /// the control for a specific instant messaging protocol and can be ommitted.
        /// </summary>
        /// <param name="_originalRtf"></param>
        /// <returns>RTF without null character</returns>
        private string RemoveBadChars(string _originalRtf)
        {
            return _originalRtf.Replace("\0", "");
        }

        #endregion

        


        #endregion



    }
}
