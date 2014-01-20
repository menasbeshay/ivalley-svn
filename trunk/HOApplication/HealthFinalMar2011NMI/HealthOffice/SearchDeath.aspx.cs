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

public partial class SearchDeath : System.Web.UI.Page
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
            
           
        }
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Master.PageHeader = GetLocalResourceObject("lblHeaderPage").ToString();
        }
    }

    /// <summary>
    /// btn born name click
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void lnkDeadName_Click(object sender, EventArgs e)
    {
         LinkButton btn = (LinkButton)sender;
         if (User.IsInRole("Doctor"))
         {
             Response.Redirect("RegisterDeathCase.aspx?ForApprove=2&DeadEventID=" + ((LinkButton)sender).CommandArgument);
         }
         if (btn.CommandName == "False")
         {
             Response.Redirect("RegisterDeathCase.aspx?DeadEventID=" + ((LinkButton)sender).CommandArgument);
         }
         else
         {
             Response.Redirect("RegisterDeathCase.aspx?DeadEventID=" + ((LinkButton)sender).CommandArgument
                                                                     + "&ForApprove=2");
         }
    }

    /// <summary>
    /// Filter all born based on special crietirea
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnFilter_Click(object sender, EventArgs e)
    {
        if (txtDateFrom.Text != "" && txtDateTo.Text == "")
        {
            MHOCommon.ShowMessage("يجب ادخل الحد الاقصى للتاريخ", this.Page);
            return;
        }
        if (txtDateTo.Text != "" && txtDateFrom.Text == "")
        {
            MHOCommon.ShowMessage("يجب ادخل الحد الادنى للتاريخ", this.Page);
            return;
        }
        Filter();
    }

    protected void grdDead_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridViewRow row = e.Row;
        if (row.RowType == DataControlRowType.DataRow)
        {
            Label lbApproved = (Label)row.FindControl("lblApproved");
            DataRowView dr = (DataRowView)row.DataItem;
            if (dr["DeadDecisionNo"] != System.DBNull.Value)
            {
                LinkButton btn = (LinkButton)row.FindControl("lnkDeadName");
                btn.CommandArgument = btn.CommandArgument + "&IsLostCase=true";
            }
            if (dr["Approved"].ToString() != "False")
            {
                lbApproved.Text = "موثق";
            }
            else
            {
                lbApproved.Text = "غير موثق";
            }
        }
    }

    protected void grdDead_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdDead.PageIndex = e.NewPageIndex;
        Filter();
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        MHOCommon.WriteQrsDead(new Guid(btn.CommandArgument.ToString()));
        ScriptManager.RegisterStartupScript(this, this.GetType(), "openPrint", string.Format("window.open('Print.aspx?Born=0&Dead=1&DeadEventID={0}');", btn.CommandArgument.ToString()), true);
        
    }
    #endregion

    #region "Methods"

    private void Filter()
    {

        Dead objDead = new Dead();
        

        DataTable res =
        objDead.FilterDead(MHOCommon.ConnString, MHOCommon.CurrentOrgID.Value,txtDeadName.Text,txtDeadNID.Text,txtInformerNID.Text, txtDateFrom.Text, txtDateTo.Text);

        grdDead.DataSource = res.DefaultView;
        grdDead.DataBind();
    }

    #endregion

   
}
