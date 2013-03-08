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
            LoadLookups();
            LoadGoves();
            LoadCivilOffice();
            LoadPoliceStation();
            LoadArea();
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
        health_office obj = new health_office();
        obj.LoadByPrimaryKey(int.Parse(lnk.Text));
        txtHealthOfficeCode.Text = lnk.Text;
        txtHealthOfficeName.Text = obj.HEALTHDESCR;
        if (obj.s_IsTown != "")
            chkIsTown.Checked = obj.IsTown;
        else
            chkIsTown.Checked = false;

        //drpGove.SelectedIndex = drpGove.Items.IndexOf(drpGove.Items.FindByValue(obj.GOVCD.ToString()));
       // drpCivilOffice.SelectedIndex = drpCivilOffice.Items.IndexOf(drpCivilOffice.Items.FindByValue(obj.CIVILCD.ToString()));
        drpGove.Enabled = false;
        drpCivilOffice.Enabled = false;

        if (obj.s_POLICECD != "")
            drpPoliceStation.SelectedIndex = drpPoliceStation.Items.IndexOf(
                                             drpPoliceStation.Items.FindByValue(obj.POLICECD.ToString()));
        else
            drpPoliceStation.SelectedIndex = 0;

        if (obj.s_AREACD != "")
        {
            LoadArea();
            dropArea.SelectedIndex = dropArea.Items.IndexOf(
                                     dropArea.Items.FindByValue(obj.AREACD.ToString()));
        }
        else
            dropArea.SelectedIndex = 0;

        btnSave.Text = "تعديل";
        txtHealthOfficeCode.ReadOnly = true;

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
        health_office delarea = new health_office();
        delarea.LoadByPrimaryKey(int.Parse(lnk.CommandArgument));
        delarea.MarkAsDeleted();
        delarea.Save();
        Filter();
    }

    #endregion

    #region "Methods"

    private void Filter()
    {
        health_office obj = new health_office();
        grdGovernate.DataSource = obj.GetHealthOfficeDetails(short.Parse(drpGove.SelectedValue), short.Parse(drpCivilOffice.SelectedValue)).DefaultView;
        grdGovernate.DataBind();
    }

    #endregion

    protected void btnSave_Click(object sender, EventArgs e)
    {
        health_office objHo = new health_office();
        if (txtHealthOfficeCode.ReadOnly)
        {
            // update case
            objHo.LoadByPrimaryKey(int.Parse(txtHealthOfficeCode.Text));
            objHo.HEALTHDESCR = txtHealthOfficeName.Text;
            objHo.CIVILCD = int.Parse(drpCivilOffice.SelectedValue);
            objHo.CIVILDESCR = drpCivilOffice.SelectedItem.Text;
            objHo.POLICECD = int.Parse(drpPoliceStation.SelectedValue);
            objHo.AREACD = int.Parse(dropArea.SelectedValue);
            objHo.IsTown = chkIsTown.Checked;

            objHo.Save();
            txtHealthOfficeCode.ReadOnly = false;
            Filter();
            //txtFilter.Text = "";
            txtHealthOfficeCode.Text = "";
            txtHealthOfficeName.Text = "";
            drpGove.Enabled = true;
            drpCivilOffice.Enabled = true;
            chkIsTown.Checked = false;
            drpPoliceStation.SelectedIndex = 0;
            dropArea.SelectedIndex = 0;
            btnSave.Text = "اضافة";
        }
        else
        {
            try
            {
                //Insert case
                objHo.AddNew();
                objHo.HEALTHCD = int.Parse(txtHealthOfficeCode.Text);
                objHo.HEALTHDESCR = txtHealthOfficeName.Text;
                objHo.CIVILCD = int.Parse(drpCivilOffice.SelectedValue);
                objHo.CIVILDESCR = drpCivilOffice.SelectedItem.Text;
                objHo.POLICECD = int.Parse(drpPoliceStation.SelectedValue);
                objHo.AREACD = int.Parse(dropArea.SelectedValue);
                objHo.IsTown = chkIsTown.Checked;

                objHo.Save();
                Filter();
                //txtFilter.Text = "";
                txtHealthOfficeCode.Text = "";
                txtHealthOfficeName.Text = "";
                drpGove.Enabled = true;
                chkIsTown.Checked = false;
                drpCivilOffice.Enabled = true;
                drpPoliceStation.SelectedIndex = 0;
                dropArea.SelectedIndex = 0;
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
        Filter();
    }

    private void LoadGoves()
    {
        //GOVERNORATE gov = new GOVERNORATE();
        //gov.LoadAll();
        drpGove.DataSource = MHOCommon.tblGovernate.DefaultView;
        drpGove.DataTextField = GOVERNORATE.ColumnNames.DESCR;
        drpGove.DataValueField = GOVERNORATE.ColumnNames.CD;
        drpGove.DataBind();
        drpGove.SelectedIndex = 0;
        
      
    }

    private void LoadCivilOffice()
    {
        CIVIL_OFFICE pol = new CIVIL_OFFICE();
        pol.Where.FK_GOVCD.Value = short.Parse(drpGove.SelectedValue);
        pol.Where.FK_GOVCD.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
        pol.Query.AddOrderBy(CIVIL_OFFICE.ColumnNames.DESCR, MyGeneration.dOOdads.WhereParameter.Dir.ASC);
        pol.Query.Load();
        drpCivilOffice.DataSource = pol.DefaultView;
        drpCivilOffice.DataTextField = POLICE_STATION.ColumnNames.DESCR;
        drpCivilOffice.DataValueField = POLICE_STATION.ColumnNames.CD;
        drpCivilOffice.DataBind();
    }

    protected void drpGove_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadCivilOffice();
        LoadPoliceStation();
        LoadArea();
        Filter();
    }
    protected void drpCivilOffices_SelectedIndexChanged(object sender, EventArgs e)
    {
        Filter();
    }

    #region Address

    /// <summary>
    /// load lookup data.
    /// </summary>
    private void LoadLookups()
    {
        GOVERNORATE objGov = new GOVERNORATE();
        objGov.LoadAll();
    }

    /// <summary>
    /// Load Police station for selected governate
    /// </summary>
    public void LoadPoliceStation()
    {
       DataTable dt = MHOCommon.LoadPoliceStationsForGovID(short.Parse(drpGove.SelectedValue));
        if (dt.Rows.Count > 0)
        {
            drpPoliceStation.DataSource = dt;
            drpPoliceStation.DataTextField = POLICE_STATION.ColumnNames.DESCR;
            drpPoliceStation.DataValueField = POLICE_STATION.ColumnNames.CD;
            drpPoliceStation.DataBind();

            ListItem item = new ListItem("-----", "0");
            drpPoliceStation.Items.Insert(0, item);
            drpPoliceStation.SelectedIndex = 0;
        }
    }

    public void LoadArea()
    {
       DataTable dtRes = MHOCommon.LoadAreasForPoliceID(int.Parse(drpPoliceStation.SelectedValue));
        if (dtRes.Rows.Count > 0)
        {
            dropArea.DataSource = dtRes;
            dropArea.DataTextField = AREA.ColumnNames.DESCR;
            dropArea.DataValueField = AREA.ColumnNames.CD;
            dropArea.DataBind();

            ListItem item = new ListItem("-----", "0");
            dropArea.Items.Insert(0, item);
            dropArea.SelectedIndex = 0;
        }
    }

    #endregion
    protected void drpPoliceStation_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadArea();
    }
    protected void grdGovernate_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridViewRow row = e.Row;
        if (row.RowType == DataControlRowType.DataRow)
        {
            if (row.Cells[4].Text == "True")
                row.Cells[4].Text = "حضر";
            if (row.Cells[4].Text == "False")
                row.Cells[4].Text = "ريف";
        }
    }
}
