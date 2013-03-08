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

public partial class UserControls_UcAddressInfo : System.Web.UI.UserControl
{
    #region Properties

    /// <summary>
    /// Gets or sets value of Dead Address No
    /// </summary>
    public string EventDeadAddressNo
    {
        get
        {
            return txtNumber.Text;
        }
        set
        {
            txtNumber.Text = value;
        }
    }

    /// <summary>
    /// Gets or sets value of Dead Address No
    /// </summary>
    public string EventDeadAddressStreet
    {
        get
        {
            return txtStreet.Text;
        }
        set
        {
            txtStreet.Text = value;
        }
    }

    /// <summary>
    /// Gets or sets value of Dead Address Sign
    /// </summary>
    public string EventDeadAddressSign
    {
        get
        {
            return txtSign.Text;
        }
        set
        {
            txtSign.Text = value;
        }
    }

    /// <summary>
    /// Gets or sets value of Governate
    /// </summary>
    public int DeadAddressGovernate
    {
        get
        {
            return Convert.ToInt32(drpState.SelectedValue);
        }
        set
        {
            drpState.SelectedIndex = drpState.Items.IndexOf(drpState.Items.FindByValue(value.ToString()));
        }
    }

    /// <summary>
    /// Gets or sets value of PoliceStation
    /// </summary>
    public int DeadAddressPoliceStation
    {
        get
        {
            return Convert.ToInt32(dropSection.SelectedValue);
        }
        set
        {
            dropSection.SelectedIndex = dropSection.Items.IndexOf(dropSection.Items.FindByValue(value.ToString()));
        }
    }

    /// <summary>
    /// Gets or sets value of PoliceStation
    /// </summary>
    public int DeadAddressArea
    {
        get
        {
            return Convert.ToInt32(drpSubSection.SelectedValue);
        }
        set
        {
            drpSubSection.SelectedIndex = drpSubSection.Items.IndexOf(drpSubSection.Items.FindByValue(value.ToString()));
        }
    }

    /// <summary>
    /// Gets or sets value of Dead Address Phone
    /// </summary>
    public string EventDeadAddressPhone
    {
        get
        {
            return txtPhone.Text;
        }
        set
        {
            txtPhone.Text = value;
        }
    }

    /// <summary>
    /// Gets or sets value of Dead Address family Phone
    /// </summary>
    public string EventDeadAddressFamilyPhone
    {
        get
        {
            return txtFamilyPhoneNo.Text;
        }
        set
        {
            txtFamilyPhoneNo.Text = value;
        }
    }

    /// <summary>
    /// Gets or sets value of Dead Address Job
    /// </summary>
    public string EventDeadAddressJob
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

    public DropDownList DropSection
    {
        get
        {
            return dropSection;
        }
    }

    public DropDownList DropState
    {
        get
        {
            return drpState;
        }
    }

    public DropDownList DropSubSection
    {
        get
        {
            return drpSubSection;
        }
    }
    #endregion

    #region Methods

    /// <summary>
    /// load lookup data.
    /// </summary>
    private void LoadLookups()
    {
        GOVERNORATE objGov = new GOVERNORATE();
        objGov.LoadAll();

        drpState.DataSource = objGov.DefaultView;
        drpState.DataTextField = GOVERNORATE.ColumnNames.DESCR;
        drpState.DataValueField = GOVERNORATE.ColumnNames.CD;
        drpState.DataBind();

        ListItem item = new ListItem("-----", "0");
        drpState.Items.Insert(0, item);
        drpSubSection.Items.Insert(0, item);
        dropSection.Items.Insert(0, item);
        drpState.SelectedIndex = 0;
    }

    /// <summary>
    /// Load Police station for selected governate
    /// </summary>
    public void LoadPoliceStation()
    {
        DataTable dt = MHOCommon.LoadPoliceStationsForGovID(short.Parse(drpState.SelectedValue));
        if (dt.Rows.Count > 0)
        {
            dropSection.DataSource = dt;
            dropSection.DataTextField = POLICE_STATION.ColumnNames.DESCR;
            dropSection.DataValueField = POLICE_STATION.ColumnNames.CD;
            dropSection.DataBind();

            ListItem item = new ListItem("-----", "0");
            dropSection.Items.Insert(0, item);
            dropSection.SelectedIndex = 0;
        }
    }

    /// <summary>
    /// load area drop down
    /// </summary>
    public void LoadArea()
    {
        DataTable dtRes = MHOCommon.LoadAreasForPoliceID(int.Parse(dropSection.SelectedValue));
        if (dtRes.Rows.Count > 0)
        {
            DropSubSection.DataSource = dtRes;
            DropSubSection.DataTextField = AREA.ColumnNames.DESCR;
            DropSubSection.DataValueField = AREA.ColumnNames.CD;
            DropSubSection.DataBind();

            ListItem item = new ListItem("-----", "0");
            DropSubSection.Items.Insert(0, item);
            DropSubSection.SelectedIndex = 0;
        }
    }

    public void disableValidation()
    {
        RequiredFieldValidator3.Enabled = false;
        RequiredFieldValidator4.Enabled = false;
        RequiredFieldValidator5.Enabled = false;
    }

    #endregion

    #region Events

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            LoadLookups();
        }
    }

    protected void drpState_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadPoliceStation();
        dropSection.Focus();
    }

    protected void dropSection_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadArea();
        DropSubSection.Focus();
    }

    #endregion



 
}
