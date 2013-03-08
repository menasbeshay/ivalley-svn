using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.ApplicationBlocks.Data;
using System.Data;
public partial class UserControls_UCPriority : System.Web.UI.UserControl
{
    public int CurrentPriority 
    {
        get 
        {
            if (Session["CurrentPriorityID"] != "0")
                return Convert.ToInt32(Session["CurrentPriorityID"]);

            return 0;
        }

        set 
        {
            Session["CurrentPriorityID"] = value;
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
        uiGridViewPriority.DataSource = SqlHelper.ExecuteDataset(MHOCommon.ConnString, "GetPrioritys");
        uiGridViewPriority.DataBind();
    }
    protected void uiButtonAdd_Click(object sender, EventArgs e)
    {
        string Prioritykname = uiTextBoxPriorityName.Text;
        // add
        if (CurrentPriority == 0)
        {
            SqlHelper.ExecuteNonQuery(MHOCommon.ConnString, "AddPriority", Prioritykname);
        }
        // edit
        else
        {
            SqlHelper.ExecuteNonQuery(MHOCommon.ConnString, "UpdatePriority", CurrentPriority, Prioritykname);
        }
        BindData();
        CurrentPriority = 0;
        uiTextBoxPriorityName.Text = "";
        uiButtonAdd.Text = GetLocalResourceObject("uiButtonAddResource1.Text").ToString();
    }
    protected void uiGridViewPriority_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "EditPriority")
        {
            CurrentPriority = Convert.ToInt32(e.CommandArgument);
            DataSet ds = SqlHelper.ExecuteDataset(MHOCommon.ConnString, "GetPriority", CurrentPriority);
            uiTextBoxPriorityName.Text = ds.Tables[0].Rows[0]["PriorityName"].ToString();
            uiButtonAdd.Text = GetLocalResourceObject("uiButtonEditResource1.Text").ToString();
            
        }
        else if (e.CommandName == "DeletePriority")
        {
            CurrentPriority = Convert.ToInt32(e.CommandArgument);
            SqlHelper.ExecuteNonQuery(MHOCommon.ConnString, "DeletePriority", CurrentPriority);
            BindData();
        }
    }
}