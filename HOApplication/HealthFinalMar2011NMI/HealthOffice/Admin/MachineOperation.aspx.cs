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

[Serializable]
public partial class Admin_MachineOperation : System.Web.UI.Page
{
    #region Propertie
    public Guid? SelectedMachineId
    {
        set {
            ViewState["SelectedMachineId"] = value;
            }
        get
        {
            if (ViewState["SelectedMachineId"] != null)
            {
                return new Guid(ViewState["SelectedMachineId"].ToString());
                
            }
            else
            {
                return null;
            }
        }
    }

    public Guid? SelectedOrgIPId
    {
        set
        {
            ViewState["SelectedOrgIPId"] = value;
        }
        get
        {
            if (ViewState["SelectedOrgIPId"] != null)
            {
                return new Guid(ViewState["SelectedOrgIPId"].ToString());
                
            }
            else
            {
                return null;
            }
        }
    }

    
    public string OldIP
    {
        get
        {
            if (Session["oldIP"] == null)
                return "";
            return Session["oldIP"].ToString();
        }
        set
        {
            Session["oldIP"] = value;
        }
    }
    #endregion

    #region Events
    protected void Page_PreInit(Object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (User.IsInRole("Admin"))
            {
                this.MasterPageFile = "~/MasterPages/AdminGov.master";
            }
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        lblMsg.Text = "";
        if(!IsPostBack)
        {
            LoadLocation();
            LoadGridData();

            // Handlle Admin Gov Case
            if (User.IsInRole("Admin"))
            {
                ListItem itemMinistry = drpLocation.Items[0];
                ListItem itemGov = drpLocation.Items[1];
                drpLocation.Items.Remove(itemMinistry);
                drpLocation.Items.Remove(itemGov);
                drpLocation.SelectedIndex = 0;
                drpLocation_SelectedIndexChanged(null, null);
            }
        }
        lblGov.BackColor = System.Drawing.Color.FromName("#efefef");
        lblCivil.BackColor = System.Drawing.Color.FromName("#efefef");
        lblOffice.BackColor = System.Drawing.Color.FromName("#efefef");
    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            lblPageHeader.Text = "اضافة و تعديل بيانات جهاز";
        }
    }
    protected void drpLocation_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drpLocation.SelectedValue != "-1" && drpLocation.SelectedValue == "1")
        {
            LoadGoves();
            LoadCivilByGov();
            LoadHealthOfficeByCivil();
            drpHealthOffice.Enabled = false;
            drpCivil.Enabled = false;
            drpGov.Enabled = false;
        }
        else if (drpLocation.SelectedValue != "-1" && drpLocation.SelectedValue == "2")
        {
            LoadGoves();
            LoadCivilByGov();
            LoadHealthOfficeByCivil();
            drpGov.Enabled = true;
            drpHealthOffice.Enabled = false;
            drpCivil.Enabled = false;
        }
        else if (drpLocation.SelectedValue != "-1" && drpLocation.SelectedValue == "3")
        {
            LoadGoves();
            LoadCivilByGov();
            LoadHealthOfficeByCivil();
            drpGov.Enabled = true;
            drpHealthOffice.Enabled = false;
            drpCivil.Enabled = true;
        }
        else if (drpLocation.SelectedValue != "-1" && drpLocation.SelectedValue == "4")
        {
            drpCivil.Enabled = true;
            drpHealthOffice.Enabled = true;
            drpGov.Enabled = true;
            LoadGoves();
            LoadCivilByGov();
            LoadHealthOfficeByCivil();
        }
        
        if (User.IsInRole("Admin"))
        {
            drpGov.Enabled = false;
            drpGov.SelectedIndex = drpGov.Items.IndexOf(drpGov.Items.FindByValue(MHOCommon.CurrentOrgGovID.ToString()));
            LoadCivilByGov();
        }
        txtIP.Text = "";
        LoadGridData();
    }
    protected void drpGov_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drpGov.SelectedValue != "-1")
        {
            LoadCivilByGov();
        }
        LoadGridData();
    }
    protected void drpCivil_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drpCivil.SelectedValue != "-1")
        {
            LoadHealthOfficeByCivil();
        }
        LoadGridData();
    }
    
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (!LogicValidateData())
            return;
        try
        {
            if (txtIP.Text == "0.0.0.0")
            {
                lblMsg.Text = "رقم التعريف خاطىء";
                return;
            }

            Machine machine;
            if (Session["Edit"] == null)
            {
                machine = new Machine();
                machine.AddNewMachine(Convert.ToInt32(drpLocation.SelectedValue), Convert.ToInt32(drpGov.SelectedValue), Convert.ToInt32(drpCivil.SelectedValue), Convert.ToInt32(drpHealthOffice.SelectedValue), txtIP.Text, drpStatus.SelectedValue == "1" ? true : false);
                LoadGridData();
                lblMsg.Text = "تمت الاضافة بنجاح";
            }
            else
            {
                // update
                if (SelectedMachineId != null && SelectedOrgIPId != null)
                {
                    machine = new Machine();
                    machine.UpdateMachine(SelectedMachineId.Value, SelectedOrgIPId.Value, Convert.ToInt32(drpLocation.SelectedValue), Convert.ToInt32(drpGov.SelectedValue), Convert.ToInt32(drpCivil.SelectedValue), Convert.ToInt32(drpHealthOffice.SelectedValue), txtIP.Text, drpStatus.SelectedValue == "1" ? true : false);
                    Session.Remove("Edit");
                    LoadGridData();
                    lblMsg.Text = "تم التعديل بنجاح";
                    txtIP.Text = string.Empty;

                    if (!User.IsInRole("Admin"))
                    {
                        drpHealthOffice.Enabled = true;
                        drpGov.Enabled = true;
                        drpCivil.Enabled = true;
                        drpLocation.Enabled = true;
                    }
                    else
                    {
                        drpLocation.Enabled = true;
                        drpCivil.Enabled = true;
                        drpHealthOffice.Enabled = true;
                    }
                   
                }
            }
            btnAdd.Text = "اضافــة";
        }
        catch (Exception ex)
        {            
            if (ex.Message.Contains("Cannot insert duplicate key"))
            lblMsg.Text = "خطأ : يوجد جهاز بنفس رقم التعريف";
            else
                lblMsg.Text = "خطأ يوجد مشكلة في اجراء العملية";
        }

    }
    protected void grdMachine_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridViewRow row = e.Row;
        if (row.RowType == DataControlRowType.DataRow)
        {
            Label lblStatus = (Label)row.FindControl("lblStatus");
            DataRowView dr = (DataRowView)row.DataItem;
            if (Convert.ToBoolean(dr["Status"].ToString()))
            {
                lblStatus.Text = "يعمل";
            }
            else
            {
                lblStatus.Text = "لا يعمل";
            }
        }
    }

    protected void lnkEdit_Click(object sender, EventArgs e)
    {
        Button delbtn = (Button)sender;
        string[] strIds = delbtn.CommandArgument.Split(',');
        SelectedMachineId = new Guid(strIds[0]);
        SelectedOrgIPId = new Guid(strIds[1]);
        Button btn = (Button)sender;
        GridViewRow row = (GridViewRow)btn.NamingContainer;
        int SelectedRowIndex = row.RowIndex;

        //**** Load drop down values ******************** 
        if (row.Cells[0].Text != "")
        {
            drpLocation.SelectedIndex =
                drpLocation.Items.IndexOf(drpLocation.Items.FindByText(row.Cells[0].Text));
        }
        if (row.Cells[1].Text != "")
        {
            drpGov.SelectedIndex =
                drpGov.Items.IndexOf(drpGov.Items.FindByText(row.Cells[1].Text));
            LoadCivilByGov();
        }
        if (row.Cells[2].Text != "")
        {
            drpCivil.SelectedIndex =
                drpCivil.Items.IndexOf(drpCivil.Items.FindByText(row.Cells[2].Text));
            LoadHealthOfficeByCivil();
        }
        if (row.Cells[3].Text != "")
        {
            drpHealthOffice.SelectedIndex =
                drpHealthOffice.Items.IndexOf(drpHealthOffice.Items.FindByText(row.Cells[3].Text));
        }
        
        //*********************************************
        btnAdd.Text = "تعديــل";
        Session["Edit"]=true;
        drpHealthOffice.Enabled = false;
        drpGov.Enabled= false;
        drpCivil.Enabled = false;
        drpLocation.Enabled = false;
        OldIP = grdMachine.DataKeys[SelectedRowIndex].Values["OrgIP"].ToString();
        txtIP.Text = OldIP;
        drpStatus.SelectedIndex = Convert.ToBoolean(grdMachine.DataKeys[SelectedRowIndex].Values["Status"].ToString()) ? 0 : 1;
        LoadGridData();
    }
    protected void grdMachine_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdMachine.PageIndex = e.NewPageIndex;
        LoadGridData();
    }
    protected void lnkDelete_Click(object sender, EventArgs e)
    {
        try
        {
            Button delbtn = (Button)sender;
            string[] strIds = delbtn.CommandArgument.Split(',');
            Guid machineId = new Guid(strIds[0]);
            Guid orgId = new Guid(strIds[1]);
            OrganizationMachineIP prgMachineIP = new OrganizationMachineIP();
            prgMachineIP.DeleteOrgIp(orgId);
            try
            {
                Machine machine = new Machine();
                machine.DeleteMachine(machineId);
            }
            catch (Exception ex)
            {
            }
            LoadGridData();
        }
        catch (Exception ex)
        {
            lblMsg.Text = "توجد مشكلة في الحذف";
        }
    }
    #endregion

    #region Methods
    private void LoadGoves()
    {
        GOVERNORATE gov = new GOVERNORATE();
        gov.LoadAll();
        drpGov.DataSource = gov.DefaultView;
        drpGov.DataTextField = GOVERNORATE.ColumnNames.DESCR;
        drpGov.DataValueField = GOVERNORATE.ColumnNames.CD;
        drpGov.DataSource = gov.DefaultView;
        drpGov.DataBind();
        drpGov.Items.Insert(0, new ListItem("اختر مديرية", "-1"));
        drpGov.SelectedIndex = 0;
    }
    private void LoadLocation()
    {
        Location_types locations = new Location_types();
        locations.LoadAll();
        drpLocation.DataTextField = Location_types.ColumnNames.Descr;
        drpLocation.DataValueField = Location_types.ColumnNames.Cd;
        drpLocation.DataSource = locations.DefaultView;
        drpLocation.DataBind();
       
    }
    private void loadAllCivil()
    {
        CIVIL_OFFICE civil = new CIVIL_OFFICE();
        civil.LoadAll();
        drpCivil.DataTextField = CIVIL_OFFICE.ColumnNames.DESCR;
        drpCivil.DataValueField = CIVIL_OFFICE.ColumnNames.CD;
        drpCivil.DataSource = civil.DefaultView;
        drpCivil.DataBind();
        drpCivil.Items.Insert(0, new ListItem("اختر ادارة", "-1"));
    }
    private void LoadCivilByGov()
    {
        CIVIL_OFFICE civil = new CIVIL_OFFICE();
        civil.Where.FK_GOVCD.Value = drpGov.SelectedValue;
        civil.Query.Load();
        drpCivil.DataTextField = CIVIL_OFFICE.ColumnNames.DESCR;
        drpCivil.DataValueField = CIVIL_OFFICE.ColumnNames.CD;
        drpCivil.DataSource = civil.DefaultView;
        drpCivil.DataBind();
        drpCivil.Items.Insert(0, new ListItem("اختر ادارة", "-1"));
    }
    private void LoadAllHealthOffice()
    {
        health_office healthOffice = new health_office();
        healthOffice.LoadAll();
        drpHealthOffice.DataTextField = health_office.ColumnNames.HEALTHDESCR;
        drpHealthOffice.DataValueField = health_office.ColumnNames.HEALTHCD;
        drpHealthOffice.DataSource = healthOffice.DefaultView;
        drpHealthOffice.DataBind();
        drpHealthOffice.Items.Insert(0, new ListItem("اختر مكتب", "-1"));
        
    }
    private void LoadHealthOfficeByCivil()
    {
        health_office healthOffice = new health_office();
        healthOffice.Where.CIVILCD.Value = drpCivil.SelectedValue;
        healthOffice.Query.Load();
        drpHealthOffice.DataTextField = health_office.ColumnNames.HEALTHDESCR;
        drpHealthOffice.DataValueField = health_office.ColumnNames.HEALTHCD;
        drpHealthOffice.DataSource = healthOffice.DefaultView;
        drpHealthOffice.DataBind();
        drpHealthOffice.Items.Insert(0, new ListItem("اختر مكتب", "-1"));
    }
    private void LoadGridData()
    {
         Machine machine = new Machine();
         grdMachine.DataSource = machine.GetMachineDetails(Convert.ToInt32(drpLocation.SelectedValue), Convert.ToInt32(drpGov.SelectedValue), Convert.ToInt32(drpCivil.SelectedValue), Convert.ToInt32(drpHealthOffice.SelectedValue));
         grdMachine.DataBind();
    }
    private bool LogicValidateData()
    {
        if (drpLocation.SelectedValue == "2" && drpGov.SelectedValue == "-1")
        {
            lblMsg.Text = "برجاء اختيار مديرية الصحة";
            lblGov.BackColor = System.Drawing.Color.Red;
            return false;
        }
        if (drpLocation.SelectedValue == "3" && drpGov.SelectedValue == "-1")
        {
            lblMsg.Text = "برجاء اختيار مديرية الصحة";
            lblGov.BackColor = System.Drawing.Color.Red;
            return false;
        }
        else if (drpLocation.SelectedValue == "3" && drpCivil.SelectedValue == "-1")
        {
            lblMsg.Text = "برجاء اختيار الادارة الصحية";
            lblCivil.BackColor = System.Drawing.Color.Red;
            return false;
        }
        if (drpLocation.SelectedValue == "4" && drpGov.SelectedValue == "-1")
        {
            lblMsg.Text = "برجاء اختيار مديرية الصحة";
            lblGov.BackColor = System.Drawing.Color.Red;
            return false;
        }
        else if (drpLocation.SelectedValue == "4" && drpCivil.SelectedValue == "-1")
        {
            lblMsg.Text = "برجاء اختيار الادارة الصحية";
            lblCivil.BackColor = System.Drawing.Color.Red;
            return false;
        }
        else if (drpLocation.SelectedValue == "4" && drpHealthOffice.SelectedValue== "-1")
        {
            lblMsg.Text = "برجاء اختيار مكتب الصحة";
            lblOffice.BackColor = System.Drawing.Color.Red;
            return false;
        }
        health_office hoObject = new health_office();
        if (Session["Edit"] != null)
        {
            // update case
            if (txtIP.Text == OldIP)
            {
                return true;
            }
        }
        DataTable dtHodetails = hoObject.GetDefaultHealthOfficeData(txtIP.Text);
        if (dtHodetails.Rows.Count > 0)
        {
            string message="";
            
            if (dtHodetails.Rows[0]["LocationTypeID"].ToString() == "4")
            {
                message = "رقم تعريف الحاسب موجود بالفعل فى" + "<br>" +  " مديرية:" + dtHodetails.Rows[0]["GoveName"].ToString() +
                           "<br> " + "  ادارة:" + dtHodetails.Rows[0]["CivilName"].ToString() +
                           "<br> " + "  مكتب صحة:" + dtHodetails.Rows[0]["HEALTHDESCR"].ToString();
            }
            else if (dtHodetails.Rows[0]["LocationTypeID"].ToString() == "3")
            {
                message = "رقم تعريف الحاسب موجود بالفعل فى مديرية:" + dtHodetails.Rows[0]["GoveName"].ToString() +
                           "<br> " + "  ادارة:" + dtHodetails.Rows[0]["CivilName"].ToString();
            }
            else if (dtHodetails.Rows[0]["LocationTypeID"].ToString() == "2")
            {
                message = "رقم تعريف الحاسب موجود بالفعل فى مديرية:" + dtHodetails.Rows[0]["GoveName"].ToString();
            }
            else if (dtHodetails.Rows[0]["LocationTypeID"].ToString() == "1")
            {
                message = "رقم تعريف الحاسب موجود بالفعل فى ديوان عام وزارة الصحة";
            }
            lblMsg.Text = message;
            return false;
        }
        return true;
    }
    #endregion
  
}
