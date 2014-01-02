using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MHO.BLL;
using System.Data;

public partial class UserControls_uiBornInfo : System.Web.UI.UserControl
{
    #region Properties

    /// <summary>
    /// Indecate Gender
    /// </summary>
    public enum Gender
    {
        Male = 1,
        Female = 2
    }

    /// <summary>
    /// Return value Combined BirthDate
    /// </summary>
    public DateTime? EventBirthDate
    {
        get
        {
            DateTime dt;
            if(DateTime.TryParseExact(uiTextBoxBirthDate.Text + " " + uiTextBoxBirthTime.Text, "yyyy/MM/dd HH:mm", null,System.Globalization.DateTimeStyles.None, out dt))
            {
                return dt;
            }
            /*if (DateTime.TryParse(txtYear.Text + "-" + txtMonth.Text + "-" + txtDay.Text + " " + txtHour.Text + ":" + txtMin.Text, out dt))
            {
                return dt;
            }*/
            return null;
        }

        set 
        {
            uiTextBoxBirthDate.Text = value.Value.ToString("yyyy/MM/dd");
            uiTextBoxBirthTime.Text = value.Value.ToString("HH:mm");
        }
    }

    /// <summary>
    /// Sets the textbox month 
    /// </summary>
    public string Month
    {
        set
        {
            txtMonth.Text = value;
        }
    }

    /// <summary>
    /// Sets the textbox day
    /// </summary>
    public string Day
    {
        set
        {
            txtDay.Text = value;
        }
    }

    /// <summary>
    /// Sets the textbox year
    /// </summary>
    public string Year
    {
        set
        {
            txtYear.Text = value;
        }
    }

    /// <summary>
    /// Sets the textbox hour
    /// </summary>
    public string Hour
    {
        set
        {
            txtHour.Text = value;
        }
    }

    /// <summary>
    /// Sets the textbox minute
    /// </summary>
    public string Minute
    {
        set
        {
            txtMin.Text = value;
        }
    }
    /// <summary>
    /// Gets or sets value of Child Name
    /// </summary>
    public string EventChildName
    {
        get
        {
            return txtName.Text;
        }
        set
        {
            txtName.Text = value;
        }
    }

    /// <summary>
    /// Gets or sets value of Gender
    /// </summary>
    public int EventChildGender
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
    /// Gets or sets value of Governate
    /// </summary>
    public int EventChildGovernate
    {
        get
        {
            return Convert.ToInt32(drpGovernate.SelectedValue);
        }
        set
        {
            drpGovernate.SelectedIndex = drpGovernate.Items.IndexOf(drpGovernate.Items.FindByValue(value.ToString()));
        }
    }

    /// <summary>
    /// Gets or sets value of PoliceStation
    /// </summary>
    public int EventChildPoliceStation
    {
        get
        {
            return Convert.ToInt32(drpPoliceStation.SelectedValue);
        }
        set
        {
            drpPoliceStation.SelectedIndex = drpPoliceStation.Items.IndexOf(drpPoliceStation.Items.FindByValue(value.ToString()));
        }
    }

    /// <summary>
    /// Gets or sets value of PoliceStation
    /// </summary>
    public int EventChildArea
    {
        get
        {
            return Convert.ToInt32(dropArea.SelectedValue);
        }
        set
        {
            dropArea.SelectedIndex = dropArea.Items.IndexOf(dropArea.Items.FindByValue(value.ToString()));
        }
    }

    #endregion

    #region Events
    /// <summary>
    /// Handles the page load event
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            LoadLookups();

