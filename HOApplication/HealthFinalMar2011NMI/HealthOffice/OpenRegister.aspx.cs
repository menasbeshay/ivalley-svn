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

public partial class OpenRegister : System.Web.UI.Page
{

    #region Properties

    public Guid? CurrentRegID
    {
        get
        {
            if (ViewState["CurrentRegID"] == null)
            {
                return null;
            }
            else
            {
                return new Guid(ViewState["CurrentRegID"].ToString());
            }
        }
        set
        {
            ViewState["CurrentRegID"] = value;
        }
    }

    public string ErrorFlag
    {
        get
        {
            return Request.QueryString["ErrorFlag"];
        }
    }

    #endregion

    #region Events

    /// <summary>
    /// Load event
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            LoadDefaultValues();
            FilterReg();
//            compareValidator.ValueToCompare = DateTime.Now.ToString("yyyy/MM/dd");
            if (!string.IsNullOrEmpty(ErrorFlag))
            {
                if (ErrorFlag == "Born")
                {
                    MHOCommon.ShowMessage("يجب ان يكون هناك دفتر مواليد مفتوح و هو الدفتر الحالى", this.Page);
                    drpRegType.SelectedIndex = 0;
                }
                else if (ErrorFlag == "Dead")
                {
                    MHOCommon.ShowMessage("يجب ان يكون هناك دفتر وفيات مفتوح و هو الدفتر الحالى", this.Page);
                    drpRegType.SelectedIndex = 1;
                }
            }
        }
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            Master.PageHeader = "فتح دفاتر المواليد و الوفيات";
        }
    }

    /// <summary>
    /// drop regtype selected index changed event
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void drpRegType_SelectedIndexChanged(object sender, EventArgs e)
    {
        FilterReg();
    }

    protected void grdReg_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridViewRow dr = e.Row;
        if (dr.RowType == DataControlRowType.DataRow)
        {
            if (dr.Cells[3].Text == "1")
            {
                dr.Cells[3].Text = "مواليد";
            }
            else
            {
                dr.Cells[3].Text = "وفيات";
            }
        }
    }

    protected void btnAddNewReg_Click(object sender, EventArgs e)
    {
        //IFormatProvider culture = new CultureInfo("en-US", true);
        //DateTime compare = DateTime.ParseExact(txtCreateDate1.Text, "yyyy/MM/dd", System.Globalization.CultureInfo.InvariantCulture);

        //if (compare > DateTime.Now)
        //{
        //    MHOCommon.ShowMessage("Error", this.Page);
        //}
        if (CurrentRegID == null)
        {
            AddNewReg();

        }
        else
        {
            UpodateReg(int.Parse(txtRegDefaultYear.Text), chkRegIsCurrent.Checked);
        }
        FilterReg();
        ClearAndGoToAddmode();
    }

    protected void lnkDelete_Click(object sender, EventArgs e)
    {
        deleteReg(new Guid(((LinkButton)sender).CommandArgument));
        FilterReg();
    }

    protected void lnkCode_Click(object sender, EventArgs e)
    {
        ChangetoEditMode(new Guid(((LinkButton)sender).CommandArgument));
    }

    protected void btnFilter_Click(object sender, EventArgs e)
    {
        FilterReg();
    }

    #endregion

    #region Methods

    private void LoadDefaultValues()
    {
        txtCreateDate1.Text = DateTime.Now.ToString("yyyy/MM/dd");
        txtRegDefaultYear.Text = DateTime.Now.Year.ToString();
    }

    private void ChangetoEditMode(Guid regID)
    {
        ManualRegister obgReg = new ManualRegister();
        obgReg.LoadByPrimaryKey(regID);

        txtCreateDate1.Text = obgReg.CreationDate.ToShortDateString();
        string _regCode = obgReg.RegisterCode.ToString();
        txtRegCode.Text = _regCode.Substring(0, 1);
        txtRegDefaultYear.Text = _regCode.Substring(2, 4);
        drpRegType.SelectedIndex = drpRegType.Items.IndexOf(
                                   drpRegType.Items.FindByValue(obgReg.RegisterType.ToString()));
        chkRegIsCurrent.Checked = obgReg.CurrentRegister;

        txtCreateDate1.ReadOnly = true;
        txtRegCode.ReadOnly = true;
        txtRegDefaultYear.ReadOnly = true;
        drpRegType.Enabled = false;
//        clndrCreateDate.Enabled = false;
        if (obgReg.CurrentRegister)
            chkRegIsCurrent.Enabled = false;
        CurrentRegID = regID;
        btnAddNewReg.Text = "تعديل";
    }

    private void ClearAndGoToAddmode()
    {
        txtCreateDate1.ReadOnly = false;
        txtRegCode.ReadOnly = false;
        drpRegType.Enabled = true;
        chkRegIsCurrent.Enabled = false;
        //clndrCreateDate.Enabled = true;
        CurrentRegID = null;
        btnAddNewReg.Text = "اضافة دفتر";

        txtCreateDate1.Text = "";
        txtRegCode.Text = "";
        txtRegDefaultYear.Text = "";
        LoadDefaultValues();
    }

    private void AddNewReg()
    {
        try
        {
            //if (changeCurrentReg(int.Parse(txtRegDefaultYear.Text), chkRegIsCurrent.Checked) || (DateTime.Parse(txtCreateDate1.Text) > DateTime.Now.Date))
            //{
            //    ManualRegister reg = new ManualRegister();
            //    reg.AddNew();
            //    reg.RegisterCode = txtRegCode.Text + "/" + txtRegDefaultYear.Text;
            //    IFormatProvider culture = new CultureInfo("en-US", true);
            //    reg.CreationDate = DateTime.Parse (Convert.ToDateTime(txtCreateDate1.Text).ToShortDateString()); //DateTime.ParseExact(txtCreateDate1.Text, "yyyy/MM/dd", System.Globalization.CultureInfo.InvariantCulture);
            //    reg.RegisterYear = int.Parse(txtRegDefaultYear.Text);
            //    reg.RegisterType = int.Parse(drpRegType.SelectedValue);
            //    reg.OrgID = MHOCommon.CurrentOrgID.Value;
            //    reg.CurrentRegister = chkRegIsCurrent.Checked;
            //    reg.StartSerial = 1;
            //    reg.Save();
            //}
            ManualRegister objreg = new ManualRegister();
            objreg.InsertNewRegister(MHOCommon.CurrentOrgID.Value, int.Parse(txtRegDefaultYear.Text)
                                    , int.Parse(drpRegType.SelectedValue), txtRegCode.Text + "/" + txtRegDefaultYear.Text);
        }
        catch
        {
            MHOCommon.ShowMessage("لقد حاولت ادخال كود دفتر موجود من قبل او بيانات غير صحيحة", this.Page);
        }
    }

    private void UpodateReg(int regYear,bool isCurrent)
    {
        if (changeCurrentReg(regYear, isCurrent))
        {
            ManualRegister regUpd = new ManualRegister();
            regUpd.LoadByPrimaryKey(CurrentRegID.Value);
            regUpd.CurrentRegister = true;
            regUpd.Save();
        }

    }

    private bool changeCurrentReg(int regYear, bool isCurrent)
    {
        ManualRegister reg = new ManualRegister();
        if (!isCurrent)
        {
            reg.Where.CurrentRegister.Value = true;
            reg.Where.CurrentRegister.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
            reg.Where.CurrentRegister.Conjuction = MyGeneration.dOOdads.WhereParameter.Conj.And;

            reg.Where.RegisterType.Value = int.Parse(drpRegType.SelectedValue);
            reg.Where.RegisterType.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
            reg.Where.RegisterType.Conjuction = MyGeneration.dOOdads.WhereParameter.Conj.And;

            reg.Where.RegisterYear.Value = regYear;
            reg.Where.RegisterYear.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
            reg.Where.RegisterYear.Conjuction = MyGeneration.dOOdads.WhereParameter.Conj.And;
            reg.Where.OrgID.Value = MHOCommon.CurrentOrgID;
            reg.Where.OrgID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;

            if (!reg.Query.Load())
            {
                MHOCommon.ShowMessage("لابد ان يكون دفتر هو الحالى خلال هذا العام", this.Page);
                return false;
            }
           
        }
        else
        {
            reg.Where.CurrentRegister.Value = true;
            reg.Where.CurrentRegister.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
            reg.Where.CurrentRegister.Conjuction = MyGeneration.dOOdads.WhereParameter.Conj.And;

            reg.Where.RegisterType.Value = int.Parse(drpRegType.SelectedValue);
            reg.Where.RegisterType.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
            reg.Where.RegisterType.Conjuction = MyGeneration.dOOdads.WhereParameter.Conj.And;

            reg.Where.RegisterYear.Value = regYear;
            reg.Where.RegisterYear.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
            reg.Where.RegisterYear.Conjuction = MyGeneration.dOOdads.WhereParameter.Conj.And;

            reg.Where.OrgID.Value = MHOCommon.CurrentOrgID;
            reg.Where.OrgID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;

            if (reg.Query.Load())
            {
                reg.CurrentRegister = false;
                reg.Save();
            }
        }
        return true;
    }

    private void FilterReg()
    {
        ManualRegister reg = new ManualRegister();
        int filterYear;
        if (txtRegYear.Text != "" && int.TryParse(txtRegYear.Text,out filterYear))
        {

            reg.Where.RegisterYear.Value = filterYear;
            reg.Where.RegisterYear.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
            reg.Where.RegisterYear.Conjuction = MyGeneration.dOOdads.WhereParameter.Conj.And;
        }
        reg.Where.RegisterType.Value = int.Parse(drpRegType.SelectedValue);
        reg.Where.RegisterType.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
        reg.Where.RegisterType.Conjuction = MyGeneration.dOOdads.WhereParameter.Conj.And;

        reg.Where.OrgID.Value = MHOCommon.CurrentOrgID;
        reg.Where.OrgID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
        reg.Query.AddOrderBy(ManualRegister.ColumnNames.RegisterCode, MyGeneration.dOOdads.WhereParameter.Dir.ASC);
        reg.Query.Load();

        grdReg.DataSource = reg.DefaultView;
        grdReg.DataBind();
    }

    private void deleteReg(Guid regIDtoDelete)
    {
        ManualRegister delReg = new ManualRegister();
        try
        {
            delReg.DeleteReg(regIDtoDelete);
        }
        catch
        {
            MHOCommon.ShowMessage("انت تحاول حذف دفتر يحتوى على سجلات او هذا هو الدفتر الوحيد", this.Page);
        }
    }

    #endregion

}
