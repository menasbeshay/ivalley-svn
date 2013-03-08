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

public partial class AdminPoliceStation : System.Web.UI.Page
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
            LoadGoves();
            Master.PageHeader = GetLocalResourceObject("lblHeaderPage").ToString();
            Master.MainHeader = GetLocalResourceObject("lblMainPage").ToString();
            Filter();
        }
    }

    /// <summary>
    /// Link Gove code click handler
    /// to allow edit this gov
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void lnkGovCode_Click(object sender, EventArgs e)
    {
        LinkButton lnk = (LinkButton)sender;
        txtCivilCode.Text = lnk.Text;
        txtCivilName.Text = lnk.CommandArgument;
        drpGove.SelectedIndex = drpGove.Items.IndexOf(drpGove.Items.FindByValue(lnk.ToolTip));
        btnSave.Text = "تعديل";
        txtCivilCode.ReadOnly = true;
    }

    /// <summary>
    /// Link Gove code click handler
    /// to allow edit this gov
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void lnkDelete_Click(object sender, EventArgs e)
    {
        LinkButton lnk = (LinkButton)sender;
        CIVIL_OFFICE delpolice = new CIVIL_OFFICE();
        delpolice.LoadByPrimaryKey(short.Parse(lnk.CommandArgument));
        delpolice.MarkAsDeleted();
        delpolice.Save();
        Filter();
    }

    #endregion

    #region "Methods"

    private void Filter()
    {
        CIVIL_OFFICE obj = new CIVIL_OFFICE();
        obj.Where.FK_GOVCD.Value = short.Parse(drpGove.SelectedValue);
        obj.Where.FK_GOVCD.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
        obj.Query.AddOrderBy(CIVIL_OFFICE.ColumnNames.DESCR, MyGeneration.dOOdads.WhereParameter.Dir.ASC);
        obj.Query.Load();
        grdGovernate.DataSource = obj.DefaultView;
        grdGovernate.DataBind();
    }

    #endregion

    protected void btnSave_Click(object sender, EventArgs e)
    {
        CIVIL_OFFICE objpolice = new CIVIL_OFFICE();
        if (txtCivilCode.ReadOnly)
        {
            try
            {
                // update case
                objpolice.LoadByPrimaryKey(short.Parse(txtCivilCode.Text));
                objpolice.DESCR = txtCivilName.Text;
                objpolice.FK_GOVCD = short.Parse(drpGove.SelectedValue);
                objpolice.Save();
                txtCivilCode.ReadOnly = false;
                Filter();
                //txtFilter.Text = "";
                txtCivilCode.Text = "";
                txtCivilName.Text = "";
                btnSave.Text = "اضافة";
            }
            catch
            {
                MHOCommon.ShowMessage("لقد حاولت ادخال اسم ادارة موجود من قبل", this.Page);
            }
        }
        else
        {
            try
            {
                //Insert case
                objpolice.AddNew();
                objpolice.CD = short.Parse(txtCivilCode.Text);
                objpolice.DESCR = txtCivilName.Text;
                objpolice.FK_GOVCD = short.Parse(drpGove.SelectedValue);
                objpolice.Save();
                Filter();
                //txtFilter.Text = "";
                txtCivilCode.Text = "";
                txtCivilName.Text = "";
            }
            catch
            {
                MHOCommon.ShowMessage("لقد حاولت ادخال كود موجود او اسم الادارة موجود من قبل", this.Page);
            }
        }
    }

    protected void grdGovernate_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdGovernate.PageIndex = e.NewPageIndex;
        Filter();
    }

    private void LoadGoves()
    {
        GOVERNORATE gov = new GOVERNORATE();
        gov.LoadAll();
        drpGove.DataSource = gov.DefaultView;
        drpGove.DataTextField = GOVERNORATE.ColumnNames.DESCR;
        drpGove.DataValueField = GOVERNORATE.ColumnNames.CD;
        drpGove.DataBind();
        drpGove.SelectedIndex = 0;
    }

    protected void drpGove_SelectedIndexChanged(object sender, EventArgs e)
    {
        Filter();
    }
}
