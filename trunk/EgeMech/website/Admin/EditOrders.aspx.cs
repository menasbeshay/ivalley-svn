using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EGEMech.BLL;

namespace website.Admin
{
    public partial class EditOrders : System.Web.UI.Page
    {
        #region properties
        public Order CurrentOrder
        {
            get
            {
                if (Session["CurrentOrder"] != null)
                    return (Order)Session["CurrentOrder"];
                else
                    return null;
            }
            set
            {
                Session["CurrentOrder"] = value;
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
                        uiPanelViewOrders.Visible = true;
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
            uiPanelViewOrders.Visible = false;
            Order order = new Order();
            uiLabelNo.Text = order.getNewSerial();     
            Clearfields();
        }

        protected void uiGridViewOrders_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewOrders.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewOrders_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditOrders")
            {
                Order order = new Order();
                order.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument));
                CurrentOrder = order;
                uiLabelNo.Text = order.OrderNumber;
                uiTextBoxFN.Text = order.FirstName;
                uiTextBoxLN.Text = order.LastName;
                uiTextBoxAddress.Text = order.Address;
                uiTextBoxCity.Text = order.City;
                uiTextBoxState.Text = order.State;
                uiTextBoxFax.Text = order.Fax;
                uiTextBoxTelephone.Text = order.Phone;
                uiTextBoxMail.Text = order.Mail;
                if (!order.IsColumnNull("OrderStatusID"))
                    uiDropDownListStatus.SelectedValue = order.OrderStatusID.ToString();


                if (!order.IsColumnNull("UserID"))
                    uiDropDownListUsers.SelectedValue = order.UserID.ToString();
                uiPanelViewOrders.Visible = false;
                uiPanelEdit.Visible = true;
                BindItems();
            }
            else if (e.CommandName == "DeleteOrders")
            {
                try
                {
                    Order order = new Order();
                    order.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument));
                    order.MarkAsDeleted();
                    order.Save();
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
            Order order = new Order();
            if (CurrentOrder != null)
            {
                order = CurrentOrder;
            }
            else
            {
                order.AddNew();
                order.OrderNumber = order.getNewSerial();
                order.Orderdate = DateTime.Now;
            }

            order.FirstName = uiTextBoxFN.Text ;
            order.LastName = uiTextBoxLN.Text;
            order.Address = uiTextBoxAddress.Text;
            order.City = uiTextBoxCity.Text;
            order.State = uiTextBoxState.Text;
            order.Fax = uiTextBoxFax.Text;
            order.Phone = uiTextBoxTelephone.Text;
            order.Mail = uiTextBoxMail.Text;
            if(!string.IsNullOrEmpty(uiDropDownListStatus.SelectedValue))
                order.OrderStatusID = Convert.ToInt32(uiDropDownListStatus.SelectedValue);


            if (!string.IsNullOrEmpty(uiDropDownListUsers.SelectedValue))
                order.UserID = Convert.ToInt32(uiDropDownListUsers.SelectedValue);
            order.Save();
            uiPanelEdit.Visible = true;
            uiPanelViewOrders.Visible = false;
            Clearfields();
            BindData();
            
