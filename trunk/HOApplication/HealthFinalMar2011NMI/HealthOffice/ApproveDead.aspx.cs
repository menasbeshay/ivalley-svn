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

public partial class ApproveDead : System.Web.UI.Page
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
            
        }
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Master.PageHeader = "قائمة ادخالات الوفيات غير المؤكدة";//GetLocalResourceObject("lblHeaderPage").ToString();
        }
    }

    /// <summary>
    /// btn born name click
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void lnkBornName_Click(object sender, EventArgs e)
    {
        Response.Redirect("RegisterDeathCase.aspx?DeadEventID=" + ((LinkButton)sender).CommandArgument
                                                                + "&ForApprove=1");
    }

    protected void grdDead_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridViewRow row = e.Row;
        if (row.RowType == DataControlRowType.DataRow)
        {
            DataRowView dr = (DataRowView)row.DataItem;
            if (dr["DeadDecisionNo"] != System.DBNull.Value)
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
        Dead objDead = new Dead();
        objDead.Where.OrgID.Value = MHOCommon.CurrentOrgID.Value;
        objDead.Where.OrgID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
        objDead.Where.OrgID.Conjuction = MyGeneration.dOOdads.WhereParameter.Conj.And;
        objDead.Where.Approved.Value = 0;
        objDead.Where.Approved.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
        objDead.Where.Approved.Conjuction = MyGeneration.dOOdads.WhereParameter.Conj.And;
        objDead.Where.HasHealthData.Value = 1;
        objDead.Where.HasHealthData.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
        objDead.Query.AddOrderBy(Dead.ColumnNames.RegisterDate, MyGeneration.dOOdads.WhereParameter.Dir.ASC);
        
        objDead.Query.Load();

        grdBorns.DataSource = objDead.DefaultView;
        grdBorns.DataBind();
    }

    #endregion
   
}
