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
    public partial class ContactList : System.Web.UI.Page
    {
        #region variables
        ContactRepository _rpoObj;
        LanguageRepository _lngObj;
        #endregion
        #region Methods
        private void LoadLanguages()
        {
            _lngObj = new LanguageRepository();
            ddlLanguage.DataSource = _lngObj.LoadByActiveState();
            ddlLanguage.DataTextField = "Name";
            ddlLanguage.DataValueField = "Id";

            ddlLanguage.DataBind();
            ddlLanguage.Items.Insert(0, "Select Lnguage...");
        }
        private void LoadPageTitle()
        {
            MasterPages.Admin.PageTitle = "Contact Us";
            MasterPages.Admin.PageType = "List";
        }

        private void LoadByLanguageID()
        {
            _rpoObj = new ContactRepository();
            grdData.DataSource = _rpoObj.LoadByLanguageId(ddlLanguage.SelectedValue.ToString());
            grdData.DataBind();
        }

        #endregion
        #region EventHandler
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadLanguages();
                LoadPageTitle();
            }
        }
        protected void ddlLanguage_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadByLanguageID();
        }
        protected void grdData_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            _rpoObj = new ContactRepository();
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