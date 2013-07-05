using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IStock.BLL;
namespace I_Stock.Admin
{
    public partial class Items : System.Web.UI.Page
    {
        #region properties
        public IStock.BLL.Items CurrentItem
        {
            get
            {
                if (Session["CurrentItem"] != null)
                    return (IStock.BLL.Items)Session["CurrentItem"];
                else
                    return null;
            }
            set
            {
                Session["CurrentItem"] = value;
            }
        }
        #endregion

        #region Events

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.CustomPageTitle = GetLocalResourceObject("Title").ToString();
                LoadCategories();
                LoadGroups();
                LoadClientTypes();
                LoadSuppliers();
                BindData();
                uiPanelAllItems.Visible = true;
                uiPanelEditItems.Visible = false;
                uipanelError.Visible = false;
                uiPanelActions.Visible = false;
            }
        }

        #region Items

        protected void uiGridViewItems_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewItems.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewItems_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditItem")
            {
                IStock.BLL.Items objData = new IStock.BLL.Items();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                uiTextBoxName.Text = objData.Name;
                uiTextBoxCode.Text = objData.ItemCode;
                uiTextBoxDesc.Text = objData.Description;
                uiTextBoxQty.Text = objData.Quantity.ToString();
                uiPanelAllItems.Visible = false;
                uiPanelEditItems.Visible = true;
                CurrentItem = objData;
                BindPrices();
                BindSuppliers();
                uiPanelActions.Visible = true;
            }
            else if (e.CommandName == "DeleteItem")
            {
                IStock.BLL.Items objData = new IStock.BLL.Items();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
                CurrentItem = null;
                BindData();
            }
        }

        protected void uiLinkButtonOK_Click(object sender, EventArgs e)
        {
            IStock.BLL.Items item = new IStock.BLL.Items();
            if (CurrentItem == null)
                item.AddNew();
            else
                item = CurrentItem;

            item.Name = uiTextBoxName.Text;
            item.Description = uiTextBoxDesc.Text;
            item.Quantity = Convert.ToInt32(uiTextBoxQty.Text);
            item.ItemCode = uiTextBoxCode.Text;
            item.GroupID = Convert.ToInt32(uiDropDownListGroup.SelectedValue);
            item.Save();
            //ClearFields();
            CurrentItem = null;
            uiPanelEditItems.Visible = true;
            uiPanelAllItems.Visible = false;
            BindData();
            uiPanelActions.Visible = true;
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentItem = null;
            uiPanelEditItems.Visible = false;
            uiPanelAllItems.Visible = true;
            uiPanelActions.Visible = false;
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentItem = null;
            uiPanelEditItems.Visible = true;
            uiPanelAllItems.Visible = false;
            uiPanelActions.Visible = false;
        }

        protected void uiDropDownListCats_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadGroups();
        }

        protected void uiDropDownListGroup_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindData();
        }

        protected void uiLinkButtonSearch_Click(object sender, EventArgs e)
        {
            BindData();
        }

        protected void uiLinkButtonBack_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentItem = null;
            uiPanelEditItems.Visible = false;
            uiPanelAllItems.Visible = true;
            uiPanelActions.Visible = false;
        }

        #endregion

        #region prices

        protected void uiLinkButtonAddPrice_Click(object sender, EventArgs e)
        {
            ItemPrices p = new ItemPrices();
            p.AddNew();
            
            p.ClientTypeID = Convert.ToInt32(uiDropDownListClientTypes.SelectedValue);
            p.ItemID = CurrentItem.ItemID;
            p.Price = decimal.Parse(uiTextBoxPrice.Text);
            p.Save();
            BindPrices();
            uiTextBoxPrice.Text = "";
        }

        protected void uiLinkButtonUpdatePrices_Click(object sender, EventArgs e)
        {
            BindPrices();
        }

        protected void uiGridViewPrices_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeletePrice")
            {
                ItemPrices objData = new ItemPrices();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()), CurrentItem.ItemID);
                objData.MarkAsDeleted();
                objData.Save();
                BindPrices();
            }
        }


        #endregion

        #region suppliers

        protected void uiLinkButtonAddSupp_Click(object sender, EventArgs e)
        {
            ItemSuppliers p = new ItemSuppliers();
            p.AddNew();

            p.SupplierID = Convert.ToInt32(uiDropDownListSuppliers.SelectedValue);
            p.ItemID = CurrentItem.ItemID;
            p.Save();
            BindSuppliers();
            
        }

        protected void uiLinkButtonUpdateSuppliers_Click(object sender, EventArgs e)
        {
            BindSuppliers();
        }

        protected void uiGridViewSuppliers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteSupp")
            {
                ItemSuppliers objData = new ItemSuppliers();
                objData.LoadByPrimaryKey(CurrentItem.ItemID,Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
                BindSuppliers();
            }
        }

        #endregion

        #endregion

        #region Methods

        private void BindData()
        {
            IStock.BLL.Items objData = new IStock.BLL.Items();
            if (!string.IsNullOrEmpty(uiDropDownListGroup.SelectedValue))
                objData.SearchItems(uiTextBoxSearch.Text, Convert.ToInt32(uiDropDownListGroup.SelectedValue));
            uiGridViewItems.DataSource = objData.DefaultView;
            uiGridViewItems.DataBind();
        }

        private void BindPrices()
        {
            IStock.BLL.ItemPrices objData = new IStock.BLL.ItemPrices();
            objData.GetPricesByItemID(CurrentItem.ItemID);
            uiGridViewPrices.DataSource = objData.DefaultView;
            uiGridViewPrices.DataBind();
        }

        private void BindSuppliers()
        {
            IStock.BLL.ItemSuppliers objData = new IStock.BLL.ItemSuppliers();
            objData.GetSuppliersByItemID(CurrentItem.ItemID);
            uiGridViewSuppliers.DataSource = objData.DefaultView;
            uiGridViewSuppliers.DataBind();
        }

        private void ClearFields()
        {
            uiTextBoxName.Text = "";
            uiTextBoxDesc.Text = "";
            uiTextBoxQty.Text = "";
            uiTextBoxCode.Text = "";
            uiDropDownListCats.SelectedIndex = 0;
            uiDropDownListGroup.SelectedIndex = 0;
        }


        private void LoadClientTypes()
        {
            IStock.BLL.ClientTypes types = new IStock.BLL.ClientTypes();
            types.LoadAll();
            uiDropDownListClientTypes.DataSource = types.DefaultView;
            uiDropDownListClientTypes.DataTextField = "Name";
            uiDropDownListClientTypes.DataValueField = "ClientTypeID";
            uiDropDownListClientTypes.DataBind();
        }

        private void LoadSuppliers()
        {
            IStock.BLL.Suppliers supp = new IStock.BLL.Suppliers();
            supp.LoadAll();
            uiDropDownListSuppliers.DataSource = supp.DefaultView;
            uiDropDownListSuppliers.DataTextField = "Name";
            uiDropDownListSuppliers.DataValueField = "SupplierID";
            uiDropDownListSuppliers.DataBind();
        }


        private void LoadCategories()
        {
            ItemCategories cats = new ItemCategories();
            cats.LoadAll();
            uiDropDownListCats.DataSource = cats.DefaultView;
            uiDropDownListCats.DataTextField = "Name";
            uiDropDownListCats.DataValueField = "ItemCategoryID";
            uiDropDownListCats.DataBind();
        }

        private void LoadGroups()
        {
            IStock.BLL.ItemGroups groups = new IStock.BLL.ItemGroups();
            if (!string.IsNullOrEmpty(uiDropDownListCats.SelectedValue))
                groups.GetItemGroupsByCategoryID(Convert.ToInt32(uiDropDownListCats.SelectedValue));
            uiDropDownListGroup.DataSource = groups.DefaultView;
            uiDropDownListGroup.DataTextField = "Name";
            uiDropDownListGroup.DataValueField = "ItemGroupID";
            uiDropDownListGroup.DataBind();
        }
        #endregion

       

    }
}