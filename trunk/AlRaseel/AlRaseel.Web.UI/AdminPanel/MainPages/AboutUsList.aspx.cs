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
    public partial class AboutUsList : System.Web.UI.Page
    {

        #region variables
        PageSectionsRepository _rpoObj;
        #endregion
        #region Methods
        private void LoadLanguages()
        {
            LanguageRepository _Obj = new LanguageRepository();
            ddlLanguage.DataSource = _Obj.LoadByActiveState();
            ddlLanguage.DataTextField = "Name";
            ddlLanguage.DataValueField = "Id";

            ddlLanguage.DataBind();
            ddlLanguage.Items.Insert(0, "Select Lnguage...");
        }
        private void LoadPages()
        {
            PageRepository _Obj = new PageRepository();
            ddlPage.DataSource = _Obj.LoadByActiveState();
            ddlPage.DataTextField = "PageName";
            ddlPage.DataValueField = "Id";

            ddlPage.DataBind();

        }
        private void LoadPageTitle()
        {
            MasterPages.Admin.PageTitle = "About Us";
            MasterPages.Admin.PageType = "List";
           
        }

        private void LoadPageSectionsByLanguageAndPageID()
        {
            PageSectionsRepository _Obj = new PageSectionsRepository();
            grdData.DataSource = _Obj.LoadByLanguageIdAndPageId(ddlPage.SelectedValue.ToString(), ddlLanguage.SelectedValue.ToString());
            grdData.DataBind();
        }

        #endregion
        #region EventHandler
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadLanguages();
                LoadPages();
                LoadPageTitle();
            }
        }

        protected void ddlLanguage_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadPageSectionsByLanguageAndPageID();
        }

        protected void ddlPage_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadPageSectionsByLanguageAndPageID();
        }

        protected void grdData_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            _rpoObj = new PageSectionsRepository();
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