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

public partial class ApproveBirth : System.Web.UI.Page
{

    #region Events

    /// <summary>
    /// Load event
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            loadBirthData();
            //GetLocalResourceObject("lblHeaderPage").ToString();
        }
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        if(!Page.IsPostBack)
        Master.PageHeader = "قائمة ادخالات المواليد غير المؤكدة";
    }

    /// <summary>
    /// btn born name click
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void lnkBornName_Click(object sender, EventArgs e)
    {
        Response.Redirect("RegisterBirthInfo.aspx?BornEventID=" + ((LinkButton)sender).CommandArgument
                                                                + "&ForApprove=1");
    }

    protected void grdBorns_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridViewRow row = e.Row;
        if (row.RowType == DataControlRowType.DataRow)
        {
            DataRowView dr = (DataRowView)row.DataItem;
            if (dr["BornDecisionNo"] != System.DBNull.Value)
            {
                LinkButton btn = (LinkButton)row.FindControl("lnkBornName");
                btn.CommandArgument = btn.CommandArgument + "&IsLostCase=true";
            }

        }
    }

    #endregion

    #region "Methods"

    private void loadBirthData()
    {
        Born objBorn = new Born();
        grdBorns.DataSource = objBorn.LoadNonApprovedBorns(MHOCommon.CurrentOrgID.Value);
        grdBorns.DataBind();
    }

    #endregion
   
}
