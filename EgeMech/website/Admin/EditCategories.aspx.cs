using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EGEMech.BLL;

namespace website.Admin
{
    public partial class EditCategories : System.Web.UI.Page
    {
        #region properties
        public Category CurrentCategory
        {
            get
            {
                if (Session["CurrentCategory"] != null)
                    return (Category)Session["CurrentCategory"];
                else
                    return null;
            }
            set
            {
                Session["CurrentCategory"] = value;
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

        protected void uiGridViewCats_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewCats.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewCats_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditCat")
            {
                Category cat = new EGEMech.BLL.Category();
                cat.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument));
                CurrentCategory = cat;

                uiTextBoxName.Text = cat.Name;

                uiPanelViewCats.Visible = false;
                uiPanelEdit.Visible = true;
            }
            else if (e.CommandName == "DeleteCat")
            {
                try
                {
                    Category cat = new EGEMech.BLL.Category();
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
            Category cat = new Category();
            if (CurrentCategory != null)
            {
                cat = CurrentCategory;
            }
            else
            {
                cat.AddNew();
            }


            cat.Name = uiTextBoxName.Text;
            cat.Save();
            uiPanelEdit.Visible = false;
            uiPanelViewCats.Visible = true;
            Clearfields();
            BindData();
            CurrentCategory = null;
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            uiPanelEdit.Visible = false;
            uiPanelViewCats.Visible = true;
            Clearfields();
            CurrentCategory = null;

        }
        #endregion

        #region methods

        private void BindData()
        {
            Category cat = new Category();
            cat.LoadAll();
            uiGridViewCats.DataSource = cat.DefaultView;
            uiGridViewCats.DataBind();
        }


        private void Clearfields()
        {
            uiTextBoxName.Text = "";
        }


        #endregion
    }
}