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

public partial class ListDeadMedicalInfo : System.Web.UI.Page
{
    #region Properties 

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
            loadBirthData();
           
        }
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (ForUpdate)
            {
                Master.PageHeader = "تعديل البيانات الصحية";
            }
            else
            {
                Master.PageHeader = "حالات الوفيات التى لم يتم ادخال البيانات الصحية لها";//GetLocalResourceObject("lblHeaderPage").ToString();
            }
        }

    }

    /// <summary>
    /// btn born name click
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void lnkBornName_Click(object sender, EventArgs e)
    {
        if (ForUpdate)
        {
            Response.Redirect("RegisterDeathHealthInfo.aspx?ForUpdate=1&DeadEventID=" + ((LinkButton)sender).CommandArgument);
        }
        else
        {
            Response.Redirect("RegisterDeathHealthInfo.aspx?DeadEventID=" + ((LinkButton)sender).CommandArgument);
        }
    }

    #endregion

    #region "Methods"

    private void loadBirthData()
    {
        Dead objDead = new Dead();
        objDead.Where.OrgID.Value = MHOCommon.CurrentOrgID.Value;
        objDead.Where.OrgID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
        objDead.Where.OrgID.Conjuction = MyGeneration.dOOdads.WhereParameter.Conj.And;
        if (ForUpdate)
        {
            objDead.Where.Approved.Value = 0;
            objDead.Where.Approved.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
            objDead.Where.Approved.Conjuction = MyGeneration.dOOdads.WhereParameter.Conj.And;
            objDead.Where.HasHealthData.Value = 1;
            objDead.Where.HasHealthData.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
        }
        else
        {
            objDead.Where.HasHealthData.Value = 0;
            objDead.Where.HasHealthData.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
        }
        objDead.Query.AddOrderBy(Dead.ColumnNames.RegisterDate, MyGeneration.dOOdads.WhereParameter.Dir.ASC);
        
        objDead.Query.Load();

        grdBorns.DataSource = objDead.DefaultView;
        grdBorns.DataBind();
    }

    #endregion
   
}
