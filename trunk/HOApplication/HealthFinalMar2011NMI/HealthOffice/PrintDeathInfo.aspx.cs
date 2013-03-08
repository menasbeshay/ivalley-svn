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

public partial class PrintDeathInfo : System.Web.UI.Page
{
    #region Properties
    private bool IsLostCase
    {
        get
        {
            if (Request.QueryString["IsLostCase"] != null)
            {
                return true;
            }
            else
                return false;
        }

    }
    /// <summary>
    /// Gets the BornEventId query string to update it
    /// </summary>
    private Guid? DeadEventIDParameter
    {
        get
        {
            if (Request.QueryString["DeadEventID"] != null)
            {
                return new Guid(Request.QueryString["DeadEventID"]);
            }
            else
            {
                return null;
            }
        }
    }

    private int? ForApprove
    {
        get
        {
            if (Request.QueryString["ForApprove"] == null)
            {
                return null;
            }
            else
            {
                return int.Parse(Request.QueryString["ForApprove"]);
            }
        }
    }
    #endregion

    #region Events
    /// <summary>
    /// Handles the load Event of Page
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadLookups();



        }

        //Master.MainHeader = GetLocalResourceObject("lblMainPage").ToString();

    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            LoadData();
            lblHealthOfficeValue.Text = MHOCommon.CurrentOrgName;
            lblRecordDateValue.Text = DateTime.Now.Date.ToShortDateString();
            if (IsLostCase)
            {
                DivDecision.Style.Add("display", "block");
                tblType.Style.Add("display", "block");

            }
            else
            {
                rdTypeList.SelectedValue = "0";
            }


            // Handle Approve case.
            if (ForApprove != null)
            {
                if (ForApprove.Value == 1)
                {
                    MHOCommon.DisablePageControls(DeathCaseConents, false);
                  
                    tblApprove.Style.Add("display", "block");
                    MHOCommon.DisablePageControls(tblApprove, true);
                }
                else
                {
                    MHOCommon.DisablePageControls(DeathCaseConents, false);
                }

            }
            else
            {
                if (Roles.IsUserInRole(Membership.GetUser().UserName, "Doctor"))
                {
                    FormsAuthentication.SignOut();
                    FormsAuthentication.RedirectToLoginPage();
                }
            }
        }
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (DeadEventIDParameter != null)
        {
            if (LogicValidation())
            {
                UpdateDeathData();
                Response.Redirect("BornResult.aspx?Dead=1");
            }
        }
        else
        {
            if (LogicValidation())
            {
                InsertDeathCase();
                Response.Redirect("BornResult.aspx?Dead=1");
            }

        }

    }

    protected void btnApprove_Click(object sender, EventArgs e)
    {
        Response.Redirect("RegisterDeathHealthInfo.aspx?ForUpdate=1&ForApprove=1&DeadEventID=" + DeadEventIDParameter.Value.ToString());
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("ApproveDead.aspx");
    }

    protected void rdTypeList_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rdTypeList.SelectedValue == "1")
        {
            rdTypeList.Enabled = false;
            DecisionControl1.lblDecisionDirector = "نيابة";
            UcDeathInfo2.EventDeadFamilyName = "مجهول";
            UcDeathInfo2.EventDeadFatherName = "مجهول";
            UcDeathInfo2.EventDeadFristName = "مجهول";
            UcDeathInfo2.EventDeadTitle = "مجهول";
            UcDeathInfo2.TxtNIDEnabledStatus = false;
            UcDeathInfo2.EventDeadNID = "0";
            //UcDeathInfo2.EventDeadNationality = 1;
            UcDeathInfo2.EventDeadReligion = 1;
            // UcDeathInfo2.EventDeadMartialStatus = 1;
            //UcDeathInfo2.EventDeadGender = 1;

            UcAddressInfo1.EventDeadAddressPhone = "-";
            UcAddressInfo1.EventDeadAddressStreet = "-";
            UcAddressInfo1.EventDeadAddressNo = "-";
            UcAddressInfo1.EventDeadAddressJob = "-";

            //UcAddressInfo1.DropState.ValidationGroup = "remove";
            //UcAddressInfo1.DropSubSection.ValidationGroup = "remove";
            UcAddressInfo1.EventDeadAddressSign = "-";

            UcMotherInfo2.ParentFamilyName = "-";
            UcMotherInfo2.ParentFatherName = "-";
            UcMotherInfo2.ParentFirstName = "-";
            UcMotherInfo2.ParentSureName = "-";
            UcMotherInfo2.ParentRelegion = 1;
            UcMotherInfo2.ParentJob = "-";

            UcNotifierInfo2.NotifierNID = "-";
            UcNotifierInfo2.NotifierFatherName = "-";
            UcNotifierInfo2.NotifierFName = "-";
            UcNotifierInfo2.NotifierphoneNo = "1";
            UcNotifierInfo2.NotifierRelation = 8;
        }
        else
        {
            UcDeathInfo2.TxtNIDEnabledStatus = true;
        }
    }

    #endregion

    #region Methods
    /// <summary>
    /// Load drop down list
    /// </summary>
    private void LoadLookups()
    {
        ManualRegister objReg = new ManualRegister();
        objReg.Where.CurrentRegister.Value = true;
        objReg.Where.CurrentRegister.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
        objReg.Where.CurrentRegister.Conjuction = MyGeneration.dOOdads.WhereParameter.Conj.And;
        objReg.Where.RegisterType.Value = 2;//for born
        objReg.Where.RegisterType.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
        objReg.Where.RegisterType.Conjuction = MyGeneration.dOOdads.WhereParameter.Conj.And;
        objReg.Where.OrgID.Value = MHOCommon.CurrentOrgID;
        objReg.Where.OrgID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
        objReg.Query.Load();

        //drpRegestierNoList.DataSource = objReg.DefaultView;
        //drpRegestierNoList.DataTextField = ManualRegister.ColumnNames.RegisterCode;
        //drpRegestierNoList.DataValueField = ManualRegister.ColumnNames.RegisterID;
        //drpRegestierNoList.DataBind();

        drpRegestierNoList.Value = objReg.RegisterID.ToString();
        txtRegestierNoList.Text = objReg.RegisterCode;

    }

    private void LoadData()
    {
        DecisionControl1.HealthOffice = "المعادي";
        if (DeadEventIDParameter != null)
        {
           
            Dead objDead = new Dead();
            objDead.LoadByPrimaryKey(DeadEventIDParameter.Value);
            UcDeathInfo2.ShowHideNID(objDead.DeadNationality == 13818);
            UcDeathInfo2.EventDeadNID = objDead.DeadNID;
            UcDeathInfo2.EventDeadGender = objDead.DeadGender;
            UcDeathInfo2.EventDeadFristName = objDead.DeadFirstName;
            UcDeathInfo2.EventDeadFatherName = objDead.DeadFatherName;
            UcDeathInfo2.EventDeadFamilyName = objDead.DeadGrandName;
            UcDeathInfo2.EventDeadTitle = objDead.DeadFamilyName;
            UcDeathInfo2.EventDeadNationality = objDead.DeadNationality;
            UcDeathInfo2.EventDeadReligion = objDead.DeadReligion;
            UcDeathInfo2.EventDeadMartialStatus = objDead.DeadMartialStatus;
            UcDeathInfo2.EventDeadCardNo = objDead.PaperID;
            UcDeathInfo2.EventDeadCardType = objDead.PaperIDType;
            UcDeathInfo2.EventCardLocation = objDead.PaperIssuePlace;
            UcDeathInfo2.ProveType = objDead.ProveText;
            UcDeathInfo2.ProveNo = objDead.ProveNumber;
            UcDeathInfo2.EventDeadBirthDate = objDead.DeadBirthDate.ToShortDateString();

            UcAddressInfo1.EventDeadAddressNo = objDead.AddressNo;
            UcAddressInfo1.EventDeadAddressStreet = objDead.AddressStreet;
            UcAddressInfo1.EventDeadAddressSign = objDead.AddressFeatured;
            UcAddressInfo1.DeadAddressGovernate = objDead.DeadGovernorate;
            UcAddressInfo1.LoadPoliceStation();
            UcAddressInfo1.DeadAddressPoliceStation = objDead.DeadSection;
            UcAddressInfo1.LoadArea();
            UcAddressInfo1.DeadAddressArea = objDead.DeadArea;
            UcAddressInfo1.EventDeadAddressPhone = objDead.DeadPhone;
            UcAddressInfo1.EventDeadAddressJob = objDead.DeadJob;
            
            UcGeneralDeathInfo1.EventDeadDieDate = objDead.DeadDieDate.ToShortDateString();
            UcGeneralDeathInfo1.EventDeadPlace = objDead.DiePlace;
            UcGeneralDeathInfo1.EventDeadPlaceDescription = objDead.DiePlaceDescription;
            UcGeneralDeathInfo1.EventDeadDieHour = objDead.DeadDieHour;
            UcGeneralDeathInfo1.EventDeadDieMin = objDead.DeadDieMin;
            //objDead.DieGovernorate = -- ToDO
            //objDead.DieSection = --ToDo
            //objDead.DieArea = --ToDo
            UcMotherInfo2.ParentNID = objDead.DeadMotherNID;
            UcMotherInfo2.ParentNationality = objDead.DeadMotherNationality;
            UcMotherInfo2.ParentFirstName = objDead.DeadMotherFirstName;
            UcMotherInfo2.ParentFatherName = objDead.DeadMotherSecondName;
            UcMotherInfo2.ParentFamilyName = objDead.DeadMotherFamilyName;
            //UcMotherInfo2.ParentSureName = objDead.deadmo
            UcMotherInfo2.ParentRelegion = objDead.DeadMotherReligion;
            UcMotherInfo2.ParentJob = objDead.DeadMotherJob;
            UcNotifierInfo2.NotifierRelation = objDead.InformerRelation;
            UcNotifierInfo2.NotifierphoneNo = objDead.InformerPhone;
            UcNotifierInfo2.NotifierNID = objDead.InformerNID;
            UcNotifierInfo2.NotifierFName = objDead.InformerFirstName;
            UcNotifierInfo2.NotifierFatherName = objDead.InformerSecondName;
            UcMotherInfo2.ParentSureName = objDead.DaadMotherSureName;
            //objDead.InformerAddress = UcNotifierInfo2.
            drpRegestierNoList.Value = objDead.RegisterID.ToString();
            ManualRegister obj = new ManualRegister();
            obj.LoadByPrimaryKey(new Guid(objDead.RegisterID.ToString()));
            txtRegestierNoList.Text = obj.RegisterCode;

            txtRecordNumber.Text = objDead.RegisterNo.ToString();
            if (IsLostCase)
            {
                if (objDead.IsUnKown)
                {
                    rdTypeList.ClearSelection();
                    rdTypeList.Items.FindByValue("1").Selected = true;
                }
                DecisionControl1.NotesValue = objDead.DeadDecisionNotes;
                DecisionControl1.DecisionDate = objDead.DeadDecisionDate;
                DecisionControl1.DecisionDirectionValue = objDead.DeadDecisionDirection;
                DecisionControl1.DecisionNumber = objDead.DeadDecisionNo;
                if (rdTypeList.SelectedValue == "1")
                {
                    DecisionControl1.lblDecisionDirector = "نيابة";
                }
            }
        }
    }
    private void InsertDeathCase()
    {
        Dead objDead = new Dead();
        objDead.AddNew();
        objDead.OrgID = MHOCommon.CurrentOrgID.Value;
        objDead.DeadNID = UcDeathInfo2.EventDeadNID;
        objDead.DeadAge = "2";
        objDead.DeadGender = UcDeathInfo2.EventDeadGender;
        objDead.DeadFirstName = UcDeathInfo2.EventDeadFristName;
        objDead.DeadFatherName = UcDeathInfo2.EventDeadFatherName;
        objDead.DeadGrandName = UcDeathInfo2.EventDeadFamilyName;
        objDead.DeadFamilyName = UcDeathInfo2.EventDeadTitle;
        objDead.DeadNationality = UcDeathInfo2.EventDeadNationality;
        objDead.DeadReligion = UcDeathInfo2.EventDeadReligion;
        objDead.DeadMartialStatus = UcDeathInfo2.EventDeadMartialStatus;
        objDead.ProveText = UcDeathInfo2.ProveType;
        objDead.ProveNumber = UcDeathInfo2.ProveNo;
        objDead.IsUnKown = false;
        if (IsLostCase)
        {
            if (DecisionControl1.DecisionNumber != string.Empty)
            {
                objDead.DeadDecisionNo = DecisionControl1.DecisionNumber;
            }
            if (DecisionControl1.DecisionDirectionValue != string.Empty)
            {
                objDead.DeadDecisionDirection = DecisionControl1.DecisionDirectionValue;
            }
            if (DecisionControl1.DecisionDate.Value.ToShortDateString() != string.Empty)
            {
                objDead.DeadDecisionDate = DateTime.Parse(DecisionControl1.DecisionDate.Value.ToShortDateString());
            }
            if (DecisionControl1.NotesValue == string.Empty)
            {
                objDead.DeadDecisionNotes = DecisionControl1.NotesValue;
            }
            objDead.IsUnKown = rdTypeList.SelectedValue == "1" ? true : false;
        }

        objDead.PaperID = UcDeathInfo2.EventDeadCardNo;
        objDead.PaperIDType = UcDeathInfo2.EventDeadCardType;
        objDead.PaperIssuePlace = UcDeathInfo2.EventCardLocation;
        objDead.AddressNo = UcAddressInfo1.EventDeadAddressNo;
        objDead.AddressStreet = UcAddressInfo1.EventDeadAddressStreet;
        objDead.AddressFeatured = UcAddressInfo1.EventDeadAddressSign;
        objDead.DeadGovernorate = UcAddressInfo1.DeadAddressGovernate;
        objDead.DeadSection = UcAddressInfo1.DeadAddressPoliceStation;
        objDead.DeadArea = UcAddressInfo1.DeadAddressArea;
        objDead.DeadPhone = UcAddressInfo1.EventDeadAddressPhone;
        objDead.DeadJob = UcAddressInfo1.EventDeadAddressJob;
        objDead.DeadBirthDate = DateTime.Parse(UcDeathInfo2.EventDeadBirthDate);
        objDead.DeadDieDate = DateTime.Parse(UcGeneralDeathInfo1.EventDeadDieDate);
        objDead.DiePlace = UcGeneralDeathInfo1.EventDeadPlace;
        objDead.DiePlaceDescription = UcGeneralDeathInfo1.EventDeadPlaceDescription;
        objDead.DeadDieHour = UcGeneralDeathInfo1.EventDeadDieHour;
        objDead.DeadDieMin = UcGeneralDeathInfo1.EventDeadDieMin;
        objDead.Approved = false;
        objDead.HasHealthData = false;
        //TODO: uncomment me
        if (MHOCommon.CurrentOrgGovID != 0 && MHOCommon.CurrentOrgAreaID != 0 && MHOCommon.CurrentOrgPoliceStationID != 0)
        {
            objDead.DieGovernorate = MHOCommon.CurrentOrgGovID;
            objDead.DieSection = MHOCommon.CurrentOrgPoliceStationID;
            objDead.DieArea = MHOCommon.CurrentOrgAreaID;
        }

        objDead.DeadMotherNID = UcMotherInfo2.ParentNID;
        objDead.DeadMotherNationality = UcMotherInfo2.ParentNationality;
        objDead.DeadMotherFirstName = UcMotherInfo2.ParentFirstName;
        objDead.DeadMotherSecondName = UcMotherInfo2.ParentFatherName;
        objDead.DeadMotherFamilyName = UcMotherInfo2.ParentFamilyName;
        objDead.DeadMotherReligion = UcMotherInfo2.ParentRelegion;
        objDead.DaadMotherSureName = UcMotherInfo2.ParentSureName;
        objDead.MotherProveNumber = UcMotherInfo2.ProveNo;
        objDead.MotherProveText = UcMotherInfo2.ProveType;
        objDead.DeadMotherJob = UcMotherInfo2.ParentJob;
        objDead.InformerRelation = UcNotifierInfo2.NotifierRelation;
        objDead.InformerPhone = UcNotifierInfo2.NotifierphoneNo;
        objDead.InformerNID = UcNotifierInfo2.NotifierNID;
        objDead.InformerFirstName = UcNotifierInfo2.NotifierFName;
        objDead.InformerSecondName = UcNotifierInfo2.NotifierFatherName;
        //objDead.InformerAddress = UcNotifierInfo2.
        objDead.RegisterID = new Guid(drpRegestierNoList.Value);
        objDead.RegisterNo = Convert.ToInt32(txtRecordNumber.Text);
        objDead.RegisterDate = DateTime.Now.Date;
        objDead.Save();
        Response.Redirect("ProcessResult.aspx");
    }
    protected void UpdateDeathData()
    {
        if (DeadEventIDParameter != null)
        {
            Dead objDead = new Dead();
            objDead.Where.DeadEventID.Value = DeadEventIDParameter.Value;
            objDead.Where.DeadEventID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
            if (objDead.Query.Load())
            {
                objDead.OrgID = MHOCommon.CurrentOrgID.Value;
                objDead.DeadNID = UcDeathInfo2.EventDeadNID;
                objDead.DeadAge = "2";
                objDead.DeadGender = UcDeathInfo2.EventDeadGender;
                objDead.DeadFirstName = UcDeathInfo2.EventDeadFristName;
                objDead.DeadFatherName = UcDeathInfo2.EventDeadFatherName;
                objDead.DeadGrandName = UcDeathInfo2.EventDeadFamilyName;
                objDead.DeadFamilyName = UcDeathInfo2.EventDeadTitle;
                objDead.DeadNationality = UcDeathInfo2.EventDeadNationality;
                objDead.DeadReligion = UcDeathInfo2.EventDeadReligion;
                objDead.DeadMartialStatus = UcDeathInfo2.EventDeadMartialStatus;
                objDead.ProveText = UcDeathInfo2.ProveType;
                objDead.ProveNumber = UcDeathInfo2.ProveNo;
                objDead.PaperID = UcDeathInfo2.EventDeadCardNo;
                objDead.PaperIDType = UcDeathInfo2.EventDeadCardType;
                objDead.PaperIssuePlace = UcDeathInfo2.EventCardLocation;
                objDead.AddressNo = UcAddressInfo1.EventDeadAddressNo;
                objDead.AddressStreet = UcAddressInfo1.EventDeadAddressStreet;
                objDead.AddressFeatured = UcAddressInfo1.EventDeadAddressSign;
                objDead.DeadGovernorate = UcAddressInfo1.DeadAddressGovernate;
                objDead.DeadSection = UcAddressInfo1.DeadAddressPoliceStation;
                objDead.DeadArea = UcAddressInfo1.DeadAddressArea;
                objDead.DeadPhone = UcAddressInfo1.EventDeadAddressPhone;
                objDead.DeadJob = UcAddressInfo1.EventDeadAddressJob;
                objDead.DeadBirthDate = DateTime.Parse(UcDeathInfo2.EventDeadBirthDate);
                objDead.DeadDieDate = DateTime.Parse(UcGeneralDeathInfo1.EventDeadDieDate);
                objDead.DiePlace = UcGeneralDeathInfo1.EventDeadPlace;
                objDead.DiePlaceDescription = UcGeneralDeathInfo1.EventDeadPlaceDescription;
                objDead.DeadDieHour = UcGeneralDeathInfo1.EventDeadDieHour;
                objDead.DeadDieMin = UcGeneralDeathInfo1.EventDeadDieMin;
                objDead.Approved = false;
                objDead.HasHealthData = false;

                //objDead.DieGovernorate = 19;
                //objDead.DieSection = 43;
                //objDead.DieArea = 19;

                if (IsLostCase)
                {
                    if (DecisionControl1.DecisionNumber != string.Empty)
                    {
                        objDead.DeadDecisionNo = DecisionControl1.DecisionNumber;
                    }
                    if (DecisionControl1.DecisionDirectionValue != string.Empty)
                    {
                        objDead.DeadDecisionDirection = DecisionControl1.DecisionDirectionValue;
                    }
                    if (DecisionControl1.DecisionDate.Value.ToShortDateString() != string.Empty)
                    {
                        objDead.DeadDecisionDate = DateTime.Parse(DecisionControl1.DecisionDate.Value.ToShortDateString());
                    }
                    if (DecisionControl1.NotesValue == string.Empty)
                    {
                        objDead.DeadDecisionNotes = DecisionControl1.NotesValue;
                    }
                    objDead.IsUnKown = rdTypeList.SelectedValue == "1" ? true : false;
                }
                objDead.DeadMotherNID = UcMotherInfo2.ParentNID;
                objDead.DeadMotherNationality = UcMotherInfo2.ParentNationality;
                objDead.DeadMotherFirstName = UcMotherInfo2.ParentFirstName;
                objDead.DeadMotherSecondName = UcMotherInfo2.ParentFatherName;
                objDead.DeadMotherFamilyName = UcMotherInfo2.ParentFamilyName;
                objDead.DaadMotherSureName = UcMotherInfo2.ParentSureName;
                objDead.DeadMotherReligion = UcMotherInfo2.ParentRelegion;
                objDead.MotherProveNumber = UcMotherInfo2.ProveNo;
                objDead.MotherProveText = UcMotherInfo2.ProveType;
                objDead.DeadMotherJob = UcMotherInfo2.ParentJob;
                objDead.InformerRelation = UcNotifierInfo2.NotifierRelation;
                objDead.InformerPhone = UcNotifierInfo2.NotifierphoneNo;
                objDead.InformerNID = UcNotifierInfo2.NotifierNID;
                objDead.InformerFirstName = UcNotifierInfo2.NotifierFName;
                objDead.InformerSecondName = UcNotifierInfo2.NotifierFatherName;
                //objDead.InformerAddress = UcNotifierInfo2.
                objDead.RegisterID = new Guid(drpRegestierNoList.Value);
                objDead.RegisterNo = Convert.ToInt32(txtRecordNumber.Text);
                objDead.Save();
            }

            Response.Redirect("ProcessResult.aspx");
        }
    }

    private bool LogicValidation()
    {
        if (!IsLostCase)
        {
            if (DateTime.Today.AddDays(-3) > DateTime.Parse(UcGeneralDeathInfo1.EventDeadDieDate))
            {
                MHOCommon.ShowMessage("تاريخ تسجيل الوفاة غير صحيح", this.Page);
                return false;
            }
        }
        if (DateTime.Parse(UcDeathInfo2.EventDeadBirthDate) > DateTime.Today)
        {
            MHOCommon.ShowMessage("تاريخ ميلاد المتوفى غير صحيح", this.Page);
            return false;
        }
        if (UcDeathInfo2.EventDeadNID == UcNotifierInfo2.NotifierNID)
        {
            MHOCommon.ShowMessage("الرقم القومى للمبلغ لا يمكن ان يكون نفس الرقم القومى للمتوفى", this.Page);
            return false;
        }

        if (DateTime.Parse(UcDeathInfo2.EventDeadBirthDate) > DateTime.Parse(UcGeneralDeathInfo1.EventDeadDieDate))
        {
            MHOCommon.ShowMessage("تاريخ الوفاة لابد ان يكون بعد تاريخ الميلاد", this.Page);
            return false;
        }
        if (DateTime.Parse(UcGeneralDeathInfo1.EventDeadDieDate).Date > DateTime.Today.Date)
        {
            MHOCommon.ShowMessage("تاريخ وفاة المتوفى غير صحيح", this.Page);
            return false;
        }
        if ((UcMotherInfo2.ParentNID == UcNotifierInfo2.NotifierNID) && UcNotifierInfo2.NotifierRelation == 4)
        {
            MHOCommon.ShowMessage("لقد قمت بادخال الرقم القومى للام فى بيانات المبلغ فى حين ان المبلغ هو الاخت", this.Page);
            return false;
        }
        if (IsLostCase)
        {
            if (rdTypeList.SelectedValue != "1")
            {
                if (DateTime.Today.AddYears(-1).Date > DateTime.Parse(UcGeneralDeathInfo1.EventDeadDieDate))
                {
                    MHOCommon.ShowMessage("تاريخ تسجيل الوفاة غير صحيح", this.Page);
                    return false;
                }
                if (DecisionControl1.DecisionDate == null)
                {
                    MHOCommon.ShowMessage("تاريخ القرار غير صحيح", this.Page);
                    return false;
                }
                if (DecisionControl1.DecisionDate.Value.Date > DateTime.Today.Date)
                {
                    MHOCommon.ShowMessage("تاريخ القرار غير صحيح", this.Page);
                    return false;
                }


                if (DateTime.Parse(UcDeathInfo2.EventDeadBirthDate) > DateTime.Today)
                {
                    MHOCommon.ShowMessage("تاريخ ميلاد المتوفى غير صحيح", this.Page);
                    return false;
                }

                if (DateTime.Today.AddDays(-1).Date <= DateTime.Parse(UcGeneralDeathInfo1.EventDeadDieDate))
                {
                    MHOCommon.ShowMessage("تاريخ تسجيل الوفاة غير صحيح", this.Page);
                    return false;
                }

                //TimeSpan dateDiff = UcBornInfo1.EventBirthDate.Subtract(DecisionControl1.DecisionDate);
                //if (dateDiff.Days < 15)
                if (DecisionControl1.DecisionDate.Value.AddDays(-1).Date < DateTime.Parse(UcGeneralDeathInfo1.EventDeadDieDate) ||
                    DateTime.Parse(UcDeathInfo2.EventDeadBirthDate) > DateTime.Parse(UcGeneralDeathInfo1.EventDeadDieDate))
                {
                    MHOCommon.ShowMessage("تاريخ القرار غير صحيح", this.Page);
                    return false;
                }

            }
            else
            {
                if (DecisionControl1.DecisionDate == null)
                {
                    MHOCommon.ShowMessage("تاريخ القرار غير صحيح", this.Page);
                    return false;
                }
                // مجهول الهوية
                if (DateTime.Parse(UcDeathInfo2.EventDeadBirthDate).Date > DateTime.Today.Date)
                {
                    MHOCommon.ShowMessage("تاريخ ميلاد المتوفى غير صحيح", this.Page);
                    return false;
                }
                if (DateTime.Parse(UcGeneralDeathInfo1.EventDeadDieDate).Date > DateTime.Today.Date)
                {
                    MHOCommon.ShowMessage("تاريخ وفاة المتوفى غير صحيح", this.Page);
                    return false;
                }
                if (DecisionControl1.DecisionDate.Value.Date > DateTime.Today.Date)
                {
                    MHOCommon.ShowMessage("تاريخ القرار غير صحيح", this.Page);
                    return false;
                }


                TimeSpan dateDiff = DateTime.Parse(UcGeneralDeathInfo1.EventDeadDieDate).Subtract(DecisionControl1.DecisionDate.Value);
                if (dateDiff.Days > 0)
                {
                    MHOCommon.ShowMessage("تاريخ القرار غير صحيح", this.Page);
                    return false;
                }
            }
        }
        return true;
    }
    #endregion
}
