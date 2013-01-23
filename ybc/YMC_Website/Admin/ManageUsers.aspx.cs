using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YMC.BLL;
using System.Configuration;
namespace YMC_Website.Admin
{
    public partial class ManageUsers : System.Web.UI.Page
    {
        #region properties
        public SiteUsers CurrentSiteUsers
        {
            get
            {
                if (Session["CurrentSiteUsers"] != null)
                    return (SiteUsers)Session["CurrentSiteUsers"];
                else
                    return null;
            }
            set
            {
                Session["CurrentSiteUsers"] = value;
            }
        }
        #endregion

        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            BindData();
            BindDataRequests();
            uiPanelViewAllPages.Visible = true;
            uiPanelEdit.Visible = false;
            Session["FCKeditor:UserFilesPath"] = ConfigurationManager.AppSettings["UserFilePath"];
        }

        protected void uiGridViewCurrentUsers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewCurrentUsers.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewUserRequests_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewUserRequests.PageIndex = e.NewPageIndex;
            BindDataRequests();
        }        

        protected void uiGridViewCurrentUsers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditUser")
            {
                SiteUsers objData = new SiteUsers();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                CurrentSiteUsers = objData;
                uiTextBoxFullName.Text = objData.UserFullName;
                uiTextBoxUserName.Text = objData.UserName;
                uiTextBoxTele.Text = objData.Telephone;
                uiFCKeditorPage.Value = Server.HtmlDecode(objData.UserPage);
                uiTextBoxMail.Text = objData.Email;
                uiTextBoxJob.Text = objData.Job;
                uiTextBoxInfo.Text = objData.OtherInfo;
                if(!objData.IsColumnNull("IsApproved"))
                    uiCheckBoxApproved.Checked = objData.IsApproved;
                uiPanelViewAllPages.Visible = false;
                uiPanelEdit.Visible = true;
            }
            else if (e.CommandName == "DeleteUser")
            {
                SiteUsers objData = new SiteUsers();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
                BindData();
                BindDataRequests();
            }
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            uiPanelViewAllPages.Visible = false;
            uiPanelEdit.Visible = true;
            Clearfields();
            CurrentSiteUsers = null;
        }

        protected void uiLinkButtonUpdate_Click(object sender, EventArgs e)
        {
            SiteUsers objData = new SiteUsers();
            if (CurrentSiteUsers != null)
                objData = CurrentSiteUsers;
            else
            {
                objData.AddNew();
            }
            objData.UserFullName = uiTextBoxFullName.Text;
            objData.UserName = uiTextBoxUserName.Text;
            objData.Telephone = uiTextBoxTele.Text;
            objData.UserPage = Server.HtmlEncode(uiFCKeditorPage.Value);
            objData.Email = uiTextBoxMail.Text;
            objData.Job = uiTextBoxJob.Text;
            objData.OtherInfo = uiTextBoxInfo.Text;
            objData.IsApproved = uiCheckBoxApproved.Checked;
            if (!string.IsNullOrEmpty(uiTextBoxPassword.Text))
                objData.UserPassword = uiTextBoxPassword.Text;
            objData.Save();
            CurrentSiteUsers = null;
            uiPanelViewAllPages.Visible = true;
            uiPanelEdit.Visible = false;
            BindData();
            BindDataRequests();        
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            uiPanelViewAllPages.Visible = true;
            uiPanelEdit.Visible = false;
            Clearfields();
            CurrentSiteUsers = null;
        }

        #endregion

        #region Methods
        private void BindData()
        {
            SiteUsers objData = new SiteUsers();
            objData.LoadAll();
            objData.Filter = "IsApproved = 1";
            uiGridViewCurrentUsers.DataSource = objData.DefaultView;
            uiGridViewCurrentUsers.DataBind();
        }

        private void BindDataRequests()
        {
            SiteUsers objData = new SiteUsers();
            objData.LoadAll();
            objData.Filter = "IsApproved <> 1 Or IsApproved is null";
            uiGridViewUserRequests.DataSource = objData.DefaultView;
            uiGridViewUserRequests.DataBind();
        }

        private void Clearfields()
        {
            uiTextBoxFullName.Text = "";
            uiTextBoxUserName.Text = "";
            uiTextBoxInfo.Text = "";
            uiTextBoxJob.Text = "";
            uiTextBoxMail.Text = "";
            uiFCKeditorPage.Value = "";
            uiTextBoxPassword.Text = "";
            uiTextBoxTele.Text = "";
            uiCheckBoxApproved.Checked = false;
            uiLabelError.Visible = false;
        }
        #endregion
    }
}