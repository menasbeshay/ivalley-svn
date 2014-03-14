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
                if (!objData.IsColumnNull("Quantity"))
                    uiTextBoxQty.Text = objData.Quantity.ToString();
                if(!objData.IsColumnNull("ReOrderLevel"))
                    uiTextBoxReOrderLevel.Text = objData.ReOrderLevel.ToString();
                
                IStock.BLL.ItemGroups group = new IStock.BLL.ItemGroups();
                group.LoadByPrimaryKey(Convert.ToInt32(objData.GroupID));
                uiLabelGroup.Text = group.Name;


                IStock.BLL.ItemCategories cat = new ItemCategories();
                if (!string.IsNullOrEmpty(uiDropDownListCats.SelectedValue))
                {
                    cat.LoadByPrimaryKey(Convert.ToInt32(uiDropDownListCats.SelectedValue));
                }
                else
                    cat.LoadByPrimaryKey(group.ItemCategoryID);
                uiLabelCat.Text = cat.Name;

                uiPanelAllItems.Visible = false;
                uiPanelEditItems.Visible = true;
                CurrentItem = objData;
                BindPrices();                
                uiPanelActions.Visible = true;
            }
            else if (e.CommandName == "DeleteItem")
            {
                try
                {
                    IStock.BLL.Items objData = new IStock.BLL.Items();
                    objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                    objData.MarkAsDeleted();
                    objData.Save();
                    CurrentItem = null;
                    BindData();
                }
                catch (Exception ex)
                {
                    uipanelError.Visible = true;
                }
            }
            else if (e.CommandName == "GetItemBalance")
            {
                Session["Report_ItemIDForBalance"] = e.CommandArgument.ToString();
                Session["CurrentReport"] = "Report_GetItemsBalances";
                Response.Redirect("Reports.aspx");
            }
        }


        protected void uiLinkButtonAllItemsBalances_Click(object sender, EventArgs e)
        {
            Session["Report_ItemIDForBalance"] = "0";
            Session["CurrentReport"] = "Report_GetItemsBalances";
            Response.Redirect("Reports.aspx");
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
            if(!string.IsNullOrEmpty(uiTextBoxQty.Text))
                item.Quantity = Convert.ToInt32(uiTextBoxQty.Text);
            item.ItemCode = uiTextBoxCode.Text;
            item.GroupID = Convert.ToInt32(uiDropDownListGroup.SelectedValue);
            if (!string.IsNullOrEmpty(uiTextBoxReOrderLevel.Text))
                item.ReOrderLevel = Convert.ToInt32(uiTextBoxReOrderLevel.Text);
            item.Save();
            //ClearFields();
            CurrentItem = item;
            uiPanelEditItems.Visible = true;
            uiPanelAllItems.Visible = false;
            BindData();
            BindPrices();
            uiPanelActions.Visible = true;
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentItem = null;
            uiGridViewPrices.DataSource = null;
            uiGridViewPrices.DataBind();
            uiPanelEditItems.Visible = false;
            uiPanelAllItems.Visible = true;
            uiPanelActions.Visible = false;
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentItem = null;
            uiGridViewPrices.DataSource = null;
            uiGridViewPrices.DataBind();
            IStock.BLL.Items item = new IStock.BLL.Items();
            uiTextBoxCode.Text = item.GenerateItemCode(Convert.ToInt32(uiDropDownListGroup.SelectedValue)).ToString();
            uiPanelEditItems.Visible = true;
            uiPanelAllItems.Visible = false;
            uiPanelActions.Visible = false;


            IStock.BLL.ItemCategories cat = new ItemCategories();
            cat.LoadByPrimaryKey(Convert.ToInt32(uiDropDownListCats.SelectedValue));
            uiLabelCat.Text = cat.Name;

            IStock.BLL.ItemGroups group = new IStock.BLL.ItemGroups();
            group.LoadByPrimaryKey(Convert.ToInt32(uiDropDownListGroup.SelectedValue));
            uiLabelGroup.Text = group.Name;

        }

        protected void uiDropDownListCats_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadGroups();
        }

        protected void uiDropDownListGroup_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (uiDropDownListGroup.SelectedValue != "0")
                uiLinkButtonAdd.Enabled = true;
            else
                uiLinkButtonAdd.Enabled = false;
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

        

        #endregion

        #region Methods

        private void BindData()
        {
            IStock.BLL.Items objData = new IStock.BLL.Items();
            if (!string.IsNullOrEmpty(uiDropDownListGroup.SelectedValue))
                objData.SearchItems(uiTextBoxSearch.Text, Convert.ToInt32(uiDropDownListGroup.SelectedValue));
            else
                objData.SearchItems(uiTextBoxSearch.Text);
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

        

        private void ClearFields()
        {
            uiTextBoxName.Text = "";
            uiTextBoxDesc.Text = "";
            uiTextBoxQty.Text = "";
            uiTextBoxCode.Text = "";
            uiTextBoxReOrderLevel.Text = "";
           // uiDropDownListCats.SelectedIndex = 0;
           // uiDropDownListGroup.SelectedIndex = 0;
        }


        private void LoadClientTypes()
        {
            IStock.BLL.ClientTypes types = new IStock.BLL.ClientTypes();
            types.LoadAll();
            uiDropDownListClientTypes.DataSource = types.DefaultView;
            uiDropDownListClientTypes.DataTextField = "Name";
            uiDropDownListClientTypes.DataValueField = "ClientTypeID";
            uiDropDownListClientTypes.DataBind();
            uiDropDownListClientTypes.Items.Insert(0, new ListItem("إختر عميل", ""));
        }
        
        private void LoadCategories()
        {
            ItemCategories cats = new ItemCategories();
            cats.LoadAll();
            uiDropDownListCats.DataSource = cats.DefaultView;
            uiDropDownListCats.DataTextField = "Name";
            uiDropDownListCats.DataValueField = "ItemCategoryID";
            uiDropDownListCats.DataBind();
            uiDropDownListCats.Items.Insert(0, new ListItem("إختر تصنيف", ""));
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
            uiDropDownListGroup.Items.Insert(0, new ListItem("إختر مجموعة", ""));
        }
        #endregion

       

    }
}