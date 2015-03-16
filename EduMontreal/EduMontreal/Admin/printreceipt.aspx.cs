using EDU.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EduMontreal.Admin
{
    public partial class printreceipt : System.Web.UI.Page
    {
        public int StatusHistoryID
        {
            get
            {
                if (Request.QueryString["id"] != null)
                {
                    int d = 0;
                    int.TryParse(Request.QueryString["id"].ToString(), out d);
                    return d;
                }
                return 0;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CurrentAdminUser"] == null)
                {
                    Response.Redirect("adminlogin");
                }

                if (StatusHistoryID != 0)
                {
                    ApplicationStatusHistory history = new ApplicationStatusHistory();
                    history.LoadByPrimaryKey(StatusHistoryID);

                    uiReportViewer.LocalReport.ReportPath = "admin/EDUReceipt.rdlc";
                    uiReportViewer.LocalReport.EnableExternalImages = true;

                    uiReportViewer.LocalReport.DataSources.Clear();

                    uiReportViewer.LocalReport.DataSources.Add(new Microsoft.Reporting.WebForms.ReportDataSource("AppReceiptDataSet", history.DefaultView));                    
                    uiReportViewer.LocalReport.Refresh();
                }
            }
        }
    }
}