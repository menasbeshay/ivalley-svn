using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Web.UI.AdminPanel.MasterPages;
using Data.DataModels;
using Data.Extensions;
using Data.Repositories;

namespace Web.UI.AdminPanel.MainPages
{
    public partial class SocialLinkList : System.Web.UI.Page
    {
        #region variables
        SocialLinkRepository _rpoObj;
        SocialLinkTypeRepository _sltObj;
        #endregion
        #region Methods
        private void LoadocialLinkTypes()
        {
            _sltObj = new SocialLinkTypeRepository();
            ddlSocialLinkType.DataSource = _sltObj.LoadByActiveState();
            ddlSocialLinkType.DataTextField = "SocialLinkType_";
            ddlSocialLinkType.DataValueField = "Id";

            ddlSocialLinkType.DataBind();
            ddlSocialLinkType.Items.Insert(0, "Select Social Link...");
        }
        private void LoadPageTitle()
        {
            MasterPages.Admin.PageTitle = "Social Links";
            MasterPages.Admin.PageType = "List";
        }

        private void LoadBySocialLinkTypeID()
        {
            _rpoObj = new SocialLinkRepository();
            grdData.DataSource = _rpoObj.LoadBySocialLinkType(ddlSocialLinkType.SelectedValue.ToString());
            grdData.DataBind();
        }

        #endregion
        #region EventHandler
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadocialLinkTypes();
                LoadPageTitle();
            }
        }
        protected void ddlLanguage_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadBySocialLinkTypeID();
        }
        protected void grdData_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            _rpoObj = new SocialLinkRepository();
            switch (e.CommandName)
            {

                case "restoreitem":
                    if (_rpoObj.Restore(e.CommandArgument.ToString(), Request.Cookies["CooLoginUserId"].Value))
                    { grdData.DataBind(); }
                    break;
                case "deleteitem":
                    if (_rpoObj.Delete(e.CommandArgument.ToString(), Request.Cookies["CooLoginUserId"].Value))
                    { grdData.DataBind(); }
                    break;
            }
        }
        protected void grdData_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowIndex == 0)
            {
                grdData.UseAccessibleHeader = true;
                grdData.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }


        #endregion
    }
}