using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Pricing_GUI
{
    public partial class Home1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (CodeGlobal.LogedInCompany == null)
                {
                    Response.Redirect("Company_Login.aspx");
                }
                BindTickets();
                BindInbox();
                BindGeneralNotifications();
                BindPrivateNotifications();
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

        private void BindPrivateNotifications()
        {
            Pricing.BLL.Notifications privateNotifications = new Pricing.BLL.Notifications();
            privateNotifications.GetTopPrivateNotifications(CodeGlobal.LogedInCompany.CompanyID);
            uiGridViewPrivateNotifications.DataSource = privateNotifications.DefaultView;
            uiGridViewPrivateNotifications.DataBind();
        }

        private void BindGeneralNotifications()
        {
            Pricing.BLL.Notifications generalNotifications = new Pricing.BLL.Notifications();
            generalNotifications.GetTopGeneralNotifications();
            uiGridViewPrivateNotifications.DataSource = generalNotifications.DefaultView;
            uiGridViewPrivateNotifications.DataBind();
        }

        private void BindInbox()
        {
            Pricing.BLL.v_PriceSchedual inbox = new Pricing.BLL.v_PriceSchedual();
            inbox.GetTopPricingSchedual(CodeGlobal.LogedInCompany.CompanyID);
          
            uiGridViewInbox.DataSource = inbox.DefaultView;
            uiGridViewInbox.DataBind();
        }

        private void BindTickets()
        {
            Pricing.BLL.Tickets companyTickets = new Pricing.BLL.Tickets();
            companyTickets.GetTopTicketsByCompanyID(CodeGlobal.LogedInCompany.CompanyID);            
            uiGridViewTickets.DataSource = companyTickets.DefaultView;
            uiGridViewTickets.DataBind();
        }
    }
}