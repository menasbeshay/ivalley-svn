using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EGEMech.BLL;
namespace website.Admin
{
    public partial class EditPages : System.Web.UI.Page
    {
        #region properties
        public EGEMech.BLL.Page CurrentPage
        {
            get
            {
                if (Session["CurrentPage"] != null)
                    return (EGEMech.BLL.Page)Session["CurrentPage"];
                else
                    return null;
            }
            set
            {
                Session["CurrentPage"] = value;
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
                        LoadDDLs();
                        BindData();
                        uiPanelViewPages.Visible = true;
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
            uiPanelViewPages.Visible = false;
            Clearfields();
        }

        protected void uiGridViewPages_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewPages.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewPages_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditPages")
            {
                EGEMech.BLL.Page page = new EGEMech.BLL.Page();
                page.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument));
                CurrentPage = page;
                
                uiTextBoxTitle.Text = page.Title;
                uiTextBoxName.Text = page.Name;
                uiCheckBoxInMenu.Checked = page.InMenu;
                uiFCKeditorContent.Value = Server.HtmlDecode(page.Content);
                if(!page.IsColumnNull("ParentID"))
                    uiDropDownListPages.SelectedValue = page.ParentID.ToString();
                uiPanelViewPages.Visible = false;
                uiPanelEdit.Visible = true;                
            }
            else if (e.CommandName == "DeletePages")
            {
                try
                {
                    EGEMech.BLL.Page page = new EGEMech.BLL.Page();
                    page.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument));
                    page.MarkAsDeleted();
                    page.Save();
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
            EGEMech.BLL.Page page = new EGEMech.BLL.Page();
            if (CurrentPage !=null)
            {
                page = CurrentPage;
            }
            else
            {
                page.AddNew();
            }

            page.Title = uiTextBoxTitle.Text;
            page.Name = uiTextBoxName.Text;
            page.InMenu = uiCheckBoxInMenu.Checked;
            page.Content = Server.HtmlEncode(uiFCKeditorContent.Value);
            if (!string.IsNullOrEmpty(uiDropDownListPages.SelectedValue))
                page.ParentID = Convert.ToInt32(uiDropDownListPages.SelectedValue);
            page.Save();
            uiPanelEdit.Visible = false;
            uiPanelViewPages.Visible = true;
            Clearfields();
            BindData();
            LoadDDLs();
            CurrentPage = null;
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            uiPanelEdit.Visible = false;
            uiPanelViewPages.Visible = true;
            Clearfields();
            CurrentPage =null;

        }
        #endregion

        #region methods

        private void LoadDDLs()
        {
            EGEMech.BLL.Page page = new EGEMech.BLL.Page();
            page.LoadAll();
            uiDropDownListPages.DataSource = page.DefaultView;
            uiDropDownListPages.DataTextField = "Name";
            uiDropDownListPages.DataValueField = "PageID";
            uiDropDownListPages.DataBind();
            uiDropDownListPages.Items.Insert(0, new ListItem("Choose page", ""));
        }

        private void BindData()
        {
            EGEMech.BLL.Page page = new EGEMech.BLL.Page();
            page.LoadAll();
            uiGridViewPages.DataSource = page.DefaultView;
            uiGridViewPages.DataBind();
        }


        private void Clearfields()
        {
            uiTextBoxTitle.Text = "";
            uiTextBoxName.Text = "";
            uiCheckBoxInMenu.Checked = false;
            uiFCKeditorContent.Value = "";            
        }


        #endregion
    }
}