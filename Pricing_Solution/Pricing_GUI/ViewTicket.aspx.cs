using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Pricing.BLL;
using System.Data;
namespace Pricing_GUI
{
    public partial class ViewTicket : System.Web.UI.Page
    {
        #region properties
        public int TicketID
        {
            get
            {
                if (Request.QueryString["t"] != null)
                {
                    try
                    {
                        return Convert.ToInt32(Request.QueryString["t"].ToString());
                    }
                    catch (Exception ex)
                    {
                        return 0;
                    }
                }
                return 0;
            }
        }
        #endregion

        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDDl();
                if (TicketID == 0)
                {
                    Response.Redirect("~/tickets.aspx");
                }
                else
                {
                    Pricing.BLL.Tickets ticket = new Pricing.BLL.Tickets();
                    ticket.LoadByPrimaryKey(TicketID);
                    
                    if(ticket.RowCount == 0)
                        Response.Redirect("~/tickets.aspx");

                    uiLabelRequestText.Text = ticket.TextRequest;
                    if (!string.IsNullOrEmpty(ticket.TradeName))
                        uiLabelDrugName.Text = ticket.TradeName;
                    else
                    {
                        Pricing.BLL.TradePricing drug = new Pricing.BLL.TradePricing();
                        drug.LoadByPrimaryKey(ticket.TradePricingID);
                        uiLabelDrugName.Text = drug.TradeName;
                    }
                    BindHistory();
                }
            }
        }


        protected void uiGridViewHistory_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewHistory.PageIndex = e.NewPageIndex;
            BindHistory();
        }

        protected void uiLinkButtonReply_Click(object sender, EventArgs e)
        {
            TicketHistory history = new TicketHistory();
            history.AddNew();
            history.TicketID = TicketID;
            history.ResponseDate = DateTime.Now;
            history.ResponseText = uiTextBoxResponse.Text;
            history.TicketStatusID = Convert.ToInt32(uiDropDownListStatus.SelectedValue);
            history.Save();

            Pricing.BLL.Tickets ticket = new Pricing.BLL.Tickets();
            ticket.LoadByPrimaryKey(TicketID);
            ticket.TicketStatusID = Convert.ToInt32(uiDropDownListStatus.SelectedValue);
            ticket.Save();

            uiTextBoxResponse.Text = "";
            uiDropDownListStatus.SelectedIndex = 0;

            BindHistory();
        }
        #endregion

        #region Methods

        private void BindHistory()
        {
            TicketHistory history = new TicketHistory();
            history.GetAllHistoryTicketsByTicketID(TicketID);
            uiGridViewHistory.DataSource = history.DefaultView;
            uiGridViewHistory.DataBind();
        }


        private void LoadDDl()
        {
            Pricing.BLL.TicketStatus status = new Pricing.BLL.TicketStatus();
            status.LoadAll();
            uiDropDownListStatus.DataSource = status.DefaultView;
            uiDropDownListStatus.DataTextField = Pricing.BLL.TicketStatus.ColumnNames.Name;
            uiDropDownListStatus.DataValueField = Pricing.BLL.TicketStatus.ColumnNames.TicketStatusID;
            uiDropDownListStatus.DataBind();
        }
        #endregion

       

        
    }
}