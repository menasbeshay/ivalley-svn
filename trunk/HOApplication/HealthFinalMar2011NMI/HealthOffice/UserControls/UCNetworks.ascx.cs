using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.ApplicationBlocks.Data;
using System.Data;
public partial class UserControls_UCNetworks : System.Web.UI.UserControl
{
    public int CurrentNetwork 
    {
        get 
        {
            if (Session["CurrentNetworkID"] != "0" )
                return Convert.ToInt32(Session["CurrentNetworkID"]);

            return 0;
        }

        set 
        {
            Session["CurrentNetworkID"] = value;
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
        uiGridViewNetworks.DataSource = SqlHelper.ExecuteDataset(MHOCommon.ConnString, "GetNetworks");
        uiGridViewNetworks.DataBind();
    }
    protected void uiButtonAdd_Click(object sender, EventArgs e)
    {
        string networkname = uiTextBoxNetworkName.Text;
        // add
        if (CurrentNetwork == 0)
        {
            SqlHelper.ExecuteNonQuery(MHOCommon.ConnString, "AddNetwork", networkname);
        }
        // edit
        else
        {
            SqlHelper.ExecuteNonQuery(MHOCommon.ConnString, "UpdateNetwork", CurrentNetwork, networkname);
        }
        BindData();
        CurrentNetwork = 0;
        uiTextBoxNetworkName.Text = "";
        uiButtonAdd.Text = GetLocalResourceObject("uiButtonAddResource1.Text").ToString();
    }
    protected void uiGridViewNetworks_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "EditNetwork")
        {
            CurrentNetwork = Convert.ToInt32(e.CommandArgument);
            DataSet ds = SqlHelper.ExecuteDataset(MHOCommon.ConnString, "GetNetwork", CurrentNetwork);
            uiTextBoxNetworkName.Text = ds.Tables[0].Rows[0]["NetworkName"].ToString();
            uiButtonAdd.Text = GetLocalResourceObject("uiButtonEditResource1.Text").ToString();
            
        }
        else if (e.CommandName == "DeleteNetwork")
        {
            CurrentNetwork = Convert.ToInt32(e.CommandArgument);
            SqlHelper.ExecuteNonQuery(MHOCommon.ConnString, "DeleteNetwork", CurrentNetwork);
            BindData();
        }
    }
}