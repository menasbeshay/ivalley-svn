using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace I_Stock.Admin
{
    public partial class ClientReturns : System.Web.UI.Page
    {
        #region properties
        public IStock.BLL.ClientReturns CurrentReturn
        {
            get
            {
                if (Session["CurrentReturn"] != null)
                    return (IStock.BLL.ClientReturns)Session["CurrentReturn"];
                else
                    return null;
            }
            set
            {
                Session["CurrentReturn"] = value;
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
                BindReturns();
                uiPanelEditReturn.Visible = false;
                uiPanelAllReturns.Visible = true;
                uiPanelItems.Visible = false;
            }
        }

        protected void uiGridViewReturns_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewReturns.PageIndex = e.NewPageIndex;
            BindReturns();
        }

        protected void uiGridViewReturns_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditReturn")
            {
                IStock.BLL.ClientReturns objData = new IStock.BLL.ClientReturns();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                uiTextBoxCode.Text = objData.ReturnNo;
                uiTextBoxDate.Text = objData.ReturnDate.ToString("dd/MM/yyy");
                uiDropDownListClients.SelectedValue = objData.ClientID.ToString();
                uiDropDownListEmployee.SelectedValue = objData.EmployeeID.ToString();
                if (!objData.IsColumnNull("Discount"))
                    uiTextBoxDiscount.Text = objData.Discount.ToString();
                uiPanelAllReturns.Visible = false;
                uiPanelEditReturn.Visible = true;
                uiPanelItems.Visible = true;
                CurrentReturn = objData;
                BindItems();
            }
            else if (e.CommandName == "DeleteReturn")
            {
                try
                {
                    IStock.BLL.ClientReturns objData = new IStock.BLL.ClientReturns();
                    objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                    IStock.BLL.ClientReturnDetails details = new IStock.BLL.ClientReturnDetails();
                    details.GetClientReturnDetails(objData.ClientReturnID);
                    
                    details.MarkAsDeleted();
                    details.Save();
                    /*
                    IStock.BLL.Clients client = new IStock.BLL.Clients();
                    client.LoadByPrimaryKey(objData.ClientID);
                    client.StartCredit -= total;
                    client.Save();
                    */
                    objData.MarkAsDeleted();
                    objData.Save();
                    CurrentReturn = null;
                    BindReturns();
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
            CurrentReturn = null;
            uiPanelEditReturn.Visible = true;
            IStock.BLL.ClientReturns Return = new IStock.BLL.ClientReturns();
            uiTextBoxCode.Text = Return.getNewSerial();
            uiPanelAllReturns.Visible = false;
        }

        protected void uiLinkButtonBack_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentReturn = null;
            uiPanelEditReturn.Visible = false;
            uiPanelAllReturns.Visible = true;
            uiPanelItems.Visible = false;
            BindReturns();
        }

        protected void uiLinkButtonOK_Click(object sender, EventArgs e)
        {
            IStock.BLL.ClientReturns clientreturn = new IStock.BLL.ClientReturns();
            if (CurrentReturn == null)
                clientreturn.AddNew();
            else
                clientreturn = CurrentReturn;

            clientreturn.ReturnNo = uiTextBoxCode.Text;
            clientreturn.ClientID = Convert.ToInt32(uiDropDownListClients.SelectedValue);
            clientreturn.ReturnDate = DateTime.ParseExact(uiTextBoxDate.Text, "dd/MM/yyyy", null);
            clientreturn.EmployeeID = Convert.ToInt32(uiDropDownListEmployee.SelectedValue);
            if (!string.IsNullOrEmpty(uiTextBoxDiscount.Text))
                clientreturn.Discount = decimal.Parse(uiTextBoxDiscount.Text);
            else
                clientreturn.Discount = 0;
            clientreturn.Save();
            //ClearFields();
            CurrentReturn = clientreturn;
            uiPanelEditReturn.Visible = true;
            uiPanelAllReturns.Visible = false;
            uiPanelItems.Visible = true;
            BindItems();
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentReturn = null;
            uiPanelEditReturn.Visible = false;
            uiPanelAllReturns.Visible = true;
            uiPanelItems.Visible = false;
        }



        protected void uiLinkButtonAddItem_Click(object sender, EventArgs e)
        {
            IStock.BLL.ClientReturnDetails detail = new IStock.BLL.ClientReturnDetails();
            detail.AddNew();
            detail.ClientReturnID = CurrentReturn.ClientReturnID;
            //if (uiDropDownListItems.SelectedIndex != -1)
            if (!string.IsNullOrEmpty(uiHiddenFieldCurrentItem.Value))
            {
                //detail.ItemID = Convert.ToInt32(uiDropDownListItems.SelectedValue);
                detail.ItemID = Convert.ToInt32(uiHiddenFieldCurrentItem.Value);
            }
            else
            {
                uiPanelErrorItems.Visible = true;
                return;
            }
            try
            {
                detail.Quantity = Convert.ToInt32(uiTextBoxQty.Text);
            }
            catch (Exception ex)
            {
                return;
            }
            try
            {
                detail.Valid = Convert.ToInt32(uiTextBoxValid.Text);
            }
            catch (Exception ex)
            {
                return;
            }
            try
            {
                detail.ItemPrice = decimal.Parse(uiTextBoxPrice.Text);
            }
            catch (Exception ex)
            {
                return;
            }
            detail.Save();
            uiPanelErrorItems.Visible = false;
            
            decimal price = 0;
            if (!CurrentReturn.IsColumnNull("Discount") && CurrentReturn.Discount != 0)
            {
                price = detail.ItemPrice * detail.Quantity * (CurrentReturn.Discount / 100);
            }
            else
            {
                price = detail.ItemPrice * detail.Quantity;
            }

            IStock.BLL.Clients client = new IStock.BLL.Clients();
            client.LoadByPrimaryKey(CurrentReturn.ClientID);
            if (!client.IsColumnNull("StartCredit"))
                client.StartCredit -= price;
            else
                client.StartCredit = -price;
            client.Save();


            IStock.BLL.Items item = new IStock.BLL.Items();
            item.LoadByPrimaryKey(detail.ItemID);
            item.Quantity += detail.Valid;
            item.Save();
            
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
                IStock.BLL.ClientReturnDetails objData = new IStock.BLL.ClientReturnDetails();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                
                decimal price = 0;
                if (!objData.IsColumnNull("Discount") && objData.Discount != 0)
                {
                    price = objData.ItemPrice * objData.Quantity * (objData.Discount / 100);
                }
                else
                {
                    price = objData.ItemPrice * objData.Quantity;
                }

                IStock.BLL.Clients client = new IStock.BLL.Clients();
                IStock.BLL.ClientReturns returns = new IStock.BLL.ClientReturns ();
                returns.LoadByPrimaryKey(objData.ClientReturnID);
                client.LoadByPrimaryKey(returns.ClientID);
                client.StartCredit += price;
                client.Save();

                IStock.BLL.Items item = new IStock.BLL.Items();
                item.LoadByPrimaryKey(objData.ItemID);
                if(!objData.IsColumnNull("Valid"))
                    item.Quantity -= objData.Valid;
                item.Save();
                
                objData.MarkAsDeleted();
                objData.Save();
                BindItems();
            }
        }


        protected void uiDropDownListItems_SelectedIndexChanged(object sender, EventArgs e)
        {
            IStock.BLL.Clients client = new IStock.BLL.Clients();
            client.LoadByPrimaryKey(CurrentReturn.ClientID);

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

        protected void uiLinkButtonPrint_Click(object sender, EventArgs e)
        {
            Session["Report_ClientReturnID"] = CurrentReturn.ClientReturnID.ToString();
            Session["CurrentReport"] = "Report_ClientReturn";
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
            uiDropDownListItems.Items.Insert(0, new ListItem("إختر الصنف",""));*/
        }


        private void BindReturns()
        {
            IStock.BLL.ClientReturns invoices = new IStock.BLL.ClientReturns();
            invoices.GetAllClientReturns();
            uiGridViewReturns.DataSource = invoices.DefaultView;
            uiGridViewReturns.DataBind();
        }


        private void BindItems()
        {
            IStock.BLL.ClientReturnDetails details = new IStock.BLL.ClientReturnDetails();
            details.GetClientReturnDetails(CurrentReturn.ClientReturnID);
            uiGridViewItems.DataSource = details.DefaultView;
            uiGridViewItems.DataBind();
            uiTextBoxTotal.Text = CurrentReturn.GetClientReturnTotals(CurrentReturn.ClientReturnID).ToString();
        }


        private void ClearFields()
        {
            uiTextBoxCode.Text = "";
            uiTextBoxDate.Text = "";
            uiTextBoxDiscount.Text = "";
            uiDropDownListClients.SelectedIndex = 0;
            uiDropDownListEmployee.SelectedIndex = 0;
        }



        #endregion

        

    }
}