using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MHO.BLL;
using System.Collections;

public partial class UserControls_UcFatherInfo : System.Web.UI.UserControl
{

    #region Properties

    /// <summary>
    /// Indecate type of control (Mother/Father)
    /// </summary>
    public enum EnumParent
    {
        Father = 0,
        Mother = 1
    }

    /// <summary>
    /// Indecate public religous
    /// </summary>
    public enum Religion
    {
        Muslim = 1,
        Christian = 2,
        Jewish=3
    }

    /// <summary>
    /// Return specific type for control
    /// </summary>
    public EnumParent UCType
    {
        set
        {
            ViewState["Type"] = value;
        }
        get
        {
            if (ViewState["Type"] != null)
            {
                return (EnumParent)ViewState["Type"];
            }
            return EnumParent.Father;
        }
    }

    /// <summary>
    /// Gets or Sets value of National Number
    /// </summary>
    public string ParentNID
    {
        get
        {
            return txtNationalId.Text;
        }
        set
        {
            txtNationalId.Text = value;
        }
    }

    /// <summary>
    /// Gets or Sets value of Parent First Name
    /// </summary>
    public string ParentFirstName
    {
        get
        {
            return txtFirstName.Text;
        }
        set
        {
            txtFirstName.Text = value;
        }
    }

    /// <summary>
    /// Gets or Sets value of Parent Father Name
    /// </summary>
    public string ParentFatherName
    {
        get
        {
            return txtFatherName.Text;
        }
        set
        {
            txtFatherName.Text = value;
        }
    }

    /// <summary>
    /// Gets or Sets value of Parent Family Name
    /// </summary>
    public string ParentFamilyName
    {
        get
        {
            return txtFamilyName.Text;
        }
        set
        {
            txtFamilyName.Text = value;
        }
    }

    /// <summary>
    /// Gets or Sets value of Parent Nationality
    /// </summary>
    public int ParentNationality
    {
        get
        {
            return Convert.ToInt32(dropNationality.SelectedValue);
        }
        set
        {
            dropNationality.SelectedIndex = dropNationality.Items.IndexOf(dropNationality.Items.FindByValue(value.ToString()));
        }
    }

    /// <summary>
    /// Gets or Sets value of Parent Job
    /// </summary>
    public string ParentJob
    {
        get
        {
            return txtPosition.Text;
        }
        set
        {
            txtPosition.Text = value;
        }
    }

    /// <summary>
    /// Gets or Sets value of Parent Nationality
    /// </summary>
    public int ParentRelegion
    {
        get
        {
            return Convert.ToInt32(dropReligion.SelectedValue);
        }
        set
        {
            dropReligion.SelectedIndex = dropReligion.Items.IndexOf(dropReligion.Items.FindByValue(value.ToString()));
        }
    }

    /// <summary>
    /// Gets or Sets value of Parent First Name
    /// </summary>
    public string ProveNo
    {
        get
        {
            return txtProveNo.Text;
        }
        set
        {
            txtProveNo.Text = value;
        }
    }

    /// <summary>
    /// Gets or Sets value of Parent First Name
    /// </summary>
    public string ProveType
    {
        get
        {
            return txtProveType.Text;
        }
        set
        {
            txtProveType.Text = value;
        }
    }

    /// <summary>
    /// Gets or Sets value of Parent Sure Name
    /// </summary>
    public string ParentSureName
    {
        get
        {
            return txtSureName.Text;
        }
        set
        {
            txtSureName.Text = value;
        }
    }

