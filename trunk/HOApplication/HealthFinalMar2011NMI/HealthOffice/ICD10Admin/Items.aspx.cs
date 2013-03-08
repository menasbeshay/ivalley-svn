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

public partial class ICD10Admin_Items : System.Web.UI.Page
{
    #region Events

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            loadDropCategories();
            loadItem();            
        }
        Master.PageHeader = "ICD10 Items";
        this.Form.DefaultButton = btnFilter.UniqueID;
        this.Form.DefaultFocus = txtFilter.ClientID;
        grdItem.EmptyDataText = "No Available Data for your search";
    }

     protected void btnFilter_Click(object sender, EventArgs e)
    {
        loadItem();
    }

    protected void lnkDelete_Click(object sender,EventArgs e)
    {
        ImageButton btn = (ImageButton)sender;
        DeleteCat(int.Parse(btn.CommandArgument));
        loadItem();
    }

    protected void grdItem_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdItem.PageIndex = e.NewPageIndex;
        loadItem();
    }
       
    #endregion

    #region Functions

    private void loadItem()
    {
        ICD10ITEM item = new ICD10ITEM();
        grdItem.DataSource = item.FilterICDItem(txtFilter.Text,int.Parse(drpICDcategories.SelectedValue));
        grdItem.DataBind();
    }

    private void loadDropCategories()
    {
        ICD10CAT cat = new ICD10CAT();
       // cat.Where.CATID.Value = 0;
        //cat.Where.CATID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.NotEqual;
        cat.Query.AddOrderBy(ICD10CAT.ColumnNames.CATDESCRENG, MyGeneration.dOOdads.WhereParameter.Dir.ASC);
        cat.Query.Load();

        drpICDcategories.DataSource = cat.DefaultView.Table;
        drpICDcategories.DataTextField = ICD10CAT.ColumnNames.CATDESCRENG;
        drpICDcategories.DataValueField = ICD10CAT.ColumnNames.CATID;
        drpICDcategories.DataBind();
    }


    private void DeleteCat(int _catID)
    {
        ICD10ITEM item = new ICD10ITEM();
        item.LoadByPrimaryKey(_catID);
        item.MarkAsDeleted();
        item.Save();
    }

    #endregion




    protected void drpICDcategories_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadItem();
    }
}
