using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.ApplicationBlocks.Data;
using System.Data;
public partial class UserControls_UCStatus : System.Web.UI.UserControl
{
    public int CurrentStatus 
    {
        get 
        {
            if (Session["CurrentStatusID"] != "0" )
                return Convert.ToInt32(Session["CurrentStatusID"]);

            return 0;
        }

        set 
        {
            Session["CurrentStatusID"] = value;
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
        uiGridViewStatuses.DataSource = SqlHelper.ExecuteDataset(MHOCommon.ConnString, "GetStatuses");
        uiGridViewStatuses.DataBind();
    }
    protected void uiButtonAdd_Click(object sender, EventArgs e)
    {
        string statusname = uiTextBoxStatusName.Text;
        // add
        if (CurrentStatus == 0)
        {
            SqlHelper.ExecuteNonQuery(MHOCommon.ConnString, "AddStatus", statusname);
        }
        // edit
        else
        {
            SqlHelper.ExecuteNonQuery(MHOCommon.ConnString, "UpdateStatus", CurrentStatus, statusname);
        }
        BindData();
        CurrentStatus = 0;
        uiTextBoxStatusName.Text = "";
        uiButtonAdd.Text = GetLocalResourceObject("uiButtonAddResource1.Text").ToString();
    }
    protected void uiGridViewStatuses_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "EditStatus")
        {
            CurrentStatus = Convert.ToInt32(e.CommandArgument);
            DataSet ds = SqlHelper.ExecuteDataset(MHOCommon.ConnString, "GetStatus", CurrentStatus);
            uiTextBoxStatusName.Text = ds.Tables[0].Rows[0]["StatusName"].ToString();
            uiButtonAdd.Text = GetLocalResourceObject("uiButtonEditResource1.Text").ToString();
            
        }
        else if (e.CommandName == "DeleteStatus")
        {
            CurrentStatus = Convert.ToInt32(e.CommandArgument);
            SqlHelper.ExecuteNonQuery(MHOCommon.ConnString, "DeleteStatus", CurrentStatus);
            BindData();
        }
    }
}