    public bool ViewHideProveArea
    {
        set
        {
            proveArea.Visible = value;
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
    /// Page Event : Load
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        lblError.Text = "";
        if (!Page.IsPostBack)
        {
          
           // SpecifyControlType();
            LoadLookups();
            txtNationalId.Attributes.Add("onblur", string.Format("EnableTextBoxes('{0}','{1}','{2}','{3}','{4}');", txtFirstName.ClientID, txtFatherName.ClientID, txtFamilyName.ClientID, txtNationalId.ClientID,txtSureName.ClientID));
        //    txtNationalId.Attributes.Add("onkeypress", "onTextEnterButtonClick()");
            dropNationality.Attributes.Add("onchange", "ClearNotifierData(this)");
            if (Request.QueryString["Print"]!= null)
            {
                btnSearch.Visible = false;
            }
        }
       
    }

    protected void Page_prerender(object sender, EventArgs e)
    {
        if (txtNationalId.Text.Trim() == "0" && ForApprove == null)
        {
            txtFirstName.Enabled = true;
            txtFatherName.Enabled = true;
            txtFamilyName.Enabled = true;
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
        //txtFirstName.Text = "Mo2ena";
        //txtFatherName.Text = "Kamel";
        //txtFamilyName.Text = "tahalel";
        //txtSureName.Text = "Foul";
    }

    /// <summary>
    /// dropdown nationality selected index changed handler.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void dropNationality_SelectedIndexChanged(object sender, EventArgs e)
    {
        ShowHideNID(dropNationality.SelectedItem.Text.Trim() == "مصر");
    }

    #endregion

    #region Methods

    /// <summary>
    /// Specify the control type ( mother/Father) in GUI level.
    /// </summary>
    private void SpecifyControlType()
    {
        if (UCType == EnumParent.Father)
        {
            lblParentName.Text = GetGlobalResourceObject("GlobalResource", "lblFather").ToString();
            //lblFamilyName.Text = GetGlobalResourceObject("GlobalResource", "lblFamily").ToString();
        }
        else
        {
            lblParentName.Text = GetGlobalResourceObject("GlobalResource", "lblMother").ToString();
            //lblFamilyName.Text = GetGlobalResourceObject("GlobalResource", "lblGrandFather").ToString();
        }
    }

    /// <summary>
    /// Load Nationality lookup from DB
    /// </summary>
    public void LoadLookups()
    {
        NATIONALITY objNationality = new NATIONALITY();
        objNationality.loadSortedList();

        dropNationality.DataSource = objNationality.DefaultView;
        dropNationality.DataTextField = NATIONALITY.ColumnNames.DESCR;
        dropNationality.DataValueField = NATIONALITY.ColumnNames.CD;
        dropNationality.DataBind();

        dropNationality.SelectedIndex = dropNationality.Items.IndexOf(
                                        dropNationality.Items.FindByValue("13818"));
    }

    /// <summary>
    /// Search function when button search pressed
    /// </summary>
    private void search()
    {
        //System.Threading.Thread.Sleep(3000);
        if (MHOCommon.ValidateNationalIDInput(txtNationalId.Text,UCType == EnumParent.Mother))
        {
            MHOCommon.NationalIdData? nidData = MHOCommon.RequestNationalIDData(txtNationalId.Text);
            if (nidData != null)
            {
                txtFirstName.Text = nidData.Value.FirstName;
                txtFatherName.Text = nidData.Value.FatherName;
                txtFamilyName.Text = nidData.Value.FamilyName;
                txtSureName.Text = nidData.Value.SureName;
            }
            else
            {
                lblError.Text = "خطا فى خدمة استرجاع بيانات الرقم القومى";
                txtFirstName.Enabled = false;
                txtFatherName.Enabled = false;
                txtFamilyName.Enabled = false;
                clearNationalNumberTextBoxs();
            }
        }
        else
        {
            lblError.Text = "الرقم القومى غير صحيح";
            clearNationalNumberTextBoxs();
            MHOCommon.NIDValidationMessage = "";
        }

    }

    #endregion


    //protected void txtNationalId_TextChanged(object sender, EventArgs e)
    //{
    //    if (txtNationalId.Text == "0")
    //    {
    //        txtFirstName.ReadOnly = false;
    //        txtFatherName.ReadOnly = false;
    //        txtFamilyName.ReadOnly = false;
    //        clearNationalNumberTextBoxs();
    //    }
    //    else
    //    {
    //        txtFirstName.ReadOnly = true;
    //        txtFatherName.ReadOnly = true;
    //        txtFamilyName.ReadOnly = true;
    //    }

    //    if (txtFirstName.Text != "" && txtFatherName.Text != "" && txtFamilyName.Text != "")
    //    {
    //        clearNationalNumberTextBoxs();
    //    }
    //}

    public void ShowHideNID(bool isEgyptian)
    {
        if (isEgyptian)
        {
            NIDArea.Style.Add("display", "block");
            proveArea.Style.Add("display", "none");
            txtFirstName.Enabled = false;
            txtFatherName.Enabled = false;
            txtFamilyName.Enabled = false;
        }
        else
        {
            NIDArea.Style.Add("display", "none");
            proveArea.Style.Add("display", "block");
            txtFirstName.Enabled = true;
            txtFatherName.Enabled = true;
            txtFamilyName.Enabled = true;
        }
    }

    public void clearNationalNumberTextBoxs()
    {
        txtFirstName.Text = "";
        txtFatherName.Text = "";
        txtFamilyName.Text = "";
        txtSureName.Text = "";
    }
}