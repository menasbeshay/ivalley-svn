using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
namespace Chat2Connect
{
    public partial class giftbox : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.IsAuthenticated)
            {

                if (!IsPostBack)
                {
                    if (Request.QueryString["t"] != null)
                    {
                        LoadSentGifts();
                    }
                    else
                    {
                        LoadRecievedGifts();
                    }
                }
            }
            else
            {
                Response.Redirect("~/default.aspx");
            }
        }

        private void LoadSentGifts()
        {
            MemberGift gifts = new MemberGift();
            gifts.GetMemberSentGifts(Member.CurrentMemberID);
            uiGridViewOutbox.DataSource = gifts.DefaultView;
            uiGridViewOutbox.DataBind();
            uiPanelOutbox.Visible = true;
            uiPanelInbox.Visible = false;
        }

        private void LoadRecievedGifts()
        {
            MemberGift gifts = new MemberGift();
            gifts.GetMemberGifts(Member.CurrentMemberID);
            uiGridViewInbox.DataSource = gifts.DefaultView;
            uiGridViewInbox.DataBind();
            uiPanelOutbox.Visible = false;
            uiPanelInbox.Visible = true;
        }

        protected void uiGridViewInbox_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewInbox.PageIndex = e.NewPageIndex;
            LoadRecievedGifts();
        }

        protected void uiGridViewOutbox_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewOutbox.PageIndex = e.NewPageIndex;
            LoadSentGifts();
        }
    }
}