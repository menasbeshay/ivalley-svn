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

public partial class AdminArea : System.Web.UI.Page
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
            LoadPolice();
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
    protected void lnkAreaCode_Click(object sender, EventArgs e)
    {
        LinkButton lnk = (LinkButton)sender;
        txtAreaCode.Text = lnk.Text;
        txtAreaName.Text = lnk.CommandName;
        drpGove.SelectedIndex = drpGove.Items.IndexOf(drpGove.Items.FindByValue(lnk.ToolTip));
        drpPoliceStation.SelectedIndex = drpPoliceStation.Items.IndexOf(drpPoliceStation.Items.FindByValue(lnk.CommandArgument));
        btnSave.Text = "تعديل";
        txtAreaCode.ReadOnly = true;
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
        AREA delarea = new AREA();
        delarea.LoadByPrimaryKey(int.Parse(lnk.CommandArgument));
        delarea.MarkAsDeleted();
        delarea.Save();
        Filter();
    }

    #endregion

    #region "Methods"

    private void Filter()
    {
        V_Area_Police_Gov obj = new V_Area_Police_Gov();
        obj.Where.GoveID.Value = short.Parse(drpGove.SelectedValue);
        obj.Where.GoveID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
        obj.Where.GoveID.Conjuction = MyGeneration.dOOdads.WhereParameter.Conj.And;
        obj.Where.PoliceID.Value = int.Parse(drpPoliceStation.SelectedValue);
        obj.Where.PoliceID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;

        obj.Query.AddOrderBy(V_Area_Police_Gov.ColumnNames.AreaName, MyGeneration.dOOdads.WhereParameter.Dir.ASC);
        obj.Query.Load();
        grdGovernate.DataSource = obj.DefaultView;
        grdGovernate.DataBind();
    }

    #endregion

    protected void btnSave_Click(object sender, EventArgs e)
    {
        AREA objArea = new AREA();
        if (txtAreaCode.ReadOnly)
        {
            try
            {
                // update case
                objArea.LoadByPrimaryKey(int.Parse(txtAreaCode.Text));
                objArea.DESCR = txtAreaName.Text;
                objArea.FK_POLICECD = int.Parse(drpPoliceStation.SelectedValue);
                objArea.Save();
                txtAreaCode.ReadOnly = false;
                Filter();
                //txtFilter.Text = "";
                txtAreaCode.Text = "";
                txtAreaName.Text = "";
                btnSave.Text = "اضافة";
            }
            catch
            {
                MHOCommon.ShowMessage("لقد حاولت ادخال اسم شياخة موجود من قبل", this.Page);
            }
        }
        else
        {
            try
            {
                //Insert case
                objArea.AddNew();
                objArea.CD = int.Parse(txtAreaCode.Text);
                objArea.DESCR = txtAreaName.Text;
                objArea.FK_POLICECD = int.Parse(drpPoliceStation.SelectedValue );
                objArea.Save();
                Filter();
                //txtFilter.Text = "";
                txtAreaCode.Text = "";
                txtAreaName.Text = "";
            }
            catch
            {
                MHOCommon.ShowMessage("لقد حاولت ادخال كود موجود او اسم الشياخة موجود من قبل", this.Page);
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

    private void LoadPolice()
    {
        drpPoliceStation.Items.Clear();
        POLICE_STATION pol = new POLICE_STATION();
        pol.Where.FK_GOVCD.Value = short.Parse(drpGove.SelectedValue);
        pol.Where.FK_GOVCD.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
        pol.Query.AddOrderBy(POLICE_STATION.ColumnNames.DESCR, MyGeneration.dOOdads.WhereParameter.Dir.ASC);
        pol.Query.Load();
        if (pol.RowCount > 0)
        {
            drpPoliceStation.DataSource = pol.DefaultView;
            drpPoliceStation.DataTextField = POLICE_STATION.ColumnNames.DESCR;
            drpPoliceStation.DataValueField = POLICE_STATION.ColumnNames.CD;
        }
        else
            drpPoliceStation.DataSource = null;
        
        drpPoliceStation.DataBind();
    }

    protected void drpGove_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadPolice();
        Filter();
    }
    protected void drpPoliceStation_SelectedIndexChanged(object sender, EventArgs e)
    {
        Filter();
    }
}
