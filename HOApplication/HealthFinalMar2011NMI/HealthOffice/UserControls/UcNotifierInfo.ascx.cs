using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserControls_UcNotifierInfo : System.Web.UI.UserControl
{
    #region Properties

    /// <summary>
    /// Indecate type of control (Born/Dead)
    /// </summary>
    public enum EnumNotifierCase
    {
        Born = 0,
        Dead = 1
    }

    /// <summary>
    /// Return specific type for control
    /// </summary>
    public EnumNotifierCase UCType
    {
        set
        {
            ViewState["UCType"] = value;
        }
        get
        {
            if (ViewState["UCType"] != null)
            {
                return (EnumNotifierCase)ViewState["UCType"];
            }
            return EnumNotifierCase.Born;
        }
    }

    /// <summary>
    /// Indecate type of control (Mother/Father)
    /// </summary>
    public enum EnumRelations
    {
        Father = 1,
        Mother = 2,
        Brother = 3,
        Sister = 4,
        Unt = 5,
        Uncle = 6,
        GranFather = 7,
        Other = 8,
        Son = 9,
        Daughter = 10
    }

    /// <summary>
    /// Gets or sets value of Notifier Relation Case
    /// </summary>
    public string NotifierRelationCase
    {
        get
        {
            return lblRelation.Text;
        }
        set
        {
            lblRelation.Text = value;
        }
    }

    /// <summary>
    /// Gets or sets value of Parent First Name
    /// </summary>
    public string NotifierFName
    {
        get
        {
            if (txtFirstName.Text == "" && hdnFirstName.Value == "")
                return txtFirstName.Text;
            else if (hdnFirstName.Value !="")
                return hdnFirstName.Value;
            else
                return txtFirstName.Text;
        }
        set
        {
            txtFirstName.Text = value;
            hdnFirstName.Value = value;
        }
    }

    /// <summary>
    /// Gets or sets value of Parent First Name
    /// </summary>
    public string NotifierFatherName
    {
        get
        {
            if (txtFatherName.Text == "" && hdnFatherName.Value == "")
                return txtFatherName.Text;
            else if (hdnFatherName.Value != "")
                return hdnFatherName.Value;
            else
                return txtFatherName.Text;
        }
        set
        {
            txtFatherName.Text = value;
            hdnFatherName.Value = value;
        }
    }

    /// <summary>
    /// Gets or sets value of National Number
    /// </summary>
    public string NotifierNID
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
    /// Gets or sets value of Parent Father Name
    /// </summary>
    public string NotifierphoneNo
    {
        get
        {
            return txtPhoneNumber.Text;
        }
        set
        {
            txtPhoneNumber.Text = value;
        }
    }

    public string NotifierAddress
    {
        get
        {
            return txtNotifierAddress.Text;
        }
        set
        {
            txtNotifierAddress.Text = value;
        }
    }

    /// <summary>
    /// Gets or sets value of Parent Father Name
    /// </summary>
    public int NotifierRelation
    {
        get
        {
            return Convert.ToInt32(drpNotiferRelation.SelectedValue);
        }
        set
        {
            drpNotiferRelation.SelectedIndex = drpNotiferRelation.Items.IndexOf(drpNotiferRelation.Items.FindByValue(value.ToString()));
        }
    }

    #endregion 
  
    #region Events

    /// <summary>
    /// load page event
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        lblError.Text = "";
        if (Request.QueryString["Print"] != null)
        {
            btnSearch.Visible = false;
        }
        if (!Page.IsPostBack)
        {
            if (UCType == EnumNotifierCase.Born)
            {
                ListItem itemSon, itemDaughter;
                itemSon = drpNotiferRelation.Items[8];
                itemDaughter = drpNotiferRelation.Items[9];
                drpNotiferRelation.Items.Remove(itemSon);
                drpNotiferRelation.Items.Remove(itemDaughter);
            }
        }
    }

    /// <summary>
    /// button search on National IDs
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        search();
        //txtFirstName.Text = "test";
        //txtFatherName.Text = "test";
        
    }

    /// <summary>
    /// on selected notifier relations change
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void drpNotiferRelation_SelectedIndexChanged(object sender, EventArgs e)
    {
        //ToDo: bring Father data and insert them by default if the notifier type was 
        //      the child father.

    }

    protected void txtNationalId_TextChanged(object sender, EventArgs e)
    {
        //if (txtFirstName.Text != "" && txtFatherName.Text != "")
        //{
        //    txtFirstName.Text = "";
        //    txtFatherName.Text = "";
        //    drpNotiferRelation.SelectedIndex = -1;

        //}

    }

    #endregion

    #region Methods

    /// <summary>
    /// Search function when button search pressed
    /// </summary>
    private void search()
    {
        bool? NotifierGender = null;
        if (drpNotiferRelation.SelectedValue == "2" || drpNotiferRelation.SelectedValue == "4")
        {
            NotifierGender = true;
        }
        else if (drpNotiferRelation.SelectedValue == "8")
        {
            NotifierGender = null;
        }
        else
        {
            NotifierGender = false;
        }

        if (MHOCommon.ValidateNationalIDInput(txtNationalId.Text,NotifierGender))
        {
            MHOCommon.NationalIdData? nidData = MHOCommon.RequestNationalIDData(txtNationalId.Text);
            if (nidData != null)
            {
                txtFirstName.Text = nidData.Value.FirstName;
                txtFatherName.Text = nidData.Value.FatherName + " " + nidData.Value.FamilyName + " " + nidData.Value.SureName;
            }
            else
            {
                lblError.Text = "خطا فى خدمة استرجاع بيانات الرقم القومى";
                txtFirstName.Text = "";
                txtFatherName.Text = "";
                txtFatherName.Enabled = true;
                txtFirstName.Enabled = true;
            }
        }
        else
        {
            lblError.Text = "الرقم القومى غير صحيح";
            txtFirstName.Text = "";
            txtFatherName.Text = "";
        }

    }

    #endregion

   
}