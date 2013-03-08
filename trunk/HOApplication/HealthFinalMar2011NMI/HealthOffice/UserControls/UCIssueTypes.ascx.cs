using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.ApplicationBlocks.Data;
using System.Data;
public partial class UserControls_UCIssueTypes : System.Web.UI.UserControl
{
    public int CurrentIssueType
    {
        get 
        {
            if (Session["CurrentIssueTypeID"] != "0")
                return Convert.ToInt32(Session["CurrentIssueTypeID"]);

            return 0;
        }

        set 
        {
            Session["CurrentIssueTypeID"] = value;
        }
    
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
        }
    }

    private void BindData()
    {
        uiGridViewIssueTypes.DataSource = SqlHelper.ExecuteDataset(MHOCommon.ConnString, "GetIssueTypes");
        uiGridViewIssueTypes.DataBind();
    }
    protected void uiButtonAdd_Click(object sender, EventArgs e)
    {
        string IssueTypename = uiTextBoxIssueTypeName.Text;
        // add
        if (CurrentIssueType == 0)
        {
            SqlHelper.ExecuteNonQuery(MHOCommon.ConnString, "AddIssueType", IssueTypename);
        }
        // edit
        else
        {
            SqlHelper.ExecuteNonQuery(MHOCommon.ConnString, "UpdateIssueType", CurrentIssueType, IssueTypename);
        }
        BindData();
        CurrentIssueType = 0;
        uiTextBoxIssueTypeName.Text = "";
        uiButtonAdd.Text = GetLocalResourceObject("uiButtonAddResource1.Text").ToString();
    }
    protected void uiGridViewIssueTypes_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "EditIssueType")
        {
            CurrentIssueType = Convert.ToInt32(e.CommandArgument);
            DataSet ds = SqlHelper.ExecuteDataset(MHOCommon.ConnString, "GetIssueType", CurrentIssueType);
            uiTextBoxIssueTypeName.Text = ds.Tables[0].Rows[0]["TypeName"].ToString();
            uiButtonAdd.Text = GetLocalResourceObject("uiButtonEditResource1.Text").ToString();
            
        }
        else if (e.CommandName == "DeleteIssueType")
        {
            CurrentIssueType = Convert.ToInt32(e.CommandArgument);
            SqlHelper.ExecuteNonQuery(MHOCommon.ConnString, "DeleteIssueType", CurrentIssueType);
            BindData();
        }
    }
}