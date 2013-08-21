using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EGEMech.BLL;

namespace website.Admin
{
    public partial class EditSubCategories : System.Web.UI.Page
    {
        #region properties
        public SubCategory CurrentSubCategory
        {
            get
            {
                if (Session["CurrentSubCategory"] != null)
                    return (SubCategory)Session["CurrentSubCategory"];
                else
                    return null;
            }
            set
            {
                Session["CurrentSubCategory"] = value;
            }
        }
        #endregion

        #region events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                 if (Session["CurrentUser"] != null)
                {
                     Users user = (Users)Session["CurrentUser"];
                     if (!user.IsColumnNull("IsAdmin") && user.IsAdmin)
                     {
                         BindData();
                         LoadDDls();
                         uiPanelViewCats.Visible = true;
                         uiPanelEdit.Visible = false;
                     }
                     else
                     {
                         Response.Redirect("~/default.aspx");
                     }
                }
                 else
                 {
                     Response.Redirect("login.aspx");
                 }
            }
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            uiPanelEdit.Visible = true;
            uiPanelViewCats.Visible = false;
            Clearfields();
        }

        protected void uiGridViewSubCats_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewSubCats.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewSubCats_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditSubCat")
            {
                SubCategory subcat = new EGEMech.BLL.SubCategory();
                subcat.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument));
                CurrentSubCategory = subcat;
                uiDropDownListCategory.SelectedValue = subcat.CategoryID.ToString();
                uiTextBoxName.Text = subcat.Name;

                uiPanelViewCats.Visible = false;
                uiPanelEdit.Visible = true;
            }
            else if (e.CommandName == "DeleteSubCat")
            {
                try
                {
                    SubCategory cat = new EGEMech.BLL.SubCategory();
                    cat.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument));
                    cat.MarkAsDeleted();
                    cat.Save();
                    BindData();
                }
                catch (Exception ex)
                {
                    uiLabelError.Visible = true;
                }

            }
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            SubCategory cat = new SubCategory();
            if (CurrentSubCategory != null)
            {
                cat = CurrentSubCategory;
            }
            else
            {
                cat.AddNew();
            }

            cat.CategoryID = Convert.ToInt32(uiDropDownListCategory.SelectedValue);
            cat.Name = uiTextBoxName.Text;
            cat.Save();
            uiPanelEdit.Visible = false;
            uiPanelViewCats.Visible = true;
            Clearfields();
            BindData();
            CurrentSubCategory = null;
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            uiPanelEdit.Visible = false;
            uiPanelViewCats.Visible = true;
            Clearfields();
            CurrentSubCategory = null;

        }
        #endregion

        #region methods


        private void LoadDDls()
        {
            Category cats = new Category();
            cats.LoadAll();
            uiDropDownListCategory.DataSource = cats.DefaultView;
            uiDropDownListCategory.DataTextField = "Name";
            uiDropDownListCategory.DataValueField = "CategoryID";
            uiDropDownListCategory.DataBind();
        }


        private void BindData()
        {
            SubCategory cat = new SubCategory();
            cat.GetAllSubCats();
            uiGridViewSubCats.DataSource = cat.DefaultView;
            uiGridViewSubCats.DataBind();
        }


        private void Clearfields()
        {
            uiTextBoxName.Text = "";
            uiDropDownListCategory.SelectedIndex = 0;
        }


        #endregion
    }
}