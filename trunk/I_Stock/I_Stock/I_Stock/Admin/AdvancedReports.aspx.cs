using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;

namespace I_Stock.Admin
{
    public partial class AdvancedReports : System.Web.UI.Page
    {
        public string BaseReportPath
        {
            get
            {
                return "admin/reports/";
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.CustomPageTitle = GetLocalResourceObject("Title").ToString();
                LoadDDLs();
            }
        }

        private void LoadDDLs()
        {
            IStock.BLL.ClientTypes types = new IStock.BLL.ClientTypes();
            types.LoadAll();
            uiDropDownListClientTypes.DataSource = types.DefaultView;
            uiDropDownListClientTypes.DataTextField = "Name";
            uiDropDownListClientTypes.DataValueField = "ClientTypeID";
            uiDropDownListClientTypes.DataBind();
            uiDropDownListClientTypes.Items.Insert(0, new ListItem("إختر تصنيف", "0"));

            IStock.BLL.Suppliers sups = new IStock.BLL.Suppliers();
            sups.LoadAll();
            uiDropDownListSuppliers.DataSource = sups.DefaultView;
            uiDropDownListSuppliers.DataTextField = "Name";
            uiDropDownListSuppliers.DataValueField = "SupplierID";
            uiDropDownListSuppliers.DataBind();
            uiDropDownListSuppliers.Items.Insert(0, new ListItem("إختر مورد", "0"));
            
            
        }

        private void LoadClients()
        {

            IStock.BLL.Clients clients = new IStock.BLL.Clients();
            clients.GetAllClientsByClientTypeID(Convert.ToInt32(uiDropDownListClientTypes.SelectedValue));
            uiDropDownListClients.DataSource = clients.DefaultView;
            uiDropDownListClients.DataTextField = "Name";
            uiDropDownListClients.DataValueField = "ClientID";
            uiDropDownListClients.DataBind();
            uiDropDownListClients.Items.Insert(0, new ListItem("إختر عميل", "0"));
        }

        protected void uiDropDownListClientTypes_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadClients();
        }

        protected void uiLinkButtonItemPrices_Click(object sender, EventArgs e)
        {
            if (uiDropDownListClientTypes.SelectedIndex == -1 || uiDropDownListClientTypes.SelectedValue == "0")
            {
                ClientScript.RegisterStartupScript( this.GetType(), "Error", "alert('من فضلك أختر نوع العميل');", true);
                return;
            }
            uiReportViewerMain.Reset();
            uiReportViewerMain.LocalReport.ReportPath = BaseReportPath + "Report_ItemPrices.rdlc";
            IStock.BLL.Items items = new IStock.BLL.Items();
            if(!string.IsNullOrEmpty(uiHiddenFieldCurrentItem.Value))
                items.Report_ItemPrices(Convert.ToInt32(uiHiddenFieldCurrentItem.Value), Convert.ToInt32(uiDropDownListClientTypes.SelectedValue));
            else
                items.Report_ItemPrices(0, Convert.ToInt32(uiDropDownListClientTypes.SelectedValue));
            uiReportViewerMain.LocalReport.DataSources.Clear();
            uiReportViewerMain.LocalReport.DataSources.Add(new ReportDataSource("Report_ItemPricesDataSet", items.DefaultView));
            uiReportViewerMain.LocalReport.SetParameters(new ReportParameter("ItemID", uiHiddenFieldCurrentItem.Value));
            uiReportViewerMain.LocalReport.SetParameters(new ReportParameter("ClientTypeID", uiDropDownListClientTypes.SelectedValue));
            uiReportViewerMain.LocalReport.Refresh();
            
        }

