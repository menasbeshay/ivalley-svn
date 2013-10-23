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
public partial class UserControls_UcDeathInfo : System.Web.UI.UserControl
{
    #region Properties

    public bool TxtNIDEnabledStatus
    {
        get
        {
            return txtNationalId.Enabled;
        }
        set
        {
            txtNationalId.Enabled = value;
        }
    }

    /// <summary>
    /// Gets or sets value of Dead NID
    /// </summary>
    public string EventDeadNID
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
    /// Gets or sets value of Dead Gender
    /// </summary>
    public int EventDeadGender
    {
        get
        {
            return Convert.ToInt32(dropGender.SelectedValue);
        }
        set
        {
            dropGender.SelectedIndex = dropGender.Items.IndexOf(dropGender.Items.FindByValue(value.ToString()));
        }
    }

    /// <summary>
    /// Gets or sets value of Dead FirstName
    /// </summary>
    public string EventDeadFristName
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
    /// Gets or sets value of Dead FatherName
    /// </summary>
    public string EventDeadFatherName
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
    /// Gets or sets value of Dead FamilyName
    /// </summary>
    public string EventDeadFamilyName
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
    /// Gets or sets value of Dead Sure Name
    /// </summary>
    public string EventDeadTitle
    {
        get
        {
            return txtTitle.Text;
        }
        set
        {
            txtTitle.Text = value;
        }
    }
   

    /// <summary>
    /// Gets or sets value of Dead Nationality
    /// </summary>
    public int EventDeadNationality
    {
        get
        {
            return Convert.ToInt32(drpNationality.SelectedValue);
        }
        set
        {
            drpNationality.SelectedIndex = drpNationality.Items.IndexOf(drpNationality.Items.FindByValue(value.ToString()));
        }
    }

    /// <summary>
    /// Gets or sets value of Dead Nationality
    /// </summary>
    public int EventDeadReligion
    {
        get
        {
            return Convert.ToInt32(drpReglion.SelectedValue);
        }
        set
        {
            drpReglion.SelectedIndex = drpReglion.Items.IndexOf(drpReglion.Items.FindByValue(value.ToString()));
        }
    }

    /// <summary>
    /// Gets or sets value of Dead MartialStatus
    /// </summary>
    public int EventDeadMartialStatus
    {
        get
        {
            return Convert.ToInt32(drpMartialStatus.SelectedValue);
        }
        set
        {
            drpMartialStatus.SelectedIndex = drpMartialStatus.Items.IndexOf(drpMartialStatus.Items.FindByValue(value.ToString()));
        }
    }

    /// <summary>
    /// Gets or sets value of Dead CardNo
    /// </summary>
    public string EventDeadCardNo
    {
        get
        {
            return txtCardNumber.Text;
        }
        set
        {
            txtCardNumber.Text = value;
        }
    }

    /// <summary>
    /// Gets or sets value of Dead MartialStatus
    /// </summary>
    public int EventDeadCardType
    {
        get
        {
            return Convert.ToInt32(drpCardType.SelectedValue);
        }
        set
        {
            drpCardType.SelectedIndex = drpCardType.Items.IndexOf(drpCardType.Items.FindByValue(value.ToString()));
        }
    }

