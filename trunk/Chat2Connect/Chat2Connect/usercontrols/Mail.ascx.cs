using BLL;
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
            Inbox=-1,
            Sent=-2,
            Deleted=-3
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
            }
        }

        protected void lnkInboxLoad_Click(object sender, EventArgs e)
        {
            CurrentFolder = (int)Folders.Inbox;
            BindMessages();
        }

        protected void lnkSentLoad_Click(object sender, EventArgs e)
        {
            CurrentFolder = (int)Folders.Sent;
            BindMessages();
        }

        protected void lnkDeletedLoad_Click(object sender, EventArgs e)
        {
            CurrentFolder = (int)Folders.Deleted;
            BindMessages();
        }

        private void BindMessages()
        {
            pnlViewMessages.Visible = true;
            pnlSendMessage.Visible = false;
            pnlCreateFolder.Visible = false;
            MemberMessage messages = new MemberMessage();
            if (MemberID > 0)
            {
                switch (CurrentFolder)
                {
                    case (int)Folders.Inbox:
                        messages.GetMessagesByMemberID_Received(MemberID);
                        break;
                    case (int)Folders.Sent:
                        messages.GetMessagesBySenderID_Sent(MemberID);
                        break;
                    case (int)Folders.Deleted:
                        messages.GetMessagesByMemberID_Deleted(MemberID);
                        break;
                    default:
                        messages.GetMessagesByFolderID(CurrentFolder);
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

        protected void grdMessages_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label sendername = (Label)e.Row.FindControl("uiLabelSenderName");
                Label _Date = (Label)e.Row.FindControl("uiLabelDate");
                DataRowView row = (DataRowView)e.Row.DataItem;
                Member _sender = new Member();
                _sender.LoadByPrimaryKey(Convert.ToInt32(row["SenderID"].ToString()));
                sendername.Text = _sender.Name;
                _Date.Text = DateTime.Parse(row["SendDate"].ToString()).ToString("dd / MM / yyyy hh:mm tt");

            }
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
                msg.GetMessagesByFolderID(folders.MessageFolderID);

                if (!(msg.RowCount > 0))
                {
                    folders.MarkAsDeleted();
                    folders.Save();
                    BindFolders();
                }
                else
                {
//                    ClientScript.RegisterStartupScript(this.GetType(), "Notify_error_del_folder", @"$.pnotify({
//                                                                                                        text: 'حذث خطأ .يوجد رسائل تحت هذا التصميف.',
//                                                                                                        type: 'error',
//                                                                                                        history: false,
//                                                                                                        closer_hover: false,
//                                                                                                        delay: 5000,
//                                                                                                        sticker: false
//                                                                                                    });", true);
                }
            }
        }

        private void BindFolders()
        {
            MessageFolder folders = new MessageFolder();
            folders.GetFolderByMemberID(MemberID);

            grdFolders.DataSource = folders.DefaultView;
            grdFolders.DataBind();

            repMemberFolders.DataSource = folders.DefaultView;
            repMemberFolders.DataBind();

        }
    }
}