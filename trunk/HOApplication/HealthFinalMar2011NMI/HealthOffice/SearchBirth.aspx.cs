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

public partial class SearchBirth : System.Web.UI.Page
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
            LoadLookups();
            
           
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
    protected void lnkBornName_Click(object sender, EventArgs e)
    {
        LinkButton btn = (LinkButton)sender;
        if (User.IsInRole("Doctor"))
        {
            Response.Redirect("RegisterBirthInfo.aspx?BornEventID=" + btn.CommandArgument
                                                                    + "&ForApprove=2");
        }
        if (btn.CommandName == "False")
        {
            Response.Redirect("RegisterBirthInfo.aspx?BornEventID=" + btn.CommandArgument);
        }
        else
        {
            Response.Redirect("RegisterBirthInfo.aspx?BornEventID=" + btn.CommandArgument
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

    protected void grdBorns_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridViewRow row = e.Row;
        if (row.RowType == DataControlRowType.DataRow)
        {
            Label lbApproved = (Label)row.FindControl("lblApproved");
            DataRowView dr = (DataRowView)row.DataItem;
            if (dr["BornDecisionNo"] != System.DBNull.Value)
            {
                LinkButton btn = (LinkButton)row.FindControl("lnkBornName");
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

    protected void grdBorns_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdBorns.PageIndex = e.NewPageIndex;
        Filter();
    }

    #endregion

    #region "Methods"

    private void LoadLookups()
    {
        ManualRegister objReg = new ManualRegister();
        objReg.Where.RegisterType.Value = 1;
        objReg.Where.RegisterType.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
        objReg.Where.RegisterType.Conjuction = MyGeneration.dOOdads.WhereParameter.Conj.And;
        
        objReg.Where.OrgID.Value = MHOCommon.CurrentOrgID;
        objReg.Where.OrgID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;

        objReg.Query.AddOrderBy(ManualRegister.ColumnNames.CurrentRegister, MyGeneration.dOOdads.WhereParameter.Dir.DESC);
        
        objReg.Query.Load();
        drpRegestierNoList.DataSource = objReg.DefaultView;
        drpRegestierNoList.DataTextField = ManualRegister.ColumnNames.RegisterCode;
        drpRegestierNoList.DataValueField = ManualRegister.ColumnNames.RegisterID;
        drpRegestierNoList.DataBind();
    }

    private void Filter()
    {
        Born objBorn = new Born();
        int regnoValue;
        if (txtRegNo.Text == "")
            regnoValue = 0;
        else
            regnoValue = int.Parse(txtRegNo.Text);

        DataTable res = 
        objBorn.FilterBorns(MHOCommon.ConnString, MHOCommon.CurrentOrgID.Value, txtFatherNID.Text, ""
                            , txtInformerNID.Text, 
                            new Guid(drpRegestierNoList.SelectedValue), regnoValue,txtDateFrom.Text,txtDateTo.Text);

            grdBorns.DataSource = res.DefaultView;
            grdBorns.DataBind();

    }

    #endregion
   
}