        protected void uiLinkButtonItemTranHiostory_Click(object sender, EventArgs e)
        {
            uiReportViewerMain.Reset();
            uiReportViewerMain.LocalReport.ReportPath = BaseReportPath + "Report_GetItemTranHistory.rdlc";
            IStock.BLL.Items items = new IStock.BLL.Items();
            DateTime? From = null, To= null;
            if(!string.IsNullOrEmpty(uiTextBoxFrom.Text))
                From = DateTime.ParseExact(uiTextBoxFrom.Text, "dd/MM/yyyy", null);
            if(!string.IsNullOrEmpty(uiTextBoxTo.Text))
                To = DateTime.ParseExact(uiTextBoxTo.Text, "dd/MM/yyyy", null);

            if (!string.IsNullOrEmpty(uiHiddenFieldCurrentItem.Value))
                items.Report_GetItemTranHistory(Convert.ToInt32(uiHiddenFieldCurrentItem.Value), From, To);
            else
                items.Report_GetItemTranHistory(0, From, To);
            uiReportViewerMain.LocalReport.DataSources.Clear();
            uiReportViewerMain.LocalReport.DataSources.Add(new ReportDataSource("Report_GetItemTranHistoryDataSet", items.DefaultView));
            uiReportViewerMain.LocalReport.SetParameters(new ReportParameter("ItemID", uiHiddenFieldCurrentItem.Value));
            uiReportViewerMain.LocalReport.SetParameters(new ReportParameter("From", uiTextBoxFrom.Text));
            uiReportViewerMain.LocalReport.SetParameters(new ReportParameter("To", uiTextBoxTo.Text));
            uiReportViewerMain.LocalReport.Refresh();
        }

        protected void uiLinkButtonPaymentPeriod_Click(object sender, EventArgs e)
        {
            uiReportViewerMain.Reset();
            uiReportViewerMain.LocalReport.ReportPath = BaseReportPath + "Report_PaymentsWithinPeriod.rdlc";
            IStock.BLL.Payments payments = new IStock.BLL.Payments();
            DateTime? From = null, To = null;
            if (!string.IsNullOrEmpty(uiTextBoxFrom.Text))
                From = DateTime.ParseExact(uiTextBoxFrom.Text, "dd/MM/yyyy", null);
            if (!string.IsNullOrEmpty(uiTextBoxTo.Text))
                To = DateTime.ParseExact(uiTextBoxTo.Text, "dd/MM/yyyy", null);
            
            payments.Report_PaymentsWithinPeriod( From, To);
           
            uiReportViewerMain.LocalReport.DataSources.Clear();
            uiReportViewerMain.LocalReport.DataSources.Add(new ReportDataSource("Report_PaymentsWithinPeriodDataSet", payments.DefaultView));
            uiReportViewerMain.LocalReport.SetParameters(new ReportParameter("From", uiTextBoxFrom.Text));
            uiReportViewerMain.LocalReport.SetParameters(new ReportParameter("To", uiTextBoxTo.Text));
            uiReportViewerMain.LocalReport.Refresh();
        }

        protected void uiLinkButtonOrdersForClient_Click(object sender, EventArgs e)
        {
            uiReportViewerMain.Reset();
            uiReportViewerMain.LocalReport.ReportPath = BaseReportPath + "Report_GetOrdersHistoryByClientID.rdlc";
            IStock.BLL.Clients client = new IStock.BLL.Clients();


            DateTime? From = null, To = null;
            if (!string.IsNullOrEmpty(uiTextBoxFrom.Text))
                From = DateTime.ParseExact(uiTextBoxFrom.Text, "dd/MM/yyyy", null);
            if (!string.IsNullOrEmpty(uiTextBoxTo.Text))
                To = DateTime.ParseExact(uiTextBoxTo.Text, "dd/MM/yyyy", null);

            int clientID = 0;
            if (!string.IsNullOrEmpty(uiDropDownListClients.SelectedValue))
                clientID = Convert.ToInt32(uiDropDownListClients.SelectedValue);

            if (!string.IsNullOrEmpty(uiHiddenFieldCurrentItem.Value))
                client.Report_GetOrdersHistoryByClientID(clientID, From, To, Convert.ToInt32(uiHiddenFieldCurrentItem.Value));
            else
                client.Report_GetOrdersHistoryByClientID(clientID, From, To, 0);

            uiReportViewerMain.LocalReport.DataSources.Clear();
            uiReportViewerMain.LocalReport.DataSources.Add(new ReportDataSource("Report_GetOrdersHistoryByClientIDDataSet", client.DefaultView));
            uiReportViewerMain.LocalReport.SetParameters(new ReportParameter("From", uiTextBoxFrom.Text));
            uiReportViewerMain.LocalReport.SetParameters(new ReportParameter("To", uiTextBoxTo.Text));
            uiReportViewerMain.LocalReport.Refresh();
        }

