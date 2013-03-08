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
using System.Globalization;

public partial class PrintMedicalDeathInfo : System.Web.UI.Page
{
    #region Properties

    public Guid ParmDeadEventID
    {
        get
        {
            return new Guid(Request.QueryString["DeadEventID"].ToString());
        }
    }

    public bool ForUpdate
    {
        get
        {
            if (Request.QueryString["ForUpdate"] != null)
            {
                if (Request.QueryString["ForUpdate"].ToString() == "1")
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }
    }

    public bool ForApprove
    {
        get
        {
            if (Request.QueryString["ForApprove"] != null)
            {
                if (Request.QueryString["ForApprove"].ToString() == "1")
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }
    }

    #endregion

    #region Events

    /// <summary>
    /// Page load event.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            ucItemControlDeathReasonA.LabelText = GetLocalResourceObject("ucItemControlDeathReason").ToString();
            ucItemControlDeathReasonD.LabelText = GetLocalResourceObject("ucItemSickReasonC").ToString();
            ucItemCauseOfDeathNotRelatedA.LabelText = GetLocalResourceObject("UcItemSickReasonCatalist").ToString();
            ucItemCauseOfDeathNotRelatedB.LabelText = GetLocalResourceObject("UcItemSickReasonCatalistOthers").ToString();
            //Master.PageHeader = GetLocalResourceObject("lblHeaderPage").ToString();
            //Master.MainHeader = GetLocalResourceObject("lblMainPage").ToString();

            loadCats();
            FemalDefaultCheck();
            if (ForUpdate)
            {
                LoadMedicalData();
            }

            radioListISSmoker_SelectedIndexChanged(null, null);
            rdCauseByAccedenc_SelectedIndexChanged(null, null);
            rdTumorFlag_SelectedIndexChanged(null, null);
        }
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (ForApprove)
        {
            MHOCommon.DisablePageControls(DeathHealthContents, false);
            tblApprove.Style.Add("display", "block");
            MHOCommon.DisablePageControls(tblApprove, true);
        }
    }
    /// <summary>
    /// drop categories selected index changed
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void dropICDCat_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadItems();
        lblSelectedItem.Text = "";
    }
    /// <summary>
    /// dropItem selected index changed
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void dropICDItem_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadCode();
        

    }
    /// <summary>
    /// drop Code selected index changed event.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void dropICDcode_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void dropCarType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (dropCarType.SelectedValue == "4")
        {
            txtCarType.Enabled = true;
        }
        else
        {
            txtCarType.Enabled = false;
        }

    }

    protected void drpReason_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drpReason.SelectedValue == "4")
        {
            txtAnotherReason.Enabled = true;
        }
        else
        {
            txtAnotherReason.Enabled = false;
        }

        if (drpReason.SelectedValue == "1")
        {
            dropCarType.Enabled = true;
            txtCarType.Enabled = true;
            RdDeadPersonType.Enabled = true;
        }
        else
        {
            dropCarType.Enabled = false;
            txtCarType.Enabled = false;
            RdDeadPersonType.Enabled = false;


            dropCarType.SelectedIndex = 0;
            RdDeadPersonType.SelectedIndex = 0;
            txtCarType.Text = "";
        }
    }
    protected void btnApprove_Click(object sender, EventArgs e)
    {
        Dead dead = new Dead();
        if (dead.ApproveDeadInfo(ParmDeadEventID))
        {
            Response.Redirect("BornResult.aspx?ApproveDead=1");
        }
        else
        {
            MHOCommon.ShowMessage("عفوا هناك خطا فى البيانات", this.Page);
        }
    }

    protected void btnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("ApproveDead.aspx");
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        if (!ForUpdate)
        {
            if (LogicValidation())
            {
                AddNewHealthInfo();
                Response.Redirect("BornResult.aspx?AddMedicalDeath=1");
            }


        }
        else
        {
            if (LogicValidation())
            {
                UpdateDeadMedicalInfo();
                Response.Redirect("BornResult.aspx?UpdateMedicalDeath=1");
            }

        }
    }
    protected void radioListISSmoker_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (radioListISSmoker.SelectedValue == "1")
        {
            radioListSmokingType.Enabled = true;
            txtsmokingPeriod1.Enabled = true;
            txtsmokingPeriod2.Enabled = true;
        }
        else
        {
            radioListSmokingType.Enabled = false;
            txtsmokingPeriod1.Enabled = false;
            txtsmokingPeriod2.Enabled = false;
            foreach (ListItem item in radioListSmokingType.Items)
            {
                item.Selected = false;
            }
            txtsmokingPeriod1.Text = "00";
            txtsmokingPeriod2.Text = "00";
        }
    }
    protected void rdCauseByAccedenc_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rdCauseByAccedenc.SelectedValue == "1")
        {
            drpReason.Enabled = true;
            txtAnotherReason.Enabled = true;
            txtAccidentLocation.Enabled = true;
            //dropCarType.Enabled = true;
            //txtCarType.Enabled = true;
            //RdDeadPersonType.Enabled = true;

        }
        else
        {
            drpReason.Enabled = false;
            txtAnotherReason.Enabled = false;
            txtAccidentLocation.Enabled = false;
            dropCarType.Enabled = false;
            txtCarType.Enabled = false;
            RdDeadPersonType.Enabled = false;

            drpReason.SelectedIndex = 0;
            dropCarType.SelectedIndex = 0;
            RdDeadPersonType.SelectedIndex = 0;
            txtAnotherReason.Text = "";
            txtAccidentLocation.Text = "";
            txtCarType.Text = "";
        }
    }
    protected void rdTumorFlag_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (rdTumorFlag.SelectedValue == "1")
        {
            txtTumorLocation.Enabled = true;
            dropTumorType.Enabled = true;
            dropTumorPhases.Enabled = true;
        }
        else
        {
            txtTumorLocation.Enabled = false;
            dropTumorType.Enabled = false;
            dropTumorPhases.Enabled = false;

            dropTumorType.SelectedIndex = 0;
            dropTumorPhases.SelectedIndex = 0;
            txtTumorLocation.Text = "";
        }
    }


    #endregion

    #region Methods
    /// <summary>
    /// Load all categories
    /// </summary>
    public void loadCats()
    {
        ICD10CAT cat = new ICD10CAT();
        cat.LoadAll();
       
    }
    /// <summary>
    /// Load items related to selected category
    /// </summary>
    public void loadItems()
    {
        ICD10ITEM itm = new ICD10ITEM();
       
        itm.Where.FK_CATID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
        itm.Query.AddOrderBy(ICD10ITEM.ColumnNames.ITEMDESCREN, MyGeneration.dOOdads.WhereParameter.Dir.ASC);
        if (itm.Query.Load())
        {

        }

        else
        {

        }
    }
    /// <summary>
    /// load codes related to selected item
    /// </summary>
    public void loadCode()
    {
    }

    public void AddNewHealthInfo()
    {
        DeadMedicalInfo deadMedical = new DeadMedicalInfo();

        deadMedical.AddNew();

        deadMedical.DeadEventID = ParmDeadEventID;

        deadMedical.CauseOfDeathA = ucItemControlDeathReasonA.SelectedICD;
        deadMedical.CauseOfDeathAPeriod = ucItemControlDeathReasonA.Days + ucItemControlDeathReasonA.Months + ucItemControlDeathReasonA.Years;

        

        deadMedical.CauseOfDeathD = ucItemControlDeathReasonD.SelectedICD;
        deadMedical.CauseOfDeathDPeriod = ucItemControlDeathReasonD.Days + ucItemControlDeathReasonD.Months + ucItemControlDeathReasonD.Years;

        deadMedical.CauseOfDeathNotRelatedA = ucItemCauseOfDeathNotRelatedA.SelectedICD;
        deadMedical.CauseOfDeathNotRelatedAPeriod = ucItemCauseOfDeathNotRelatedA.Days + ucItemCauseOfDeathNotRelatedA.Months + ucItemCauseOfDeathNotRelatedA.Years;

        deadMedical.CauseOfDeathNotRelatedB = ucItemCauseOfDeathNotRelatedB.SelectedICD;
        deadMedical.CauseOfDeathNotRelatedBPeriod = ucItemCauseOfDeathNotRelatedB.Days + ucItemCauseOfDeathNotRelatedB.Months + ucItemCauseOfDeathNotRelatedB.Years;

        deadMedical.IsSmoker = radioListISSmoker.SelectedValue == "1" ? true : false;
        deadMedical.SmokeType = radioListSmokingType.SelectedValue;
        deadMedical.SmokePeriod = (txtsmokingPeriod1.Text.Length == 1 ? "0" + txtsmokingPeriod1.Text : txtsmokingPeriod1.Text) +
                                  (txtsmokingPeriod2.Text.Length == 1 ? "0" + txtsmokingPeriod2.Text : txtsmokingPeriod2.Text);

        deadMedical.IsCausedByAccedent = rdCauseByAccedenc.SelectedValue == "1" ? true : false;
        deadMedical.AccedentCause = int.Parse(drpReason.SelectedValue);
        deadMedical.AccedentPlace = txtAccidentLocation.Text;
        deadMedical.AccedentAnotherCause = txtAnotherReason.Text;
        deadMedical.VehicleType = int.Parse(dropCarType.SelectedValue);
        deadMedical.VehicleTypeOther = txtCarType.Text;
        deadMedical.DeadStatus = int.Parse(RdDeadPersonType.SelectedValue);

        deadMedical.HasTumor = rdTumorFlag.SelectedValue == "1" ? true : false;
        deadMedical.PlaceOfTumor = txtTumorLocation.Text;
        deadMedical.TypeOfTumor = int.Parse(dropTumorType.SelectedValue);
        deadMedical.PhaseOfTumor = int.Parse(dropTumorPhases.SelectedValue);

        deadMedical.DeadThroghCarry = rdDeathThroughCarry.SelectedValue == "1" ? true : false;
        deadMedical.DeadThroghBirth = rdDeadThroughBirth.SelectedValue == "1" ? true : false;
        deadMedical.AbortionPast6Weeks = rdAbortionPast6Weeks.SelectedValue == "1" ? true : false;
        //   deadMedical.DeadThroghBirth = rdDeadThroughBirth.SelectedValue == "1" ? true : false;
        deadMedical.BirthPast6Weeks = rdBirthPast6Weeks.SelectedValue == "1" ? true : false;
        DateTime testInputDate;
        if (DateTime.TryParse(txtDate.Text, out testInputDate))
        {
            IFormatProvider culture = new CultureInfo("en-US", true);
            deadMedical.BirthDate = DateTime.ParseExact(txtDate.Text, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
        }
        deadMedical.BirthResult = int.Parse(dropBirthOuput.SelectedValue);
        deadMedical.BirthPlace = txtBirthLocation.Text;
        deadMedical.BirthOperator = txtBirthOperator.Text;

        deadMedical.Save();

        // update Dead record to indecate about medical info completion.
        Dead dead = new Dead();
        dead.LoadByPrimaryKey(ParmDeadEventID);
        dead.HasHealthData = true;
        dead.Save();
    }

    public void LoadMedicalData()
    {
      
        DeadMedicalInfo deadMedical = new DeadMedicalInfo();
        deadMedical.Where.DeadEventID.Value = ParmDeadEventID;
        deadMedical.Where.DeadEventID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
        deadMedical.Query.Load();

        ICDCODE9000 objICD9000 = new ICDCODE9000();
        ucItemControlDeathReasonA.setCode = objICD9000.getICD9000Description(deadMedical.CauseOfDeathA);
        //deadMedical.CauseOfDeathA = ucItemControlDeathReasonA.SelectedICD;
        ucItemControlDeathReasonA.Days = deadMedical.CauseOfDeathAPeriod.Substring(0, 2);
        ucItemControlDeathReasonA.Months = deadMedical.CauseOfDeathAPeriod.Substring(2, 2);
        ucItemControlDeathReasonA.Years = deadMedical.CauseOfDeathAPeriod.Substring(4, 2);

        //deadMedical.CauseOfDeathAPeriod = ucItemControlDeathReasonA.Days + ucItemControlDeathReasonA.Months + ucItemControlDeathReasonA.Years;
        if (deadMedical.CauseOfDeathB != null && deadMedical.CauseOfDeathB != 0)
            lblSelectedItem.Text = new ICD10ITEM().getItemDescription(deadMedical.CauseOfDeathB);
        //deadMedical.CauseOfDeathB = int.Parse(dropICDItem.SelectedValue);
        if (deadMedical.CauseOfDeathC != "")
            lblSelectedCode.Text = new ICD10CODE().getCodeDescription(deadMedical.CauseOfDeathC);
        //deadMedical.CauseOfDeathC = dropICDcode.SelectedValue;

        if (deadMedical.CauseOfDeathD != "")
            ucItemControlDeathReasonD.setCode = objICD9000.getICD9000Description(deadMedical.CauseOfDeathD);
        //deadMedical.CauseOfDeathD = ucItemControlDeathReasonD.SelectedICD;
        if (deadMedical.CauseOfDeathDPeriod != "000000")
        {
            //deadMedical.CauseOfDeathDPeriod = ucItemControlDeathReasonD.Days + ucItemControlDeathReasonD.Months + ucItemControlDeathReasonD.Years;
            ucItemControlDeathReasonD.Days = deadMedical.CauseOfDeathDPeriod.Substring(0, 2);
            ucItemControlDeathReasonD.Months = deadMedical.CauseOfDeathDPeriod.Substring(2, 2);
            ucItemControlDeathReasonD.Years = deadMedical.CauseOfDeathDPeriod.Substring(4, 2);
        }

        if (deadMedical.CauseOfDeathNotRelatedA != "")
            ucItemCauseOfDeathNotRelatedA.setCode = objICD9000.getICD9000Description(deadMedical.CauseOfDeathNotRelatedA);
        //deadMedical.CauseOfDeathNotRelatedA = ucItemCauseOfDeathNotRelatedA.SelectedICD;
        if (deadMedical.CauseOfDeathNotRelatedAPeriod != "000000")
        {
            // deadMedical.CauseOfDeathNotRelatedAPeriod = ucItemCauseOfDeathNotRelatedA.Days + ucItemCauseOfDeathNotRelatedA.Months + ucItemCauseOfDeathNotRelatedA.Years;
            ucItemCauseOfDeathNotRelatedA.Days = deadMedical.CauseOfDeathNotRelatedAPeriod.Substring(0, 2);
            ucItemCauseOfDeathNotRelatedA.Months = deadMedical.CauseOfDeathNotRelatedAPeriod.Substring(2, 2);
            ucItemCauseOfDeathNotRelatedA.Years = deadMedical.CauseOfDeathNotRelatedAPeriod.Substring(4, 2);
        }

        if (deadMedical.CauseOfDeathNotRelatedB != "")
            ucItemCauseOfDeathNotRelatedB.setCode = objICD9000.getICD9000Description(deadMedical.CauseOfDeathNotRelatedB);
        // deadMedical.CauseOfDeathNotRelatedB = ucItemCauseOfDeathNotRelatedB.SelectedICD;
        if (deadMedical.CauseOfDeathNotRelatedBPeriod != "000000")
        {
            //deadMedical.CauseOfDeathNotRelatedBPeriod = ucItemCauseOfDeathNotRelatedB.Days + ucItemCauseOfDeathNotRelatedB.Months + ucItemCauseOfDeathNotRelatedB.Years;
            ucItemCauseOfDeathNotRelatedB.Days = deadMedical.CauseOfDeathNotRelatedBPeriod.Substring(0, 2);
            ucItemCauseOfDeathNotRelatedB.Months = deadMedical.CauseOfDeathNotRelatedBPeriod.Substring(2, 2);
            ucItemCauseOfDeathNotRelatedB.Years = deadMedical.CauseOfDeathNotRelatedBPeriod.Substring(4, 2);
        }

        if (deadMedical.IsSmoker)
            radioListISSmoker.SelectedIndex = 0;
        else
            radioListISSmoker.SelectedIndex = 1;
        //deadMedical.IsSmoker = radioListISSmoker.SelectedValue == "1" ? true : false;
        radioListSmokingType.SelectedIndex = radioListSmokingType.Items.IndexOf(radioListSmokingType.Items.FindByValue(deadMedical.SmokeType));
        //deadMedical.SmokeType = radioListSmokingType.SelectedValue;
        txtsmokingPeriod1.Text = deadMedical.SmokePeriod.Substring(0, 2);
        txtsmokingPeriod2.Text = deadMedical.SmokePeriod.Substring(2, 2);
        //  deadMedical.SmokePeriod = (txtsmokingPeriod1.Text.Length == 1 ? "0" + txtsmokingPeriod1.Text : txtsmokingPeriod1.Text) +
        //                           (txtsmokingPeriod2.Text.Length == 1 ? "0" + txtsmokingPeriod2.Text : txtsmokingPeriod2.Text);

        if (deadMedical.IsCausedByAccedent)
            rdCauseByAccedenc.SelectedIndex = 0;
        else
            rdCauseByAccedenc.SelectedIndex = 1;

        drpReason.SelectedIndex = drpReason.Items.IndexOf(drpReason.Items.FindByValue(deadMedical.AccedentCause.ToString()));
        //deadMedical.AccedentCause = int.Parse(drpReason.SelectedValue);
        txtAccidentLocation.Text = deadMedical.AccedentPlace;
        txtAnotherReason.Text = deadMedical.AccedentAnotherCause;
        //deadMedical.AccedentPlace = txtAccidentLocation.Text;
        dropCarType.SelectedIndex = dropCarType.Items.IndexOf(dropCarType.Items.FindByValue(deadMedical.VehicleType.ToString()));
        //deadMedical.VehicleType = int.Parse(dropCarType.SelectedValue);
        txtCarType.Text = deadMedical.VehicleTypeOther;
        //deadMedical.VehicleTypeOther = txtCarType.Text;
        RdDeadPersonType.SelectedIndex = RdDeadPersonType.Items.IndexOf(RdDeadPersonType.Items.FindByValue(deadMedical.DeadStatus.ToString()));
        //deadMedical.DeadStatus = int.Parse(RdDeadPersonType.SelectedValue);

        if (deadMedical.HasTumor)
            rdTumorFlag.SelectedIndex = 0;
        else
            rdTumorFlag.SelectedIndex = 1;
        txtTumorLocation.Text = deadMedical.PlaceOfTumor;
        dropTumorType.SelectedIndex = dropTumorType.Items.IndexOf(dropTumorType.Items.FindByValue(deadMedical.TypeOfTumor.ToString()));
        //deadMedical.TypeOfTumor = int.Parse(dropTumorType.SelectedValue);
        dropTumorPhases.SelectedIndex = dropTumorPhases.Items.IndexOf(dropTumorPhases.Items.FindByValue(deadMedical.PhaseOfTumor.ToString()));
        // deadMedical.PhaseOfTumor = int.Parse(dropTumorPhases.SelectedValue);

        if (deadMedical.DeadThroghCarry)
            rdDeathThroughCarry.SelectedIndex = 0;
        else
            rdDeathThroughCarry.SelectedIndex = 1;

        //deadMedical.DeadThroghCarry = rdDeathThroughCarry.SelectedValue == "1" ? true : false;
        if (deadMedical.DeadThroghBirth)
            rdDeadThroughBirth.SelectedIndex = 0;
        else
            rdDeadThroughBirth.SelectedIndex = 1;

        //deadMedical.DeadThroghBirth = rdAbortionPast6Weeks.SelectedValue == "1" ? true : false;
        if (deadMedical.AbortionPast6Weeks)
            rdAbortionPast6Weeks.SelectedIndex = 0;
        else
            rdAbortionPast6Weeks.SelectedIndex = 1;

        //deadMedical.AbortionPast6Weeks = rdAbortionPast6Weeks.SelectedValue == "1" ? true : false;
        if (deadMedical.BirthPast6Weeks)
            rdBirthPast6Weeks.SelectedIndex = 0;
        else
            rdBirthPast6Weeks.SelectedIndex = 1;
        // deadMedical.DeadThroghBirth = rdDeadThroughBirth.SelectedValue == "1" ? true : false;
        //deadMedical.BirthPast6Weeks = rdBirthPast6Weeks.SelectedValue == "1" ? true : false;

        try
        {
            txtDate.Text = deadMedical.BirthDate.ToString();
        }
        catch
        {
            //continue
        }
        //IFormatProvider culture = new CultureInfo("en-US", true);
        //deadMedical.BirthDate = DateTime.ParseExact(txtDate.Text, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
        dropBirthOuput.SelectedIndex = dropBirthOuput.Items.IndexOf(dropBirthOuput.Items.FindByValue(deadMedical.BirthResult.ToString()));
        //deadMedical.BirthResult = int.Parse(dropBirthOuput.SelectedValue);
        txtBirthLocation.Text = deadMedical.BirthPlace;
        txtBirthOperator.Text = deadMedical.BirthOperator;
    }

    public bool LogicValidation()
    {
        if (!ForUpdate && ucItemControlDeathReasonA.SelectedICD == "" || ucItemControlDeathReasonA.SelectedICD == "0")
        {
            MHOCommon.ShowMessage("برجاء ادخال السبب المباشر للوفاة", this.Page);
           
            return false;
        }
        if (radioListISSmoker.SelectedValue == "1")
        {
            if (string.IsNullOrEmpty(radioListSmokingType.SelectedValue))
            {
                MHOCommon.ShowMessage("برجاء ادخال نوع التدخين", this.Page);
              
                updSmoking.Update();
                return false;
            }
        }
        if (rdCauseByAccedenc.SelectedValue == "1")
        {
            if (string.IsNullOrEmpty(drpReason.SelectedValue) || string.IsNullOrEmpty(txtAccidentLocation.Text))
            {
                MHOCommon.ShowMessage("برجاء ادخال بيانات الحادث", this.Page);
              
                updateAccedant.Update();
                return false;
            }
            else if (drpReason.SelectedValue == "4" && string.IsNullOrEmpty(txtAccidentLocation.Text))
            {
                MHOCommon.ShowMessage("برجاء ادخال بيانات الحادث", this.Page);
                
                updateAccedant.Update();
                return false;
            }
            if (dropCarType.SelectedValue == "4" && string.IsNullOrEmpty(txtCarType.Text))
            {
                MHOCommon.ShowMessage("برجاء ادخال بيانات الحادث", this.Page);
                
                updateAccedant.Update();
                return false;
            }

        }
        if (rdTumorFlag.SelectedValue == "1")
        {
            if (string.IsNullOrEmpty(txtTumorLocation.Text) || string.IsNullOrEmpty(dropTumorType.SelectedValue) || string.IsNullOrEmpty(dropTumorPhases.SelectedValue))
            {
                MHOCommon.ShowMessage("برجاء ادخال بيانات الاورام", this.Page);
               
                updTumors.Update();
                return false;
            }

        }

        return true;
    }

    public void UpdateDeadMedicalInfo()
    {
        DeadMedicalInfo deadMedical = new DeadMedicalInfo();
        deadMedical.Where.DeadEventID.Value = ParmDeadEventID;
        deadMedical.Where.DeadEventID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
        deadMedical.Query.Load();
        if (!string.IsNullOrEmpty(ucItemControlDeathReasonA.SelectedICD))
        {
            deadMedical.CauseOfDeathA = ucItemControlDeathReasonA.SelectedICD;
        }
        deadMedical.CauseOfDeathAPeriod = ucItemControlDeathReasonA.Days + ucItemControlDeathReasonA.Months + ucItemControlDeathReasonA.Years;

    

        deadMedical.CauseOfDeathD = ucItemControlDeathReasonD.SelectedICD;
        deadMedical.CauseOfDeathDPeriod = ucItemControlDeathReasonD.Days + ucItemControlDeathReasonD.Months + ucItemControlDeathReasonD.Years;

        deadMedical.CauseOfDeathNotRelatedA = ucItemCauseOfDeathNotRelatedA.SelectedICD;
        deadMedical.CauseOfDeathNotRelatedAPeriod = ucItemCauseOfDeathNotRelatedA.Days + ucItemCauseOfDeathNotRelatedA.Months + ucItemCauseOfDeathNotRelatedA.Years;

        deadMedical.CauseOfDeathNotRelatedB = ucItemCauseOfDeathNotRelatedB.SelectedICD;
        deadMedical.CauseOfDeathNotRelatedBPeriod = ucItemCauseOfDeathNotRelatedB.Days + ucItemCauseOfDeathNotRelatedB.Months + ucItemCauseOfDeathNotRelatedB.Years;

        deadMedical.IsSmoker = radioListISSmoker.SelectedValue == "1" ? true : false;
        deadMedical.SmokeType = radioListSmokingType.SelectedValue;
        deadMedical.SmokePeriod = (txtsmokingPeriod1.Text.Length == 1 ? "0" + txtsmokingPeriod1.Text : txtsmokingPeriod1.Text) +
                                  (txtsmokingPeriod2.Text.Length == 1 ? "0" + txtsmokingPeriod2.Text : txtsmokingPeriod2.Text);

        deadMedical.IsCausedByAccedent = rdCauseByAccedenc.SelectedValue == "1" ? true : false;
        deadMedical.AccedentCause = int.Parse(drpReason.SelectedValue);
        deadMedical.AccedentPlace = txtAccidentLocation.Text;
        deadMedical.AccedentAnotherCause = txtAnotherReason.Text;
        deadMedical.VehicleType = int.Parse(dropCarType.SelectedValue);
        deadMedical.VehicleTypeOther = txtCarType.Text;
        deadMedical.DeadStatus = int.Parse(RdDeadPersonType.SelectedValue);

        deadMedical.HasTumor = rdTumorFlag.SelectedValue == "1" ? true : false;
        deadMedical.PlaceOfTumor = txtTumorLocation.Text;
        deadMedical.TypeOfTumor = int.Parse(dropTumorType.SelectedValue);
        deadMedical.PhaseOfTumor = int.Parse(dropTumorPhases.SelectedValue);

        deadMedical.DeadThroghCarry = rdDeathThroughCarry.SelectedValue == "1" ? true : false;
        //deadMedical.DeadThroghBirth = rdAbortionPast6Weeks.SelectedValue == "1" ? true : false;
        deadMedical.AbortionPast6Weeks = rdAbortionPast6Weeks.SelectedValue == "1" ? true : false;
        deadMedical.DeadThroghBirth = rdDeadThroughBirth.SelectedValue == "1" ? true : false;
        deadMedical.BirthPast6Weeks = rdBirthPast6Weeks.SelectedValue == "1" ? true : false;

        DateTime testInputDate;
        if (DateTime.TryParse(txtDate.Text, out testInputDate))
        {
            IFormatProvider culture = new CultureInfo("en-US", true);
            deadMedical.BirthDate = DateTime.ParseExact(txtDate.Text, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
        }
        deadMedical.BirthResult = int.Parse(dropBirthOuput.SelectedValue);
        deadMedical.BirthPlace = txtBirthLocation.Text;
        deadMedical.BirthOperator = txtBirthOperator.Text;

        deadMedical.Save();

    }

    public void FemalDefaultCheck()
    {
        try
        {
            
        }
        catch
        {
            
        }
    }

    #endregion
}
