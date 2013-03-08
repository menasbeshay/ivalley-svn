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

public partial class AdminGovernate : System.Web.UI.Page
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
            Master.PageHeader = GetLocalResourceObject("lblHeaderPage").ToString();
            Master.MainHeader = GetLocalResourceObject("lblMainPage").ToString();
            Filter("");
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
        txtGoveCode.Text = lnk.Text;
        txtGoveCode.ReadOnly = true;
        txtGoveName.Text = lnk.CommandArgument;
        btnSave.Text = "تعديل";
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
        GOVERNORATE delgov = new GOVERNORATE();
        delgov.LoadByPrimaryKey(short.Parse(lnk.CommandArgument));
        delgov.MarkAsDeleted();
        delgov.Save();
        Filter("");
    }

    #endregion

    #region "Methods"

    private void Filter( string filter)
    {
        GOVERNORATE objGov = new GOVERNORATE();
        //objGov.Where.DESCR.Value = filter;
        //objGov.Where.DESCR.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;

        objGov.Query.AddOrderBy(GOVERNORATE.ColumnNames.DESCR, MyGeneration.dOOdads.WhereParameter.Dir.ASC);
        objGov.Query.Load();
        grdGovernate.DataSource = objGov.DefaultView;
        grdGovernate.DataBind();
    }

    #endregion

    protected void btnSave_Click(object sender, EventArgs e)
    {
        GOVERNORATE objGovInsUpd = new GOVERNORATE();
        if (txtGoveCode.ReadOnly)
        {
            // update case
            objGovInsUpd.LoadByPrimaryKey(short.Parse(txtGoveCode.Text));
            objGovInsUpd.DESCR = txtGoveName.Text;
            objGovInsUpd.Save();
            txtGoveCode.ReadOnly = false;
            Filter("");
            //txtFilter.Text = "";
            txtGoveCode.Text = "";
            txtGoveName.Text = "";
            btnSave.Text = "اضافة";
        }
        else
        {
            try
            {
                //Insert case
                objGovInsUpd.AddNew();
                objGovInsUpd.CD = short.Parse(txtGoveCode.Text);
                objGovInsUpd.DESCR = txtGoveName.Text;
                objGovInsUpd.Save();
                Filter("");
                //txtFilter.Text = "";
                txtGoveCode.Text = "";
                txtGoveName.Text = "";
            }
            catch
            {
                MHOCommon.ShowMessage("لقد حاولت ادخال كود موجود اوهناك خطأ فى البيانات", this.Page);
            }
        }
    }
    protected void grdGovernate_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdGovernate.PageIndex = e.NewPageIndex;
        Filter("");
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Filter("");
    }
}
