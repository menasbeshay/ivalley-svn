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

public partial class Register : System.Web.UI.Page
{
    #region Properties
    public TextBox NationalId
    {
        get
        {
            return (TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("txtNationalId");
        }
    }

    public TextBox FirstName
    {
        get
        {
            return (TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("txtFirstName");
        }
    }

    public TextBox FatherName
    {
        get
        {
            return (TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("txtFatherName");
        }
    }

    public Literal LabelErr
    {
        get
        {
            return (Literal)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("ErrorMessage");
        }
    }

    public DropDownList DrpRole
    {
        get
        {
            return (DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("dropRole");
        }
    }
    public DropDownList DropGov
    {
        get
        {
            return (DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("drpGov");
        }
    }
    public DropDownList DrpCivil
    {
        get
        {
            return (DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("drpCivil");
        }
    }
    public DropDownList DrpHealthOffice
    {
        get
        {
            return (DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("drpHealthOffice");
        }
    }
    #endregion

    #region Events
    //protected void btnAddNewUser_Click(object sender, EventArgs e)
    //{
    //    Response.Redirect("Register.aspx");
    //}
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
    protected void btnSearch_Click(object sender, ImageClickEventArgs e)
    {
        search();
        // FirstName.Text = "مايكل";
        //FatherName.Text = "حشمت يوسف";
        FirstName.ReadOnly = false;
        FatherName.ReadOnly = false;
    }
    protected void dropRole_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DrpRole.SelectedValue == "SuperAdmin")
        {
            DrpHealthOffice.Enabled = false;
            DrpCivil.Enabled = false;
            DropGov.Enabled = false;
        }
        if (DrpRole.SelectedValue == "Admin")
        {
            LoadGoves();
            LoadCivilByGov();
            LoadHealthOfficeByCivil();
            DrpHealthOffice.Enabled = false;
            DrpCivil.Enabled = false;
            DropGov.Enabled = true;
        }
        else if (DrpRole.SelectedValue == "SubAdmin")
        {
            LoadGoves();
            LoadCivilByGov();
            LoadHealthOfficeByCivil();
            DrpHealthOffice.Enabled = false;
            DrpCivil.Enabled = true;
            DropGov.Enabled = true;
        }
        else if (DrpRole.SelectedValue == "Doctor" || DrpRole.SelectedValue == "Writer")
        {
            DrpCivil.Enabled = true;
            DrpHealthOffice.Enabled = true;
            DropGov.Enabled = true;
            LoadGoves();
            LoadCivilByGov();
            LoadHealthOfficeByCivil();
        }

        if (User.IsInRole("Admin"))
        {
            DropGov.Enabled = false;
            DropGov.SelectedIndex = DropGov.Items.IndexOf(DropGov.Items.FindByValue(MHOCommon.CurrentOrgGovID.ToString()));
            LoadCivilByGov();
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadGoves();

            if (User.IsInRole("Admin"))
            {
                ListItem itemMinistry = DrpRole.Items[0];
                ListItem itemGov = DrpRole.Items[1];
                DrpRole.Items.Remove(itemMinistry);
                DrpRole.Items.Remove(itemGov);
                DrpRole.SelectedIndex = 0;
                dropRole_SelectedIndexChanged(null, null);
            }
        }
    }
    /// <summary>
    /// Search function when button search pressed
    /// </summary>
    private void search()
    {
        if (MHOCommon.ValidateNationalIDInput(NationalId.Text, null))
        {
            MHOCommon.NationalIdData? nidData = MHOCommon.RequestNationalIDData(NationalId.Text);
            if (nidData != null)
            {
                FirstName.Text = nidData.Value.FirstName;
                FatherName.Text = nidData.Value.FatherName + " " + nidData.Value.FamilyName + " " + nidData.Value.SureName;

            }
            else
            {
                LabelErr.Text = "خطا فى خدمة استرجاع بيانات الرقم القومى";
                FirstName.Text = "";
                FatherName.Text = "";

            }
        }
        else
        {
            LabelErr.Text = "الرقم القومى غير صحيح";
            FirstName.Text = "";
            FatherName.Text = "";

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
        FirstName.ReadOnly = false;
        FatherName.ReadOnly = false;
    }
    protected void txtNationalId_TextChanged(object sender, EventArgs e)
    {
        FirstName.Text = string.Empty;
        FatherName.Text = string.Empty;
    }
    protected void drpGov_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList dropGov = (DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("drpGov");
        //if (dropGov.SelectedValue != "-1")
        //{
        LoadCivilByGov();
        LoadHealthOfficeByCivil();
        //}
    }
    protected void drpCivil_SelectedIndexChanged(object sender, EventArgs e)
    {
        DropDownList drpCivil = (DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("drpCivil");
        //if (drpCivil.SelectedValue != "-1")
        //{
        LoadHealthOfficeByCivil();
        //}
    }
    /// <summary>
    /// 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {
        try
        {


            DropDownList dropOrg = (DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("droOrg");
            DropDownList dropRole = (DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("dropRole");
            TextBox txtPhoneNumber = (TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("txtPhoneNo");
            TextBox txtQalification = (TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("txtqulification");
            DropDownList dropStatus = (DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("drpStatus");

            OrgUser orgUser = new MHO.BLL.OrgUser();
            aspnet_Users user = new aspnet_Users();
            // string currentUserName = user.UserName;
            user.GetUserByName(((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("username")).Text);
            orgUser.Insert(user.UserId, FirstName.Text, FatherName.Text, NationalId.Text, Convert.ToInt32(DropGov.SelectedValue), Convert.ToInt32(DrpCivil.SelectedValue), Convert.ToInt32(DrpHealthOffice.SelectedValue),
                txtPhoneNumber.Text, txtQalification.Text, dropStatus.SelectedValue == "1" ? true : false);
            Roles.AddUserToRole(((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("username")).Text, dropRole.SelectedValue);
            user = null;
            aspnet_Users user1 = new aspnet_Users();
            user1.GetUserByName(Page.User.Identity.Name);
            // CreateUserWizard1.MoveTo(CreateUserWizardStep2);
        }
        catch (Exception ex)
        {
        }
        finally
        {
            Response.Redirect("RegisterUserResult.aspx");
        }
          
    }

    protected void CreateUserWizard1_CreatingUser(object sender, LoginCancelEventArgs e)
    {

        OrgUser objUser = new OrgUser();
        objUser.Where.NationalId.Value = ((TextBox)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("txtNationalId")).Text;
        objUser.Where.NationalId.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
        //if (objUser.Query.Load())
        //{
        //    MHOCommon.ShowMessage("لقد ادخلت رقم قومى موجود من قبل ", this.Page);
        //    e.Cancel = true;
        //    return;
        //}

        DropDownList dropRole = (DropDownList)CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("dropRole");
        if (dropRole.SelectedValue == "Admin")
        {

            if (DropGov.SelectedValue == "-1")
            {
                MHOCommon.ShowMessage("يجب اختيار مديرية صحية", this.Page);
                e.Cancel = true;
            }
            return;
        }

        if (dropRole.SelectedValue == "SubAdmin")
        {

            if (DropGov.SelectedValue == "-1" || DrpCivil.SelectedValue == "-1")
            {
                MHOCommon.ShowMessage("يجب اختيار مديرية صحية /ادارة صحية", this.Page);
                e.Cancel = true;
            }
            return;
        }
        if (dropRole.SelectedValue == "Doctor" || dropRole.SelectedValue == "Writer")
        {

            if (DropGov.SelectedValue == "-1" || DrpCivil.SelectedValue == "-1" || DrpHealthOffice.SelectedValue == "-1")
            {
                MHOCommon.ShowMessage("يجب اختيار مديرية صحية/ ادارة صحية / مكتب صحة", this.Page);
                e.Cancel = true;
            }
            return;
        }
        
    }
    #endregion

    #region Methods
    private void LoadGoves()
    {

        GOVERNORATE gov = new GOVERNORATE();
        gov.LoadAll();
        DropGov.DataSource = gov.DefaultView;
        DropGov.DataTextField = GOVERNORATE.ColumnNames.DESCR;
        DropGov.DataValueField = GOVERNORATE.ColumnNames.CD;
        DropGov.DataSource = gov.DefaultView;
        DropGov.DataBind();
        DropGov.Items.Insert(0, new ListItem("اختر مديرية", "-1"));
        DropGov.SelectedIndex = 0;
    }
    private void LoadCivilByGov()
    {

        CIVIL_OFFICE civil = new CIVIL_OFFICE();
        civil.Where.FK_GOVCD.Value = DropGov.SelectedValue;
        civil.Query.Load();
        DrpCivil.DataTextField = CIVIL_OFFICE.ColumnNames.DESCR;
        DrpCivil.DataValueField = CIVIL_OFFICE.ColumnNames.CD;
        DrpCivil.DataSource = civil.DefaultView;
        DrpCivil.DataBind();
        DrpCivil.Items.Insert(0, new ListItem("اختر ادارة", "-1"));
    }
    private void LoadHealthOfficeByCivil()
    {

        health_office healthOffice = new health_office();
        healthOffice.Where.CIVILCD.Value = DrpCivil.SelectedValue;
        healthOffice.Query.Load();
        DrpHealthOffice.DataTextField = health_office.ColumnNames.HEALTHDESCR;
        DrpHealthOffice.DataValueField = health_office.ColumnNames.HEALTHCD;
        DrpHealthOffice.DataSource = healthOffice.DefaultView;
        DrpHealthOffice.DataBind();
        DrpHealthOffice.Items.Insert(0, new ListItem("اختر مكتب", "-1"));
    }

    #endregion

}
