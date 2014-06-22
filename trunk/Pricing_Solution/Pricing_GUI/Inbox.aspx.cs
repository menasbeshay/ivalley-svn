using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pricing.BLL;


namespace Pricing_GUI
{
    public partial class Inbox : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Reset the disable mode session for product view .
                CodeGlobal.IsDisableMode = false;

                BinddropDownLists();
                BindInbox();
            }
        }

        private void BinddropDownLists()
        {
            PricingStatus objstatus = new PricingStatus();
            objstatus.LoadAll();
            ui_drpStatus.DataSource = objstatus.DefaultView;
            ui_drpStatus.DataTextField = PricingStatus.ColumnNames.Status;
            ui_drpStatus.DataValueField = PricingStatus.ColumnNames.PricingStatusID;
            ui_drpStatus.DataBind();
            ListItem item_status = new ListItem("-- All Status -- ", "-1");
            ui_drpStatus.Items.Insert(0, item_status);

            Registeration_Committee_Type objCommitteType = new Registeration_Committee_Type();
            objCommitteType.LoadAll();
            ui_drpCommitteeType.DataSource = objCommitteType.DefaultView;
            ui_drpCommitteeType.DataTextField = Registeration_Committee_Type.ColumnNames.CommitteType;
            ui_drpCommitteeType.DataValueField = Registeration_Committee_Type.ColumnNames.ID;
            ui_drpCommitteeType.DataBind();
            ListItem item_CommitteeTypes = new ListItem("-- All Types -- ", "-1");
            ui_drpCommitteeType.Items.Insert(0, item_CommitteeTypes);
        }

        private void BindInbox()
        {
            Pricing.BLL.v_PriceSchedual inbox = new Pricing.BLL.v_PriceSchedual();
            inbox.GetAllPricingInboxForCompany(CodeGlobal.LogedInCompany.CompanyID, ui_txtDateFrom.Text, ui_txtDateTo.Text, int.Parse(ui_drpCommitteeType.SelectedValue), int.Parse(ui_drpStatus.SelectedValue), ui_txtTradeName.Text);

            uiGridViewInbox.DataSource = inbox.DefaultView;
            uiGridViewInbox.DataBind();
        }

        protected void btn_filter_Click(object sender, EventArgs e)
        {
            BindInbox();
        }

        protected void uiGridViewInbox_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewInbox.PageIndex = e.NewPageIndex;
            BindInbox();
        }

        protected void ui_btnTradePricingDetails_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            //CodeGlobal.IsDisableMode = true;
            // TODO: Check if this case will open in enabled or isabled mode.

            Response.Redirect("New_Request.aspx?ID=" + btn.CommandArgument);
        }
    }
}