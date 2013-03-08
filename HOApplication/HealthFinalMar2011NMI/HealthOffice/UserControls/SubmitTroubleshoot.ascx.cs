using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MHO.BLL;
using Microsoft.ApplicationBlocks.Data;
using System.Data.SqlClient;

public partial class UserControls_SubmitTroubleshoot : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadLookups();
            setDateTime();
            setCurrentUserInfo();
            BindData();
            LoadIssueLookups();
            
        }
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
    }

    private void BindData()
    {
        try
        {
            uiGridViewRecentIssues.DataSource = SqlHelper.ExecuteDataset(MHOCommon.ConnString, "GetTroubleshootingsByUser", MHOCommon.CurrentLoggedUserID);
            uiGridViewRecentIssues.DataBind();
        }
        catch (Exception)
        {
            // gives error when log out
        }
    }

    private void setCurrentUserInfo()
    {
        try
        {
            OrgUser Current = new OrgUser();
            if (MHOCommon.CurrentLoggedUserID != null && MHOCommon.CurrentLoggedUserID != Guid.Empty)
            {
                Current.LoadByPrimaryKey(MHOCommon.CurrentLoggedUserID);
                uiTextBoxNotifierName.Text = Current.FirstName.Trim() + " " + Current.FatherName.Trim();

                if (Current.GovId != 0)
                {
                    uiDropDownListGov.SelectedValue = Current.GovId.ToString();
                    uiDropDownListGov.Enabled = false;
                    uiDropDownListMachineGov.SelectedValue = Current.GovId.ToString();
                    uiDropDownListMachineGov.Enabled = false;

                    /*********************/
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
                        uiDropDownListCivil.Items.Insert(0, new ListItem("---", "0"));
                        uiDropDownListCivil.SelectedIndex = 0;
                    }

                    if (uiDropDownListMachineGov.SelectedIndex != 0)
                    {
                        CIVIL_OFFICE pol = new CIVIL_OFFICE();
                        pol.Where.FK_GOVCD.Value = short.Parse(uiDropDownListMachineGov.SelectedValue);
                        pol.Where.FK_GOVCD.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
                        pol.Query.AddOrderBy(CIVIL_OFFICE.ColumnNames.DESCR, MyGeneration.dOOdads.WhereParameter.Dir.ASC);
                        pol.Query.Load();
                        uiDropDownListMachineCivil.DataSource = pol.DefaultView;
                        uiDropDownListMachineCivil.DataTextField = POLICE_STATION.ColumnNames.DESCR;
                        uiDropDownListMachineCivil.DataValueField = POLICE_STATION.ColumnNames.CD;
                        uiDropDownListMachineCivil.DataBind();
                        uiDropDownListMachineCivil.Items.Insert(0, new ListItem("---", "0"));
                        uiDropDownListMachineCivil.SelectedIndex = 0;
                    }

                    if (Current.CivilId != 0)
                    {
                        uiDropDownListCivil.SelectedValue = Current.CivilId.ToString();
                        uiDropDownListCivil.Enabled = false;
                        uiDropDownListMachineCivil.SelectedValue = Current.CivilId.ToString();
                        uiDropDownListMachineCivil.Enabled = false;


                        if (uiDropDownListCivil.SelectedIndex != 0 && uiDropDownListGov.SelectedIndex != 0)
                        {
                            health_office obj = new health_office();
                            uiDropDownListHealthOffice.DataSource = obj.GetHealthOfficeDetails(short.Parse(uiDropDownListGov.SelectedValue), short.Parse(uiDropDownListCivil.SelectedValue)).DefaultView;
                            uiDropDownListHealthOffice.DataTextField = health_office.ColumnNames.HEALTHDESCR;
                            uiDropDownListHealthOffice.DataValueField = health_office.ColumnNames.HEALTHCD;
                            uiDropDownListHealthOffice.DataBind();
                            uiDropDownListHealthOffice.Items.Insert(0, new ListItem("---", "0"));
                            uiDropDownListHealthOffice.SelectedIndex = 0;
                        }

                        if (uiDropDownListMachineGov.SelectedIndex != 0 && uiDropDownListMachineCivil.SelectedIndex != 0)
                        {
                            health_office obj = new health_office();
                            uiDropDownListMachineHealthOffice.DataSource = obj.GetHealthOfficeDetails(short.Parse(uiDropDownListMachineGov.SelectedValue), short.Parse(uiDropDownListMachineCivil.SelectedValue)).DefaultView;
                            uiDropDownListMachineHealthOffice.DataTextField = health_office.ColumnNames.HEALTHDESCR;
                            uiDropDownListMachineHealthOffice.DataValueField = health_office.ColumnNames.HEALTHCD;
                            uiDropDownListMachineHealthOffice.DataBind();
                            uiDropDownListMachineHealthOffice.Items.Insert(0, new ListItem("---", "0"));
                            uiDropDownListMachineHealthOffice.SelectedIndex = 0;
                        }
                    }
                }
                /************************/
            }
        }
        catch (Exception)
        {
            // gives error when log out             
        }
    }

    private void setDateTime()
    {
        uiTextBoxDate.Text = DateTime.Now.ToShortDateString();
        uiTextBoxDate.Enabled = false;
        uiTextBoxTime.Text = DateTime.Now.ToShortTimeString();
        uiTextBoxTime.Enabled = false;
    }

    private void LoadLookups()
    {
        GOVERNORATE gov = new GOVERNORATE();
        gov.LoadAll();

        uiDropDownListGov.DataSource = gov.DefaultView;
        uiDropDownListGov.DataTextField = GOVERNORATE.ColumnNames.DESCR;
        uiDropDownListGov.DataValueField = GOVERNORATE.ColumnNames.CD;
        uiDropDownListGov.DataBind();
        uiDropDownListGov.Items.Insert(0, new ListItem("---", "0"));
        uiDropDownListGov.SelectedValue = MHOCommon.CurrentOrgGovID.ToString();

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
            uiDropDownListCivil.Items.Insert(0, new ListItem("---", "0"));
            uiDropDownListCivil.SelectedIndex = 0;
        }

        uiDropDownListMachineGov.DataSource = gov.DefaultView;
        uiDropDownListMachineGov.DataTextField = GOVERNORATE.ColumnNames.DESCR;
        uiDropDownListMachineGov.DataValueField = GOVERNORATE.ColumnNames.CD;
        uiDropDownListMachineGov.DataBind();
        uiDropDownListMachineGov.Items.Insert(0, new ListItem("---", "0"));
        uiDropDownListMachineGov.SelectedIndex = 0;
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
            uiDropDownListCivil.Items.Insert(0, new ListItem("---", "0"));
            uiDropDownListCivil.SelectedIndex = 0;
        }
    }
    protected void uiDropDownListMachineGov_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (uiDropDownListMachineGov.SelectedIndex != 0)
        {
            CIVIL_OFFICE pol = new CIVIL_OFFICE();
            pol.Where.FK_GOVCD.Value = short.Parse(uiDropDownListMachineGov.SelectedValue);
            pol.Where.FK_GOVCD.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
            pol.Query.AddOrderBy(CIVIL_OFFICE.ColumnNames.DESCR, MyGeneration.dOOdads.WhereParameter.Dir.ASC);
            pol.Query.Load();
            uiDropDownListMachineCivil.DataSource = pol.DefaultView;
            uiDropDownListMachineCivil.DataTextField = POLICE_STATION.ColumnNames.DESCR;
            uiDropDownListMachineCivil.DataValueField = POLICE_STATION.ColumnNames.CD;
            uiDropDownListMachineCivil.DataBind();
            uiDropDownListMachineCivil.Items.Insert(0, new ListItem("---", "0"));
            uiDropDownListMachineCivil.SelectedIndex = 0;
        }
    }
    protected void uiDropDownListCivil_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (uiDropDownListCivil.SelectedIndex != 0 && uiDropDownListGov.SelectedIndex != 0)
        {
            health_office obj = new health_office();
            uiDropDownListHealthOffice.DataSource = obj.GetHealthOfficeDetails(short.Parse(uiDropDownListGov.SelectedValue), short.Parse(uiDropDownListCivil.SelectedValue)).DefaultView;
            uiDropDownListHealthOffice.DataTextField = health_office.ColumnNames.HEALTHDESCR;
            uiDropDownListHealthOffice.DataValueField = health_office.ColumnNames.HEALTHCD;
            uiDropDownListHealthOffice.DataBind();
            uiDropDownListHealthOffice.Items.Insert(0, new ListItem("---", "0"));
            uiDropDownListHealthOffice.SelectedIndex = 0;
        }
    }
    protected void uiDropDownListMachineCivil_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (uiDropDownListMachineGov.SelectedIndex != 0 && uiDropDownListMachineCivil.SelectedIndex != 0)
        {
            health_office obj = new health_office();
            uiDropDownListMachineHealthOffice.DataSource = obj.GetHealthOfficeDetails(short.Parse(uiDropDownListMachineGov.SelectedValue), short.Parse(uiDropDownListMachineCivil.SelectedValue)).DefaultView;
            uiDropDownListMachineHealthOffice.DataTextField = health_office.ColumnNames.HEALTHDESCR;
            uiDropDownListMachineHealthOffice.DataValueField = health_office.ColumnNames.HEALTHCD;
            uiDropDownListMachineHealthOffice.DataBind();
            uiDropDownListMachineHealthOffice.Items.Insert(0, new ListItem("---", "0"));
            uiDropDownListMachineHealthOffice.SelectedIndex = 0;
        }
    }
    protected void uiButtonAdd_Click(object sender, EventArgs e)
    {
        SqlHelper.ExecuteNonQuery(MHOCommon.ConnString, "AddTroubleshooting",
            new SqlParameter("@GovID", uiDropDownListGov.SelectedIndex == 0 || uiDropDownListGov.SelectedIndex == -1 ? null : short.Parse(uiDropDownListGov.SelectedValue).ToString()),
            new SqlParameter("@CivilID", uiDropDownListCivil.SelectedIndex == 0 || uiDropDownListCivil.SelectedIndex == -1 ? null : short.Parse(uiDropDownListCivil.SelectedValue).ToString()),
            new SqlParameter("@HealthOfficeID", uiDropDownListHealthOffice.SelectedIndex == 0 || uiDropDownListHealthOffice.SelectedIndex == -1 ? null : int.Parse(uiDropDownListHealthOffice.SelectedValue).ToString()),
            new SqlParameter("@Date", DateTime.Parse(uiTextBoxDate.Text)),
            new SqlParameter("@Time", DateTime.Now.ToShortTimeString()),
            new SqlParameter("@IssueTypeID", uiRadioButtonListIssueType.SelectedIndex == -1 ? null : int.Parse(uiRadioButtonListIssueType.SelectedValue).ToString()),
            new SqlParameter("@MachineGovID", uiDropDownListMachineGov.SelectedIndex == 0 || uiDropDownListMachineGov.SelectedIndex == -1 ? null : short.Parse(uiDropDownListMachineGov.SelectedValue).ToString()),
            new SqlParameter("@MachineCivilID", uiDropDownListMachineCivil.SelectedIndex == 0 || uiDropDownListMachineCivil.SelectedIndex == -1 ? null : short.Parse(uiDropDownListMachineCivil.SelectedValue).ToString()),
            new SqlParameter("@MachineHealthOfficeID", uiDropDownListMachineHealthOffice.SelectedIndex == 0 || uiDropDownListMachineHealthOffice.SelectedIndex == -1 ? null : int.Parse(uiDropDownListMachineHealthOffice.SelectedValue).ToString()),
            new SqlParameter("@NetworkID", uiRadioButtonListNetworkType.SelectedIndex == -1 ? null : int.Parse(uiRadioButtonListNetworkType.SelectedValue).ToString()),
            new SqlParameter("@PriorityID", uiDropDownListPriority.SelectedIndex == -1 ? null : int.Parse(uiDropDownListPriority.SelectedValue).ToString()),
            new SqlParameter("@Telephone", uiTextBoxTele.Text),
            new SqlParameter("@Mobile", uiTextBoxMobile.Text),
            new SqlParameter("@USBSerial", uiTextBoxSerialNo.Text),
            new SqlParameter("@UserID", MHOCommon.CurrentLoggedUserID),
            new SqlParameter("@Description", uiTextBoxDescription.Text));

        BindData();
    }
}