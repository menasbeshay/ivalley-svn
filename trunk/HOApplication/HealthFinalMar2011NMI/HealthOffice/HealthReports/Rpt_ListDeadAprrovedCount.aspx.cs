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
using MHO.BLL;
public partial class HealthReports_Rpt_ListDeadAprrovedCount : System.Web.UI.Page
{
    string StarDate, EndDate;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            lblMsg.Visible = false;
           
            StarDate=lblFrom.Text = string.IsNullOrEmpty(Request.QueryString["startdate"]) ? "" : Request.QueryString["startdate"];
            EndDate=lblTo.Text = string.IsNullOrEmpty(Request.QueryString["enddate"]) ? "" : Request.QueryString["enddate"];
            LoadGridData();
        }
        catch
        {
            lblMsg.Visible = true;
        }
    }
    #region Methods
    private void LoadGridData()
    {
            Dead objDead = new Dead();
            grdListDeadAprrovedCount.DataSource = objDead.ListDeadAprrovedCount(StarDate, EndDate);
            grdListDeadAprrovedCount.DataBind();
    }
    #endregion
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/reports.aspx");
    }
}
