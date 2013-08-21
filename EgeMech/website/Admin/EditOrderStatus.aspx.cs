using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EGEMech.BLL;

namespace website.Admin
{
    public partial class EditOrderStatus : System.Web.UI.Page
    {
        #region properties
        public OrderStatus CurrentStatus
        {
            get
            {
                if (Session["CurrentStatus"] != null)
                    return (OrderStatus)Session["CurrentStatus"];
                else
                    return null;
            }
            set
            {
                Session["CurrentStatus"] = value;
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
                        BindData();
                        uiPanelViewStatus.Visible = true;
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
            uiPanelViewStatus.Visible = false;
            Clearfields();
        }

        protected void uiGridViewStatus_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewStatus.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewStatus_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditStatus")
            {
                OrderStatus orderStatus = new EGEMech.BLL.OrderStatus();
                orderStatus.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument));
                CurrentStatus = orderStatus;
                
                uiTextBoxName.Text = orderStatus.Name;

                uiPanelViewStatus.Visible = false;
                uiPanelEdit.Visible = true;
            }
            else if (e.CommandName == "DeleteStatus")
            {
                try
                {
                    OrderStatus orderStatus = new EGEMech.BLL.OrderStatus();
                    orderStatus.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument));
                    orderStatus.MarkAsDeleted();
                    orderStatus.Save();
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
            OrderStatus status = new OrderStatus();
            if (CurrentStatus != null)
            {
                status = CurrentStatus;
            }
            else
            {
                status.AddNew();
            }

            
            status.Name = uiTextBoxName.Text;
            status.Save();
            uiPanelEdit.Visible = false;
            uiPanelViewStatus.Visible = true;
            Clearfields();
            BindData();
            CurrentStatus = null;
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            uiPanelEdit.Visible = false;
            uiPanelViewStatus.Visible = true;
            Clearfields();
            CurrentStatus = null;

        }
        #endregion

        #region methods

        private void BindData()
        {
            OrderStatus Status = new OrderStatus();
            Status.LoadAll();
            uiGridViewStatus.DataSource = Status.DefaultView;
            uiGridViewStatus.DataBind();
        }


        private void Clearfields()
        {           
            uiTextBoxName.Text = "";           
        }


        #endregion
    }
}