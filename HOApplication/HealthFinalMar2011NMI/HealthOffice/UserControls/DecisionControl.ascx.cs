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

public partial class UserControls_DecisionControl : System.Web.UI.UserControl
{
    #region properties
    public string HealthOffice
    {
        set
        {
            lblHealthOfficeValue.Text = value;
        }
        get
        {
            return lblHealthOfficeValue.Text;
        }
    }
    public string DecisionNumber
    {
        set
        {
            txtDecisionNumber.Text = value;
        }
        get
        {
            return txtDecisionNumber.Text;
        }
    }
    public string DecisionDirectionValue
    {
        set
        {
            txtDecisionDirectionValue.Text = value;
        }
        get
        {
            return txtDecisionDirectionValue.Text;
        }
    }
    public string NotesValue
    {
        set
        {
            txtNotesValue.Text = value;
        }
        get
        {
            return txtNotesValue.Text;
        }
    }
    public DateTime? DecisionDate
    {
        get
        {
            DateTime dt;
            if (DateTime.TryParse(txtDecisionDate.Text, out dt))
            {
                return dt;
            }
            return null;
        }
        set
        {
            txtDecisionDate.Text = value.Value.ToShortDateString();
        }
    }
    public string lblDecisionDirector
    {
        set
        {
            lblDecisionDirectionValue.Text = value;
        }
    }
    public bool ValidateDescisionNo
    {
        set
        {
            RequiredFieldValidator1.Enabled = value;
        }
    }
    public bool ValidatereqName
    {
        set
        {
            reqName.Enabled = value;
        }
    }
    #endregion
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["IsLostCase"] != null)
            {
                reqName.ValidationGroup = "GenralValidate";
                RequiredFieldValidator1.ValidationGroup = "GenralValidate";
            }
        }
    }
}