        protected void uiLinkButtonDeliveryOrdersPeriod_Click(object sender, EventArgs e)
        {
            uiReportViewerMain.Reset();
            uiReportViewerMain.LocalReport.ReportPath = BaseReportPath + "Report_GetDeliveryOrdersDetailsTotalsWithinPeriod.rdlc";
            IStock.BLL.DeliveryOrder DeliveryOrder = new IStock.BLL.DeliveryOrder();

            
            DateTime? From = null, To = null;
            if (!string.IsNullOrEmpty(uiTextBoxFrom.Text))
                From = DateTime.ParseExact(uiTextBoxFrom.Text, "dd/MM/yyyy", null);
            if (!string.IsNullOrEmpty(uiTextBoxTo.Text))
                To = DateTime.ParseExact(uiTextBoxTo.Text, "dd/MM/yyyy", null);

            DeliveryOrder.Report_GetDeliveryOrdersDetailsTotalsWithinPeriod(From, To);

            uiReportViewerMain.LocalReport.DataSources.Clear();
            uiReportViewerMain.LocalReport.DataSources.Add(new ReportDataSource("Report_GetDeliveryOrdersDetailsTotalsWithinPeriodDataSet", DeliveryOrder.DefaultView));
            uiReportViewerMain.LocalReport.SetParameters(new ReportParameter("From", uiTextBoxFrom.Text));
            uiReportViewerMain.LocalReport.SetParameters(new ReportParameter("To", uiTextBoxTo.Text));
            uiReportViewerMain.LocalReport.Refresh();
        }

        protected void uiLinkButtonDeliveryOrderTotals_Click(object sender, EventArgs e)
        {
            uiReportViewerMain.Reset();
            uiReportViewerMain.LocalReport.ReportPath = BaseReportPath + "Report_GetDeliveryOrdersDetailsTotals.rdlc";
            IStock.BLL.DeliveryOrder DeliveryOrder = new IStock.BLL.DeliveryOrder();
            
            DeliveryOrder.Report_GetDeliveryOrdersDetailsTotals(uiTextBoxOrderFrom.Text, uiTextBoxOrderTo.Text);

            uiReportViewerMain.LocalReport.DataSources.Clear();
            uiReportViewerMain.LocalReport.DataSources.Add(new ReportDataSource("Report_GetDeliveryOrdersDetailsTotalsDataSet", DeliveryOrder.DefaultView));
            uiReportViewerMain.LocalReport.SetParameters(new ReportParameter("DeliveryOrderNoFrom", uiTextBoxFrom.Text));
            uiReportViewerMain.LocalReport.SetParameters(new ReportParameter("DeliveryOrderNoTo", uiTextBoxTo.Text));
            uiReportViewerMain.LocalReport.Refresh();
        }

        protected void uiLinkButtonPurchaseOrders_Click(object sender, EventArgs e)
        {
            uiReportViewerMain.Reset();
            uiReportViewerMain.LocalReport.ReportPath = BaseReportPath + "Report_GetPurchaseOrders.rdlc";
            IStock.BLL.PurchaseOrders purchaseOrder = new IStock.BLL.PurchaseOrders();


            DateTime? From = null, To = null;
            if (!string.IsNullOrEmpty(uiTextBoxFrom.Text))
                From = DateTime.ParseExact(uiTextBoxFrom.Text, "dd/MM/yyyy", null);
            if (!string.IsNullOrEmpty(uiTextBoxTo.Text))
                To = DateTime.ParseExact(uiTextBoxTo.Text, "dd/MM/yyyy", null);

            int SupID = 0;
            if (!string.IsNullOrEmpty(uiDropDownListSuppliers.SelectedValue))
                SupID = Convert.ToInt32(uiDropDownListSuppliers.SelectedValue);

            int ItemID = 0;
            if (!string.IsNullOrEmpty(uiHiddenFieldCurrentItem.Value))
                ItemID = Convert.ToInt32(uiHiddenFieldCurrentItem.Value);


            purchaseOrder.Report_PurchaseOrders(ItemID, SupID,From, To);

            uiReportViewerMain.LocalReport.DataSources.Clear();
            uiReportViewerMain.LocalReport.DataSources.Add(new ReportDataSource("Report_GetPurchaseOrdersDataSet", purchaseOrder.DefaultView));            
            uiReportViewerMain.LocalReport.Refresh();
        }
    }
}