using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace I_Stock.Admin
{
    public partial class PurchaseOrders : System.Web.UI.Page
    {
        #region properties
        public IStock.BLL.PurchaseOrders CurrentPurchaseOrder
        {
            get
            {
                if (Session["CurrentPurchaseOrder"] != null)
                    return (IStock.BLL.PurchaseOrders)Session["CurrentPurchaseOrder"];
                else
                    return null;
            }
            set
            {
                Session["CurrentPurchaseOrder"] = value;
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
                BindOrders();
                uiPanelEditPurchaseOrder.Visible = false;
                uiPanelAllOrders.Visible = true;
                uiPanelItems.Visible = false;
            }
        }

        protected void uiGridViewOrders_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewOrders.PageIndex = e.NewPageIndex;
            BindOrders();
        }

        protected void uiGridViewOrders_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditOrder")
            {
                IStock.BLL.PurchaseOrders objData = new IStock.BLL.PurchaseOrders();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                uiTextBoxCode.Text = objData.PurchaseOrderNo;
                uiTextBoxDate.Text = objData.PurchaseOrderDate.ToString("dd/MM/yyy");
                uiDropDownListSuppliers.SelectedValue = objData.SupplierID.ToString();
                
                uiPanelAllOrders.Visible = false;
                uiPanelEditPurchaseOrder.Visible = true;
                uiPanelItems.Visible = true;
                CurrentPurchaseOrder = objData;
                BindItems();
                EnableDisableControls();                
                
            }
            else if (e.CommandName == "DeleteOrder")
            {
                try
                {
                    IStock.BLL.PurchaseOrders objData = new IStock.BLL.PurchaseOrders();
                    objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                    IStock.BLL.PurchaseOrderDetails details = new IStock.BLL.PurchaseOrderDetails();
                    details.GetPurchaseOrderDetails(objData.PurchaseOrderID);
                    /*
                    if (details.RowCount > 0)
                    { 
                        for(int i=0;i<details.RowCount;i++)                   
                        {
                            IStock.BLL.Items item = new IStock.BLL.Items();
                            item.LoadByPrimaryKey(details.ItemID);
                            item.Quantity -= details.NoOfPackages * details.ItemOnPackages;
                            item.Save();
                            details.MoveNext();
                        }
                    }
                    */
                    details.MarkAsDeleted();
                    details.Save();

                    objData.MarkAsDeleted();
                    objData.Save();
                    CurrentPurchaseOrder = null;
                    BindOrders();
                }
                catch (Exception ex)
                {
                    uipanelError.Visible = true;
                }
            }
        }

        private void EnableDisableControls()
        {
            
            if(CurrentPurchaseOrder.Confirmed)
                uiLinkButtonConfirm.Attributes.Add("disabled", "disabled");
            else
                uiLinkButtonConfirm.Attributes.Remove("disabled");

            uiGridViewItems.Enabled = !CurrentPurchaseOrder.Confirmed;

            uiDropDownListSuppliers.Enabled = !CurrentPurchaseOrder.Confirmed;
            uiTextBoxDate.Enabled = !CurrentPurchaseOrder.Confirmed;
            uiTextBoxItemOnPackages.Enabled = !CurrentPurchaseOrder.Confirmed;
            uiTextBoxItems.Enabled = !CurrentPurchaseOrder.Confirmed;
            uiTextBoxNoOfPackages.Enabled = !CurrentPurchaseOrder.Confirmed;
            uiTextBoxPrice.Enabled = !CurrentPurchaseOrder.Confirmed;
            uiLinkButtonAddItem.Enabled = !CurrentPurchaseOrder.Confirmed;
        }


        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentPurchaseOrder = null;
            uipanelError.Visible = false;
            uiPanelEditPurchaseOrder.Visible = true;
            IStock.BLL.PurchaseOrders d = new IStock.BLL.PurchaseOrders();
            uiTextBoxCode.Text = d.getNewSerial();
            uiPanelAllOrders.Visible = false;

            ///////
            uiLinkButtonConfirm.Enabled = true;
            uiGridViewItems.Enabled = true;
            uiDropDownListSuppliers.Enabled = true;
            uiTextBoxDate.Enabled = true;
            uiTextBoxItemOnPackages.Enabled = true;
            uiTextBoxItems.Enabled = true;
            uiTextBoxNoOfPackages.Enabled = true;
            uiTextBoxPrice.Enabled = true;
            ///////
        }

        protected void uiLinkButtonBack_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentPurchaseOrder = null;
            uiPanelEditPurchaseOrder.Visible = false;
            uiPanelAllOrders.Visible = true;
            uiPanelItems.Visible = false;
            BindOrders();
        }

        protected void uiLinkButtonOK_Click(object sender, EventArgs e)
        {
            IStock.BLL.PurchaseOrders order = new IStock.BLL.PurchaseOrders();
            if (CurrentPurchaseOrder == null)
                order.AddNew();
            else
                order = CurrentPurchaseOrder;

            order.PurchaseOrderNo = uiTextBoxCode.Text;
            order.SupplierID= Convert.ToInt32(uiDropDownListSuppliers.SelectedValue);
            order.PurchaseOrderDate = DateTime.ParseExact(uiTextBoxDate.Text, "dd/MM/yyyy", null);
            order.Confirmed = false;
            order.Save();
            //ClearFields();
            CurrentPurchaseOrder = order;
            uiPanelEditPurchaseOrder.Visible = true;
            uiPanelAllOrders.Visible = false;
            uiPanelItems.Visible = true;            
            BindItems();
            EnableDisableControls();
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentPurchaseOrder = null;
            uiPanelEditPurchaseOrder.Visible = false;
            uiPanelAllOrders.Visible = true;
            uiPanelItems.Visible = false;
        }



        protected void uiLinkButtonAddItem_Click(object sender, EventArgs e)
        {
            IStock.BLL.PurchaseOrderDetails detail = new IStock.BLL.PurchaseOrderDetails();
            detail.AddNew();
            detail.PurchaseOrderID = CurrentPurchaseOrder.PurchaseOrderID;
            //detail.ItemID = Convert.ToInt32(uiDropDownListItems.SelectedValue);
            detail.ItemID = Convert.ToInt32(uiHiddenFieldCurrentItem.Value);
            detail.NoOfPackages = Convert.ToInt32(uiTextBoxNoOfPackages.Text);
            detail.ItemOnPackages = Convert.ToInt32(uiTextBoxItemOnPackages.Text);
            detail.PackagePrice = decimal.Parse(uiTextBoxPrice.Text);
            detail.Save();


            /*
            IStock.BLL.Items item = new IStock.BLL.Items();
            item.LoadByPrimaryKey(detail.ItemID);
            if (item.IsColumnNull("Quantity"))
                item.SetColumn("Quantity", detail.NoOfPackages * detail.ItemOnPackages);
            else
                item.Quantity += detail.NoOfPackages * detail.ItemOnPackages;
            item.Save();
            */
            BindItems();
        }

        protected void uiGridViewItems_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewItems.PageIndex = e.NewPageIndex;
            BindItems();
        }

        protected void uiGridViewItems_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteDetail")
            {
                IStock.BLL.PurchaseOrderDetails objData = new IStock.BLL.PurchaseOrderDetails();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                /*
                IStock.BLL.Items item = new IStock.BLL.Items();
                item.LoadByPrimaryKey(objData.ItemID);
                item.Quantity -= objData.NoOfPackages * objData.ItemOnPackages;
                item.Save();
                */

                objData.MarkAsDeleted();
                objData.Save();
                BindItems();
            }
        }

        protected void uiLinkButtonPrint_Click(object sender, EventArgs e)
        {
            Session["Report_PuchaseOrderID"] = CurrentPurchaseOrder.PurchaseOrderID.ToString();
            Session["CurrentReport"] = "Report_PurchaseOrder";
            Response.Redirect("Reports.aspx");
        }
        
        #endregion

        #region methods


        private void loadDDLs()
        {
            IStock.BLL.Suppliers Suppliers = new IStock.BLL.Suppliers();
            Suppliers.LoadAll();
            Suppliers.Sort = "Name";
            uiDropDownListSuppliers.DataSource = Suppliers.DefaultView;
            uiDropDownListSuppliers.DataTextField = "Name";
            uiDropDownListSuppliers.DataValueField = "SupplierID";
            uiDropDownListSuppliers.DataBind();
            uiDropDownListSuppliers.Items.Insert(0, new ListItem("إختر المورد", ""));
/*
            IStock.BLL.Items items = new IStock.BLL.Items();
            items.LoadAll();
            items.Sort = "Name";
            uiDropDownListItems.DataSource = items.DefaultView;
            uiDropDownListItems.DataTextField = "Name";
            uiDropDownListItems.DataValueField = "ItemID";
            uiDropDownListItems.DataBind();
            uiDropDownListItems.Items.Insert(0, new ListItem("إختر صنف", ""));*/
        }


        private void BindOrders()
        {
            IStock.BLL.PurchaseOrders Orders = new IStock.BLL.PurchaseOrders();
            Orders.GetAllPurchaseOrders();
            uiGridViewOrders.DataSource = Orders.DefaultView;
            uiGridViewOrders.DataBind();
        }


        private void BindItems()
        {
            IStock.BLL.PurchaseOrderDetails details = new IStock.BLL.PurchaseOrderDetails();
            details.GetPurchaseOrderDetails(CurrentPurchaseOrder.PurchaseOrderID);
            uiGridViewItems.DataSource = details.DefaultView;
            uiGridViewItems.DataBind();
            uiTextBoxTotal.Text = CurrentPurchaseOrder.GetPurchaseOrderTotals(CurrentPurchaseOrder.PurchaseOrderID).ToString();
        }


        private void ClearFields()
        {
            uiTextBoxCode.Text = "";
            uiTextBoxDate.Text = "";
            uiTextBoxTotal.Text = "";
            
        }


        #endregion

        protected void uiLinkButtonConfirm_Click(object sender, EventArgs e)
        {
            CurrentPurchaseOrder.Confirmed = true;
            CurrentPurchaseOrder.Save();
            uiLinkButtonConfirm.Enabled = false;


            IStock.BLL.PurchaseOrderDetails details = new IStock.BLL.PurchaseOrderDetails();
            details.GetPurchaseOrderDetails(CurrentPurchaseOrder.PurchaseOrderID);
            for (int i = 0; i < details.RowCount; i++)
            {
                IStock.BLL.Items item = new IStock.BLL.Items();
                item.LoadByPrimaryKey(details.ItemID);
                if (item.IsColumnNull("Quantity"))
                    item.SetColumn("Quantity", details.NoOfPackages * details.ItemOnPackages);
                else
                    item.Quantity += details.NoOfPackages * details.ItemOnPackages;
                item.Save();
                details.MoveNext();
            }
            EnableDisableControls();
            BindItems();
        }

        protected void uiGridViewOrders_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView row = (DataRowView)e.Row.DataItem;
                LinkButton delete = (LinkButton)e.Row.FindControl("uiLinkButtonDelete");
                if ((bool)row["Confirmed"])
                {
                    delete.Attributes.Add("disabled", "disabled");
                    delete.OnClientClick =  "return false;";
                }
            }
        }

        protected void uiGridViewItems_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView row = (DataRowView)e.Row.DataItem;
                LinkButton delete = (LinkButton)e.Row.FindControl("uiLinkButtonDelete");
                if (CurrentPurchaseOrder.Confirmed)
                {
                    delete.Attributes.Add("disabled", "disabled");
                    delete.OnClientClick = "return false;";
                }
            }
        }

        

    }
}