using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace I_Stock.Admin
{
    public partial class Invoice : System.Web.UI.Page
    {
        #region properties
        public IStock.BLL.Invoices CurrentInvoice
        {
            get
            {
                if (Session["CurrentInvoice"] != null)
                    return (IStock.BLL.Invoices)Session["CurrentInvoice"];
                else
                    return null;
            }
            set
            {
                Session["CurrentInvoice"] = value;
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
                BindInvoices();
                uiPanelEditInvoice.Visible = false;
                uiPanelAllInvoices.Visible = true;
                uiPanelItems.Visible = false;
            }
        }

        protected void uiGridViewInvoices_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewInvoices.PageIndex = e.NewPageIndex;
            BindInvoices();
        }

        protected void uiGridViewInvoices_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditInvoice")
            {
                IStock.BLL.Invoices objData = new IStock.BLL.Invoices();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                uiTextBoxCode.Text = objData.InvoiceNo;
                uiTextBoxDate.Text = objData.InvoiceDate.ToString("dd/MM/yyy");
                uiDropDownListClients.SelectedValue = objData.ClientID.ToString();
                uiDropDownListEmployee.SelectedValue = objData.EmployeeID.ToString();
                if (!objData.IsColumnNull("Discount"))
                    uiTextBoxDiscount.Text = objData.Discount.ToString();
                uiPanelAllInvoices.Visible = false;
                uiPanelEditInvoice.Visible = true;
                uiPanelItems.Visible = true;
                CurrentInvoice = objData;
                BindItems();
            }
            else if (e.CommandName == "DeleteInvoice")
            {
                try
                {
                    IStock.BLL.Invoices objData = new IStock.BLL.Invoices();
                    objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                    IStock.BLL.InvoiceDetails details = new IStock.BLL.InvoiceDetails();
                    details.GetInvoicerDetails(objData.InvoiceID);

                    decimal total = objData.GetInvoiceTotals(objData.InvoiceID);

                    details.MarkAsDeleted();
                    details.Save();

                    IStock.BLL.ClientReturns cr = new IStock.BLL.ClientReturns();
                    cr.GetClientReturnByInvoiceID(objData.InvoiceID);
                    if (cr.RowCount > 0)
                    {
                        cr.SetColumnNull("InvoiceID");
                        cr.Save();
                    }

                    objData.MarkAsDeleted();
                    objData.Save();
                    CurrentInvoice = null;
                    BindInvoices();
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
            CurrentInvoice = null;
            uiPanelEditInvoice.Visible = true;
            IStock.BLL.Invoices invoice = new IStock.BLL.Invoices();
            uiTextBoxCode.Text = invoice.getNewSerial();
            uiPanelAllInvoices.Visible = false;
        }

        protected void uiLinkButtonBack_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentInvoice = null;
            uiPanelEditInvoice.Visible = false;
            uiPanelAllInvoices.Visible = true;
            uiPanelItems.Visible = false;
            BindInvoices();
        }

        protected void uiLinkButtonOK_Click(object sender, EventArgs e)
        {
            IStock.BLL.Invoices invoice = new IStock.BLL.Invoices();
            if (CurrentInvoice == null)
                invoice.AddNew();
            else
                invoice = CurrentInvoice;

            invoice.InvoiceNo = uiTextBoxCode.Text;
            invoice.ClientID = Convert.ToInt32(uiDropDownListClients.SelectedValue);
            invoice.InvoiceDate = DateTime.ParseExact(uiTextBoxDate.Text, "dd/MM/yyyy", null);
            invoice.EmployeeID = Convert.ToInt32(uiDropDownListEmployee.SelectedValue);
            if (!string.IsNullOrEmpty(uiTextBoxDiscount.Text))
                invoice.Discount = decimal.Parse(uiTextBoxDiscount.Text);
            else
                invoice.Discount = 0;

            invoice.Save();

            ///* get last Client Return */
            //IStock.BLL.ClientReturns Return = new IStock.BLL.ClientReturns();
            //Return.GetLastClientReturnForInvoice(invoice.ClientID);
            //if (Return.RowCount > 0)
            //{
            //    Return.InvoiceID = invoice.InvoiceID;
            //    Return.Save();
            //}
            //ClearFields();
            CurrentInvoice = invoice;
            uiPanelEditInvoice.Visible = true;
            uiPanelAllInvoices.Visible = false;
            uiPanelItems.Visible = true;
            BindItems();
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentInvoice = null;
            uiPanelEditInvoice.Visible = false;
            uiPanelAllInvoices.Visible = true;
            uiPanelItems.Visible = false;
        }



        protected void uiLinkButtonAddItem_Click(object sender, EventArgs e)
        {
            IStock.BLL.InvoiceDetails detail = new IStock.BLL.InvoiceDetails();
            detail.AddNew();
            detail.InvoiceID = CurrentInvoice.InvoiceID;
            if (uiDropDownListItems.SelectedIndex != -1)
                detail.ItemID = Convert.ToInt32(uiDropDownListItems.SelectedValue);
            else
            {
                uiPanelErrorItems.Visible = true;   
                return;
            }
            detail.Quantity = Convert.ToInt32(uiTextBoxQty.Text);
            detail.ItemPrice = decimal.Parse(uiTextBoxPrice.Text);
            detail.Save();
            uiPanelErrorItems.Visible = false;
            /*
            decimal price = 0;
            if (!CurrentInvoice.IsColumnNull("Discount") && CurrentInvoice.Discount != 0)
            {
                price = detail.ItemPrice * detail.Quantity * (CurrentInvoice.Discount / 100);
            }
            else
            {
                price = detail.ItemPrice * detail.Quantity;
            }

            IStock.BLL.Clients client = new IStock.BLL.Clients();
            client.LoadByPrimaryKey(CurrentInvoice.ClientID);
            client.StartCredit += price;
            client.Save();
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
                IStock.BLL.InvoiceDetails objData = new IStock.BLL.InvoiceDetails();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                /*
                decimal price = 0;
                if (!CurrentInvoice.IsColumnNull("Discount") && CurrentInvoice.Discount != 0)
                {
                    price = objData.ItemPrice * objData.Quantity * (CurrentInvoice.Discount / 100);
                }
                else
                {
                    price = objData.ItemPrice * objData.Quantity;
                }

                IStock.BLL.Clients client = new IStock.BLL.Clients();
                client.LoadByPrimaryKey(CurrentInvoice.ClientID);
                client.StartCredit -= price;
                client.Save();
                */
                objData.MarkAsDeleted();
                objData.Save();
                BindItems();
            }
        }


        protected void uiDropDownListItems_SelectedIndexChanged(object sender, EventArgs e)
        {
            IStock.BLL.Clients client = new IStock.BLL.Clients();
            client.LoadByPrimaryKey(CurrentInvoice.ClientID);

            IStock.BLL.ItemPrices price = new IStock.BLL.ItemPrices();
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
            uiDropDownListClients.Items.Insert(0, new ListItem("إختر العميل", ""));

            IStock.BLL.Employees employees = new IStock.BLL.Employees();
            employees.LoadAll();
            employees.Sort = "Name";
            uiDropDownListEmployee.DataSource = employees.DefaultView;
            uiDropDownListEmployee.DataTextField = "Name";
            uiDropDownListEmployee.DataValueField = "EmployeeID";
            uiDropDownListEmployee.DataBind();
            uiDropDownListEmployee.Items.Insert(0, new ListItem("إختر الموظف", ""));

            IStock.BLL.Items items = new IStock.BLL.Items();
            items.LoadAll();
            items.Sort = "Name";
            uiDropDownListItems.DataSource = items.DefaultView;
            uiDropDownListItems.DataTextField = "Name";
            uiDropDownListItems.DataValueField = "ItemID";
            uiDropDownListItems.DataBind();
            uiDropDownListItems.Items.Insert(0, new ListItem("إختر الصنف", ""));
        }


        private void BindInvoices()
        {
            IStock.BLL.Invoices invoices = new IStock.BLL.Invoices();
            invoices.GetAllInvoices();
            uiGridViewInvoices.DataSource = invoices.DefaultView;
            uiGridViewInvoices.DataBind();
        }


        private void BindItems()
        {
            IStock.BLL.InvoiceDetails details = new IStock.BLL.InvoiceDetails();
            details.GetInvoicerDetails(CurrentInvoice.InvoiceID);
            uiGridViewItems.DataSource = details.DefaultView;
            uiGridViewItems.DataBind();

            IStock.BLL.ClientReturns Return = new IStock.BLL.ClientReturns();
            if (!CurrentInvoice.IsColumnNull("DeliveryOrderID"))
                Return.GetClientReturnByDeliveryOrderID(CurrentInvoice.DeliveryOrderID);
            if (Return.RowCount > 0)
            {
                uiTextBoxTotal.Text = (CurrentInvoice.GetInvoiceTotals(CurrentInvoice.InvoiceID) - Return.GetClientReturnTotals(Return.ClientReturnID)).ToString();
                uiLabelClientReturn.Text = Return.ReturnNo;
                uiTextBoxTotalReturn.Text = Return.GetClientReturnTotals(Return.ClientReturnID).ToString();
            }
            else
                uiTextBoxTotal.Text = CurrentInvoice.GetInvoiceTotals(CurrentInvoice.InvoiceID).ToString();
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



        #endregion

    }
}