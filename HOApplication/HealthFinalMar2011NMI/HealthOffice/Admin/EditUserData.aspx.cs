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

public partial class Admin_EditUserData : System.Web.UI.Page
{
    #region Properties
    public Guid? UserId
    {
        get
        {
            if (Request.QueryString["UserId"] != null)
            {
                return new Guid(Request.QueryString["UserId"].ToString());
            }
            else
                return null;
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
    /// <summary>
    /// Click Handler for search button
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        search();
        txtFirstName.ReadOnly = false;
        txtFatherName.ReadOnly = false;
    }
    protected void txtNationalId_TextChanged(object sender, EventArgs e)
    {
        txtFirstName.Text = string.Empty;
        txtFatherName.Text = string.Empty;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadGoves();
            LoadData();

            if (User.IsInRole("Admin"))
            {
                dropRole.Enabled = false;
                drpCivil.Enabled = false;
                drpGov.Enabled = false;
                drpHealthOffice.Enabled = false;
            }
        }
    }

    protected void dropRole_SelectedIndexChanged(object sender, EventArgs e)
    {
        //if (dropRole.SelectedIndex == 1)
        //{
        //    LoadGoves();
        //    drpHealthOffice.Enabled = false;
        //    drpCivil.Enabled = false;
        //}
        //else if (dropRole.SelectedIndex == 2)
        //{
        //    LoadGoves();
        //    drpHealthOffice.Enabled = false;
        //    drpCivil.Enabled = true;
        //}
        //else if (dropRole.SelectedIndex == 3 || dropRole.SelectedIndex == 4)
        //{
        //    drpCivil.Enabled = true;
        //    drpHealthOffice.Enabled = true;
        //    LoadGoves();
        //}
        if (dropRole.SelectedIndex == 0)
        {
            drpHealthOffice.Enabled = false;
            drpCivil.Enabled = false;
            drpGov.Enabled = false;
        }
        if (dropRole.SelectedIndex == 1)
        {
            LoadGoves();
            LoadCivilByGov();
            LoadHealthOfficeByCivil();
            drpHealthOffice.Enabled = false;
            drpCivil.Enabled = false;
            drpGov.Enabled = true;
        }
        else if (dropRole.SelectedIndex == 2)
        {
            LoadGoves();
            LoadCivilByGov();
            LoadHealthOfficeByCivil();
            drpHealthOffice.Enabled = false;
            drpCivil.Enabled = true;
            drpGov.Enabled = true;
        }
        else if (dropRole.SelectedIndex == 3 || dropRole.SelectedIndex == 4)
        {
            drpCivil.Enabled = true;
            drpHealthOffice.Enabled = true;
            drpGov.Enabled = true;
            LoadGoves();
            LoadCivilByGov();
            LoadHealthOfficeByCivil();
        }
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        try
        {
            OrgUser orgUser = new MHO.BLL.OrgUser();
            orgUser.Update(UserId.Value, txtFirstName.Text, txtFatherName.Text, txtNationalId.Text, Convert.ToInt32(drpGov.SelectedValue), Convert.ToInt32(drpCivil.SelectedValue), Convert.ToInt32(drpHealthOffice.SelectedValue),
                    txtPhoneNo.Text, txtqulification.Text, drpStatus.SelectedValue == "1" ? true : false);
            orgUser = new MHO.BLL.OrgUser();
            orgUser.UpdateUserDetails(UserId.Value, new Guid(dropRole.SelectedValue), UserName.Text, Email.Text);
            ErrorMessage.Text = "تم التعديل بنجاح";
        }
        catch (Exception ex)
        {
            //ErrorMessage.Text = ex.ToString();
            ErrorMessage.Text = "لقد ادخلت رقم قومى موجود من قبل او هناك خطأ فى البيانات";
        }
    }


    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("EditUser.aspx");
    }

    protected void drpGov_SelectedIndexChanged(object sender, EventArgs e)
    {

        if (drpGov.SelectedValue != "-1")
        {
            LoadCivilByGov();
        }
    }
    protected void drpCivil_SelectedIndexChanged(object sender, EventArgs e)
    {

        if (drpCivil.SelectedValue != "-1")
        {
            LoadHealthOfficeByCivil();
        }
    }
    #endregion

    #region Methods
    /// <summary>
    /// Load data
    /// </summary>
    private void LoadData()
    {
        if (UserId != null)
        {
            aspnet_Users aspnet_Users = new aspnet_Users();
            DataTable dt = aspnet_Users.GetUserData(UserId.Value);
            if (dt.Rows.Count > 0)
            {
                dropRole.SelectedIndex = dropRole.Items.IndexOf(
                                           dropRole.Items.FindByValue(dt.Rows[0]["RoleId"].ToString().ToUpper()));

                txtqulification.Text = dt.Rows[0]["QualificationInfo"].ToString();
                txtPhoneNo.Text = dt.Rows[0]["PhoneNumber"].ToString();
                if (dt.Rows[0]["GovId"] != System.DBNull.Value)
                {

                    drpGov.SelectedIndex = drpGov.Items.IndexOf(
                                           drpGov.Items.FindByValue(dt.Rows[0]["GovId"].ToString()));
                    drpGov_SelectedIndexChanged(null, null);
                }
                if (dt.Rows[0]["CivilId"] != System.DBNull.Value)
                {
                    drpCivil.SelectedIndex = drpCivil.Items.IndexOf(
                                           drpCivil.Items.FindByValue(dt.Rows[0]["CivilId"].ToString()));

                    drpCivil_SelectedIndexChanged(null, null);
                }
                if (dt.Rows[0]["HealthOfficeId"] != System.DBNull.Value)
                {
                    drpHealthOffice.SelectedIndex = drpHealthOffice.Items.IndexOf(
                                           drpHealthOffice.Items.FindByValue(dt.Rows[0]["HealthOfficeId"].ToString()));

                }
                txtNationalId.Text = dt.Rows[0]["NationalId"].ToString();
                txtFirstName.Text = dt.Rows[0]["FirstName"] != System.DBNull.Value ? dt.Rows[0]["FirstName"].ToString() : string.Empty;
                txtFatherName.Text = dt.Rows[0]["FatherName"] != System.DBNull.Value ? dt.Rows[0]["FatherName"].ToString() : string.Empty;
                Email.Text = dt.Rows[0]["Email"].ToString();
                drpStatus.SelectedIndex = drpStatus.Items.IndexOf(
                                          drpStatus.Items.FindByValue(dt.Rows[0]["Status"].ToString() == "True" ? "1" : "0"));

                UserName.Text = dt.Rows[0]["UserName"].ToString();
            }
        }
        else
        {
            btnEdit.Enabled = false;
        }
    }
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
    /// <summary>
    /// Search function when button search pressed
    /// </summary>
    private void search()
    {
        if (MHOCommon.ValidateNationalIDInput(txtNationalId.Text, null))
        {
            MHOCommon.NationalIdData? nidData = MHOCommon.RequestNationalIDData(txtNationalId.Text);
            if (nidData != null)
            {
                //txtFirstName.Text
                ErrorMessage.Text = nidData.Value.FirstName;
                txtFatherName.Text = nidData.Value.FatherName + " " + nidData.Value.FamilyName;

            }
            else
            {
                ErrorMessage.Text = "خطا فى خدمة استرجاع بيانات الرقم القومى";
                txtFirstName.Text = "";
                txtFatherName.Text = "";

            }
        }
        else
        {
            ErrorMessage.Text = "الرقم القومى غير صحيح";
            txtFirstName.Text = "";
            txtFatherName.Text = "";

        }

    }
    #endregion

}
