using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.ApplicationBlocks.Data;
using MHO.BLL;
using System.Data;
using System.Data.SqlClient;

public partial class UserControls_AdminListTroubleShooting : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
            LoadDDls();
        }
    }

    private void LoadDDls()
    {
        GOVERNORATE gov = new GOVERNORATE();
        gov.LoadAll();

        uiDropDownListGov.DataSource = gov.DefaultView;
        uiDropDownListGov.DataTextField = GOVERNORATE.ColumnNames.DESCR;
        uiDropDownListGov.DataValueField = GOVERNORATE.ColumnNames.CD;
        uiDropDownListGov.DataBind();
        uiDropDownListGov.Items.Insert(0, new ListItem("---"));
        uiDropDownListGov.SelectedIndex = 0;

        uiDropDownListPriority.DataSource = SqlHelper.ExecuteDataset(MHOCommon.ConnString, "GetPrioritys");
        uiDropDownListPriority.DataTextField = "PriorityName";
        uiDropDownListPriority.DataValueField = "PriorityID";
        uiDropDownListPriority.DataBind();
        uiDropDownListPriority.Items.Insert(0, new ListItem("---"));
        uiDropDownListPriority.SelectedIndex = 0;

        uiDropDownListStatus.DataSource = SqlHelper.ExecuteDataset(MHOCommon.ConnString, "GetStatuses");
        uiDropDownListStatus.DataTextField = "StatusName";
        uiDropDownListStatus.DataValueField = "StatusID";
        uiDropDownListStatus.DataBind();
        uiDropDownListStatus.Items.Insert(0, new ListItem("---"));
        uiDropDownListStatus.SelectedIndex = 0;
    }

    private void BindData()
    {
        uiGridViewTroubleshootings.DataSource = SqlHelper.ExecuteDataset(MHOCommon.ConnString, "GetTroubleshootings", null);
        uiGridViewTroubleshootings.DataBind();
    }
    protected void uiDropDownListGov_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (uiDropDownListGov.SelectedIndex != 0)
        {
            CIVIL_OFFICE pol = new CIVIL_OFFICE();
            pol.Where.FK_GOVCD.Value = short.Parse(uiDropDownListGov.SelectedValue);
            pol.Where.FK_GOVCD.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
            pol.Query.AddOrderBy(CIVIL_OFFICE.ColumnNames.DESCR, MyGeneration.dOOdads.WhereParameter.Dir.ASC);
            pol.Query.Load();
            uiDropDownListCivil.DataSource = pol.DefaultView;
            uiDropDownListCivil.DataTextField = POLICE_STATION.ColumnNames.DESCR;
            uiDropDownListCivil.DataValueField = POLICE_STATION.ColumnNames.CD;
            uiDropDownListCivil.DataBind();
            uiDropDownListCivil.Items.Insert(0, new ListItem("---"));
            uiDropDownListCivil.SelectedIndex = 0;
        }
    }
    protected void uiButtonSearch_Click(object sender, EventArgs e)
    {
        DataSet ds = SqlHelper.ExecuteDataset(MHOCommon.ConnString, "GetTroubleshootings", null);
        ds.Tables[0].DefaultView.RowFilter = "";
        if (uiDropDownListGov.SelectedIndex != 0 )
            ds.Tables[0].DefaultView.RowFilter += " MachineGovID = " + uiDropDownListGov.SelectedValue;

        if (uiDropDownListCivil.SelectedIndex != 0 && uiDropDownListCivil.SelectedIndex != -1)
        {
            if (!string.IsNullOrEmpty(ds.Tables[0].DefaultView.RowFilter))
                ds.Tables[0].DefaultView.RowFilter += " And MachineCivilID = " + uiDropDownListCivil.SelectedValue;
            else
                ds.Tables[0].DefaultView.RowFilter += " MachineCivilID = " + uiDropDownListCivil.SelectedValue;
        }

        if (uiDropDownListStatus.SelectedIndex != 0)
        {
            if (!string.IsNullOrEmpty(ds.Tables[0].DefaultView.RowFilter))
                ds.Tables[0].DefaultView.RowFilter += " And StatusID = " + uiDropDownListStatus.SelectedValue;
            else
                ds.Tables[0].DefaultView.RowFilter += " StatusID = " + uiDropDownListStatus.SelectedValue;
        }

        if (uiDropDownListPriority.SelectedIndex != 0)
        {
            if (!string.IsNullOrEmpty(ds.Tables[0].DefaultView.RowFilter))
                ds.Tables[0].DefaultView.RowFilter += " And PriorityID = " + uiDropDownListPriority.SelectedValue;
            else
                ds.Tables[0].DefaultView.RowFilter += " PriorityID = " + uiDropDownListPriority.SelectedValue;
        }
        uiGridViewTroubleshootings.DataSource = ds.Tables[0].DefaultView;
        uiGridViewTroubleshootings.DataBind();
    }
    protected void uiGridViewTroubleshootings_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int TID = Convert.ToInt32(e.CommandArgument);
        if (e.CommandName == "EditTroubleshooting")
        {
            
            Response.Redirect("~/Admin/AdminEditTroubleshooting.aspx?TID=" + TID.ToString());

        }
        else if (e.CommandName == "DeleteTroubleshootingID")
        {
            SqlHelper.ExecuteNonQuery(MHOCommon.ConnString, "DeleteTroubleshooting", TID);
            BindData();
        }
    }
}