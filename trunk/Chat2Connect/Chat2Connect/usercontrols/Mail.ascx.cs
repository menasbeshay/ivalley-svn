using BLL;
using Helper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Chat2Connect.usercontrols
{
    public partial class Mail : System.Web.UI.UserControl
    {
        public int MemberID
        {
            get
            {
                if (ViewState["MemberID"] == null)
                    ViewState["MemberID"] = 0;
                return Convert.ToInt32(ViewState["MemberID"]);
            }
            set
            {
                ViewState["MemberID"] = value;
                ctrlSendMail.MemberID = MemberID;
                BindFolders();
                BindMessages();
            }
        }

        public string MemberName
        {
            get
            {
                if (ViewState["MemberName"] == null)
                    ViewState["MemberName"] = "";
                return ViewState["MemberName"].ToString();
            }
            set
            {
                ViewState["MemberName"] = value;
                ctrlSendMail.MemberName = MemberName;
            }
        }
        protected enum Folders
        {
            [StringValue("البريد الوارد")]
            Inbox=-3,
            [StringValue("البريد المرسل")]
            Sent = -2,
            [StringValue("المهملات")]
            Deleted = -1
        }
        protected int CurrentFolder
        {
            get
            {
                if (ViewState["MessagesFolder"] == null)
                {
                    ViewState["MessagesFolder"] = (int)Folders.Inbox;
                }
                return Convert.ToInt32(ViewState["MessagesFolder"]);
            }
            set
            {
                ViewState["MessagesFolder"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindFolders();

                int friendId = 0;
                string friendname = "";
                if (!string.IsNullOrEmpty(Request.QueryString["t"]) && Request.QueryString["t"].ToString() == "createmsg")
                {
                    int.TryParse(Request.QueryString["u"].ToString(), out friendId);
                    friendname = Request.QueryString["un"].ToString();
                }
                if (friendId != 0 && !string.IsNullOrEmpty(friendname))
                {
                    pnlSendMessage.Visible = true;
                    pnlCreateFolder.Visible = false;
                    pnlViewMessages.Visible = false;
                    Page.ClientScript.RegisterStartupScript(Page.GetType(), "sendmsg", "$(document).ready(function (){  $('#txtTo').tokenInput('add', { id: " + friendId + ", name: '" + friendname + "' }); });", true);
                }
            }
        }

        private void BindMessages()
        {
            pnlViewMessages.Visible = true;
            pnlSendMessage.Visible = false;
            pnlCreateFolder.Visible = false;
            MemberMessage messages = new MemberMessage();
            btnDeleteMessages.OnClientClick = "";
            var memberField = grdMessages.Columns[1] as BoundField;
            memberField.HeaderText = "الراسل";
            memberField.DataField = "FromMember";
            if (MemberID > 0)
            {
                switch (CurrentFolder)
                {
                    case (int)Folders.Inbox:
                        messages.LoadReceivedMessages(MemberID);
                        break;
                    case (int)Folders.Sent:
                        messages.LoadSentMessages(MemberID);
                        memberField.DataField = Message.ColumnNames.ToMembers;
                        memberField.HeaderText = "إلى";
                        break;
                    case (int)Folders.Deleted:
                        messages.LoadTrashMessages(MemberID);
                        btnDeleteMessages.OnClientClick = "return confirm('سيتم الحذف نهائياهل تريد الإستمرار؟');";
                        break;
                    default:
                        messages.LoadByFolderID(CurrentFolder);
                        break;
                }
            }

            grdMessages.DataSource = messages.DefaultView;
            grdMessages.DataBind();

        }

        protected void grdMessages_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdMessages.PageIndex = e.NewPageIndex;
            BindMessages();
        }

        protected void lnkSendMessage_Click(object sender, EventArgs e)
        {
            pnlSendMessage.Visible = true;
            pnlCreateFolder.Visible = false;
            pnlViewMessages.Visible = false;
        }

        protected void lnkCreateFolder_Click(object sender, EventArgs e)
        {
            pnlViewMessages.Visible = false;
            pnlSendMessage.Visible = false;
            pnlCreateFolder.Visible = true;
        }

        protected void lnkCustomeFolderMessages_Click(object sender, EventArgs e)
        {
            CurrentFolder = Convert.ToInt32(((LinkButton)sender).CommandArgument.ToString());
            BindMessages();
            Page.ClientScript.RegisterStartupScript(this.GetType(), "ActiviateFolder", "ActiviateFolder("+CurrentFolder.ToString()+")", true);
        }

        protected void lnkSaveFolder_Click(object sender, EventArgs e)
        {
            MessageFolder folder = new MessageFolder();
            if (folderID.Value == "0")
            {
                folder.AddNew();
            }
            else
            {
                folder.LoadByPrimaryKey(Convert.ToInt32(folderID.Value));
            }
            
            folder.Name = txtFolderName.Text;
            folder.MemberID = MemberID;
            folder.Save();

            BindFolders();
            txtFolderName.Text = "";
            folderID.Value = "0";
        }

        protected void grdFolders_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {

        }

        protected void grdFolders_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditFolder")
            {
                MessageFolder folder = new MessageFolder();
                folder.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                txtFolderName.Text = folder.Name;
                folderID.Value = e.CommandArgument.ToString();
            }
            else if (e.CommandName == "DeleteFolder")
            {
                MessageFolder folders = new MessageFolder();
                folders.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                MemberMessage msg = new MemberMessage();
                msg.LoadByFolderID(folders.MessageFolderID);

                if (!(msg.RowCount > 0))
                {
                    folders.MarkAsDeleted();
                    folders.Save();
                    BindFolders();
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "Notify_error_del_folder", @"$.pnotify({
                                                                                                        text: 'حذث خطأ .يوجد رسائل تحت هذا التصميف.',
                                                                                                        type: 'error',
                                                                                                        history: false,
                                                                                                        closer_hover: false,
                                                                                                        delay: 5000,
                                                                                                        sticker: false
                                                                                                    });", true);
                }
            }
        }

        private void BindFolders()
        {
            MessageFolder folders = new MessageFolder();
            folders.GetFolderByMemberID(MemberID);

            rptFoldersMove.Visible = folders.RowCount > 0;

            grdFolders.DataSource = folders.DefaultView;
            grdFolders.DataBind();

            rptFoldersMove.DataSource = folders.DefaultView;
            rptFoldersMove.DataBind();

            int idx = 0;
            foreach (var f in Helper.EnumUtil.GetValues<Folders>())
            {
                DataRow dr = folders.DefaultView.Table.NewRow();
                dr[MessageFolder.ColumnNames.MessageFolderID] = (int)f;
                dr[MessageFolder.ColumnNames.Name] = Helper.StringEnum.GetStringValue(f);
                folders.DefaultView.Table.Rows.InsertAt(dr, idx);
                idx++;
            }
            
            repMemberFolders.DataSource = folders.DefaultView;
            repMemberFolders.DataBind();

            

        }

        protected void btnDeleteMessages_Click(object sender, EventArgs e)
        {
            MemberMessage message = new MemberMessage();
            List<int> selectedMessages = GetSelectedMessages();
            if (selectedMessages.Count > 0)
            {
                if (CurrentFolder == (int)Folders.Deleted)
                {
                    message.Delete(selectedMessages);
                }
                else
                {
                    message.MoveToTrash(selectedMessages);
                }
                BindMessages();
            }
        }

        protected void lnkMoveMessagesToFolder_Click(object sender, EventArgs e)
        {
            int folderID = Convert.ToInt32(((LinkButton)sender).CommandArgument.ToString());
            MemberMessage message = new MemberMessage();
            List<int> selectedMessages = GetSelectedMessages();
            if (selectedMessages.Count>0)
            {
                message.MoveToFolder(selectedMessages,folderID);
                BindMessages();
            }
        }

        private List<int> GetSelectedMessages()
        {
            List<int> selectedMessages = new List<int>();
            CheckBox chkMsg;
            for (int i = 0; i < grdMessages.Rows.Count; i++)
            {
                if (grdMessages.Rows[i].RowType == DataControlRowType.DataRow)
                {
                    chkMsg = (CheckBox)grdMessages.Rows[i].FindControl("chkSelect");
                    if (chkMsg.Checked)
                    {
                        selectedMessages.Add(Convert.ToInt32(chkMsg.Attributes["data-id"]));
                    }
                }
            }
            return selectedMessages;
        }

        
    }
}