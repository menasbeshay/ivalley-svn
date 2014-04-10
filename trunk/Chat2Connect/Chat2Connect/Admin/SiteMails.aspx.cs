using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Chat2Connect.Admin
{
    public partial class SiteMails : System.Web.UI.Page
    {
        private enum Folders
        {
            Inbox,
            Sent,
            Deleted
        }
        private Folders CurrentFolder
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
        public static List<string> PageRoles
        {
            get
            {
                List<string> lstRoles = new List<string>();
                lstRoles.Add(Helper.Enums.AdminRoles.Admin_SiteMails.ToString());
                return lstRoles;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                drpSiteMembers.DataValueField = BLL.Member.ColumnNames.MemberID;
                drpSiteMembers.DataTextField = BLL.Member.ColumnNames.Name;
                drpSiteMembers.DataSource = BLL.Member.SiteMembers;
                drpSiteMembers.DataBind();
            }
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
            int memberID = Convert.ToInt32(drpSiteMembers.SelectedValue);
            MemberMessage messages = new MemberMessage();
            switch (CurrentFolder)
            {
                case Folders.Inbox:
                    messages.GetMessagesByMemberID_Received(memberID);
                    break;
                case Folders.Sent:
                    messages.GetMessagesBySenderID_Sent(memberID);
                    break;
                case Folders.Deleted:
                    messages.GetMessagesByMemberID_Deleted(memberID);
                    break;
                default:
                    messages.GetMessagesByMemberID_Received(memberID);
                    break;
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