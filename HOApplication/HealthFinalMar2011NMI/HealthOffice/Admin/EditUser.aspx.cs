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

public partial class Admin_EditUser : System.Web.UI.Page
{
    protected void Page_PreInit(Object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (User.IsInRole("Admin"))
            {
                this.MasterPageFile = "~/MasterPages/AdminGov.master";
            }
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadGoves();

            if (User.IsInRole("Admin"))
            {
                ListItem itemMinistry = dropRole.Items[0];
                ListItem itemGov = dropRole.Items[1];
                dropRole.Items.Remove(itemMinistry);
                dropRole.Items.Remove(itemGov);
                dropRole.SelectedIndex = 0;
                dropRole_SelectedIndexChanged(null, null);
            }
        }
    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            lblPageHeader.Text = "استعلام عن مستخدم";
        }
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        LoadGridData();
    }
    protected void dropRole_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (dropRole.SelectedItem.Text == "مشرف وزارة")
        {
            drpHealthOffice.Enabled = false;
            drpCivil.Enabled = false;
            drpGov.Enabled = false;
        }
        if (dropRole.SelectedItem.Text == "مشرف مديرية")
        {
            LoadGoves();
            LoadCivilByGov();
            LoadHealthOfficeByCivil();
            drpHealthOffice.Enabled = false;
            drpCivil.Enabled = false;
            drpGov.Enabled = true;
        }
        else if (dropRole.SelectedItem.Text == "مشرف ادارة")
        {
            LoadGoves();
            LoadCivilByGov();
            LoadHealthOfficeByCivil();
            drpHealthOffice.Enabled = false;
            drpCivil.Enabled = true;
            drpGov.Enabled = true;
        }
        else if (dropRole.SelectedItem.Text == "طبيب" || dropRole.SelectedItem.Text == "كاتب صحة")
        {
            drpCivil.Enabled = true;
            drpHealthOffice.Enabled = true;
            drpGov.Enabled = true;
            LoadGoves();
            LoadCivilByGov();
            LoadHealthOfficeByCivil();
        }
        if (User.IsInRole("Admin"))
        {
            drpGov.Enabled = false;
            drpGov.SelectedIndex = drpGov.Items.IndexOf(drpGov.Items.FindByValue(MHOCommon.CurrentOrgGovID.ToString()));
            LoadCivilByGov();
        }
        LoadGridData();
    }
    protected void drpGov_SelectedIndexChanged(object sender, EventArgs e)
    {
       
        //if (drpGov.SelectedValue != "-1")
        //{
            LoadCivilByGov();
            LoadHealthOfficeByCivil();
      //  }
        LoadGridData();
    }
    protected void drpCivil_SelectedIndexChanged(object sender, EventArgs e)
    {
       
       // if (drpCivil.SelectedValue != "-1")
        //{
            LoadHealthOfficeByCivil();
        //}
        LoadGridData();
    }
    protected void grduser_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        GridViewRow row = e.Row;
        if (row.RowType == DataControlRowType.DataRow)
        {
            Label lblStatus = (Label)row.FindControl("lblStatus");
            DataRowView dr = (DataRowView)row.DataItem;
            if (Convert.ToBoolean(dr["Status"].ToString()))
            {
                lblStatus.Text = "يعمل";
            }
            else
            {
                lblStatus.Text = "لا يعمل";
            }
        }
    }
    protected void grduser_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grduser.PageIndex = e.NewPageIndex;
        LoadGridData();
    }
    protected void lnkEdit_Click(object sender, EventArgs e)
    {
        LinkButton editbtn = (LinkButton)sender;
        Guid userId = new Guid(editbtn.CommandArgument);
        Response.Redirect("EditUserData.aspx?UserId=" + userId);

    }
    protected void lnkDel_Click(object sender, EventArgs e)
    {
        try
        {
            Button delbtn = (Button)sender;
            Guid userId = new Guid(delbtn.CommandArgument);

            OrgUser orguser = new OrgUser();
            orguser.DeleteUser(userId);
            MembershipUser user = Membership.GetUser(userId);
            Membership.DeleteUser(user.UserName);
            
            LoadGridData();
        }
        catch (Exception ex)
        {
            lblMsg.Visible = true;
            lblMsg.Text = "توجد مشكلة في الحذف";
        }
    }

    protected void btnChangePassword_Click(object sender, EventArgs e)
    {
        
            Button delbtn = (Button)sender;
            Guid userId = new Guid(delbtn.CommandArgument);

            Response.Redirect("AdminChangePassword.aspx?userID="+userId.ToString());
    }
    protected void drpHealthOffice_SelectedIndexChanged(object sender, EventArgs e)
    {
        LoadGridData();
    }
    
    #region Methods

    private void LoadGoves()
    {

        GOVERNORATE gov = new GOVERNORATE();
        gov.LoadAll();
        drpGov.DataSource = gov.DefaultView;
        drpGov.DataTextField = GOVERNORATE.ColumnNames.DESCR;
        drpGov.DataValueField = GOVERNORATE.ColumnNames.CD;
        drpGov.DataSource = gov.DefaultView;
        drpGov.DataBind();
        drpGov.Items.Insert(0, new ListItem("اختر مديرية", "-1"));
        drpGov.SelectedIndex = 0;
    }
    private void LoadCivilByGov()
    {

        CIVIL_OFFICE civil = new CIVIL_OFFICE();
        civil.Where.FK_GOVCD.Value = drpGov.SelectedValue;
        civil.Query.Load();
        drpCivil.DataTextField = CIVIL_OFFICE.ColumnNames.DESCR;
        drpCivil.DataValueField = CIVIL_OFFICE.ColumnNames.CD;
        drpCivil.DataSource = civil.DefaultView;
        drpCivil.DataBind();
        drpCivil.Items.Insert(0, new ListItem("اختر ادارة", "-1"));
    }

    private void LoadHealthOfficeByCivil()
    {

        health_office healthOffice = new health_office();
        healthOffice.Where.CIVILCD.Value = drpCivil.SelectedValue;
        healthOffice.Query.Load();
        drpHealthOffice.DataTextField = health_office.ColumnNames.HEALTHDESCR;
        drpHealthOffice.DataValueField = health_office.ColumnNames.HEALTHCD;
        drpHealthOffice.DataSource = healthOffice.DefaultView;
        drpHealthOffice.DataBind();
        drpHealthOffice.Items.Insert(0, new ListItem("اختر مكتب", "-1"));
    }
    private void LoadGridData()
    {
        OrgUser user = new OrgUser();
        grduser.DataSource = user.GetUserDetails(new Guid(dropRole.SelectedValue), Convert.ToInt32(drpGov.SelectedValue), Convert.ToInt32(drpCivil.SelectedValue), Convert.ToInt32(drpHealthOffice.SelectedValue),txtNationalID.Text);
        grduser.DataBind();
    }

    #endregion
  
}
