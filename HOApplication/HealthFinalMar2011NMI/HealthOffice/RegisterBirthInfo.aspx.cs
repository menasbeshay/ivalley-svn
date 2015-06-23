using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MHO.BLL;
using System.Web.Security;

[Serializable]
public partial class RegisterBirthdayInfo : System.Web.UI.Page
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
    private Guid? BornEventIdParameter
    {
        get
        {
            if (Request.QueryString["BornEventID"] != null)
            {
                ViewState["MedicalInfoUpdate"] = 1;
                return new Guid(Request.QueryString["BornEventID"]);
            }
            else if (ViewState["BornEventID"] != null)
            {
                ViewState["MedicalInfoUpdate"] = 0;
                return new Guid(ViewState["BornEventID"].ToString());
            }
            else
            {
                return null;
            }
        }
        set
        {
            ViewState["BornEventID"] = value;
        }
    }
    private string currentDescisionNo
    {
        get
        {
            if (ViewState["currentDescisionNo"] == null)
            {
                return "";
            }
            else
            {
                return ViewState["currentDescisionNo"].ToString();
            }
        }
        set
        {
            ViewState["currentDescisionNo"] = value;
        }

    }

    /////// <summary>
    /////// Gets or sets the InsertedBornEventID
    /////// </summary>
    ////private Guid InsertedBornEventID
    ////{
    ////    get
    ////    {
    ////        return new Guid(ViewState["InsertedBornEventID"].ToString());
    ////    }
    ////    set
    ////    {
    ////        ViewState["InsertedBornEventID"] = value;
    ////    }
    ////}

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
    [Serializable]
    public struct BornUniqueValues
    {
        public string FatherNationalID;
        public string MotherNationalID;
        public string BirthDateTime;
        public string BornName;
        public string BornRegDate;
    }

    /// <summary>
    /// store the current data for the dead in case of update.
    /// </summary>
    public BornUniqueValues currentBornData
    {
        get
        {
            if (Session["currentBornData"] == null)
                return new BornUniqueValues();
            else
                return (BornUniqueValues)Session["currentBornData"];
        }
        set
        {
            Session["currentBornData"] = value;
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
            txtNationalNumber.Attributes.Add("onblur", string.Format("EnableTextBoxesHealth('{0}','{1}','{2}');", txtFirstName.ClientID, txtRemainName.ClientID, txtNationalNumber.ClientID));
            LoadLookups();
        }
        //this.Form.DefaultButton = btnSaveBornInfo.UniqueID;
    }
    protected void Page_prerender(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadData();
            Master.PageHeader = GetLocalResourceObject("lblHeaderPage").ToString();
            //Master.MainHeader = GetLocalResourceObject("lblMainPage").ToString();
            if (IsLostCase)
            {
                DivDecision.Style.Add("display", "block");
                tblType.Style.Add("display", "block");
                // Set Default Values for Health Data
                //txtBirthLocation.Text = "-";
                //txtWeight2.Text = "2";
                //txtCurrentInterval2.Text = "0";
                //txtNationalNumber.Text = "0";
                //txtFirstName.Text = "-";
                //txtRemainName.Text = "-";
                //drpRelation.SelectedIndex = 1;
                
            }
            else
            {
                rdTypeList.SelectedValue = "0";
            }

            // Handle approve case
            if (ForApprove != null)
            {
                if (ForApprove.Value == 1)
                {
                    MHOCommon.DisablePageControls(divBirthPage, false);
                    btnSaveBornInfo.Visible = false;
                    btnSaveMedicalInfo.Visible = false;
                    tblApprove.Style.Add("display", "block");
                    MHOCommon.DisablePageControls(tblApprove, true);
                }
                else
                {
                    MHOCommon.DisablePageControls(divBirthPage, false);
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
    /// <summary>
    /// Handles the Click event of the control btnContinue
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSaveBornInfo_Click(object sender, EventArgs e)
    {
       
            if (BornEventIdParameter != null)
            {
                if (logicValidation())
                {
                    UpdateEventData();
                }
                else
                {
                    UcBornInfo1.Focus();
                    return;
                }
            }
            else
            {
                if (logicValidation())
                {
                    InsertEventData();
                }
                else
                {
                    UcBornInfo1.Focus();
                    return;
                }
            }
          
                TabContainerBirthInfo.ActiveTabIndex = 1;
                rdTypeList.Enabled = false;
                txtBirthLocation.Focus();
            
            
        
    }

    /// <summary>
    /// Handles the Click event of the control btnSaveBornInfo
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSaveMedicalInfo_Click(object sender, EventArgs e)
    {
        
        
        if (ViewState["MedicalInfoUpdate"] != null && ViewState["MedicalInfoUpdate"].ToString() == "1")
        {
            UpdateBornMedicalInfo();
        }
        else
        {
            InsertBornMedicalInfo();

        }
        Born objBorn = new Born();
        objBorn.UpdateBornWriter(MHOCommon.CurrentLoggedUserID, BornEventIdParameter.Value);
        Response.Redirect("BornResult.aspx?Birth=1&BornEventIdParameter=" + BornEventIdParameter.ToString());
    }

    protected void txtTwinsNo_TextChanged(object sender, EventArgs e)
    {
        txtTotal1.Text = (int.Parse(txtTwinsNo.Text) + 1).ToString();
    }

    protected void txtOldBornNo_TextChanged(object sender, EventArgs e)
    {
        txtTotal2.Text = (int.Parse(txtOldBornNo.Text) + 1).ToString();
    }

    /// <summary>
    /// txtXOldBornNo txt changed
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void txtXOldBornNo_TextChanged(object sender, EventArgs e)
    {
        txtTotal3.Text = (int.Parse(txtXOldBornNo.Text) + 1).ToString();
    }

    /// <summary>
    /// Search button click handler
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (MHOCommon.ValidateNationalIDInput(txtNationalNumber.Text,null))
        {
            MHOCommon.NationalIdData? nidData = MHOCommon.RequestNationalIDData(txtNationalNumber.Text);
            if (nidData != null)
            {
                txtFirstName.Text = nidData.Value.FirstName;
                txtRemainName.Text = nidData.Value.FatherName + " " + nidData.Value.FamilyName + " " + nidData.Value.SureName;
            }
            else
            {
                MHOCommon.ShowMessage("خطا فى خدمة استرجاع بيانات الرقم القومى",this.Page);
                txtFirstName.Text = "";
                txtRemainName.Text = "";
            }
        }
        else
        {
            MHOCommon.ShowMessage("الرقم القومى غير صحيح", this.Page);
            txtFirstName.Text = "";
            txtRemainName.Text = "";
        }
    }

    /// <summary>
    /// on changing active tab
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void TabContainerBirthInfo_ActiveTabChanged(object sender, EventArgs e)
    {
        if (BornEventIdParameter == null)
        {
            TabContainerBirthInfo.ActiveTabIndex = 0;
        }
    }

    protected void btnApprove_Click(object sender, EventArgs e)
    {
        Born born = new Born();
        if (born.ApproveBornInfo(BornEventIdParameter.Value))
        {
            Born objBorn = new Born();
            objBorn.UpdateBornDoctor(MHOCommon.CurrentLoggedUserID, BornEventIdParameter.Value);
            Response.Redirect("BornResult.aspx?Birth=1&BornEventIdParameter=" + BornEventIdParameter.Value);
        }
        else
        {
            MHOCommon.ShowMessage("عفوا هناك خطا فى البيانات", this.Page);
        }
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("ApproveBirth.aspx");
    }

    //protected void txtNationalNumber_TextChanged(object sender, EventArgs e)
    //{
    //    if (txtNationalNumber.Text == "0")
    //    {
    //        txtFirstName.Text = "";
    //        txtFirstName.ReadOnly = false;
    //        txtRemainName.Text = "";
    //        txtRemainName.ReadOnly = false;
    //    }
    //}

    protected void rdTypeList_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rdTypeList.SelectedValue == "1")
        {
            DecisionControl1.lblDecisionDirector = "نيابة";

            // Set Default Values for Health Data
            //txtBirthLocation.Text = "-";
            //txtWeight3.Text = "2";
            txtCurrentInterval2.Text = "0";
            txtNationalNumber.Text = "0";
            txtFirstName.Text = "-";
            txtRemainName.Text = "-";
            drpRelation.SelectedIndex = 1;
        }
        else
        {
            // Set Default Values for Health Data
            //txtBirthLocation.Text = "";
            //txtWeight3.Text = "";
            txtCurrentInterval2.Text = "";
            txtNationalNumber.Text = "";
            txtFirstName.Text = "";
            txtRemainName.Text = "";
            drpRelation.SelectedIndex = 0;
        }
    }
    #endregion

    #region Methods

    private void InsertEventData()
    {
        Born objBorn = new Born();
        if (IsLostCase)
        {
            BornEventIdParameter = objBorn.AddNewEventBorn(MHOCommon.CurrentOrgID.Value, UcBornInfo1.EventChildName, UcBornInfo1.EventChildGender, UcBornInfo1.EventBirthDate.Value,
                                                          UcBornInfo1.EventChildGovernate, UcBornInfo1.EventChildPoliceStation, UcBornInfo1.EventChildArea,
                                                          UcFatherInfo2.ParentNID, UcFatherInfo2.ParentFirstName, UcFatherInfo2.ParentFatherName,
                                                          UcFatherInfo2.ParentFamilyName, UcFatherInfo2.ParentJob, UcFatherInfo2.ParentRelegion, UcFatherInfo2.ParentNationality,
                                                          UcMotherInfo2.ParentNID, UcMotherInfo2.ParentFirstName, UcMotherInfo2.ParentFatherName, UcMotherInfo2.ParentFamilyName,
                                                          UcMotherInfo2.ParentJob, UcMotherInfo2.ParentRelegion, UcMotherInfo2.ParentNationality,
                                                          UcNotifierInfo1.NotifierRelation, UcNotifierInfo1.NotifierFName, UcNotifierInfo1.NotifierFatherName, UcNotifierInfo1.NotifierphoneNo,
                                                          UcNotifierInfo1.NotifierNID,
                                                          new Guid(drpRegestierNoList.Value),
                                                          int.Parse(txtRecordNumber.Text),
                                                          UcFatherInfo2.ProveNo, UcFatherInfo2.ProveType,
                                                          UcMotherInfo2.ProveNo, UcMotherInfo2.ProveType,
                                                          UcMotherInfo2.ParentSureName, UcFatherInfo2.ParentSureName, DecisionControl1.DecisionNumber
                                                          , DecisionControl1.DecisionDirectionValue, DecisionControl1.DecisionDate.Value.ToShortDateString(), DecisionControl1.NotesValue,
            rdTypeList.SelectedValue=="1"?true:false,UcNotifierInfo1.NotifierAddress);
        }
        else
        {
            BornEventIdParameter = objBorn.AddNewEventBorn(MHOCommon.CurrentOrgID.Value, UcBornInfo1.EventChildName, UcBornInfo1.EventChildGender, UcBornInfo1.EventBirthDate.Value,
                                                          UcBornInfo1.EventChildGovernate, UcBornInfo1.EventChildPoliceStation, UcBornInfo1.EventChildArea,
                                                          UcFatherInfo2.ParentNID, UcFatherInfo2.ParentFirstName, UcFatherInfo2.ParentFatherName,
                                                          UcFatherInfo2.ParentFamilyName, UcFatherInfo2.ParentJob, UcFatherInfo2.ParentRelegion, UcFatherInfo2.ParentNationality,
                                                          UcMotherInfo2.ParentNID, UcMotherInfo2.ParentFirstName, UcMotherInfo2.ParentFatherName, UcMotherInfo2.ParentFamilyName,
                                                          UcMotherInfo2.ParentJob, UcMotherInfo2.ParentRelegion, UcMotherInfo2.ParentNationality,
                                                          UcNotifierInfo1.NotifierRelation, UcNotifierInfo1.NotifierFName, UcNotifierInfo1.NotifierFatherName, UcNotifierInfo1.NotifierphoneNo,
                                                          UcNotifierInfo1.NotifierNID,
                                                          new Guid(drpRegestierNoList.Value),
                                                          int.Parse(txtRecordNumber.Text),
                                                          UcFatherInfo2.ProveNo, UcFatherInfo2.ProveType,
                                                          UcMotherInfo2.ProveNo, UcMotherInfo2.ProveType,
                                                          UcMotherInfo2.ParentSureName, UcFatherInfo2.ParentSureName, string.Empty
                                                          , string.Empty, string.Empty, string.Empty, false, UcNotifierInfo1.NotifierAddress);
        }
        btnSaveBornInfo.Text = "تعديل بيانات الميلاد";
        TabPanelHealthData.Enabled = true;
        UcNotifierInfo1.NotifierFName = UcNotifierInfo1.NotifierFName;
        UcNotifierInfo1.NotifierFatherName = UcNotifierInfo1.NotifierFatherName;
        

    }

    private void InsertBornMedicalInfo()
    {
        BornMedicalInfo objBornMedicalInfo = new BornMedicalInfo();

        objBornMedicalInfo.AddNewBornMedicalInfo(BornEventIdParameter.Value, 
             txtBirthLocation.Text, 
             int.Parse(drpBornWieght.SelectedValue),
             0,
             txtCurrentInterval2.Text != "" ? int.Parse(txtCurrentInterval2.Text):0,
             txtCurrentInterval1.Text != "" ? int.Parse(txtCurrentInterval1.Text):0,
             txtPastInterval2.Text != "" ? int.Parse(txtPastInterval2.Text) : 0,
             txtPastInterval1.Text != "" ? int.Parse(txtPastInterval1.Text):0,
             txtTwinsNo.Text != "" ? int.Parse(txtTwinsNo.Text):0,
             txtOldBornNo.Text != "" ? int.Parse(txtOldBornNo.Text):0,
             txtXOldBornNo.Text != "" ? int.Parse(txtXOldBornNo.Text):0,
             txtPastDeadNoOfChildrent.Text != "" ? Convert.ToInt32(txtPastDeadNoOfChildrent.Text):0,
            txtNationalNumber.Text,
            txtFirstName.Text,
            txtRemainName.Text, 
            int.Parse(drpRelation.SelectedValue));
      
        //Response.Redirect("ProcessResult.aspx");
    }

    private void UpdateEventData()
    {
        if (BornEventIdParameter != null)
        {
            Born objBorn = new Born();
            if (IsLostCase)
            {
                objBorn.UpdateNewEventBorn(BornEventIdParameter.Value, UcBornInfo1.EventChildName, UcBornInfo1.EventChildGender, UcBornInfo1.EventBirthDate.Value,
                      UcBornInfo1.EventChildGovernate, UcBornInfo1.EventChildPoliceStation, UcBornInfo1.EventChildArea,
                      UcFatherInfo2.ParentNID, UcFatherInfo2.ParentFirstName, UcFatherInfo2.ParentFatherName,
                      UcFatherInfo2.ParentFamilyName, UcFatherInfo2.ParentJob, UcFatherInfo2.ParentRelegion, UcFatherInfo2.ParentNationality,
                      UcMotherInfo2.ParentNID, UcMotherInfo2.ParentFirstName, UcMotherInfo2.ParentFatherName, UcMotherInfo2.ParentFamilyName,
                      UcMotherInfo2.ParentJob, UcMotherInfo2.ParentRelegion, UcMotherInfo2.ParentNationality,
                      UcNotifierInfo1.NotifierRelation, UcNotifierInfo1.NotifierFName,
                      UcNotifierInfo1.NotifierFatherName, UcNotifierInfo1.NotifierphoneNo,
                      UcNotifierInfo1.NotifierNID, new Guid(drpRegestierNoList.Value),
                      int.Parse(txtRecordNumber.Text), UcFatherInfo2.ProveNo,
                      UcFatherInfo2.ProveType, UcMotherInfo2.ProveNo, UcMotherInfo2.ProveType,
                      UcMotherInfo2.ParentSureName, UcFatherInfo2.ParentSureName,
                      DecisionControl1.DecisionNumber, DecisionControl1.DecisionDirectionValue, DecisionControl1.DecisionDate.Value.ToShortDateString(), DecisionControl1.NotesValue
                      , rdTypeList.SelectedValue == "1" ? true : false, UcNotifierInfo1.NotifierAddress);
            }
            else
            {
                objBorn.UpdateNewEventBorn(BornEventIdParameter.Value, UcBornInfo1.EventChildName, UcBornInfo1.EventChildGender, UcBornInfo1.EventBirthDate.Value,
                      UcBornInfo1.EventChildGovernate, UcBornInfo1.EventChildPoliceStation, UcBornInfo1.EventChildArea,
                      UcFatherInfo2.ParentNID, UcFatherInfo2.ParentFirstName, UcFatherInfo2.ParentFatherName,
                      UcFatherInfo2.ParentFamilyName, UcFatherInfo2.ParentJob, UcFatherInfo2.ParentRelegion, UcFatherInfo2.ParentNationality,
                      UcMotherInfo2.ParentNID, UcMotherInfo2.ParentFirstName, UcMotherInfo2.ParentFatherName, UcMotherInfo2.ParentFamilyName,
                      UcMotherInfo2.ParentJob, UcMotherInfo2.ParentRelegion, UcMotherInfo2.ParentNationality,
                      UcNotifierInfo1.NotifierRelation, UcNotifierInfo1.NotifierFName,
                      UcNotifierInfo1.NotifierFatherName, UcNotifierInfo1.NotifierphoneNo,
                      UcNotifierInfo1.NotifierNID, new Guid(drpRegestierNoList.Value),
                      int.Parse(txtRecordNumber.Text), UcFatherInfo2.ProveNo,
                      UcFatherInfo2.ProveType, UcMotherInfo2.ProveNo, UcMotherInfo2.ProveType,
                      UcMotherInfo2.ParentSureName, UcFatherInfo2.ParentSureName,
                     string.Empty, string.Empty, string.Empty, string.Empty, false, UcNotifierInfo1.NotifierAddress);
            }

        }

    }

    private void UpdateBornMedicalInfo()    
    {
        if (BornEventIdParameter != null)
        {
            BornMedicalInfo objBornMedicalInfo = new BornMedicalInfo();
            objBornMedicalInfo.UpdateBornMedicalInfo(BornEventIdParameter.Value,
                txtBirthLocation.Text,
                int.Parse(drpBornWieght.SelectedValue),
                0,
                txtCurrentInterval2.Text != "" ? int.Parse(txtCurrentInterval2.Text):0,
                txtCurrentInterval1.Text != "" ? int.Parse(txtCurrentInterval1.Text):0,
                txtPastInterval2.Text != "" ? int.Parse(txtPastInterval2.Text):0,
                txtPastInterval1.Text != "" ? int.Parse(txtPastInterval1.Text):0,
                txtTwinsNo.Text != "" ? int.Parse(txtTwinsNo.Text):0,
                txtOldBornNo.Text != "" ? int.Parse(txtOldBornNo.Text):0,
                txtXOldBornNo.Text !="" ? int.Parse(txtXOldBornNo.Text):0,
                txtPastDeadNoOfChildrent.Text != "" ? int.Parse(txtPastDeadNoOfChildrent.Text):0,
                txtNationalNumber.Text, txtFirstName.Text, txtRemainName.Text, 
                int.Parse(drpRelation.SelectedValue));
            //Response.Redirect("ProcessResult.aspx");
        }
    }

    /// <summary>
    /// Loads Data For Edit Mode
    /// </summary>
    private void LoadData()
    {
        // set default values
        lblRecordDateValue.Text = DateTime.Now.Date.ToShortDateString();
        lblHealthOfficeValue.Text = MHOCommon.CurrentOrgName;
        DecisionControl1.HealthOffice = MHOCommon.CurrentOrgName;

        if (BornEventIdParameter != null)
        {
            TabPanelHealthData.Enabled = true;
            btnSaveBornInfo.Text ="تعديل بيانات الميلاد";
            btnSaveMedicalInfo.Text = "تعديل البيانات الصحية";
            Born born = new Born();
            if (born.LoadByPrimaryKey(BornEventIdParameter.Value))
            {
                // load Born Basic Data
                UcBornInfo1.EventChildName = born.BornName;
                UcBornInfo1.EventChildGender = born.BornGender;
                UcBornInfo1.EventBirthDate = born.BirthDate;
                UcBornInfo1.Month = born.BirthDate.Month.ToString();
                UcBornInfo1.Year = born.BirthDate.Year.ToString();
                UcBornInfo1.Day = born.BirthDate.Day.ToString();
                UcBornInfo1.Minute = born.BirthDate.Minute.ToString();
                UcBornInfo1.Hour = born.BirthDate.Hour.ToString();
                UcBornInfo1.EventChildGovernate = born.BornGovernorate;
                UcBornInfo1.LoadPoliceStation();
                UcBornInfo1.EventChildPoliceStation = born.BornSection;
                UcBornInfo1.LoadArea();
                UcBornInfo1.EventChildArea = born.BornArea;
                UcFatherInfo2.ParentNID = born.FatherNID;
                UcFatherInfo2.ParentFirstName = born.FirstFatherName;
                UcFatherInfo2.ParentFatherName = born.SecondFatherName;
                UcFatherInfo2.ParentFamilyName = born.FamilyFatherName;
                UcFatherInfo2.ParentJob = born.FatherJob;
                UcFatherInfo2.ParentRelegion = born.FatherReligion;
                UcFatherInfo2.LoadLookups();
                UcFatherInfo2.ParentNationality = born.FatherNationality;
                UcFatherInfo2.ProveNo = born.FatherProveNo;
                UcFatherInfo2.ProveType = born.FatherProveType;
                UcFatherInfo2.ParentSureName = born.FatherSureName;
                // If the parent was egyptian
                UcFatherInfo2.ShowHideNID(born.FatherNationality == 13818);

                UcMotherInfo2.ParentNID = born.MotherNID;
                UcMotherInfo2.ParentFirstName = born.FirstMotherName;
                UcMotherInfo2.ParentFatherName = born.SecondMotherName;
                UcMotherInfo2.ParentFamilyName = born.FamilyMotherName;
                UcMotherInfo2.ParentJob = born.MotherJob;
                UcMotherInfo2.ParentRelegion = born.MotherReligion;
                UcMotherInfo2.LoadLookups();
                UcMotherInfo2.ParentNationality = born.MotherNationality;
                UcMotherInfo2.ProveNo = born.MotherProveNo;
                UcMotherInfo2.ProveType = born.MotherProveType;
                UcMotherInfo2.ParentSureName = born.MotherSureName;

                // If the parent was egyptian
                UcMotherInfo2.ShowHideNID(born.MotherNationality == 13818);
                
                UcNotifierInfo1.NotifierRelation = born.InformerRelation;
                UcNotifierInfo1.NotifierFName = born.InformerFirstName;
                UcNotifierInfo1.NotifierFatherName = born.InformerSecondName;
                UcNotifierInfo1.NotifierphoneNo = born.InformerPhone;
                UcNotifierInfo1.NotifierAddress = born.InformerAddress;
                UcNotifierInfo1.NotifierNID = born.InformerNID;
                txtRecordNumber.Text = born.RegisterNo.ToString();
                lblRecordNumberValue.Text = born.RegisterNo.ToString();
                drpRegestierNoList.Value = born.RegisterID.ToString();
                // Load Register Name
                ManualRegister obj = new ManualRegister();
                obj.LoadByPrimaryKey(new Guid(born.RegisterID.ToString()));
                txtRegestierNoList.Text = obj.RegisterCode;
                uiLabelRecordNo.Text = obj.RegisterCode;

                BornUniqueValues objUnique = new BornUniqueValues();
                objUnique.BirthDateTime = born.BirthDate.ToString();
                objUnique.BornName = born.BornName;
                objUnique.BornRegDate = born.RegisterDate.ToString();
                objUnique.FatherNationalID = born.FatherNID;
                objUnique.MotherNationalID = born.MotherNID;
                currentBornData = objUnique;
                
                if (IsLostCase)
                {
                    if (born.IsFound)
                    {
                        rdTypeList.ClearSelection();
                        rdTypeList.Items.FindByValue("1").Selected = true;
                    }
                    DecisionControl1.NotesValue = born.BornDecisionNotes;
                    DecisionControl1.DecisionDate = born.BornDecisionDate;
                    DecisionControl1.DecisionDirectionValue = born.BornDecisionDirection;
                    DecisionControl1.DecisionNumber = born.BornDecisionNo;
                    currentDescisionNo = born.BornDecisionNo;
                    if (rdTypeList.SelectedValue == "1")
                    {
                        DecisionControl1.lblDecisionDirector = "نيابة";
                    }
                }
            }

            // Load Medical Data
            BornMedicalInfo objBornMedicalInfo = new BornMedicalInfo();
            objBornMedicalInfo.Where.BornEventID.Value = BornEventIdParameter.Value;
            objBornMedicalInfo.Where.BornEventID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;

            if (objBornMedicalInfo.Query.Load())
            {
                //txtWeight1.Text = objBornMedicalInfo.BornWeightGram.ToString();
                //txtWeight3.Text = objBornMedicalInfo.BornWeightKG.ToString();
                int _bornwieght = 1;
                if (objBornMedicalInfo.BornWeightKG < 1 || objBornMedicalInfo.BornWeightKG > 3)
                {
                    _bornwieght = 1;
                }
                else
                {
                     _bornwieght = objBornMedicalInfo.BornWeightKG;
                }
                drpBornWieght.SelectedIndex = drpBornWieght.Items.IndexOf(drpBornWieght.Items.FindByValue(_bornwieght.ToString()));

                txtBirthLocation.Text = objBornMedicalInfo.BirthPlace;
                txtCurrentInterval2.Text = objBornMedicalInfo.MarriageDurationYears.ToString();
                txtCurrentInterval1.Text = objBornMedicalInfo.MarriageDurationMonth.ToString();
                txtPastInterval2.Text = objBornMedicalInfo.XMarriageDurationYears.ToString();
                txtPastInterval1.Text = objBornMedicalInfo.XMarriageDurationMonth.ToString();
                txtTwinsNo.Text = objBornMedicalInfo.TwinsNo.ToString();
                txtOldBornNo.Text = objBornMedicalInfo.OlderBornNo.ToString();
                txtXOldBornNo.Text = objBornMedicalInfo.XOlderBornNo.ToString();
                txtPastDeadNoOfChildrent.Text = objBornMedicalInfo.DeadBornNo.ToString();
                txtNationalNumber.Text = objBornMedicalInfo.ObstetricsNID;
                txtFirstName.Text = objBornMedicalInfo.ObstetricsFName;
                txtRemainName.Text = objBornMedicalInfo.ObstetricsLName;
                drpRelation.SelectedValue = objBornMedicalInfo.ObstetricsRelation.ToString();
            }
            // default totals
            txtTotal1.Text = (int.Parse(txtTwinsNo.Text) + 1).ToString();
            txtTotal2.Text = (int.Parse(txtOldBornNo.Text) + 1).ToString();
            txtTotal3.Text = (int.Parse(txtXOldBornNo.Text) + 1).ToString();
        }
    }

    /// <summary>
    /// Load drop down list
    /// </summary>
    private void LoadLookups()
    {
        if (MHOCommon.CurrentOrgID == null)
        {
            Response.Redirect("login.aspx");
        }

        ManualRegister objReg = new ManualRegister();
        objReg.Where.CurrentRegister.Value = 1;
        objReg.Where.CurrentRegister.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
        objReg.Where.CurrentRegister.Conjuction = MyGeneration.dOOdads.WhereParameter.Conj.And;
        objReg.Where.RegisterType.Value = 1;//for born
        objReg.Where.RegisterType.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
        objReg.Where.RegisterType.Conjuction = MyGeneration.dOOdads.WhereParameter.Conj.And;
        objReg.Where.OrgID.Value = MHOCommon.CurrentOrgID;
        objReg.Where.OrgID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;

        if (objReg.Query.Load())
        {
            drpRegestierNoList.Value = objReg.RegisterID.ToString();
            txtRegestierNoList.Text = objReg.RegisterCode;
            uiLabelRecordNo.Text = objReg.RegisterCode;
        }
        else
        {
            Response.Redirect("OpenRegister.aspx?ErrorFlag=Born");
        }

        // default totals
        txtTotal1.Text = (int.Parse(txtTwinsNo.Text) + 1).ToString();
        txtTotal2.Text = (int.Parse(txtOldBornNo.Text) + 1).ToString();
        txtTotal3.Text = (int.Parse(txtXOldBornNo.Text) + 1).ToString();

    }

    private bool logicValidation()
    {
        if (UcFatherInfo2.ParentNID == "0")
        {
            MHOCommon.ShowMessage("الرقم القومى للأب غير صحيح", this.Page);
            return false;
        }

        if (UcNotifierInfo1.NotifierNID == "0")
        {
            MHOCommon.ShowMessage("الرقم القومى للمبلغ غير صحيح", this.Page);
            return false;
        }
       if (!MHOCommon.ValidateNationalIDInput(UcFatherInfo2.ParentNID, false))
        {
            MHOCommon.ShowMessage(MHOCommon.NIDValidationMessage + "\\nبيانات الأب", this.Page);
            return false;
        }

        if (!MHOCommon.ValidateNationalIDInput(UcMotherInfo2.ParentNID, true))
        {
            MHOCommon.ShowMessage(MHOCommon.NIDValidationMessage + "\\nبيانات الأم", this.Page);
            return false;
        }
        

        if (UcMotherInfo2.ParentNID == "0")
        {
            MHOCommon.ShowMessage("الرقم القومى للأم غير صحيح", this.Page);
            return false;
        }   

        if (UcBornInfo1.EventBirthDate == null)
        {
            MHOCommon.ShowMessage("خطأ فى تاريخ او وقت الميلاد", this.Page);
            return false;
        }        

        if ((UcFatherInfo2.ParentNID == UcNotifierInfo1.NotifierNID) && UcNotifierInfo1.NotifierRelation != 1)
        {
            MHOCommon.ShowMessage("لقد ادخلت الرقم القومى للاب فى بيانات المبلغ فى حين ان المبلغ ليس الاب", this.Page);
            return false;
        }

        #region Check For Repeated Birth cases.

        Born objBorn = new Born();

        if (BornEventIdParameter != null)
        {
            // Update case.
            if (UcBornInfo1.EventBirthDate.ToString() != currentBornData.BirthDateTime ||
                UcBornInfo1.EventChildName != currentBornData.BornName ||
                UcFatherInfo2.ParentNID != currentBornData.FatherNationalID ||
                UcMotherInfo2.ParentNID != currentBornData.MotherNationalID)
            {
                if (objBorn.IsBornCaseExist(UcFatherInfo2.ParentNID, UcMotherInfo2.ParentNID, UcBornInfo1.EventChildName, UcBornInfo1.EventBirthDate.Value.ToString("yyyy-MM-dd HH:mm"), Convert.ToDateTime(currentBornData.BornRegDate).ToString("yyyy-MM-dd")))
                {
                    MHOCommon.ShowMessage("بيانات المولود موجودة من قبل برجاء مراجعة البيانات و اعادة المحاولة", this.Page);
                    return false;
                }
            }

        }
        else
        {
            // Add Case
            if (objBorn.IsBornCaseExist(UcFatherInfo2.ParentNID, UcMotherInfo2.ParentNID, UcBornInfo1.EventChildName, UcBornInfo1.EventBirthDate.Value.ToString("yyyy-MM-dd HH:mm"), ""))
            {
                MHOCommon.ShowMessage("بيانات المولود موجودة من قبل برجاء مراجعة البيانات و اعادة المحاولة", this.Page);
                return false;
            }
        }

        #endregion


        if (!IsLostCase)
        {
            if (UcBornInfo1.EventBirthDate.Value.Date > DateTime.Today.Date)
            {
                MHOCommon.ShowMessage("تاريخ الميلاد يجب ان يكون اقل من او يساوى تاريخ اليوم", this.Page);
                return false;
            }

            if (DateTime.Today.AddDays(-15) >= UcBornInfo1.EventBirthDate)
            {
                MHOCommon.ShowMessage("تاريخ تسجيل الميلاد يجب ان لا يزيد عن 15 يوم من تاريخ الميلاد", this.Page);
                return false;
            }
        }
        if (IsLostCase)
        {
            if (DecisionControl1.DecisionDate == null)
            {
                MHOCommon.ShowMessage("تاريخ القرار غير صحيح", this.Page);
                return false;
            }

            health_office objHealthOffice = new health_office();
            
                if (BornEventIdParameter != null)
                {
                    // update case
                    if (currentDescisionNo != DecisionControl1.DecisionNumber)
                    {
                        if (objHealthOffice.IsDecisionNumberExisit(DecisionControl1.DecisionNumber,MHOCommon.CurrentOrgID.Value, true))
                        {
                            MHOCommon.ShowMessage("عفوا رقم القرار موجود من قبل", this.Page);
                            return false;
                        }
                    }
                }
                else
                {
                    if (objHealthOffice.IsDecisionNumberExisit(DecisionControl1.DecisionNumber, MHOCommon.CurrentOrgID.Value, true))
                   {
                    MHOCommon.ShowMessage("عفوا رقم القرار موجود من قبل", this.Page);
                    return false;
                    }
                }
               
            

            if (rdTypeList.SelectedValue != "1")
            {
                if (UcBornInfo1.EventBirthDate.Value.Date > DateTime.Today.Date)
                {
                    MHOCommon.ShowMessage("تاريخ الميلاد يجب ان يكون اقل من او يساوى تاريخ اليوم", this.Page);
                    return false;
                }
                if (DateTime.Today.AddYears(-1).Date > UcBornInfo1.EventBirthDate.Value.Date)
                {
                    MHOCommon.ShowMessage("تاريخ تسجيل الميلاد غير صحيح", this.Page);
                    return false;
                }

                if (DateTime.Today.AddDays(-15).Date <= UcBornInfo1.EventBirthDate.Value.Date)
                {
                    MHOCommon.ShowMessage("تاريخ تسجيل الميلاد غير صحيح", this.Page);
                    return false;
                }
                if (DecisionControl1.DecisionDate.Value.Date > DateTime.Today.Date)
                {
                    MHOCommon.ShowMessage("تاريخ القرار غير صحيح", this.Page);
                    return false;
                }
                //TimeSpan dateDiff = UcBornInfo1.EventBirthDate.Subtract(DecisionControl1.DecisionDate);
                //if (dateDiff.Days < 15)
                if (DecisionControl1.DecisionDate.Value.AddDays(-15).Date < UcBornInfo1.EventBirthDate.Value.Date)
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
                if (UcBornInfo1.EventBirthDate.Value.Date > DateTime.Today.Date)
                {
                    MHOCommon.ShowMessage("تاريخ الميلاد يجب ان يكون اقل من او يساوى تاريخ اليوم", this.Page);
                    return false;
                }
                TimeSpan dateDiff = UcBornInfo1.EventBirthDate.Value.Subtract(DecisionControl1.DecisionDate.Value);
                if (dateDiff.Days > 0)
                {
                    MHOCommon.ShowMessage("تاريخ القرار غير صحيح", this.Page);
                    return false;
                }
                if (DecisionControl1.DecisionDate.Value.Date > DateTime.Today.Date)
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