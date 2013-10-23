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
    int GovID, CivilID, HealthOfficeID;
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            lblMsg.Visible = false;
           
            StarDate=lblFrom.Text = string.IsNullOrEmpty(Request.QueryString["startdate"]) ? "" : Request.QueryString["startdate"];
            EndDate=lblTo.Text = string.IsNullOrEmpty(Request.QueryString["enddate"]) ? "" : Request.QueryString["enddate"];
            GovID = string.IsNullOrEmpty(Request.QueryString["GovID"]) ? -1 : Convert.ToInt32(Request.QueryString["GovID"].ToString());
            CivilID = string.IsNullOrEmpty(Request.QueryString["CivilID"])  ? -1 : Convert.ToInt32(Request.QueryString["CivilID"].ToString());
            HealthOfficeID = string.IsNullOrEmpty(Request.QueryString["HealthOfficeID"])  ? -1 : Convert.ToInt32(Request.QueryString["HealthOfficeID"].ToString());
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
        if (GovID !=-1 && CivilID != -1 && HealthOfficeID != -1)
        {
            grdListDeadAprrovedCountHealthOffice.DataSource = objDead.ListDeadAprrovedCountHealthOffice(StarDate, EndDate, GovID, CivilID, HealthOfficeID);
            grdListDeadAprrovedCount.Visible = false;
            grdListDeadAprrovedCountCivil.Visible = false;
            grdListDeadAprrovedCountGov.Visible = false;
            grdListDeadAprrovedCountHealthOffice.DataBind();
            grdListDeadAprrovedCountHealthOffice.Visible = true;
        }
        else if (GovID != -1 && CivilID != -1)
        {
            grdListDeadAprrovedCountCivil.DataSource = objDead.ListDeadAprrovedCountCivil(StarDate, EndDate, GovID, CivilID);
            grdListDeadAprrovedCount.Visible = false;
            grdListDeadAprrovedCountHealthOffice.Visible = false;
            grdListDeadAprrovedCountGov.Visible = false;
            grdListDeadAprrovedCountCivil.Visible = true;
            grdListDeadAprrovedCountCivil.DataBind();
        }
        else if (GovID != -1)
        {
            grdListDeadAprrovedCountGov.DataSource = objDead.ListDeadAprrovedCountGov(StarDate, EndDate, GovID);
            grdListDeadAprrovedCount.Visible = false;
            grdListDeadAprrovedCountHealthOffice.Visible = false;
            grdListDeadAprrovedCountGov.Visible = true;
            grdListDeadAprrovedCountCivil.Visible = false;
            grdListDeadAprrovedCountGov.DataBind();
        }
        else
        {
            grdListDeadAprrovedCount.DataSource = objDead.ListDeadAprrovedCount(StarDate, EndDate);
            grdListDeadAprrovedCount.DataBind();
            grdListDeadAprrovedCount.Visible = true;
            grdListDeadAprrovedCountCivil.Visible = false;
            grdListDeadAprrovedCountHealthOffice.Visible = false;
            grdListDeadAprrovedCountGov.Visible = false;
        }
    }
    #endregion
    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/admin/reports.aspx");
    }
}
