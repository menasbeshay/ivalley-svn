using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Profile;
using EGEMech.BLL;
namespace website
{
    public partial class MyAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserLoggedIn"] != null)
            {
                BindData();
                BindUserData();
            }
            else
            {
                Response.Redirect("UserLogin.aspx");
            }
        }

        protected void uiGridViewOrders_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewOrders.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewOrders_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewOrder")
            {
                Order order = new Order();
                order.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument));
                Session["ViewCurrentOrder"] = order;
                Response.Redirect("MyOrders.aspx");
            }
           
        }

        protected void uiButtonRegister_Click(object sender, EventArgs e)
        {
            Users user = (Users)Session["UserLoggedIn"];
            user.FirstName = uiTextBoxFN.Text;
            user.LastName = uiTextBoxLN.Text;            
            user.Password = uiTextBoxPassword.Text;
            user.Mail = uiTextBoxMail.Text;
            user.Address = uiTextBoxAddress.Text;
            user.City = uiTextBoxCity.Text;
            user.Country = uiTextBoxCountry.Text;
            user.Phone = uiTextBoxPhone.Text;
            user.Fax = uiTextBoxFax.Text;
            user.PostalCode = uiTextBoxPC.Text;
            user.State = uiTextBoxState.Text;
            user.Save();
            BindUserData();
        }

        private void BindData()
        {
            Users user = (Users)Session["UserLoggedIn"];
            Order myorders = new Order();
            myorders.GetAllOrdersByUserID(user.UserID);
            uiGridViewOrders.DataSource = myorders.DefaultView;
            uiGridViewOrders.DataBind();
        }

        private void BindUserData()
        {
            Users user = (Users)Session["UserLoggedIn"];
            uiTextBoxFN.Text = user.FirstName;
            uiTextBoxLN.Text = user.LastName;
            uiLabelUserName.Text = user.UserName;
            uiTextBoxMail.Text = user.Mail;
            uiTextBoxAddress.Text = user.Address;
            uiTextBoxCity.Text = user.City;
            uiTextBoxCountry.Text = user.Country;
            uiTextBoxFax.Text = user.Fax;
            uiTextBoxPhone.Text = user.Phone;
            uiTextBoxPC.Text = user.PostalCode;
            uiTextBoxState.Text = user.State;
        }

       
    }
}