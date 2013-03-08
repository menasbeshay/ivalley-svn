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

public partial class AdminOrg : System.Web.UI.Page
{
    #region Properties

    public Guid CurrentOrgID
    {
        get
        {
            return new Guid(ViewState["CurrentOrgID"].ToString());
        }
        set
        {
            ViewState["CurrentOrgID"] = value;
        }
    }

    #endregion

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
            LoadLookups();
            LoadPoliceStation();
            LoadArea();
            loadMainOffices();
            Filter();
        }
    }

    protected void drpState_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadPoliceStation();
        LoadArea();
        Filter();
    }

    protected void dropSection_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadArea();
        Filter();
    }

    protected void lnkGovCode_Click(object sender, EventArgs e)
    {
        LinkButton lnk = (LinkButton)sender;
        V_Org obj = new V_Org();
        obj.Where.OrgID.Value = new Guid(lnk.CommandArgument);
        obj.Where.OrgID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
        obj.Query.Load();
        string parent = string.IsNullOrEmpty(obj.OrgParentID.ToString()) ? "0" : obj.OrgParentID.ToString();
        drpMainOrg.SelectedIndex = drpMainOrg.Items.IndexOf(
                                   drpMainOrg.Items.FindByValue(parent));
        drpState.SelectedIndex = drpState.Items.IndexOf(
                                 drpState.Items.FindByValue(obj.GoveID.ToString()));
        dropSection.SelectedIndex = dropSection.Items.IndexOf(
                                    dropSection.Items.FindByValue(obj.PoliceID.ToString()));
        drpSubSection.SelectedIndex = drpSubSection.Items.IndexOf(
                                      drpSubSection.Items.FindByValue(obj.AreaID.ToString()));
        txtOfficeName.Text = obj.OrgDescription;
        chkISOfficeInTown.Checked = obj.OrgType;
        CurrentOrgID = obj.OrgID;

        btnSave.Text = "تعديل";
    }

    protected void lnkDelete_Click(object sender, EventArgs e)
    {
        try
        {
            Organization org = new Organization();
            org.LoadByPrimaryKey(new Guid(((LinkButton)sender).CommandArgument));
            org.MarkAsDeleted();
            org.Save();
            Filter();
            loadMainOffices();
        }
        catch
        {
            MHOCommon.ShowMessage("لقد قمت بمحاولة حذف يحتوى على سجلات - العملية فشلت ", this.Page);
        }
    }

    protected void grdGovernate_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdGovernate.PageIndex = e.NewPageIndex;
        Filter();
    }

    #endregion

    #region "Methods"

    private void Filter()
    {
        V_Org obj = new V_Org();
        obj.Where.GoveID.Value = short.Parse(drpState.SelectedValue);
        obj.Where.GoveID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
        obj.Where.GoveID.Conjuction = MyGeneration.dOOdads.WhereParameter.Conj.And;
        obj.Where.PoliceID.Value = int.Parse(dropSection.SelectedValue);
        obj.Where.PoliceID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
        obj.Where.PoliceID.Conjuction = MyGeneration.dOOdads.WhereParameter.Conj.And;
        obj.Where.AreaID.Value = int.Parse(drpSubSection.SelectedValue);
        obj.Where.AreaID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;

        obj.Query.AddOrderBy(V_Org.ColumnNames.OrgDescription, MyGeneration.dOOdads.WhereParameter.Dir.ASC);
        obj.Query.Load();

        grdGovernate.DataSource = obj.DefaultView;
        grdGovernate.DataBind();
    }
    /// <summary>
    /// load lookup data.
    /// </summary>
    private void LoadLookups()
    {
        GOVERNORATE objGov = new GOVERNORATE();
        objGov.LoadAll();

        drpState.DataSource = objGov.DefaultView;
        drpState.DataTextField = GOVERNORATE.ColumnNames.DESCR;
        drpState.DataValueField = GOVERNORATE.ColumnNames.CD;
        drpState.DataBind();
        drpState.SelectedIndex = 0;
    }

    /// <summary>
    /// Load Police station for selected governate
    /// </summary>
    public void LoadPoliceStation()
    {
        POLICE_STATION objPolice = new POLICE_STATION();
        if (objPolice.LoadPoliceStationsForGoveID(drpState.SelectedValue))
        {
            dropSection.DataSource = objPolice.DefaultView;
            dropSection.DataTextField = POLICE_STATION.ColumnNames.DESCR;
            dropSection.DataValueField = POLICE_STATION.ColumnNames.CD;
            dropSection.DataBind();
        }
    }

    /// <summary>
    /// load area drop down
    /// </summary>
    public void LoadArea()
    {
        AREA objArea = new AREA();
        if (objArea.LoadAreaForPoliceID(dropSection.SelectedValue))
        {
            drpSubSection.DataSource = objArea.DefaultView;
            drpSubSection.DataTextField = AREA.ColumnNames.DESCR;
            drpSubSection.DataValueField = AREA.ColumnNames.CD;
            drpSubSection.DataBind();
        }
    }

    public void loadMainOffices()
    {
        Organization org = new Organization();
        org.Where.OrgParentID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.IsNull;
        org.Query.AddOrderBy(Organization.ColumnNames.OrgDescription, MyGeneration.dOOdads.WhereParameter.Dir.ASC);
        org.Query.Load();

        drpMainOrg.DataSource = org.DefaultView;
        drpMainOrg.DataTextField = Organization.ColumnNames.OrgDescription;
        drpMainOrg.DataValueField = Organization.ColumnNames.OrgID;
        drpMainOrg.DataBind();

        ListItem item = new ListItem("بدون مكتب اساسى", "0");
        drpMainOrg.Items.Insert(0, item);
        drpMainOrg.SelectedIndex = 0;

    }
    #endregion
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (btnSave.Text == "تعديل")
        {
            // Update case
            Organization org = new Organization();
            org.LoadByPrimaryKey(CurrentOrgID);
            org.GoveID = short.Parse(drpState.SelectedValue);
            org.PoliceID = int.Parse(dropSection.SelectedValue);
            org.AreaID = int.Parse(drpSubSection.SelectedValue);
            if (drpMainOrg.SelectedValue != "0")
                org.OrgParentID = new Guid(drpMainOrg.SelectedValue);
            else
                org.OrgParentID = Guid.Empty;
            org.OrgDescription = txtOfficeName.Text;
            org.OrgType = chkISOfficeInTown.Checked;
            org.Save();

            txtOfficeName.Text = "";
            drpMainOrg.SelectedIndex = 0;
            btnSave.Text = "اضافة";
            Filter();
        }
        else
        {
            //insert case
            Organization org = new Organization();
            org.AddNew();
            org.GoveID = short.Parse(drpState.SelectedValue);
            org.PoliceID = int.Parse(dropSection.SelectedValue);
            org.AreaID = int.Parse(drpSubSection.SelectedValue);
            if (drpMainOrg.SelectedValue != "0")
                org.OrgParentID = new Guid(drpMainOrg.SelectedValue);
            else
                org.OrgParentID = Guid.Empty;
            org.OrgDescription = txtOfficeName.Text;
            org.OrgType = chkISOfficeInTown.Checked;
            org.Save();

            txtOfficeName.Text = "";
            drpMainOrg.SelectedIndex = 0;
            Filter();
        }
        loadMainOffices();
    }
}
