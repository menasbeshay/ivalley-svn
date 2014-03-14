using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace I_Stock.Admin
{
    public partial class DeliveryOrder : System.Web.UI.Page
    {
        #region properties
        public IStock.BLL.DeliveryOrder CurrentDeliveryOrder
        {
            get
            {
                if (Session["CurrentDeliveryOrder"] != null)
                    return (IStock.BLL.DeliveryOrder)Session["CurrentDeliveryOrder"];
                else
                    return null;
            }
            set
            {
                Session["CurrentDeliveryOrder"] = value;
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
                uiPanelEditDeliveryOrder.Visible = false;
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
                IStock.BLL.DeliveryOrder objData = new IStock.BLL.DeliveryOrder();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                uiTextBoxCode.Text = objData.DeliveryOrderNo;
                uiTextBoxDate.Text = objData.DeliveryOrderDate.ToString("dd/MM/yyy");
                uiDropDownListClients.SelectedValue = objData.ClientID.ToString();
                uiDropDownListEmployee.SelectedValue = objData.EmployeeID.ToString();
                if(!objData.IsColumnNull("Discount"))
                    uiTextBoxDiscount.Text = objData.Discount.ToString();
                uiPanelAllOrders.Visible = false;
                uiPanelEditDeliveryOrder.Visible = true;
                uiPanelItems.Visible = true;
                CurrentDeliveryOrder = objData;
                //EnableDisableActions();
                BindItems();
            }
            else if (e.CommandName == "DeleteOrder")
            {
                try
                {
                    IStock.BLL.DeliveryOrder objData = new IStock.BLL.DeliveryOrder();
                    objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                    IStock.BLL.DeliveryOrderDetails details = new IStock.BLL.DeliveryOrderDetails();
                    details.GetDeliveryOrderDetails(objData.DeliveryOrderID);

                    decimal total = objData.GetDeliveryOrderTotals(objData.DeliveryOrderID);

                    /* restore items to stock */
                    for (int i = 0; i < details.RowCount; i++)
                    {
                        IStock.BLL.Items item = new IStock.BLL.Items();
                        item.LoadByPrimaryKey(details.ItemID);
                        item.Quantity += details.Quantity;
                        details.MoveNext();
                        item.Save();
                    }
                    /* restore items to stock */

                    details.MarkAsDeleted();
                    details.Save();

                    /* update client credit */
                    IStock.BLL.Clients client = new IStock.BLL.Clients();
                    client.LoadByPrimaryKey(objData.ClientID);
                    client.StartCredit -= total;
                    client.Save();
                    /* update client credit */


                    IStock.BLL.ClientReturns cr = new IStock.BLL.ClientReturns ();
                    cr.GetClientReturnByDeliveryOrderID(objData.DeliveryOrderID);
                    if (cr.RowCount > 0)
                    {
                        cr.SetColumnNull("DeliveryOrderID");
                        cr.Save();
                    }

                    objData.MarkAsDeleted();
                    objData.Save();



                    CurrentDeliveryOrder = null;
                    BindOrders();
                }
                catch (Exception ex)
                {
                    uipanelError.Visible = true;
                }
            }
        }


        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentDeliveryOrder = null;
            uipanelError.Visible = false;
            uiPanelEditDeliveryOrder.Visible = true;
            IStock.BLL.DeliveryOrder d = new IStock.BLL.DeliveryOrder();
            uiTextBoxCode.Text = d.getNewSerial();
            uiPanelAllOrders.Visible = false;
        }

        protected void uiLinkButtonBack_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentDeliveryOrder = null;
            uiPanelEditDeliveryOrder.Visible = false;
            uiPanelAllOrders.Visible = true;
            uiPanelItems.Visible = false;
            BindOrders();
        }

        protected void uiLinkButtonOK_Click(object sender, EventArgs e)
        {
            IStock.BLL.DeliveryOrder order = new IStock.BLL.DeliveryOrder();
            if (CurrentDeliveryOrder == null)
                order.AddNew();            
            else
                order = CurrentDeliveryOrder;

            order.DeliveryOrderNo = uiTextBoxCode.Text;
            order.ClientID = Convert.ToInt32(uiDropDownListClients.SelectedValue);
            order.DeliveryOrderDate = DateTime.ParseExact(uiTextBoxDate.Text, "dd/MM/yyyy", null);
            order.EmployeeID = Convert.ToInt32(uiDropDownListEmployee.SelectedValue);
            if (!string.IsNullOrEmpty(uiTextBoxDiscount.Text))
                order.Discount = decimal.Parse(uiTextBoxDiscount.Text);
            else
                order.Discount = 0;
            order.Save();

            IStock.BLL.ClientReturns clientReturn = new IStock.BLL.ClientReturns();
            clientReturn.GetLastClientReturnForDeliveryOrder(order.ClientID);
            if (clientReturn.RowCount > 0)
            {
                clientReturn.DeliveryOrderID = order.DeliveryOrderID;
                clientReturn.Save();
            }

            //ClearFields();
            CurrentDeliveryOrder = order;
            uiPanelEditDeliveryOrder.Visible = true;
            uiPanelAllOrders.Visible = false;
            uiPanelItems.Visible = true;
            //EnableDisableActions();            
            BindItems();
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentDeliveryOrder = null;
            uiPanelEditDeliveryOrder.Visible = false;
            uiPanelAllOrders.Visible = true;
            uiPanelItems.Visible = false;
        }



        protected void uiLinkButtonAddItem_Click(object sender, EventArgs e)
        {
            /* get items from stock */
            IStock.BLL.Items item = new IStock.BLL.Items();
            item.LoadByPrimaryKey(Convert.ToInt32(uiHiddenFieldCurrentItem.Value));
            if (!item.IsColumnNull("Quantity"))
            {
                if (item.Quantity == 0 || Convert.ToInt32(uiTextBoxQty.Text) > item.Quantity)
                {
                    ErrorDiv.Visible = true;
                    uiLabelError.Text = GetLocalResourceObject("ItemQtyError").ToString();
                    return;
                }
                item.Quantity -= Convert.ToInt32(uiTextBoxQty.Text);

            }
            else 
            {
                ErrorDiv.Visible = true;
                uiLabelError.Text = GetLocalResourceObject("ItemQtyError").ToString();
                return;
            }
            item.Save();
            /* get items from stock */

            IStock.BLL.DeliveryOrderDetails detail = new IStock.BLL.DeliveryOrderDetails();
            detail.AddNew();
            detail.DeliveryOrderID = CurrentDeliveryOrder.DeliveryOrderID;
            detail.ItemID = Convert.ToInt32(uiHiddenFieldCurrentItem.Value);
            //detail.ItemID = Convert.ToInt32(uiDropDownListItems.SelectedValue);
            detail.Quantity = Convert.ToInt32(uiTextBoxQty.Text);
            detail.ItemPrice = decimal.Parse(uiTextBoxPrice.Text);
            detail.Save();

           

            decimal price = 0;
            if (!CurrentDeliveryOrder.IsColumnNull("Discount") && CurrentDeliveryOrder.Discount != 0)
            {
                price = detail.ItemPrice * detail.Quantity * (CurrentDeliveryOrder.Discount / 100);
            }
            else
            {
                price = detail.ItemPrice * detail.Quantity;
            }

            IStock.BLL.Clients client = new IStock.BLL.Clients();
            client.LoadByPrimaryKey(CurrentDeliveryOrder.ClientID);
            if (!client.IsColumnNull("StartCredit"))
                client.StartCredit += price;
            else
                client.StartCredit = price;
            client.Save();
            ErrorDiv.Visible = false;
            uiTextBoxItems.Text = "";
            uiTextBoxPrice.Text = "";
            uiTextBoxQty.Text = "";
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
                IStock.BLL.DeliveryOrderDetails objData = new IStock.BLL.DeliveryOrderDetails();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                decimal price = 0;
                if (!CurrentDeliveryOrder.IsColumnNull("Discount") && CurrentDeliveryOrder.Discount != 0)
                {
                    price = objData.ItemPrice * objData.Quantity * (CurrentDeliveryOrder.Discount / 100);
                }
                else
                {
                    price = objData.ItemPrice * objData.Quantity;
                }

                /* restore items to stock */
                IStock.BLL.Items item = new IStock.BLL.Items();
                item.LoadByPrimaryKey(objData.ItemID);
                item.Quantity += objData.Quantity;                
                item.Save();
                /* restore items to stock */


                IStock.BLL.Clients client = new IStock.BLL.Clients();
                client.LoadByPrimaryKey(CurrentDeliveryOrder.ClientID);
                client.StartCredit -= price;
                client.Save();

                objData.MarkAsDeleted();
                objData.Save();               
                BindItems();
            }
        }


        protected void uiDropDownListItems_SelectedIndexChanged(object sender, EventArgs e)
        {
            IStock.BLL.Clients client = new IStock.BLL.Clients();
            client.LoadByPrimaryKey(CurrentDeliveryOrder.ClientID);
            
            IStock.BLL.ItemPrices price = new IStock.BLL.ItemPrices();
            if(!string.IsNullOrEmpty(uiDropDownListItems.SelectedValue))
                price.LoadByPrimaryKey(client.ClientTypeID, Convert.ToInt32(uiDropDownListItems.SelectedValue));

            if (price.RowCount > 0)
            {
                uiTextBoxPrice.Text = price.Price.ToString();
            }
            else
            {
                uiTextBoxPrice.Text = "";
            }
        }


        protected void uiLinkButtonCreateInvoice_Click(object sender, EventArgs e)
        {
            IStock.BLL.Invoices invoice = new IStock.BLL.Invoices();
            string code = invoice.getNewSerial();
            invoice.AddNew();
            invoice.InvoiceNo = code;
            invoice.ClientID = CurrentDeliveryOrder.ClientID;
            invoice.InvoiceDate = CurrentDeliveryOrder.DeliveryOrderDate;
            invoice.EmployeeID = CurrentDeliveryOrder.EmployeeID;
            invoice.DeliveryOrderID = CurrentDeliveryOrder.DeliveryOrderID;
            if (!CurrentDeliveryOrder.IsColumnNull("Discount"))
                invoice.Discount = CurrentDeliveryOrder.Discount;
            else
                invoice.Discount = 0;
            invoice.Save();

            IStock.BLL.DeliveryOrderDetails details = new IStock.BLL.DeliveryOrderDetails();
            IStock.BLL.InvoiceDetails invoicedetails = new IStock.BLL.InvoiceDetails();

            details.GetDeliveryOrderDetails(CurrentDeliveryOrder.DeliveryOrderID);

            for (int i = 0; i < details.RowCount; i++)
            {
                invoicedetails.AddNew();
                invoicedetails.InvoiceID = invoice.InvoiceID;
                invoicedetails.ItemID = details.ItemID;
                invoicedetails.ItemPrice = details.ItemPrice;
                invoicedetails.Quantity = details.Quantity;                
                details.MoveNext();
            }
            invoicedetails.Save();
            //EnableDisableActions();
        }


        protected void uiLinkButtonPrint_Click(object sender, EventArgs e)
        {
            Session["Report_DeliveryOrderID"] = CurrentDeliveryOrder.DeliveryOrderID.ToString();
            Session["CurrentReport"] = "Report_DeliveryOrder";
            Response.Redirect("Reports.aspx");
        }
        #endregion

        #region methods


        private void loadDDLs()
        {
            IStock.BLL.Clients Clients = new IStock.BLL.Clients();
            Clients.LoadAll();
            Clients.Sort = "Name";
            uiDropDownListClients.DataSource = Clients.DefaultView;
            uiDropDownListClients.DataTextField = "Name";
            uiDropDownListClients.DataValueField = "ClientID";
            uiDropDownListClients.DataBind();
            uiDropDownListClients.Items.Insert(0, new ListItem("إختر العميل",""));

            IStock.BLL.Employees employees = new IStock.BLL.Employees();
            employees.LoadAll();
            employees.Sort = "Name";
            uiDropDownListEmployee.DataSource = employees.DefaultView;
            uiDropDownListEmployee.DataTextField = "Name";
            uiDropDownListEmployee.DataValueField = "EmployeeID";
            uiDropDownListEmployee.DataBind();
            uiDropDownListEmployee.Items.Insert(0, new ListItem("إختر الموظف",""));

           /* IStock.BLL.Items items = new IStock.BLL.Items();
            items.LoadAll();
            items.Sort = "Name";
            uiDropDownListItems.DataSource = items.DefaultView;
            uiDropDownListItems.DataTextField = "Name";
            uiDropDownListItems.DataValueField = "ItemID";
            uiDropDownListItems.DataBind();
            uiDropDownListItems.Items.Insert(0, new ListItem("إختر صنف", ""));      */      
        }


        private void BindOrders()
        {
            IStock.BLL.DeliveryOrder Orders = new IStock.BLL.DeliveryOrder();
            Orders.GetAllDeliveryOrders();            
            uiGridViewOrders.DataSource = Orders.DefaultView;
            uiGridViewOrders.DataBind();
        }


        private void BindItems()
        {
            IStock.BLL.DeliveryOrderDetails details = new IStock.BLL.DeliveryOrderDetails();
            details.GetDeliveryOrderDetails(CurrentDeliveryOrder.DeliveryOrderID);
            uiGridViewItems.DataSource = details.DefaultView;
            uiGridViewItems.DataBind();
            IStock.BLL.ClientReturns cr = new IStock.BLL.ClientReturns();
            cr.GetClientReturnByDeliveryOrderID(CurrentDeliveryOrder.DeliveryOrderID);
            if (cr.RowCount > 0)
            {
                uiTextBoxTotal.Text = (CurrentDeliveryOrder.GetDeliveryOrderTotals(CurrentDeliveryOrder.DeliveryOrderID) - cr.GetClientReturnTotals(cr.ClientReturnID)).ToString();
                uiLabelClientReturn.Text = cr.ReturnNo;
                uiTextBoxTotalReturn.Text = cr.GetClientReturnTotals(cr.ClientReturnID).ToString();
            }
            else
                uiTextBoxTotal.Text = CurrentDeliveryOrder.GetDeliveryOrderTotals(CurrentDeliveryOrder.DeliveryOrderID).ToString();
        }


        private void ClearFields()
        {
            uiTextBoxCode.Text = "";
            uiTextBoxDate.Text = "";
            uiTextBoxDiscount.Text = "";
            uiTextBoxTotalReturn.Text = "";
            uiLabelClientReturn.Text = "";
            uiDropDownListClients.SelectedIndex = 0;
            uiDropDownListEmployee.SelectedIndex = 0;
        }



        private void EnableDisableActions()
        {
            IStock.BLL.Invoices invoice = new IStock.BLL.Invoices();
            invoice.GetDeliveryOrderInvoice(CurrentDeliveryOrder.DeliveryOrderID);
            if (invoice.RowCount == 0)
                uiPanelActions.Visible = true;
            else
                uiPanelActions.Visible = false;
        }

        #endregion




    }
}