using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MHO.BLL;
using System.Data;
public partial class UserControls_UCSubItemControl : System.Web.UI.UserControl
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


    public bool ViewTimes
    {
        get
        {
            return TimesTable.Visible;
        }
        set
        {
            TimesTable.Visible = value;
            RegularExpressionValidator3.Enabled = value;
            lbl.Enabled = value;
            RegularExpressionValidator1.Enabled = value;
            RegularExpressionValidator2.Enabled = value;
        }
    }
    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        lblSelectedICD.Text = "";
        //ICDCODE9000 objICD = new ICDCODE9000();
        ICD10_MainDeathReason objICD = new ICD10_MainDeathReason();
        if (txtSearch.Text != "")
        {
            DataTable dt = objICD.FilterICDcodes(txtSearch.Text.Trim());

            if (dt.Rows.Count > 0)
            {
                dropItem.DataSource = dt.DefaultView;
                //dropItem.DataTextField = ICDCODE9000.ColumnNames.DESCRENG;
                //dropItem.DataValueField = ICDCODE9000.ColumnNames.CODE;
                dropItem.DataTextField = ICD10_MainDeathReason.ColumnNames.Causename;
                dropItem.DataValueField = ICD10_MainDeathReason.ColumnNames.Code;
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