    /// <summary>
    /// Gets or sets value of Dead Card Location
    /// </summary>
    public string EventCardLocation
    {
        get
        {
            return txtCardLocation.Text;
        }
        set
        {
            txtCardLocation.Text = value;
        }
    }

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
    /// Gets or sets value of Dead NID
    /// </summary>
    public string EventDeadBirthDate
    {
        get
        {
            return txtBirthDate.Text;
        }
        set
        {
            txtBirthDate.Text = value;
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

    #region Event

    protected void Page_Load(object sender, EventArgs e)
    {
        lblError.Text = "";

        if (!Page.IsPostBack)
        {
            
            LoadLookups();
           // txtCardNumber.Attributes.Add("onKeyUp", "checkNumber(this)");
           
            //txtNationalId.Attributes.Add("onblur", string.Format("EnableTextBoxesForDeath('{0}','{1}','{2}','{3}');", txtFirstName.ClientID, txtFatherName.ClientID, txtFamilyName.ClientID, txtNationalId.ClientID));

            if (Request.QueryString["Print"] != null)
            {
                btnSearch.Visible = false;
            }

        }
    }

    protected void Page_prerender(object sender, EventArgs e)
    {
        
        if (ForApprove == null)
        {
            if (txtNationalId.Text.Trim() == "0")
            {
                txtFirstName.Enabled = true;
                txtFatherName.Enabled = true;
                txtFamilyName.Enabled = true;
            }
        }

        if (!IsPostBack)
        {
            if (Session["NationalID"] != null)
            {
                if (Session["NationalID"].ToString() != "0" && Session["NationalID"].ToString() != "11111111111111")
                {
                    txtBirthDate.Text = MHOCommon.GetDateFromNID(Session["NationalID"].ToString()).ToString("yyyy/MM/dd");
                    updateDeathInfo.Update();
                }
                Session.Remove("NationalID");

            }
        }
    }

    public void setUnknownCase()
    {

        ListItem itemMaried = new ListItem("غير معلوم", "5");
        ListItem itemGender = new ListItem("غير معلوم", "3");

        drpMartialStatus.Items.Insert(5, itemMaried);
        dropGender.Items.Insert(3, itemGender);
        drpMartialStatus.SelectedIndex = 5;
        dropGender.SelectedIndex = 3;
        
    }


    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (search())
        {
            //txtFirstName.Text = "Ahmed";
            //txtFatherName.Text = "Mohamed";
            //txtFamilyName.Text = "Mahmoud";
            //txtTitle.Text = "test";
            Session["NationalID"] = txtNationalId.Text;
        }
        else
        {
            Session["NationalID"] = null;
        }
    }

    protected void dropGender_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (dropGender.SelectedValue != "0" && txtNationalId.Text != "0" && drpNationality.SelectedItem.Text.Trim() == "مصر")
        {
            if (!MHOCommon.ValidateNationalIDInput(txtNationalId.Text, dropGender.SelectedValue == "2" ? true : false))
            {
                lblError.Text = "النوع لا يتوافق مع الرقم القومي المدخل";
                dropGender.SelectedIndex = -1;
            }
        }
    }

    /// <summary>
    /// dropdown nationality selected index changed handler.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void drpNationality_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drpNationality.SelectedItem.Text.Trim() != "مصر")
        {
            btnSearch.Visible = false;
            lblNationalId.Text = "رقم الباسبور";
        }
        else
        {
            btnSearch.Visible = true;
            lblNationalId.Text = "الرقم القومى";
        }
        ShowHideNID(drpNationality.SelectedItem.Text.Trim() == "مصر");
    }

    #endregion

    #region Methods

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
      
    }

    /// <summary>
    /// Load Nationality lookup from DB
    /// </summary>
    private void LoadLookups()
    {
        NATIONALITY objNationality = new NATIONALITY();
        objNationality.loadSortedList();

        drpNationality.DataSource = objNationality.DefaultView;
        drpNationality.DataTextField = NATIONALITY.ColumnNames.DESCR;
        drpNationality.DataValueField = NATIONALITY.ColumnNames.CD;
        drpNationality.DataBind();

        drpNationality.SelectedIndex = drpNationality.Items.IndexOf(
                                        drpNationality.Items.FindByValue("13818"));
    }

    /// <summary>
    /// Search function when button search pressed
    /// </summary>
    private bool search()
    {
        //return true;
        if (MHOCommon.ValidateNationalIDInput(txtNationalId.Text,null))
        {
            MHOCommon.NationalIdData? nidData = MHOCommon.RequestNationalIDData(txtNationalId.Text);
            if (nidData != null)
            {
                txtFirstName.Text = nidData.Value.FirstName;
                txtFatherName.Text = nidData.Value.FatherName;
                txtFamilyName.Text = nidData.Value.FamilyName;
                txtTitle.Text = nidData.Value.SureName;
                return true;
            }
            else
            {
                lblError.Text = "خطا فى خدمة استرجاع بيانات الرقم القومى";
                txtFirstName.Text = "";
                txtFatherName.Text = "";
                txtFamilyName.Text = "";
                txtTitle.Text = "";
            }
        }
        else
        {
            lblError.Text = "الرقم القومى غير صحيح";
            txtFirstName.Text = "";
            txtFatherName.Text = "";
            txtFamilyName.Text = "";
            txtTitle.Text = "";
        }
        return false;
    }

    #endregion


    protected void txtNationalId_TextChanged(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(txtNationalId.Text) && txtNationalId.Text != "0")
        {
            Session["NationalID"] = txtNationalId.Text;
            txtBirthDate.Text = MHOCommon.GetDateFromNID(txtNationalId.Text).ToString("yyyy/MM/dd");
        }
    }
}
