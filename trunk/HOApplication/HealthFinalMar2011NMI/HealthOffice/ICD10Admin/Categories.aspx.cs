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

public partial class ICD10Admin_Categories : System.Web.UI.Page
{
    #region Events

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            loadCat();
            
        }
        Master.PageHeader = "ICD10 Categories";
        this.Form.DefaultButton = btnFilter.UniqueID;
        this.Form.DefaultFocus = txtFilter.ClientID;
        grdCategories.EmptyDataText = "No Available Data for your search";
    }

     protected void btnFilter_Click(object sender, EventArgs e)
    {
        loadCat();
    }

    protected void lnkDelete_Click(object sender,EventArgs e)
    {
        ImageButton btn = (ImageButton)sender;
        DeleteCat(int.Parse(btn.CommandArgument));
        loadCat();
    }

    protected void grdCategories_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdCategories.PageIndex = e.NewPageIndex;
        loadCat();
    }
       
    #endregion

    #region Functions

    private void loadCat()
    {
        ICD10CAT cat = new ICD10CAT();
        grdCategories.DataSource = cat.FilterICDCat(txtFilter.Text);
        grdCategories.DataBind();
    }

    private void DeleteCat(int _catID)
    {
        ICD10CAT cat = new ICD10CAT();
        cat.LoadByPrimaryKey(_catID);
        cat.MarkAsDeleted();
        cat.Save();
    }

    #endregion


    
    
}
