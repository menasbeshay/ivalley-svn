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

        #endregion
    }
}