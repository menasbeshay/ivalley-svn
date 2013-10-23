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

public partial class UserControls_UcItemControl : System.Web.UI.UserControl
{
    #region Properties
    public string LabelText
    {
        set
        {
            lblTitle.Text = value;
        }
    }

    public string SelectedICD
    {
        get
        {
            return dropItem.SelectedValue;
        }
    }

    public string setCode
    {
        set
        {
            lblInsertedCode.Text = value;
        }
    }

    public string Days
    {
        get
        {
            if (txtDay.Text.Length == 1)
                return "0" + txtDay.Text;
            else
                return txtDay.Text;
        }
        set
        {
            txtDay.Text = value;
        }
    }

    public string Months
    {
        get
        {
            if (txtMonth.Text.Length == 1)
                return "0" + txtMonth.Text;
            else
                return txtMonth.Text;
        }
        set
        {
            txtMonth.Text = value;
        }
    }

    public string Years
    {
        get
        {
            if (txtYear.Text.Length == 1)
                return "0" + txtYear.Text;
            else
                return txtYear.Text;
        }
        set
        {
            txtYear.Text = value;
        }
    }

    public string Hours
    {
        get
        {
            if (txtHour.Text.Length == 1)
                return "0" + txtHour.Text;
            else
                return txtHour.Text;
        }
        set
        {
            txtHour.Text = value;
        }
    }
    public string Mins
    {
        get
        {
            if (txtMin.Text.Length == 1)
                return "0" + txtMin.Text;
            else
                return txtMin.Text;
        }
        set
        {
            txtMin.Text = value;
        }
    }

    #endregion
    #region Events
    /// <summary>
    /// Handles the load of the page
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["Print"] != null)
        {
            btnSearch.Visible = false;
            txtSearch.Visible = false;
            dropItem.Visible = false;
        }
    }
    #endregion
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        lblSelectedICD.Text = "";
        //ICDCODE9000 objICD = new ICDCODE9000();
        ICD10_DirectDeathReason objICD = new ICD10_DirectDeathReason();
        if (txtSearch.Text != "")
        {
            DataTable dt = objICD.FilterICDcodes(txtSearch.Text.Trim());

            if (dt.Rows.Count > 0)
            {
                dropItem.DataSource = dt.DefaultView;
                //dropItem.DataTextField = ICDCODE9000.ColumnNames.DESCRENG;
                //dropItem.DataValueField = ICDCODE9000.ColumnNames.CODE;
                dropItem.DataTextField = ICD10_DirectDeathReason.ColumnNames.DiagnosisEDesc;
                dropItem.DataValueField = ICD10_DirectDeathReason.ColumnNames.DiagnosisCode;
                dropItem.DataBind();

                ListItem item = new ListItem(" ", "0");
                dropItem.Items.Insert(0, item);
                dropItem.SelectedIndex = 0;
            }
            else
            {
                dropItem.Items.Clear();
                dropItem.DataSource = null;
                dropItem.DataBind();
            }
        }
        else
        {
            dropItem.Items.Clear();
            dropItem.DataSource = null;
            dropItem.DataBind();
        }
    }
    protected void dropItem_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblSelectedICD.Text = dropItem.SelectedValue;
    }
}