            CurrentOrder = order;
            BindItems();
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            uiPanelEdit.Visible = false;
            uiPanelViewOrders.Visible = true;
            Clearfields();
            CurrentOrder = null;

        }

        protected void uiDropDownListProducts_SelectedIndexChanged(object sender, EventArgs e)
        {
            Product pro = new Product();
            pro.LoadByPrimaryKey(Convert.ToInt32(uiDropDownListProducts.SelectedValue));
            if(!pro.IsColumnNull("Price"))
                uiTextBoxPrice.Text = pro.Price.ToString();
        }


        protected void uiLinkButtonAddItem_Click(object sender, EventArgs e)
        {
            OrderDetails detail = new OrderDetails();
            detail.AddNew();
            detail.OrderID = CurrentOrder.OrderID;
            detail.ProductID = Convert.ToInt32(uiDropDownListProducts.SelectedValue);
            detail.Quantity = Convert.ToInt32(uiTextBoxQty.Text);
            detail.ItemPrice = decimal.Parse(uiTextBoxPrice.Text);
            detail.Save();
            
            BindItems();
        }

        protected void uiGridViewProducts_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewProducts.PageIndex = e.NewPageIndex;
            BindItems();
        }

        protected void uiGridViewProducts_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteDetail")
            {
                OrderDetails objData = new OrderDetails();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                
                objData.MarkAsDeleted();
                objData.Save();
                BindItems();
            }
        }


        protected void uiDropDownListUsers_SelectedIndexChanged(object sender, EventArgs e)
        {
            Users user = new Users();
            user.LoadByPrimaryKey(Convert.ToInt32(uiDropDownListUsers.SelectedValue));
            uiTextBoxFN.Text = user.FirstName;
            uiTextBoxLN.Text = user.LastName;
            uiTextBoxAddress.Text = user.Address;
            uiTextBoxCity.Text = user.City;
            uiTextBoxState.Text = user.State;
            uiTextBoxFax.Text = user.Fax;
            uiTextBoxTelephone.Text = user.Phone;
            uiTextBoxMail.Text = user.Mail;
        }


        protected void uiLinkButtonUpdateStatus_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(uiDropDownListStatus.SelectedValue))
            {
                CurrentOrder.OrderStatusID = Convert.ToInt32(uiDropDownListStatus.SelectedValue);
                CurrentOrder.Save();

                OrderStatusHistory history = new OrderStatusHistory();
                history.AddNew();
                history.ChangeDate = DateTime.Now;
                history.OrderID = CurrentOrder.OrderID;
                history.OrderStatusID = CurrentOrder.OrderStatusID;
                history.Save();
            }
        }

        #endregion

        #region methods

        private void LoadDDLs()
        {
            Users users = new Users();
            users.GetAllUsers();
            uiDropDownListUsers.DataSource = users.DefaultView;
            uiDropDownListUsers.DataTextField = "DisplayName";
            uiDropDownListUsers.DataValueField = "UserID";
            uiDropDownListUsers.DataBind();
            uiDropDownListUsers.Items.Insert(0, new ListItem("Choose user", ""));

            Product product = new Product();
            product.GetAllProducts();
            uiDropDownListProducts.DataSource = product.DefaultView;
            uiDropDownListProducts.DataTextField = "Name";
            uiDropDownListProducts.DataValueField = "ProductID";
            uiDropDownListProducts.DataBind();
            uiDropDownListProducts.Items.Insert(0, new ListItem("Choose product", ""));

            OrderStatus orderStatus = new OrderStatus();
            orderStatus.LoadAll();
            uiDropDownListStatus.DataSource = orderStatus.DefaultView;
            uiDropDownListStatus.DataTextField = "Name";
            uiDropDownListStatus.DataValueField = "OrderStatusID";
            uiDropDownListStatus.DataBind();
            uiDropDownListStatus.Items.Insert(0, new ListItem("Choose status", ""));
        }

        private void BindData()
        {
            Order orders = new Order();
            orders.GetAllOrders();
            uiGridViewOrders.DataSource = orders.DefaultView;
            uiGridViewOrders.DataBind();
        }


        private void BindItems()
        {
            OrderDetails details = new OrderDetails();
            details.GetOrderDetails(CurrentOrder.OrderID);
            uiGridViewProducts.DataSource = details.DefaultView;
            uiGridViewProducts.DataBind();
            //uiTextBoxTotal.Text = CurrentDeliveryOrder.GetDeliveryOrderTotals(CurrentDeliveryOrder.DeliveryOrderID).ToString();
        }

        private void Clearfields()
        {
            uiTextBoxFN.Text = "";
            uiTextBoxLN.Text = "";
            uiTextBoxAddress.Text = "";
            uiTextBoxCity.Text = "";
            uiTextBoxState.Text = "";
            uiTextBoxFax.Text = "";
            uiTextBoxTelephone.Text = "";
            uiTextBoxMail.Text = "";
        }


        #endregion

        
    }
}