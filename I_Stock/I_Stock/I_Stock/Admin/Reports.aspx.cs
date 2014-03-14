using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;
using IStock.BLL;
using System.Data;
namespace I_Stock.Admin
{
    public partial class Reports : System.Web.UI.Page
    {
        #region properties
        public string CurrentReport
        {
            get
            {
                if (Session["CurrentReport"] != null)
                    return Session["CurrentReport"].ToString();
                else
                    return null;
            }
            set
            {
                Session["CurrentReport"] = value;
            }
        }

        public string BaseReportPath
        {
            get
            {
                return "admin/reports/";
            }            
        }

        #endregion

        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (CurrentReport != null)
                {
                    LoadReport();
                }
            }
        }

        #endregion

        #region Methods

        private void LoadReport()
        {
            uiReportViewerMain.LocalReport.ReportPath = BaseReportPath + CurrentReport + ".rdlc";
            switch (CurrentReport)
            {
                case "Report_GetItemsBalances":
                    if (Session["Report_ItemIDForBalance"] != null)
                    {
                        IStock.BLL.Items items = new IStock.BLL.Items();
                        items.Report_GetItemsBalances(Convert.ToInt32(Session["Report_ItemIDForBalance"].ToString()));
                        uiReportViewerMain.LocalReport.DataSources.Clear();
                        uiReportViewerMain.LocalReport.DataSources.Add(new ReportDataSource(CurrentReport + "DataSet", items.DefaultView));
                        uiReportViewerMain.LocalReport.SetParameters(new ReportParameter("ItemID", Session["Report_ItemIDForBalance"].ToString()));
                        uiReportViewerMain.LocalReport.Refresh();
                    }
                    break;
                case "Report_GetClientCredit":
                    if (Session["Report_ClientIDForCredit"] != null)
                    {
                        IStock.BLL.Clients clients = new IStock.BLL.Clients();
                        clients.Report_GetClientCredit(Convert.ToInt32(Session["Report_ClientIDForCredit"].ToString()));
                        uiReportViewerMain.LocalReport.DataSources.Clear();
                        uiReportViewerMain.LocalReport.DataSources.Add(new ReportDataSource(CurrentReport + "DataSet", clients.DefaultView));
                        uiReportViewerMain.LocalReport.SetParameters(new ReportParameter("ClientID", Session["Report_ClientIDForCredit"].ToString()));
                        uiReportViewerMain.LocalReport.Refresh();
                    }
                    break;
                case "Report_DeliveryOrder":
                    if (Session["Report_DeliveryOrderID"] != null)
                    {
                        IStock.BLL.DeliveryOrder order = new IStock.BLL.DeliveryOrder();
                        order.Report_DeliveryOrder(Convert.ToInt32(Session["Report_DeliveryOrderID"].ToString()));

                        IStock.BLL.DeliveryOrder orderT = new IStock.BLL.DeliveryOrder();
                        orderT.Report_DeliveryOrder(Convert.ToInt32(Session["Report_DeliveryOrderID"].ToString()));
                        orderT.GetDeliveryOrderTotalsForReport(orderT.DeliveryOrderID);
                        IStock.BLL.DeliveryOrderDetails details = new DeliveryOrderDetails();
                        details.GetDeliveryOrderDetails(order.DeliveryOrderID);
                        IStock.BLL.ClientReturns cr = new IStock.BLL.ClientReturns();
                        cr.GetClientReturnByDeliveryOrderID(order.DeliveryOrderID);
                        

                        uiReportViewerMain.LocalReport.DataSources.Clear();
                        uiReportViewerMain.LocalReport.DataSources.Add(new ReportDataSource(CurrentReport + "DataSet", order.DefaultView));
                        uiReportViewerMain.LocalReport.DataSources.Add(new ReportDataSource(CurrentReport + "DetailsDataSet", details.DefaultView));
                        if (cr.RowCount > 0)
                        {
                            cr.GetClientReturnTotalsForReport(cr.ClientReturnID);
                            uiReportViewerMain.LocalReport.DataSources.Add(new ReportDataSource("GetClientReturnTotalDataSet", cr.DefaultView));
                        }
                        else
                           uiReportViewerMain.LocalReport.DataSources.Add(new ReportDataSource("GetClientReturnTotalDataSet", new DataView()));                        
                        
                        uiReportViewerMain.LocalReport.DataSources.Add(new ReportDataSource("DeliveryOrderTotalDataSet", orderT.DefaultView));

                        uiReportViewerMain.LocalReport.SetParameters(new ReportParameter("DeliveryOrderID", Session["Report_DeliveryOrderID"].ToString()));
                        uiReportViewerMain.LocalReport.Refresh();
                    }
                    break;

                case "Report_ClientReturn":
                    if (Session["Report_ClientReturnID"] != null)
                    {
                        IStock.BLL.ClientReturns cr = new IStock.BLL.ClientReturns();
                        cr.Report_ClientReturn(Convert.ToInt32(Session["Report_ClientReturnID"].ToString()));

                        IStock.BLL.ClientReturnDetails details = new ClientReturnDetails();
                        details.GetClientReturnDetails(cr.ClientReturnID);

                        uiReportViewerMain.LocalReport.DataSources.Clear();
                        uiReportViewerMain.LocalReport.DataSources.Add(new ReportDataSource(CurrentReport + "DataSet", cr.DefaultView));
                        uiReportViewerMain.LocalReport.DataSources.Add(new ReportDataSource(CurrentReport + "DetailsDataSet", details.DefaultView));

                        uiReportViewerMain.LocalReport.SetParameters(new ReportParameter("ClientReturn", Session["Report_ClientReturnID"].ToString()));
                        uiReportViewerMain.LocalReport.Refresh();
                    }
                    break;
                case "Report_PurchaseOrder":
                    if (Session["Report_PuchaseOrderID"] != null)
                    {
                        IStock.BLL.PurchaseOrders pr = new IStock.BLL.PurchaseOrders();
                        pr.Report_PurchaseOrder(Convert.ToInt32(Session["Report_PuchaseOrderID"].ToString()));

                        IStock.BLL.PurchaseOrderDetails details = new PurchaseOrderDetails();
                        details.GetPurchaseOrderDetails(pr.PurchaseOrderID);

                        uiReportViewerMain.LocalReport.DataSources.Clear();
                        uiReportViewerMain.LocalReport.DataSources.Add(new ReportDataSource(CurrentReport + "DataSet", pr.DefaultView));
                        uiReportViewerMain.LocalReport.DataSources.Add(new ReportDataSource(CurrentReport + "DetailsDataSet", details.DefaultView));
                        uiReportViewerMain.LocalReport.SetParameters(new ReportParameter("PurchaseOrderID", Session["Report_PuchaseOrderID"].ToString()));
                        
                        
                        uiReportViewerMain.LocalReport.Refresh();
                    }
                    break;

                case "Report_Payment":
                    if (Session["Report_PaymentID"] != null)
                    {
                        IStock.BLL.Payments payment = new IStock.BLL.Payments();
                        payment.Report_Payments(Convert.ToInt32(Session["Report_PaymentID"].ToString()));

                        uiReportViewerMain.LocalReport.DataSources.Clear();
                        uiReportViewerMain.LocalReport.DataSources.Add(new ReportDataSource(CurrentReport + "DataSet", payment.DefaultView));
                        uiReportViewerMain.LocalReport.SetParameters(new ReportParameter("PaymentID", Session["Report_PaymentID"].ToString()));


                        uiReportViewerMain.LocalReport.Refresh();
                    }
                    break;
                default:
                    break;
            }
        }
        #endregion 
    }
}