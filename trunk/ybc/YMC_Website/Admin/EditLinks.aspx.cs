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
    public partial class EditLinks : System.Web.UI.Page
    {
        #region properties
        public ImportantLinks CurrentLink
        {
            get
            {
                if (Session["CurrentLink"] != null)
                    return (ImportantLinks)Session["CurrentLink"];
                else
                    return null;
            }
            set
            {
                Session["CurrentLink"] = value;
            }
        }
        #endregion

        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            BindData();
            uiPanelViewAllPages.Visible = true;
            uiPanelEdit.Visible = false;
            Session["FCKeditor:UserFilesPath"] = ConfigurationManager.AppSettings["UserFilePath"];
        }

        protected void uiGridViewLinks_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewLinks.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewLinks_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditLink")
            {
                ImportantLinks objData = new ImportantLinks();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                CurrentLink = objData;
                uiTextBoxArTitle.Text = objData.LinkName;
                uiTextBoxURL.Text = objData.LinkURL;
                uiPanelViewAllPages.Visible = false;
                uiPanelEdit.Visible = true;
            }
            else if (e.CommandName == "DeleteLink")
            {
                ImportantLinks objData = new ImportantLinks();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
                BindData();
            }
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            uiPanelViewAllPages.Visible = false;
            uiPanelEdit.Visible = true;
            Clearfields();
            CurrentLink = null;
        }

        protected void uiLinkButtonUpdate_Click(object sender, EventArgs e)
        {
            ImportantLinks objData = new ImportantLinks();
            if (CurrentLink != null)
                objData = CurrentLink;
            else
            {
                objData.AddNew();
            }
            objData.LinkName = uiTextBoxArTitle.Text;
            objData.LinkURL = uiTextBoxURL.Text;
            objData.Save();
            CurrentLink = null;
            uiPanelViewAllPages.Visible = true;
            uiPanelEdit.Visible = false;
            BindData();
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            uiPanelViewAllPages.Visible = true;
            uiPanelEdit.Visible = false;
            Clearfields();
            CurrentLink = null;
        }

        #endregion

        #region Methods
        private void BindData()
        {
            ImportantLinks objData = new ImportantLinks();
            objData.LoadAll();
            uiGridViewLinks.DataSource = objData.DefaultView;
            uiGridViewLinks.DataBind();
        }

        private void Clearfields()
        {
            uiTextBoxArTitle.Text = "";
            uiTextBoxURL.Text = "";
            uiLabelError.Visible = false;
        }
        #endregion
    }
}