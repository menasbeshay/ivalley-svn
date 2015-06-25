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

public partial class RegisterDeathHealthInfo : System.Web.UI.Page
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
            ucSubItemControlDeathReasonD.LabelText = GetLocalResourceObject("ucItemSickReasonC").ToString();
            ucSubItemControlDeathReasonC.LabelText = GetLocalResourceObject("ucItemSickReasonC").ToString();
            ucSubItemControlDeathReasonB.LabelText = GetLocalResourceObject("ucItemSickReasonC").ToString();
            ucItemControlDeathReason_D.LabelText = GetLocalResourceObject("ucItemSickReasonC").ToString();
            ucItemCauseOfDeathNotRelatedA.LabelText = GetLocalResourceObject("UcItemSickReasonCatalist").ToString();
            ucItemCauseOfDeathNotRelatedB.LabelText = GetLocalResourceObject("UcItemSickReasonCatalistOthers").ToString();
            Master.PageHeader = GetLocalResourceObject("lblHeaderPage").ToString();
            Master.MainHeader = GetLocalResourceObject("lblMainPage").ToString();


            LoadLocationOfTumor();
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
            btnAdd.Visible = false;
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
        dropICDcode.Items.Clear();
        lblSelectedItem.Text = "";
        lblSelectedCode.Text = "";
    }
    /// <summary>
    /// dropItem selected index changed
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void dropICDItem_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadCode();
        lblSelectedItem.Text = dropICDItem.SelectedValue;
        lblSelectedCode.Text = "";
       
    }
    /// <summary>
    /// drop Code selected index changed event.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void dropICDcode_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblSelectedCode.Text = dropICDcode.SelectedValue;
        
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
           // Dead objDead = new Dead();
            dead.UpdateDeadDoctor(MHOCommon.CurrentLoggedUserID, ParmDeadEventID);
            Response.Redirect("BornResult.aspx?ApproveDead=1&Medical=1&DeadEventID=" + ParmDeadEventID);
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
                Response.Redirect("BornResult.aspx?AddMedicalDeath=1&Medical=1&DeadEventID=" + ParmDeadEventID);
            }


        }
        else
        {
            if (LogicValidation())
            {
                UpdateDeadMedicalInfo();
                Response.Redirect("BornResult.aspx?UpdateMedicalDeath=1&Medical=1&DeadEventID=" + ParmDeadEventID);
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
            uiDropDownListTumorLocation.Enabled = true;
            dropTumorType.Enabled = true;
            dropTumorPhases.Enabled = true;
        }
        else
        {
            txtTumorLocation.Enabled = false;
            uiDropDownListTumorLocation.Enabled = false;
            dropTumorType.Enabled = false;
            dropTumorPhases.Enabled = false;

            dropTumorType.SelectedIndex = 0;
            dropTumorPhases.SelectedIndex = 0;
            txtTumorLocation.Text = "";
            uiDropDownListTumorLocation.SelectedIndex = 0;
        }
    }
  

    #endregion

    #region Methods

    public void LoadLocationOfTumor()
    {
        TumorLocation locations = new TumorLocation();
        locations.LoadAll();
        uiDropDownListTumorLocation.DataSource = locations.DefaultView;
        uiDropDownListTumorLocation.DataTextField = TumorLocation.ColumnNames.LocationName;
        uiDropDownListTumorLocation.DataValueField = TumorLocation.ColumnNames.LoacationId;
        uiDropDownListTumorLocation.DataBind();
        ListItem item = new ListItem("----", "0");
        uiDropDownListTumorLocation.Items.Insert(0, item);
        uiDropDownListTumorLocation.SelectedIndex = 0;
    }
    /// <summary>
    /// Load all categories
    /// </summary>
    public void loadCats()
    {
        ICD10CAT cat = new ICD10CAT();
        cat.LoadAll();
        dropICDCat.DataSource = cat.DefaultView;
        dropICDCat.DataTextField = ICD10CAT.ColumnNames.CATDESCRENG;
        dropICDCat.DataValueField = ICD10CAT.ColumnNames.CATID;
        dropICDCat.DataBind();
    }
    /// <summary>
    /// Load items related to selected category
    /// </summary>
    public void loadItems()
    {
        ICD10ITEM itm = new ICD10ITEM();
        itm.Where.FK_CATID.Value = dropICDCat.SelectedValue;
        itm.Where.FK_CATID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
        itm.Query.AddOrderBy(ICD10ITEM.ColumnNames.ITEMDESCREN, MyGeneration.dOOdads.WhereParameter.Dir.ASC);
        if (itm.Query.Load())
        {
            dropICDItem.DataSource = itm.DefaultView;
            dropICDItem.DataTextField = ICD10ITEM.ColumnNames.ITEMDESCREN;
            dropICDItem.DataValueField = ICD10ITEM.ColumnNames.ITEMID;
            dropICDItem.DataBind();

            ListItem item = new ListItem(" ", "0");
            dropICDItem.Items.Insert(0, item);
            dropICDItem.SelectedIndex = 0;
        }
        else
        {
            dropICDItem.Items.Clear();
        }
    }
    /// <summary>
    /// load codes related to selected item
    /// </summary>
    public void loadCode()
    {
        ICD10CODE cod = new ICD10CODE();
        cod.Where.FK_ITEMID.Value = dropICDItem.SelectedValue;
        cod.Where.FK_ITEMID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
        cod.Query.AddOrderBy(ICD10CODE.ColumnNames.CODEDESCREN, MyGeneration.dOOdads.WhereParameter.Dir.ASC);
        if (cod.Query.Load())
        {
            dropICDcode.DataSource = cod.DefaultView;
            dropICDcode.DataTextField = ICD10CODE.ColumnNames.CODEDESCREN;
            dropICDcode.DataValueField = ICD10CODE.ColumnNames.ICDCODEID;
            dropICDcode.DataBind();

            ListItem item = new ListItem(" ", "0");
            dropICDcode.Items.Insert(0, item);
            dropICDcode.SelectedIndex = 0;
        }
        else
        {
            dropICDcode.Items.Clear();
        }
    }

    public void AddNewHealthInfo()
    {
        DeadMedicalInfo deadMedical = new DeadMedicalInfo();
        
        deadMedical.AddNew();

        deadMedical.DeadEventID = ParmDeadEventID;

        if (!uiCheckBoxUnderInvestigation.Checked)
        {
            deadMedical.CauseOfDeathA = ucItemControlDeathReasonA.SelectedICD;
            deadMedical.CauseOfDeathAPeriod = ucItemControlDeathReasonA.Days + ucItemControlDeathReasonA.Months + ucItemControlDeathReasonA.Years + ucItemControlDeathReasonA.Hours + ucItemControlDeathReasonA.Mins;

            deadMedical.CauseOfDeathB = ucSubItemControlDeathReasonB.SelectedICD;
            deadMedical.CauseOfDeathBPeriod = ucSubItemControlDeathReasonB.Days + ucSubItemControlDeathReasonB.Months + ucSubItemControlDeathReasonB.Years + ucSubItemControlDeathReasonB.Hours + ucSubItemControlDeathReasonB.Mins;

            deadMedical.CauseOfDeathC = ucSubItemControlDeathReasonC.SelectedICD;
            deadMedical.CauseOfDeathCPeriod = ucSubItemControlDeathReasonC.Days + ucSubItemControlDeathReasonC.Months + ucSubItemControlDeathReasonC.Years + ucSubItemControlDeathReasonC.Hours + ucSubItemControlDeathReasonC.Mins;

            deadMedical.CauseOfDeathD = ucSubItemControlDeathReasonD.SelectedICD;
            deadMedical.CauseOfDeathDPeriod = ucSubItemControlDeathReasonD.Days + ucSubItemControlDeathReasonD.Months + ucSubItemControlDeathReasonD.Years + ucSubItemControlDeathReasonD.Hours + ucSubItemControlDeathReasonD.Mins;

            /*if (dropICDItem.SelectedValue != "")
            {
                deadMedical.CauseOfDeathB = int.Parse(dropICDItem.SelectedValue);
            }
            else
            {
                deadMedical.CauseOfDeathB = 0;
            }
            deadMedical.CauseOfDeathC = dropICDcode.SelectedValue;
        
            deadMedical.CauseOfDeathD = ucItemControlDeathReasonD.SelectedICD;
            deadMedical.CauseOfDeathDPeriod = ucItemControlDeathReasonD.Days + ucItemControlDeathReasonD.Months + ucItemControlDeathReasonD.Years;
            */
            deadMedical.CauseOfDeathNotRelatedA = ucItemCauseOfDeathNotRelatedA.SelectedICD;
            deadMedical.CauseOfDeathNotRelatedAPeriod = ucItemCauseOfDeathNotRelatedA.Days + ucItemCauseOfDeathNotRelatedA.Months + ucItemCauseOfDeathNotRelatedA.Years + ucItemCauseOfDeathNotRelatedA.Hours + ucItemCauseOfDeathNotRelatedA.Mins;

            deadMedical.CauseOfDeathNotRelatedB = ucItemCauseOfDeathNotRelatedB.SelectedICD;
            deadMedical.CauseOfDeathNotRelatedBPeriod = ucItemCauseOfDeathNotRelatedB.Days + ucItemCauseOfDeathNotRelatedB.Months + ucItemCauseOfDeathNotRelatedB.Years + ucItemCauseOfDeathNotRelatedB.Hours + ucItemCauseOfDeathNotRelatedB.Mins;

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
            if (uiDropDownListTumorLocation.SelectedValue != "0")
                deadMedical.LocationOfTumor = Convert.ToInt32(uiDropDownListTumorLocation.SelectedValue);
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
        }
        else
        {
            deadMedical.IsUnderInvestigation = uiCheckBoxUnderInvestigation.Checked;
        }
        deadMedical.Save();

        // update Dead record to indecate about medical info completion.
        Dead dead = new Dead();
        dead.LoadByPrimaryKey(ParmDeadEventID);
        dead.HasHealthData = true;
        dead.Save();
    }

    public void LoadMedicalData()
    {
        btnAdd.Text = "تعديل البيانات الصحية";
        DeadMedicalInfo deadMedical = new DeadMedicalInfo();
        deadMedical.Where.DeadEventID.Value = ParmDeadEventID;
        deadMedical.Where.DeadEventID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
        deadMedical.Query.Load();

        uiCheckBoxUnderInvestigation.Checked = deadMedical.IsUnderInvestigation;

        //ICDCODE9000 objICD9000 = new ICDCODE9000();
        if (!deadMedical.IsColumnNull("CauseOfDeathA"))
        {
            ICD10_DirectDeathReason objICD9000 = new ICD10_DirectDeathReason();
            ucItemControlDeathReasonA.setCode = objICD9000.getICD9000Description(deadMedical.CauseOfDeathA);
            //deadMedical.CauseOfDeathA = ucItemControlDeathReasonA.SelectedICD;
            ucItemControlDeathReasonA.Days = deadMedical.CauseOfDeathAPeriod.Substring(0, 2);
            ucItemControlDeathReasonA.Months = deadMedical.CauseOfDeathAPeriod.Substring(2, 2);
            ucItemControlDeathReasonA.Years = deadMedical.CauseOfDeathAPeriod.Substring(4, 2);
            ucItemControlDeathReasonA.Hours = deadMedical.CauseOfDeathAPeriod.Substring(6, 2);
            ucItemControlDeathReasonA.Mins = deadMedical.CauseOfDeathAPeriod.Substring(8, 2);
        }
        ICD10_MainDeathReason objicd10 = new ICD10_MainDeathReason();
        if (!deadMedical.IsColumnNull("CauseOfDeathB"))
        {
            ucSubItemControlDeathReasonB.setCode = objicd10.getICD9000Description(deadMedical.CauseOfDeathB);
            if (deadMedical.CauseOfDeathBPeriod != "00000000")
            {                
                ucSubItemControlDeathReasonB.Days = deadMedical.CauseOfDeathBPeriod.Substring(0, 2);
                ucSubItemControlDeathReasonB.Months = deadMedical.CauseOfDeathBPeriod.Substring(2, 2);
                ucSubItemControlDeathReasonB.Years = deadMedical.CauseOfDeathBPeriod.Substring(4, 2);
                ucSubItemControlDeathReasonB.Hours = deadMedical.CauseOfDeathBPeriod.Substring(6, 2);
                ucSubItemControlDeathReasonB.Mins = deadMedical.CauseOfDeathBPeriod.Substring(8, 2);
            }
        }
        if (!deadMedical.IsColumnNull("CauseOfDeathC"))
        {
            ucSubItemControlDeathReasonC.setCode = objicd10.getICD9000Description(deadMedical.CauseOfDeathC);
            if (deadMedical.CauseOfDeathCPeriod != "00000000")
            {
                ucSubItemControlDeathReasonC.Days = deadMedical.CauseOfDeathCPeriod.Substring(0, 2);
                ucSubItemControlDeathReasonC.Months = deadMedical.CauseOfDeathCPeriod.Substring(2, 2);
                ucSubItemControlDeathReasonC.Years = deadMedical.CauseOfDeathCPeriod.Substring(4, 2);
                ucSubItemControlDeathReasonC.Hours = deadMedical.CauseOfDeathCPeriod.Substring(6, 2);
                ucSubItemControlDeathReasonC.Mins = deadMedical.CauseOfDeathCPeriod.Substring(8, 2);
            }
        }
        if (!deadMedical.IsColumnNull("CauseOfDeathD"))
        {
            ucSubItemControlDeathReasonD.setCode = objicd10.getICD9000Description(deadMedical.CauseOfDeathD);
            if (deadMedical.CauseOfDeathDPeriod != "00000000")
            {
                ucSubItemControlDeathReasonD.Days = deadMedical.CauseOfDeathDPeriod.Substring(0, 2);
                ucSubItemControlDeathReasonD.Months = deadMedical.CauseOfDeathDPeriod.Substring(2, 2);
                ucSubItemControlDeathReasonD.Years = deadMedical.CauseOfDeathDPeriod.Substring(4, 2);
                ucSubItemControlDeathReasonD.Hours = deadMedical.CauseOfDeathDPeriod.Substring(6, 2);
                ucSubItemControlDeathReasonD.Mins = deadMedical.CauseOfDeathDPeriod.Substring(8, 2);
            }
        }

        //deadMedical.CauseOfDeathAPeriod = ucItemControlDeathReasonA.Days + ucItemControlDeathReasonA.Months + ucItemControlDeathReasonA.Years;
       /* if (deadMedical.CauseOfDeathB!=null && deadMedical.CauseOfDeathB != 0)
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
        */
        if (deadMedical.CauseOfDeathNotRelatedA != "")
            ucItemCauseOfDeathNotRelatedA.setCode = objicd10.getICD9000Description(deadMedical.CauseOfDeathNotRelatedA);
        //deadMedical.CauseOfDeathNotRelatedA = ucItemCauseOfDeathNotRelatedA.SelectedICD;
        if (deadMedical.CauseOfDeathNotRelatedAPeriod != "00000000" && !deadMedical.IsColumnNull("CauseOfDeathNotRelatedAPeriod"))
        {
            // deadMedical.CauseOfDeathNotRelatedAPeriod = ucItemCauseOfDeathNotRelatedA.Days + ucItemCauseOfDeathNotRelatedA.Months + ucItemCauseOfDeathNotRelatedA.Years;
            ucItemCauseOfDeathNotRelatedA.Days = deadMedical.CauseOfDeathNotRelatedAPeriod.Substring(0, 2);
            ucItemCauseOfDeathNotRelatedA.Months = deadMedical.CauseOfDeathNotRelatedAPeriod.Substring(2, 2);
            ucItemCauseOfDeathNotRelatedA.Years = deadMedical.CauseOfDeathNotRelatedAPeriod.Substring(4, 2);
            ucItemCauseOfDeathNotRelatedA.Hours = deadMedical.CauseOfDeathNotRelatedAPeriod.Substring(6, 2);
            ucItemCauseOfDeathNotRelatedA.Mins = deadMedical.CauseOfDeathNotRelatedAPeriod.Substring(8, 2);
        }

        if (deadMedical.CauseOfDeathNotRelatedB != "")
            ucItemCauseOfDeathNotRelatedB.setCode = objicd10.getICD9000Description(deadMedical.CauseOfDeathNotRelatedB);
        // deadMedical.CauseOfDeathNotRelatedB = ucItemCauseOfDeathNotRelatedB.SelectedICD;
        if (deadMedical.CauseOfDeathNotRelatedBPeriod != "00000000" && !deadMedical.IsColumnNull("CauseOfDeathNotRelatedBPeriod"))
        {
            //deadMedical.CauseOfDeathNotRelatedBPeriod = ucItemCauseOfDeathNotRelatedB.Days + ucItemCauseOfDeathNotRelatedB.Months + ucItemCauseOfDeathNotRelatedB.Years;
            ucItemCauseOfDeathNotRelatedB.Days = deadMedical.CauseOfDeathNotRelatedBPeriod.Substring(0, 2);
            ucItemCauseOfDeathNotRelatedB.Months = deadMedical.CauseOfDeathNotRelatedBPeriod.Substring(2, 2);
            ucItemCauseOfDeathNotRelatedB.Years = deadMedical.CauseOfDeathNotRelatedBPeriod.Substring(4, 2);
            ucItemCauseOfDeathNotRelatedB.Hours = deadMedical.CauseOfDeathNotRelatedBPeriod.Substring(6, 2);
            ucItemCauseOfDeathNotRelatedB.Mins = deadMedical.CauseOfDeathNotRelatedBPeriod.Substring(8, 2);
        }

        if (!deadMedical.IsColumnNull("IsSmoker"))
        {
            if (deadMedical.IsSmoker)
                radioListISSmoker.SelectedIndex = 0;
            else
                radioListISSmoker.SelectedIndex = 1;

            radioListSmokingType.SelectedIndex = radioListSmokingType.Items.IndexOf(radioListSmokingType.Items.FindByValue(deadMedical.SmokeType));
            //deadMedical.SmokeType = radioListSmokingType.SelectedValue;
            txtsmokingPeriod1.Text = deadMedical.SmokePeriod.Substring(0, 2);
            txtsmokingPeriod2.Text = deadMedical.SmokePeriod.Substring(2, 2);
        }
        //deadMedical.IsSmoker = radioListISSmoker.SelectedValue == "1" ? true : false;
        
        //  deadMedical.SmokePeriod = (txtsmokingPeriod1.Text.Length == 1 ? "0" + txtsmokingPeriod1.Text : txtsmokingPeriod1.Text) +
        //                           (txtsmokingPeriod2.Text.Length == 1 ? "0" + txtsmokingPeriod2.Text : txtsmokingPeriod2.Text);

        if (!deadMedical.IsColumnNull("IsCausedByAccedent"))
        {
            if (deadMedical.IsCausedByAccedent)
                rdCauseByAccedenc.SelectedIndex = 0;
            else
                rdCauseByAccedenc.SelectedIndex = 1;
        }
        if (!deadMedical.IsColumnNull("AccedentCause"))
        {
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
        }
        if (!deadMedical.IsColumnNull("HasTumor"))
        {
            if (deadMedical.HasTumor)
                rdTumorFlag.SelectedIndex = 0;
            else
                rdTumorFlag.SelectedIndex = 1;
        }
        txtTumorLocation.Text = deadMedical.PlaceOfTumor;
        if (!deadMedical.IsColumnNull("LocationOfTumor"))
            uiDropDownListTumorLocation.SelectedValue = deadMedical.LocationOfTumor.ToString();
        if (!deadMedical.IsColumnNull("TypeOfTumor"))
        {
            dropTumorType.SelectedIndex = dropTumorType.Items.IndexOf(dropTumorType.Items.FindByValue(deadMedical.TypeOfTumor.ToString()));
            //deadMedical.TypeOfTumor = int.Parse(dropTumorType.SelectedValue);
            dropTumorPhases.SelectedIndex = dropTumorPhases.Items.IndexOf(dropTumorPhases.Items.FindByValue(deadMedical.PhaseOfTumor.ToString()));
            // deadMedical.PhaseOfTumor = int.Parse(dropTumorPhases.SelectedValue);
        }
        if (!deadMedical.IsColumnNull("DeadThroghCarry"))
        {
            if (deadMedical.DeadThroghCarry)
                rdDeathThroughCarry.SelectedIndex = 0;
            else
                rdDeathThroughCarry.SelectedIndex = 1;
        }
        //deadMedical.DeadThroghCarry = rdDeathThroughCarry.SelectedValue == "1" ? true : false;
        if (!deadMedical.IsColumnNull("DeadThroghBirth"))
        {
            if (deadMedical.DeadThroghBirth)
                rdDeadThroughBirth.SelectedIndex = 0;
            else
                rdDeadThroughBirth.SelectedIndex = 1;
        }
        //deadMedical.DeadThroghBirth = rdAbortionPast6Weeks.SelectedValue == "1" ? true : false;
        if (!deadMedical.IsColumnNull("AbortionPast6Weeks"))
        {
            if (deadMedical.AbortionPast6Weeks)
                rdAbortionPast6Weeks.SelectedIndex = 0;
            else
                rdAbortionPast6Weeks.SelectedIndex = 1;
        }
        //deadMedical.AbortionPast6Weeks = rdAbortionPast6Weeks.SelectedValue == "1" ? true : false;
        if (!deadMedical.IsColumnNull("BirthPast6Weeks"))
        {
            if (deadMedical.BirthPast6Weeks)
                rdBirthPast6Weeks.SelectedIndex = 0;
            else
                rdBirthPast6Weeks.SelectedIndex = 1;
        }
        // deadMedical.DeadThroghBirth = rdDeadThroughBirth.SelectedValue == "1" ? true : false;
        //deadMedical.BirthPast6Weeks = rdBirthPast6Weeks.SelectedValue == "1" ? true : false;
        
        try
        {
            txtDate.Text = deadMedical.BirthDate.ToString("dd/MM/yyyy");
        }
        catch
        {
            //continue
        }
        //IFormatProvider culture = new CultureInfo("en-US", true);
        //deadMedical.BirthDate = DateTime.ParseExact(txtDate.Text, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
        if (!deadMedical.IsColumnNull("BirthResult"))
        {
            dropBirthOuput.SelectedIndex = dropBirthOuput.Items.IndexOf(dropBirthOuput.Items.FindByValue(deadMedical.BirthResult.ToString()));
        }
        //deadMedical.BirthResult = int.Parse(dropBirthOuput.SelectedValue);
        txtBirthLocation.Text = deadMedical.BirthPlace;
        txtBirthOperator.Text = deadMedical.BirthOperator;

        try
        {
            uiTextBoxAbortionDate.Text = deadMedical.AbortionDate.ToString("dd/MM/yyyy");
        }
        catch
        {
            //continue
        }
        uiTextBoxAbortionPlace.Text = deadMedical.AbortionPlace;

    }

    public bool LogicValidation()
    {
        if (!ForUpdate && (ucItemControlDeathReasonA.SelectedICD == "" || ucItemControlDeathReasonA.SelectedICD == "0") && !uiCheckBoxUnderInvestigation.Checked)
        {
            MHOCommon.ShowMessage("برجاء ادخال السبب المباشر للوفاة", this.Page);
            TabContainerDeathInfo.ActiveTabIndex = TabPanelDeathHealthData.TabIndex;
            return false;
        }

        if (!ForUpdate && (ucSubItemControlDeathReasonB.SelectedICD == "" || ucSubItemControlDeathReasonB.SelectedICD == "0") && !uiCheckBoxUnderInvestigation.Checked)
        {
            MHOCommon.ShowMessage("برجاء ادخال سبب للوفاة - النتيجة الأولى", this.Page);
            TabContainerDeathInfo.ActiveTabIndex = TabPanelDeathHealthData.TabIndex;
            return false;
        }
        
        // check female death cases between 15 years & 49 years 
        if (!ForUpdate && !uiCheckBoxUnderInvestigation.Checked)
        {
            if (rdDeathThroughCarry.SelectedIndex == -1 || rdDeadThroughBirth.SelectedIndex == -1 || rdBirthPast6Weeks.SelectedIndex == -1 || rdAbortionPast6Weeks.SelectedIndex == -1)
            {
                MHOCommon.ShowMessage("برجاء إكمال ادخال البيانات الخاصة بالإناث بين (15 - 49) سنة ", this.Page);
                TabContainerDeathInfo.ActiveTabIndex = TabPanelGirlsData.TabIndex;
                return false;
            }
        }
        if (radioListISSmoker.SelectedValue == "1")
        {
            if (string.IsNullOrEmpty(radioListSmokingType.SelectedValue))
            {
                MHOCommon.ShowMessage("برجاء ادخال نوع التدخين", this.Page);
                TabContainerDeathInfo.ActiveTabIndex = TabPanelSmokingData.TabIndex;
                updSmoking.Update();
                return false;
            }
        }
        if (rdCauseByAccedenc.SelectedValue == "1")
        {
            if (string.IsNullOrEmpty(drpReason.SelectedValue) || string.IsNullOrEmpty(txtAccidentLocation.Text))
            {
                MHOCommon.ShowMessage("برجاء ادخال بيانات الحادث", this.Page);
                TabContainerDeathInfo.ActiveTabIndex = TabPanelAccidentData.TabIndex;
                updateAccedant.Update();
                return false;
            }
            else if (drpReason.SelectedValue=="4" && string.IsNullOrEmpty(txtAccidentLocation.Text))
            {
                MHOCommon.ShowMessage("برجاء ادخال بيانات الحادث", this.Page);
                TabContainerDeathInfo.ActiveTabIndex = TabPanelAccidentData.TabIndex;
                updateAccedant.Update();
                return false;
            }
            if (dropCarType.SelectedValue == "4" && string.IsNullOrEmpty(txtCarType.Text))
            {
                MHOCommon.ShowMessage("برجاء ادخال بيانات الحادث", this.Page);
                TabContainerDeathInfo.ActiveTabIndex = TabPanelAccidentData.TabIndex;
                updateAccedant.Update();
                return false;
            }
            
        }
        if (rdTumorFlag.SelectedValue == "1")
        {
            if (/*string.IsNullOrEmpty(txtTumorLocation.Text) ||*/ string.IsNullOrEmpty(uiDropDownListTumorLocation.SelectedValue) || uiDropDownListTumorLocation.SelectedValue == "0" || string.IsNullOrEmpty(dropTumorType.SelectedValue) || string.IsNullOrEmpty(dropTumorPhases.SelectedValue))
            {
                MHOCommon.ShowMessage("برجاء ادخال بيانات الاورام", this.Page);
                TabContainerDeathInfo.ActiveTabIndex = TabPanelTumorsData.TabIndex;
                updTumors.Update();
                return false;
            }
            
        }

        if (!string.IsNullOrEmpty(ucItemControlDeathReasonA.SelectedICD) && ucItemControlDeathReasonA.SelectedICD != "0")
        {
            if ((ucItemControlDeathReasonA.Hours == "00" || string.IsNullOrEmpty(ucItemControlDeathReasonA.Hours)) &&
                (ucItemControlDeathReasonA.Days == "00" || string.IsNullOrEmpty(ucItemControlDeathReasonA.Days)) &&
                (ucItemControlDeathReasonA.Months == "00" || string.IsNullOrEmpty(ucItemControlDeathReasonA.Months)) &&
                (ucItemControlDeathReasonA.Years == "00" || string.IsNullOrEmpty(ucItemControlDeathReasonA.Years)))
            {
                MHOCommon.ShowMessage("برجاء ادخال المدة بين السبب والوفاة - السبب المباشر للوفاة", this.Page);
                TabContainerDeathInfo.ActiveTabIndex = TabPanelDeathHealthData.TabIndex;
                return false;
            }
        }

        if (!string.IsNullOrEmpty(ucSubItemControlDeathReasonB.SelectedICD) && ucSubItemControlDeathReasonB.SelectedICD != "0")
        {
            if ((ucSubItemControlDeathReasonB.Hours == "00" || string.IsNullOrEmpty(ucSubItemControlDeathReasonB.Hours)) &&
                (ucSubItemControlDeathReasonB.Days == "00" || string.IsNullOrEmpty(ucSubItemControlDeathReasonB.Days)) &&
                (ucSubItemControlDeathReasonB.Months == "00" || string.IsNullOrEmpty(ucSubItemControlDeathReasonB.Months)) &&
                (ucSubItemControlDeathReasonB.Years == "00" || string.IsNullOrEmpty(ucSubItemControlDeathReasonB.Years)))
            {
                MHOCommon.ShowMessage("برجاء ادخال المدة بين السبب والوفاة - النتيجة الأولى", this.Page);
                TabContainerDeathInfo.ActiveTabIndex = TabPanelDeathHealthData.TabIndex;
                return false;
            }
        }

        if (!string.IsNullOrEmpty(ucSubItemControlDeathReasonC.SelectedICD) && ucSubItemControlDeathReasonC.SelectedICD != "0")
        {
            if ((ucSubItemControlDeathReasonC.Hours == "00" || string.IsNullOrEmpty(ucSubItemControlDeathReasonC.Hours)) &&
                (ucSubItemControlDeathReasonC.Days == "00" || string.IsNullOrEmpty(ucSubItemControlDeathReasonC.Days)) &&
                (ucSubItemControlDeathReasonC.Months == "00" || string.IsNullOrEmpty(ucSubItemControlDeathReasonC.Months)) &&
                (ucSubItemControlDeathReasonC.Years == "00" || string.IsNullOrEmpty(ucSubItemControlDeathReasonC.Years)))
            {
                MHOCommon.ShowMessage("برجاء ادخال المدة بين السبب والوفاة - النتيجة الثانية", this.Page);
                TabContainerDeathInfo.ActiveTabIndex = TabPanelDeathHealthData.TabIndex;
                return false;
            }
        }

        if (!string.IsNullOrEmpty(ucSubItemControlDeathReasonD.SelectedICD) && ucSubItemControlDeathReasonD.SelectedICD != "0")
        {
            if ((ucSubItemControlDeathReasonD.Hours == "00" || string.IsNullOrEmpty(ucSubItemControlDeathReasonD.Hours)) &&
                (ucSubItemControlDeathReasonD.Days == "00" || string.IsNullOrEmpty(ucSubItemControlDeathReasonD.Days)) &&
                (ucSubItemControlDeathReasonD.Months == "00" || string.IsNullOrEmpty(ucSubItemControlDeathReasonD.Months)) &&
                (ucSubItemControlDeathReasonD.Years == "00" || string.IsNullOrEmpty(ucSubItemControlDeathReasonD.Years)))
            {
                MHOCommon.ShowMessage("برجاء ادخال المدة بين السبب والوفاة - النتيجة الثالثة", this.Page);
                TabContainerDeathInfo.ActiveTabIndex = TabPanelDeathHealthData.TabIndex;
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
        deadMedical.CauseOfDeathAPeriod = ucItemControlDeathReasonA.Days + ucItemControlDeathReasonA.Months + ucItemControlDeathReasonA.Years + ucItemControlDeathReasonA.Hours + ucItemControlDeathReasonA.Mins;

        if (!string.IsNullOrEmpty(ucSubItemControlDeathReasonB.SelectedICD))
        {
            deadMedical.CauseOfDeathB = ucSubItemControlDeathReasonB.SelectedICD;
            deadMedical.CauseOfDeathBPeriod = ucSubItemControlDeathReasonB.Days + ucSubItemControlDeathReasonB.Months + ucSubItemControlDeathReasonB.Years + ucSubItemControlDeathReasonB.Hours + ucSubItemControlDeathReasonB.Mins; 
        }
        if (!string.IsNullOrEmpty(ucSubItemControlDeathReasonC.SelectedICD))
        {
            deadMedical.CauseOfDeathC = ucSubItemControlDeathReasonC.SelectedICD;
            deadMedical.CauseOfDeathCPeriod = ucSubItemControlDeathReasonC.Days + ucSubItemControlDeathReasonC.Months + ucSubItemControlDeathReasonC.Years + ucSubItemControlDeathReasonC.Hours + ucSubItemControlDeathReasonC.Mins;
        }
        if (!string.IsNullOrEmpty(ucSubItemControlDeathReasonD.SelectedICD))
        {
            deadMedical.CauseOfDeathD = ucSubItemControlDeathReasonD.SelectedICD;
            deadMedical.CauseOfDeathDPeriod = ucSubItemControlDeathReasonD.Days + ucSubItemControlDeathReasonD.Months + ucSubItemControlDeathReasonD.Years + ucSubItemControlDeathReasonD.Hours + ucSubItemControlDeathReasonD.Mins;
        }

       /* if (dropICDItem.SelectedValue != "")
            deadMedical.CauseOfDeathB = int.Parse(dropICDItem.SelectedValue);
        deadMedical.CauseOfDeathC = dropICDcode.SelectedValue;

        deadMedical.CauseOfDeathD = ucItemControlDeathReasonD.SelectedICD;
        deadMedical.CauseOfDeathDPeriod = ucItemControlDeathReasonD.Days + ucItemControlDeathReasonD.Months + ucItemControlDeathReasonD.Years;
        */
        deadMedical.CauseOfDeathNotRelatedA = ucItemCauseOfDeathNotRelatedA.SelectedICD;
        deadMedical.CauseOfDeathNotRelatedAPeriod = ucItemCauseOfDeathNotRelatedA.Days + ucItemCauseOfDeathNotRelatedA.Months + ucItemCauseOfDeathNotRelatedA.Years + ucItemCauseOfDeathNotRelatedA.Hours + ucItemCauseOfDeathNotRelatedA.Mins;

        deadMedical.CauseOfDeathNotRelatedB = ucItemCauseOfDeathNotRelatedB.SelectedICD;
        deadMedical.CauseOfDeathNotRelatedBPeriod = ucItemCauseOfDeathNotRelatedB.Days + ucItemCauseOfDeathNotRelatedB.Months + ucItemCauseOfDeathNotRelatedB.Years + ucItemCauseOfDeathNotRelatedB.Hours + ucItemCauseOfDeathNotRelatedB.Mins;

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
        if(uiDropDownListTumorLocation.SelectedValue != "0")
            deadMedical.LocationOfTumor = Convert.ToInt32(uiDropDownListTumorLocation.SelectedValue);
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
        
        if (DateTime.TryParse(uiTextBoxAbortionDate.Text, out testInputDate))
        {
            IFormatProvider culture = new CultureInfo("en-US", true);
            deadMedical.AbortionDate = DateTime.ParseExact(uiTextBoxAbortionDate.Text, "dd/MM/yyyy", null);
        }
        deadMedical.AbortionPlace = uiTextBoxAbortionPlace.Text;
        deadMedical.IsUnderInvestigation = uiCheckBoxUnderInvestigation.Checked;
        deadMedical.Save();

    }

    public void FemalDefaultCheck()
    {
        try
        {
            Dead objDead = new Dead();
            objDead.LoadByPrimaryKey(ParmDeadEventID);
            TimeSpan span = objDead.DeadDieDate.Subtract(objDead.DeadBirthDate);
            //check if the dead age was between 15 and 45 years & the dead is femal.
            if ((span.Days >= 5475 && span.Days <= 17885) && objDead.DeadGender == 2)
            {
                TabPanelGirlsData.Enabled = true;
            }
            else
            {
                TabPanelGirlsData.Enabled = false;
            }
        }
        catch
        {
            TabPanelGirlsData.Enabled = false;
        }
    }

    #endregion

    
}