            if (MHOCommon.CurrentOrgGovID != 0)
            {
                // select the current governorate by default.
                drpGovernate.SelectedIndex = drpGovernate.Items.IndexOf(drpGovernate.Items.FindByValue(MHOCommon.CurrentOrgGovID.ToString()));
                drpGovernate_SelectedIndexChanged(null, null);
            }
        }
    }

    /// <summary>
    /// select index changed for governate
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void drpGovernate_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadPoliceStation();
        drpPoliceStation.Focus();
        //LoadArea();
    }

    /// <summary>
    /// select index changed for Police
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void drpPoliceStation_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadArea();
        dropArea.Focus();
    }

    #endregion

    #region Methods

    /// <summary>
    /// load lookup data.
    /// </summary>
    private void LoadLookups()
    {
        //GOVERNORATE objGov = new GOVERNORATE();
        //objGov.LoadAll();

        drpGovernate.DataSource = MHOCommon.tblGovernate.DefaultView;//objGov.DefaultView;
        drpGovernate.DataTextField = GOVERNORATE.ColumnNames.DESCR;
        drpGovernate.DataValueField = GOVERNORATE.ColumnNames.CD;
        drpGovernate.DataBind();

        ListItem item = new ListItem("-----", "0");
        drpGovernate.Items.Insert(0, item);
        dropArea.Items.Insert(0, item);
        drpPoliceStation.Items.Insert(0, item);
        drpGovernate.SelectedIndex = 0;

        // Set Default date:
        txtDay.Text = DateTime.Now.Day.ToString();
        txtHour.Text = DateTime.Now.Hour.ToString();
        txtMin.Text = DateTime.Now.Minute.ToString();
        txtMonth.Text = DateTime.Now.Month.ToString();
        txtYear.Text = DateTime.Now.Year.ToString();


        uiTextBoxBirthDate.Text = DateTime.Now.ToString("yyyy/MM/dd");
        uiTextBoxBirthTime.Text = DateTime.Now.ToString("HH:mm");
    }

    /// <summary>
    /// Load Police station for selected governate
    /// </summary>
    public void LoadPoliceStation()
    {
        //POLICE_STATION objPolice = new POLICE_STATION();
        //if (objPolice.LoadPoliceStationsForGoveID(drpGovernate.SelectedValue))
        //{
        //    drpPoliceStation.DataSource = objPolice.DefaultView;
        //    drpPoliceStation.DataTextField = POLICE_STATION.ColumnNames.DESCR;
        //    drpPoliceStation.DataValueField = POLICE_STATION.ColumnNames.CD;
        //    drpPoliceStation.DataBind();

        //    ListItem item = new ListItem("-----", "0");
        //    drpPoliceStation.Items.Insert(0, item);
        //    drpPoliceStation.SelectedIndex = 0;
        //}
        DataTable dt = MHOCommon.LoadPoliceStationsForGovID(short.Parse(drpGovernate.SelectedValue));
        if (dt.Rows.Count > 0)
        {
            drpPoliceStation.DataSource = dt;
            drpPoliceStation.DataTextField = POLICE_STATION.ColumnNames.DESCR;
            drpPoliceStation.DataValueField = POLICE_STATION.ColumnNames.CD;
            drpPoliceStation.DataBind();

            ListItem item = new ListItem("-----", "0");
            drpPoliceStation.Items.Insert(0, item);
            drpPoliceStation.SelectedIndex = 0;
        }
    }

    public void LoadArea()
    {
        //AREA objArea = new AREA();
        //if (objArea.LoadAreaForPoliceID(drpPoliceStation.SelectedValue))
        //{
        //    dropArea.DataSource = objArea.DefaultView;
        //    dropArea.DataTextField = AREA.ColumnNames.DESCR;
        //    dropArea.DataValueField = AREA.ColumnNames.CD;
        //    dropArea.DataBind();

        //    ListItem item = new ListItem("-----", "0");
        //    dropArea.Items.Insert(0, item);
        //    dropArea.SelectedIndex = 0;
        //}

        DataTable dtRes = MHOCommon.LoadAreasForPoliceID(int.Parse(drpPoliceStation.SelectedValue));
        if (dtRes.Rows.Count > 0)
        {
            dropArea.DataSource = dtRes;
            dropArea.DataTextField = AREA.ColumnNames.DESCR;
            dropArea.DataValueField = AREA.ColumnNames.CD;
            dropArea.DataBind();

            ListItem item = new ListItem("-----", "0");
            dropArea.Items.Insert(0, item);
            dropArea.SelectedIndex = 0;
        }
    }
    #endregion

   
}