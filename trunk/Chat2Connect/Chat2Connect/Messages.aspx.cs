using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace Chat2Connect
{
    public partial class Messages : System.Web.UI.Page
    {
        #region Properties
        public string ActionType 
        {
            get
            {
                if (Request.QueryString["t"] != null)
                {
                    if (!string.IsNullOrEmpty(Request.QueryString["t"].ToString()))
                        return Request.QueryString["t"].ToString();
                    else
                        return string.Empty;
                }
                else
                {
                    return string.Empty;
                }
            }
        }

        public MessageFolder CurrentFolder 
        { 
            get 
            {
                if (Session["CurrentFolder"] != null)
                {
                    return (MessageFolder)Session["CurrentFolder"];
                }
                return null;
            }
            set
            {
                Session["CurrentFolder"] = value;
            }
        }

        #endregion

        #region Events

        protected override void InitializeCulture()
        {
            CultureInfo ci = new CultureInfo("ar-EG");
            ci.DateTimeFormat = ci.DateTimeFormat;
            System.Threading.Thread.CurrentThread.CurrentCulture = ci;

            base.InitializeCulture();

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(ActionType))
                {
                    switch (ActionType)
                    {
                        case "inbox":
                            uiPanelMsgList.Visible = true;
                            uiPanelCreateMsg.Visible = false;
                            uiPanelCreateFolder.Visible = false;
                            BindMessages();
                            break;
                        case "sent":
                            uiPanelMsgList.Visible = true;
                            uiPanelCreateMsg.Visible = false;
                            uiPanelCreateFolder.Visible = false;
                            BindMessages();
                            break;
                        case "deleted":
                            uiPanelMsgList.Visible = true;
                            uiPanelCreateMsg.Visible = false;
                            uiPanelCreateFolder.Visible = false;
                            BindMessages();
                            break;
                        case "createmsg":
                            uiPanelMsgList.Visible = false;
                            uiPanelCreateMsg.Visible = true;
                            uiPanelCreateFolder.Visible = false;
                            //BindFriends();
                            Member member = new Member();
                            member.GetMemberByUserId(new Guid(Membership.GetUser().ProviderUserKey.ToString()));
                            uiHiddenFieldCurrentMember.Value = member.MemberID.ToString();
                            break;
                        case "createfolder":
                            uiPanelMsgList.Visible = false;
                            uiPanelCreateMsg.Visible = false;
                            uiPanelCreateFolder.Visible = true;
                            break;
                        default:
                            Response.Redirect("messages.aspx?t=inbox");
                            break;
                    }
                }
                else
                {
                    Response.Redirect("messages.aspx?t=inbox");
                }
            }
        }

        protected void uiGridViewMessages_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewMessages.PageIndex = e.NewPageIndex;
            BindMessages();
        }

        protected void uiGridViewMessages_RowDataBound(object sender, GridViewRowEventArgs e)
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

        

        #endregion

        #region Methods

        private void BindMessages()
        {
            Member member = new Member();
            member.GetMemberByUserId(new Guid(Membership.GetUser().ProviderUserKey.ToString()));
            MemberMessage messages = new MemberMessage();
            switch (ActionType)
            {
                case "inbox":
                    messages.GetMessagesByMemberID_Received(member.MemberID);
                    break;
                case "sent":
                    messages.GetMessagesBySenderID_Sent(member.MemberID);
                    break;
                case "deleted":
                    messages.GetMessagesByMemberID_Deleted(member.MemberID);
                    break;
                default:
                    messages.GetMessagesByMemberID_Received(member.MemberID);
                    break;
            }

            uiGridViewMessages.DataSource = messages.DefaultView;
            uiGridViewMessages.DataBind();

        }

        private void BindFolders()
        {
            Member member = new Member();
            member.GetMemberByUserId(new Guid(Membership.GetUser().ProviderUserKey.ToString()));
            MessageFolder folders = new MessageFolder();
            folders.GetFolderByMemberID(member.MemberID);

            uiGridViewFolders.DataSource = folders.DefaultView;
            uiGridViewFolders.DataBind();

        }


        private void BindFriends()
        {
            Member member = new Member();
            member.GetMemberByUserId(new Guid(Membership.GetUser().ProviderUserKey.ToString()));
            MemberFriend friends = new MemberFriend();
            friends.GetAllMemberFriends(member.MemberID);

            uiDropDownListFriends.DataSource = friends.DefaultView;
            uiDropDownListFriends.DataTextField = "MemberName";
            uiDropDownListFriends.DataValueField = "FriendID";
            uiDropDownListFriends.DataBind();

        }

        #endregion

        protected void uiGridViewFolders_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewFolders.PageIndex = e.NewPageIndex;
            BindFolders();
        }

        protected void uiGridViewFolders_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditFolder")
            {
                MessageFolder folders = new MessageFolder();
                folders.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                uiTextBoxFolderName.Text = folders.Name;
                CurrentFolder = folders;                
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
                    ClientScript.RegisterStartupScript(this.GetType(), "Notify_error_del_folder", @"$.pnotify({
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

        protected void uiLinkButtonSave_Click(object sender, EventArgs e)
        {
            if (CurrentFolder == null)
            {
                CurrentFolder = new MessageFolder();
                CurrentFolder.AddNew();
            }
            Member member = new Member();
            member.GetMemberByUserId(new Guid(Membership.GetUser().ProviderUserKey.ToString()));

            CurrentFolder.Name = uiTextBoxFolderName.Text;
            CurrentFolder.MemberID = member.MemberID;
            CurrentFolder.Save();

            BindFolders();
            uiTextBoxFolderName.Text = "";
            CurrentFolder = null;
        }

        protected void uiLinkButtonSend_Click(object sender, EventArgs e)
        {
            
        }
    }
}