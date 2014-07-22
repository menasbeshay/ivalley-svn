using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Pricing_GUI.CAPA
{
    public partial class ManageTickets : System.Web.UI.Page
    {
        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.ChildPageTitle = "Tickets ..";
            if (!IsPostBack)
            {
                LoadDDls();
                BindTickets();
            }
        }


        protected void uiGridViewTickets_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewTickets.PageIndex = e.NewPageIndex;
            BindTickets();
        }

        protected void uiGridViewTickets_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewTicket")
            {
                Response.Redirect("TicketResponse.aspx?t=" + e.CommandArgument.ToString());
            }
        }

        protected void uiGridViewTickets_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView row = (DataRowView)e.Row.DataItem;
                Label tradeName = (Label)e.Row.FindControl("uiLabelTradeName");
                if (!string.IsNullOrEmpty(row["MainTradeName"].ToString()))
                {
                    tradeName.Text = row["MainTradeName"].ToString();
                }
                else
                {
                    tradeName.Text = row["TradeName"].ToString();
                }
            }
        }

        protected void uiLinkButtonSearch_Click(object sender, EventArgs e)
        {
            BindTickets();
        }

        protected void uiDropDownListStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindTickets();
        }
        #endregion

        

        #region Methods


        private void LoadDDls()
        {
            Pricing.BLL.TicketStatus status = new Pricing.BLL.TicketStatus();
            status.LoadAll();
            uiDropDownListStatus.DataSource = status.DefaultView;
            uiDropDownListStatus.DataTextField = Pricing.BLL.TicketStatus.ColumnNames.Name;
            uiDropDownListStatus.DataValueField = Pricing.BLL.TicketStatus.ColumnNames.TicketStatusID;
            uiDropDownListStatus.DataBind();

            ListItem item = new ListItem("-- All Status --", "-1");
            uiDropDownListStatus.Items.Insert(0, item);
        }
        private void BindTickets()
        {
            Pricing.BLL.Tickets AllTickets = new Pricing.BLL.Tickets();
            AllTickets.SearchTickets(uiTextBoxSearchtxt.Text, Convert.ToInt32(uiDropDownListStatus.SelectedValue));
            uiGridViewTickets.DataSource = AllTickets.DefaultView;
            uiGridViewTickets.DataBind();
        }

        #endregion

        

       
    }
}