using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
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
                BindMessages();
            }
        }
        protected enum Folders
        {
            Inbox,
            Sent,
            Deleted
        }
        protected Folders CurrentFolder
        {
            get
            {
                if (ViewState["MessagesFolder"] == null)
                {
                    ViewState["MessagesFolder"] = Folders.Inbox;
                }
                Folders result;
                Enum.TryParse<Folders>(Convert.ToString(ViewState["MessagesFolder"]), out result);
                return result;
            }
            set
            {
                ViewState["MessagesFolder"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lnkInboxLoad_Click(object sender, EventArgs e)
        {
            CurrentFolder = Folders.Inbox;
            BindMessages();
        }

        protected void lnkSentLoad_Click(object sender, EventArgs e)
        {
            CurrentFolder = Folders.Sent;
            BindMessages();
        }

        protected void lnkDeletedLoad_Click(object sender, EventArgs e)
        {
            CurrentFolder = Folders.Deleted;
            BindMessages();
        }

        private void BindMessages()
        {
            MemberMessage messages = new MemberMessage();
            if (MemberID > 0)
            {
                switch (CurrentFolder)
                {
                    case Folders.Inbox:
                        messages.GetMessagesByMemberID_Received(MemberID);
                        break;
                    case Folders.Sent:
                        messages.GetMessagesBySenderID_Sent(MemberID);
                        break;
                    case Folders.Deleted:
                        messages.GetMessagesByMemberID_Deleted(MemberID);
                        break;
                    default:
                        messages.GetMessagesByMemberID_Received(MemberID);
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
    }
}