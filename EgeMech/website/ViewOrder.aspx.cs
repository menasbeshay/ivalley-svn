using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace website
{
    public partial class ViewOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                EGEMech.BLL.Order order = new EGEMech.BLL.Order ();
                order.LoadByPrimaryKey(Convert.ToInt32(Request.QueryString["oid"].ToString()));
                order.LoadByPrimaryKey(order.OrderID);
                EGEMech.BLL.OrderDetails details = new EGEMech.BLL.OrderDetails();
                details.GetOrderDetails(order.OrderID);

                ReportViewer1.LocalReport.ReportPath = "Report1.rdlc";
                ReportViewer1.LocalReport.DataSources.Add(new Microsoft.Reporting.WebForms.ReportDataSource("DataSet1", order.DefaultView));
                ReportViewer1.LocalReport.DataSources.Add(new Microsoft.Reporting.WebForms.ReportDataSource("DataSet2", details.DefaultView));
                ReportViewer1.LocalReport.Refresh();
            }
        }
    }
}