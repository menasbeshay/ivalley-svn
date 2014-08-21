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
    public partial class ProductAlbumsList : System.Web.UI.Page
    {
        #region variables
        ProductAlbumRepository _rpoObj;
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
        private void LoadProducts()
        {
            ProductRepository _Obj = new ProductRepository();
            ddlProducts.DataSource = _Obj.LoadByActiveState();
            ddlProducts.DataTextField = "ProductTitle";
            ddlProducts.DataValueField = "Id";

            ddlProducts.DataBind();
            ddlProducts.Items.Insert(0, "Select Product...");
        }
        private void LoadPageTitle()
        {
            MasterPages.Admin.PageTitle = "Product Albums";
            MasterPages.Admin.PageType = "List";
        }

        private void LoadProductAlbumsByLanguageIDAndProductId()
        {
            _rpoObj = new ProductAlbumRepository();
            grdData.DataSource = _rpoObj.LoadByProductIdAndLanguageId(ddlLanguage.SelectedValue.ToString(),ddlProducts.SelectedValue.ToString());
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
                LoadProducts();
            }
        }

        protected void ddlLanguage_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadProductAlbumsByLanguageIDAndProductId();
        }

        protected void grdData_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            _rpoObj = new ProductAlbumRepository();
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