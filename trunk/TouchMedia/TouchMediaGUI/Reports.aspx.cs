using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
//using Microsoft.Reporting.WebForms;
using BLL;
namespace TouchMediaGUI
{
    public partial class Reports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BLL.TransformationSupplier DOO = new BLL.TransformationSupplier();
            DOO.LoadAll();
            drpTransformationSupplier.DataSource = DOO.DefaultView;
            drpTransformationSupplier.DataValueField = TransformationSupplier.ColumnNames.TransformationSupplierID;
            drpTransformationSupplier.DataTextField = TransformationSupplier.ColumnNames.TransformationSupplierName;
            drpTransformationSupplier.DataBind();

            DeliveryOrderStatus Ds = new DeliveryOrderStatus();
            Ds.LoadAll();
            drpDeliveryOrderStatus.DataSource = Ds.DefaultView;
            drpDeliveryOrderStatus.DataValueField = DeliveryOrderStatus.ColumnNames.DeliveryOrderStatusID;
            drpDeliveryOrderStatus.DataTextField = DeliveryOrderStatus.ColumnNames.DeliveryOrderStatusNameAr;
            drpDeliveryOrderStatus.DataBind();
        }

        protected void btnDeliveryOrderReport_Click(object sender, EventArgs e)
        {
            Microsoft.Reporting.WebForms.ReportDataSource rds = new Microsoft.Reporting.WebForms.ReportDataSource();
            DeliveryOrderReportsTableAdapters.DeliveryOrderReportTableAdapter DOTA = new DeliveryOrderReportsTableAdapters.DeliveryOrderReportTableAdapter();
            DOTA.ClearBeforeFill = true;

            try
            {
                DateTime? From = null;
                DateTime? To = null;

                From = DateTime.ParseExact(txtDateFrom.Text,"dd/MM/yyyy",null);
                To = DateTime.ParseExact(txtDateTo.Text,"dd/MM/yyyy",null);
                rds.Name = "DODataSet";
                rds.Value = DOTA.GetData(0, From, To);
                ReportViewer1.LocalReport.ReportPath = "Reports\\DeliveryReport.rdlc";
                //ReportViewer1.LocalReport.SetParameters(new Microsoft.Reporting.WebForms.ReportParameter[] { new Microsoft.Reporting.WebForms.ReportParameter("From", txtDateFrom.ToString()) });
                ReportViewer1.LocalReport.DataSources.Clear();
                ReportViewer1.LocalReport.DataSources.Add(rds);
                ReportViewer1.LocalReport.Refresh();
            }
            catch (Exception ex)
            {
                throw;
            }
        }

        protected void btnStatus_Click(object sender, EventArgs e)
        {
            Microsoft.Reporting.WebForms.ReportDataSource rds = new Microsoft.Reporting.WebForms.ReportDataSource();
            FilterbyStatusTableAdapters.DeliveryOrderReportByStatusTableAdapter DORSTA = new FilterbyStatusTableAdapters.DeliveryOrderReportByStatusTableAdapter();
            DORSTA.ClearBeforeFill = true;

            try 
            { 
            
                }
        }
    }
}