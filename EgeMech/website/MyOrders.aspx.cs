using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EGEMech.BLL;
namespace website
{
    public partial class MyOrders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserLoggedIn"] != null)
            {
                if (Session["ViewCurrentOrder"] != null)
                {
                    BindOrder();
                }
                else
                {
                    Response.Redirect("MyAccount.aspx");
                }
            }
            else
            {
                Response.Redirect("UserLogin.aspx");
            }
        }

        private void BindOrder()
        {
            Order order = (Order)Session["ViewCurrentOrder"];
            uiLabelOrderNumber.Text = order.OrderNumber;
            OrderStatus status = new OrderStatus ();
            status.LoadByPrimaryKey(order.OrderStatusID);
            uiLabelStatus.Text = status.Name;
            uiLabelDate.Text = order.Orderdate.ToString("dd/MM/yyyy");

            uiLabelFullName.Text = order.FirstName + " " + order.LastName;
            uiLabelCity.Text = order.City;
            uiLabelCountry.Text = order.Country;
            uiLabelFax.Text = order.Fax;
            uiLabelTele.Text = order.Phone;
            uiLabelMail.Text = order.Mail;

            uiHyperLinkInvoice.NavigateUrl = "ViewOrder.aspx?oid=" + order.OrderID.ToString();

            BindDetails();
            BindHistory();
        }

        private void BindHistory()
        {
            Order order = (Order)Session["ViewCurrentOrder"];
            OrderStatusHistory his = new OrderStatusHistory();
            his.GetOrderStatusHistory(order.OrderID);
            uiGridViewHistory.DataSource = his.DefaultView;
            uiGridViewHistory.DataBind();
        }

        private void BindDetails()
        {
            Order order = (Order)Session["ViewCurrentOrder"];
            OrderDetails details = new OrderDetails();
            details.GetOrderDetails(order.OrderID);
            uiGridViewProducts.DataSource = details.DefaultView;
            uiGridViewProducts.DataBind();
        }

        protected void uiGridViewProducts_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewProducts.PageIndex = e.NewPageIndex;
            BindDetails();
        }

        protected void uiGridViewHistory_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewHistory.PageIndex = e.NewPageIndex;
            BindHistory();
        }
    }
}