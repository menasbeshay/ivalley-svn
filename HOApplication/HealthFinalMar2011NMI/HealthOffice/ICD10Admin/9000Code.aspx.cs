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

public partial class ICD10Admin_9000Code : System.Web.UI.Page
{
    #region Events

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            load9000Code();
            
        }
        Master.PageHeader = "ICD10 9000 Code";
        this.Form.DefaultButton = btnFilter.UniqueID;
        this.Form.DefaultFocus = txtFilter.ClientID;
        grd9000Code.EmptyDataText = "No Available Data for your search";
    }

     protected void btnFilter_Click(object sender, EventArgs e)
    {
        load9000Code();
    }

    protected void lnkDelete_Click(object sender,EventArgs e)
    {
        ImageButton btn = (ImageButton)sender;
        Delete9000Code(btn.CommandArgument);
        load9000Code();
    }

    protected void grdgrd9000Code_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grd9000Code.PageIndex = e.NewPageIndex;
        load9000Code();
    }
       
    #endregion

    #region Functions

    private void load9000Code()
    {
        ICDCODE9000 code = new ICDCODE9000();
        grd9000Code.DataSource = code.FilterICDcodes(txtFilter.Text);
        grd9000Code.DataBind();
    }

    private void Delete9000Code(string _code)
    {
        ICDCODE9000 code = new ICDCODE9000();
        code.LoadByPrimaryKey(_code);
        code.MarkAsDeleted();
        code.Save();
    }

    #endregion


    
    
}
