using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IStock.BLL;
using System.Data;

namespace I_Stock.Admin
{
    public partial class ItemGroups : System.Web.UI.Page
    {
        #region properties
        public IStock.BLL.ItemGroups CurrentGroup
        {
            get
            {
                if (Session["CurrentGroup"] != null)
                    return (IStock.BLL.ItemGroups)Session["CurrentGroup"];
                else
                    return null;
            }
            set
            {
                Session["CurrentGroup"] = value;
            }
        }

        #endregion

        #region events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.CustomPageTitle = GetLocalResourceObject("Title").ToString();
                loadDDLs();
                BindGroups();
                uipanelError.Visible = false;
                uiPanelEditGroup.Visible = false;
                uiPanelAllGroups.Visible = true;
            }
        }


        protected void uiDropDownListCats_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindGroups();
        }

        protected void uiGridViewGroups_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewGroups.PageIndex = e.NewPageIndex;
            BindGroups();
        }

        protected void uiGridViewGroups_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditGroup")
            {
                IStock.BLL.ItemGroups objData = new IStock.BLL.ItemGroups();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                uiTextBoxName.Text = objData.Name;
                uiTextBoxDesc.Text = objData.Description;
                uiDropDownListCats.SelectedValue = objData.ItemCategoryID.ToString();

                uiPanelAllGroups.Visible = false;
                uiPanelEditGroup.Visible = true;
                CurrentGroup = objData;

                BindGroups();
            }
            else if (e.CommandName == "DeleteGroup")
            {
                try
                {
                    IStock.BLL.ItemGroups objData = new IStock.BLL.ItemGroups();
                    objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                    objData.MarkAsDeleted();
                    objData.Save();
                    CurrentGroup = null;
                    BindGroups();
                }
                catch (Exception ex)
                {
                    uipanelError.Visible = true;
                }
            }
        }

        protected void uiGridViewGroups_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Label CatName = (Label)e.Row.FindControl("uiLabelCat");

                IStock.BLL.ItemCategories Cat = new IStock.BLL.ItemCategories();
                DataRowView row = (DataRowView)e.Row.DataItem;
                Cat.LoadByPrimaryKey(Convert.ToInt32(row["ItemCategoryID"].ToString()));
                CatName.Text = Cat.Name;

            }
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentGroup = null;
            uiPanelEditGroup.Visible = true;
            uiPanelAllGroups.Visible = false;  
        }

        protected void uiLinkButtonBack_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentGroup = null;
            uiPanelEditGroup.Visible = false;
            uiPanelAllGroups.Visible = true;
            BindGroups();
        }

        protected void uiLinkButtonOK_Click(object sender, EventArgs e)
        {
            IStock.BLL.ItemGroups groups = new IStock.BLL.ItemGroups();
            if (CurrentGroup == null)
                groups.AddNew();
            else
                groups = CurrentGroup;

            groups.Name = uiTextBoxName.Text;
            groups.Description = uiTextBoxDesc.Text;
            groups.ItemCategoryID = Convert.ToInt32(uiDropDownListCats.SelectedValue);
            groups.Save();
            ClearFields();
            CurrentGroup = null;
            uiPanelEditGroup.Visible = false;
            uiPanelAllGroups.Visible = true;
            BindGroups();
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentGroup = null;
            uiPanelEditGroup.Visible = false;
            uiPanelAllGroups.Visible = true;
        }
        #endregion

        #region methods


        private void loadDDLs()
        {
            IStock.BLL.ItemCategories Cats = new IStock.BLL.ItemCategories();
            Cats.LoadAll();
            Cats.Sort = "Name";
            uiDropDownListCats.DataSource = Cats.DefaultView;
            uiDropDownListCats.DataTextField = "Name";
            uiDropDownListCats.DataValueField = "ItemCategoryID";
            uiDropDownListCats.DataBind();
        }


        private void BindGroups()
        {
            IStock.BLL.ItemGroups groups = new IStock.BLL.ItemGroups();
            groups.GetItemGroupsByCategoryID(Convert.ToInt32(uiDropDownListCats.SelectedValue));
            groups.Sort = "Name";
            uiGridViewGroups.DataSource = groups.DefaultView;
            uiGridViewGroups.DataBind();
        }

        private void ClearFields()
        {
            uiTextBoxName.Text = "";
            uiTextBoxDesc.Text = "";
            uiDropDownListCats.SelectedIndex = 0;
        }


        #endregion

    }
}