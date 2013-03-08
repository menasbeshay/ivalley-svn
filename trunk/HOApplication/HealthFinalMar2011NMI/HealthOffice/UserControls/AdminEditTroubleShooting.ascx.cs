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

public partial class UserControls_AdminEditTroubleShooting : System.Web.UI.UserControl
{
    public int TroubleshootID { get { return Convert.ToInt32(Request.QueryString["TID"]); } }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadLookups();
            LoadIssueLookups();
            BindData();
        }
    }

    private void BindData()
    {
        DataSet ds = SqlHelper.ExecuteDataset(MHOCommon.ConnString, "GetTroubleshooting", TroubleshootID);
        uiDropDownListGov.SelectedValue = ds.Tables[0].Rows[0]["GovID"].ToString();
        uiDropDownListCivil.SelectedValue = ds.Tables[0].Rows[0]["CivilID"].ToString();
        uiDropDownListHealthOffice.SelectedValue = ds.Tables[0].Rows[0]["HealthOfficeID"].ToString();
        uiDropDownListMachineGov.SelectedValue = ds.Tables[0].Rows[0]["MachineGovID"].ToString();
        uiDropDownListMachineCivil.SelectedValue = ds.Tables[0].Rows[0]["MachineCivilID"].ToString();
        uiDropDownListMachineHealthOffice.SelectedValue = ds.Tables[0].Rows[0]["MachineHealthOfficeID"].ToString();

        uiTextBoxDate.Text = DateTime.Parse(ds.Tables[0].Rows[0]["Date"].ToString()).ToShortDateString();
        uiTextBoxTime.Text = DateTime.Parse(ds.Tables[0].Rows[0]["Time"].ToString()).ToShortTimeString();

        uiTextBoxNotifierName.Text = ds.Tables[0].Rows[0]["UserName"].ToString();
        uiTextBoxIssueNo.Text = ds.Tables[0].Rows[0]["TroubleshootingID"].ToString();

        uiDropDownListPriority.SelectedValue = ds.Tables[0].Rows[0]["PriorityID"].ToString();
        uiRadioButtonListIssueType.SelectedValue = ds.Tables[0].Rows[0]["IssueTypeID"].ToString();
        uiRadioButtonListNetworkType.SelectedValue = ds.Tables[0].Rows[0]["NetworkID"].ToString();
        uiTextBoxDescription.Text = ds.Tables[0].Rows[0]["Description"].ToString();

        uiTextBoxTele.Text = ds.Tables[0].Rows[0]["Telephone"].ToString();
        uiTextBoxMobile.Text = ds.Tables[0].Rows[0]["Mobile"].ToString();
        uiTextBoxSerialNo.Text = ds.Tables[0].Rows[0]["USBSerial"].ToString();
        uiDropDownListStatus.SelectedValue = ds.Tables[0].Rows[0]["StatusID"].ToString(); 
    }

    private void LoadIssueLookups()
    {
        uiDropDownListPriority.DataSource = SqlHelper.ExecuteDataset(MHOCommon.ConnString, "GetPrioritys");
        uiDropDownListPriority.DataTextField = "PriorityName";
        uiDropDownListPriority.DataValueField = "PriorityID";
        uiDropDownListPriority.DataBind();

        uiRadioButtonListIssueType.DataSource = SqlHelper.ExecuteDataset(MHOCommon.ConnString, "GetIssueTypes");
        uiRadioButtonListIssueType.DataTextField = "TypeName";
        uiRadioButtonListIssueType.DataValueField = "IssueTypeID";
        uiRadioButtonListIssueType.DataBind();

        uiRadioButtonListNetworkType.DataSource = SqlHelper.ExecuteDataset(MHOCommon.ConnString, "GetNetworks");
        uiRadioButtonListNetworkType.DataTextField = "NetworkName";
        uiRadioButtonListNetworkType.DataValueField = "NetworkID";
        uiRadioButtonListNetworkType.DataBind();

        uiDropDownListStatus.DataSource = SqlHelper.ExecuteDataset(MHOCommon.ConnString, "GetStatuses");
        uiDropDownListStatus.DataTextField = "StatusName";
        uiDropDownListStatus.DataValueField = "StatusID";
        uiDropDownListStatus.DataBind();

    }

    private void LoadLookups()
    {
        GOVERNORATE gov = new GOVERNORATE();
        gov.LoadAll();

        uiDropDownListGov.DataSource = gov.DefaultView;
        uiDropDownListGov.DataTextField = GOVERNORATE.ColumnNames.DESCR;
        uiDropDownListGov.DataValueField = GOVERNORATE.ColumnNames.CD;
        uiDropDownListGov.DataBind();
        uiDropDownListGov.Items.Insert(0, new ListItem("---"));
        uiDropDownListGov.SelectedIndex = 0;

        uiDropDownListMachineGov.DataSource = gov.DefaultView;
        uiDropDownListMachineGov.DataTextField = GOVERNORATE.ColumnNames.DESCR;
        uiDropDownListMachineGov.DataValueField = GOVERNORATE.ColumnNames.CD;
        uiDropDownListMachineGov.DataBind();
        uiDropDownListMachineGov.Items.Insert(0, new ListItem("---"));
        uiDropDownListMachineGov.SelectedIndex = 0;

        CIVIL_OFFICE pol = new CIVIL_OFFICE();
        pol.LoadAll();
        uiDropDownListCivil.DataSource = pol.DefaultView;
        uiDropDownListCivil.DataTextField = POLICE_STATION.ColumnNames.DESCR;
        uiDropDownListCivil.DataValueField = POLICE_STATION.ColumnNames.CD;
        uiDropDownListCivil.DataBind();
        uiDropDownListCivil.Items.Insert(0, new ListItem("---"));
        uiDropDownListCivil.SelectedIndex = 0;

        uiDropDownListMachineCivil.DataSource = pol.DefaultView;
        uiDropDownListMachineCivil.DataTextField = POLICE_STATION.ColumnNames.DESCR;
        uiDropDownListMachineCivil.DataValueField = POLICE_STATION.ColumnNames.CD;
        uiDropDownListMachineCivil.DataBind();
        uiDropDownListMachineCivil.Items.Insert(0, new ListItem("---"));
        uiDropDownListMachineCivil.SelectedIndex = 0;

        health_office obj = new health_office();
        obj.LoadAll();
        uiDropDownListHealthOffice.DataSource = obj.DefaultView;
        uiDropDownListHealthOffice.DataTextField = health_office.ColumnNames.HEALTHDESCR;
        uiDropDownListHealthOffice.DataValueField = health_office.ColumnNames.HEALTHCD;
        uiDropDownListHealthOffice.DataBind();
        uiDropDownListHealthOffice.Items.Insert(0, new ListItem("---"));
        uiDropDownListHealthOffice.SelectedIndex = 0;


        uiDropDownListMachineHealthOffice.DataSource = obj.DefaultView;
        uiDropDownListMachineHealthOffice.DataTextField = health_office.ColumnNames.HEALTHDESCR;
        uiDropDownListMachineHealthOffice.DataValueField = health_office.ColumnNames.HEALTHCD;
        uiDropDownListMachineHealthOffice.DataBind();
        uiDropDownListMachineHealthOffice.Items.Insert(0, new ListItem("---"));
        uiDropDownListMachineHealthOffice.SelectedIndex = 0;


    }
    protected void uiButtonUpdate_Click(object sender, EventArgs e)
    {
        SqlHelper.ExecuteNonQuery(MHOCommon.ConnString, "UpdateTroubleshooting",
            new SqlParameter("@TroubleshootingID", TroubleshootID),
            new SqlParameter("@GovID", uiDropDownListGov.SelectedIndex == 0 || uiDropDownListGov.SelectedIndex == -1 ? null : short.Parse(uiDropDownListGov.SelectedValue).ToString()),
            new SqlParameter("@CivilID", uiDropDownListCivil.SelectedIndex == 0 || uiDropDownListCivil.SelectedIndex == -1 ? null : short.Parse(uiDropDownListCivil.SelectedValue).ToString()),
            new SqlParameter("@HealthOfficeID", uiDropDownListHealthOffice.SelectedIndex == 0 || uiDropDownListHealthOffice.SelectedIndex == -1 ? null : int.Parse(uiDropDownListHealthOffice.SelectedValue).ToString()),
            new SqlParameter("@Date", DateTime.Parse(uiTextBoxDate.Text)),
            new SqlParameter("@Time", DateTime.Parse(uiTextBoxTime.Text)),
            new SqlParameter("@IssueTypeID", uiRadioButtonListIssueType.SelectedIndex == -1 ? null : int.Parse(uiRadioButtonListIssueType.SelectedValue).ToString()),
            new SqlParameter("@MachineGovID", uiDropDownListMachineGov.SelectedIndex == 0 || uiDropDownListMachineGov.SelectedIndex == -1 ? null : short.Parse(uiDropDownListMachineGov.SelectedValue).ToString()),
            new SqlParameter("@MachineCivilID", uiDropDownListMachineCivil.SelectedIndex == 0 || uiDropDownListMachineCivil.SelectedIndex == -1 ? null : short.Parse(uiDropDownListMachineCivil.SelectedValue).ToString()),
            new SqlParameter("@MachineHealthOfficeID", uiDropDownListMachineHealthOffice.SelectedIndex == 0 || uiDropDownListMachineHealthOffice.SelectedIndex == -1 ? null : int.Parse(uiDropDownListMachineHealthOffice.SelectedValue).ToString()),
            new SqlParameter("@NetworkID", uiRadioButtonListNetworkType.SelectedIndex == -1 ? null : int.Parse(uiRadioButtonListNetworkType.SelectedValue).ToString()),
            new SqlParameter("@StatusID", uiDropDownListStatus.SelectedIndex == -1 ? null : int.Parse(uiDropDownListStatus.SelectedValue).ToString()),
            new SqlParameter("@PriorityID", uiDropDownListPriority.SelectedIndex == -1 ? null : int.Parse(uiDropDownListPriority.SelectedValue).ToString()),
            new SqlParameter("@Telephone", uiTextBoxTele.Text),
            new SqlParameter("@Mobile", uiTextBoxMobile.Text),
            new SqlParameter("@USBSerial", uiTextBoxSerialNo.Text),
            new SqlParameter("@UserID", MHOCommon.CurrentLoggedUserID),
            new SqlParameter("@Description", uiTextBoxDescription.Text));

        Response.Redirect("~/Admin/AdminTroubleshooting.aspx");
    }
}