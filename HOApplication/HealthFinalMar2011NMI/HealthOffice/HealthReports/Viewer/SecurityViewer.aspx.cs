using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;
using Microsoft.Reporting.WebForms;

public partial class SecurityViewer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {



    }
    public static void RenderReport()
    {
    }
    protected void UmisReportViewer_Init(object sender, EventArgs e)
    {

    }
    protected void UmisReportViewer_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            try
            {
                               
                UmisReportViewer.ServerReport.ReportServerUrl = new Uri(ConfigurationManager.AppSettings["ReportServer"]);
                UmisReportViewer.ServerReport.ReportPath = "/" + ConfigurationManager.AppSettings["ReportFolder"] + "/" + Request.QueryString["rptRDL"];                
                // use network credentials 
                if (ConfigurationManager.AppSettings["UseReportServerCredentials"] == "True")
                {
                    string reportsUserName = ConfigurationManager.AppSettings["reportsUserName"];
                    string reportsPassword = ConfigurationManager.AppSettings["reportsPassword"];
                    string reportsDomain = ConfigurationManager.AppSettings["reportsDomain"];
                    UmisReportViewer.ServerReport.ReportServerCredentials = new CustomReportCredentials(reportsUserName, reportsPassword, reportsDomain);
                } 
                
                this.Title = Request.QueryString["rptRDL"];
                int count = Request.QueryString.Keys.Count;
                List<Microsoft.Reporting.WebForms.ReportParameter> rptList = new List<Microsoft.Reporting.WebForms.ReportParameter>();
                for (int i = 0; i < count; i++)
                {
                    if (Request.QueryString.Keys[i].ToLower() != "rptrdl" && Request.QueryString.Keys[i].ToLower() != "rqpage")
                    {
                        rptList.Add(new Microsoft.Reporting.WebForms.ReportParameter(Request.QueryString.Keys[i], Request.QueryString[i]));

                        //lbltstParam.Text += "<b>Key:</b> " + Request.QueryString.Keys[i] + " <b>Value:</b> " + Request.QueryString[i];
                        //lbltstParam.Text += "<br/>";
                    }
                }
                UmisReportViewer.ServerReport.SetParameters(rptList);
                UmisReportViewer.ServerReport.Refresh();
            }
            catch (Exception ex)
            {
                // ConfirmUserControl.Visible = true;
                // ConfirmUserControl.ShowException(ex);

            }
            finally
            {
                //UmisReportViewer.ServerReport.
            }
    }
    protected void btnBack_Click(object sender, ImageClickEventArgs e)
    {

        Response.Redirect(Request.QueryString["rqpage"]);
    }
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.QueryString["rqpage"]);

    }
    protected void uiLinkButtonExportExcel_Click(object sender, EventArgs e)
    {
        Warning[] warnings;
        string[] streamids;
        string mimeType;
        string encoding;
        string extension;
        string deviceInfo;

        byte[] bytes = UmisReportViewer.ServerReport.Render("Excel", null, out mimeType, out encoding, out extension,out streamids, out warnings);

        Response.ContentType = "application/Excel";
        Response.AppendHeader("Content-Disposition", "attachment; filename=\"report1.xls\"");
        Response.OutputStream.Write(bytes, 0, bytes.Length);
        Response.Flush();
        Response.End();
    }
    protected void uiLinkButtonExportPDF_Click(object sender, EventArgs e)
    {
        Warning[] warnings;
        string[] streamids;
        string mimeType;
        string encoding;
        string extension;
        string deviceInfo;

        byte[] bytes = UmisReportViewer.ServerReport.Render("pdf", null, out mimeType, out encoding, out extension, out streamids, out warnings);

        Response.ContentType = "application/pdf";
        Response.AppendHeader("Content-Disposition", "attachment; filename=\"report1.pdf\"");
        Response.OutputStream.Write(bytes, 0, bytes.Length);
        Response.Flush();
        Response.End();
    }
}
