﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using MyGeneration.dOOdads;

namespace TouchMediaGUI
{
    public partial class PurchaseOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.PageTitle = "اوامر الشراء";

                BindGeneralPurchaseOrder();

                if (getQueryString_PurchaseOrder > 0)
                {
                    BLL.PurchaseOrder PoG = new BLL.PurchaseOrder();
                    PoG.LoadByPrimaryKey(getQueryString_PurchaseOrder);
                    txtPurchaseOrderNumber.Text = PoG.PurchaseOrderNumber;
                    txtPurchaseOrderDate.Text = PoG.PurchaseOrderDate.ToString("dd/MM/yyyy");
                    txtManagement.Text = PoG.Management;
                    
                    //if(CheckBoxList1.Items.IndexOf(0)
                    //{
                    
                    //}
                    txtDeliveryDate.Text = PoG.DeliveryDate.ToString("dd/MM/yyyy");
                    txtDeliveryPlace.Text = PoG.DeliveryPlace;
                    txtPaymentRequirement.Text = PoG.PaymentRequierment;
                    TxtManagerName.Text = PoG.ManagerName;
                    uiCheckBoxListType.Items[0].Selected = PoG.ISFinalProduct;
                    uiCheckBoxListType.Items[1].Selected = PoG.ISSample;
                    uiCheckBoxListType.Items[2].Selected = PoG.ISProductUnderManufacturing;
                    BindDetailsPurchaseOrder();

                    PanelPurchaseOrdersGrid.Visible = false;
                    PanelPurchaseOrderGeneral.Visible = true;
                    PanelGrdPurcahseOrderDetails.Visible = true;
                    PanelPurchaseOrderDetails.Visible = true;

                    
                }
                if(getQueryString_PurchaseOrderDetails > 0)
                {
                    PurchaseOrderDetails POD = new PurchaseOrderDetails();
                    POD.LoadByPrimaryKey(getQueryString_PurchaseOrderDetails);
                    txtTotalValue.Text = POD.TotalValue.ToString();
                    txtUnitPrice.Text = POD.UnitPrice.ToString();
                    txtQuantityRequired.Text = POD.QuantityRequired.ToString();
                    txtStockOnHands.Text = POD.StockOnHand.ToString();
                    txtUnit.Text = POD.Unit.ToString();
                    txtDescription.Text = POD.Description;
                    
                }
               
            }
            //BindGeneralPurchaseOrder();
            //BindDetailsPurchaseOrder();
            
        }
        private void BindGeneralPurchaseOrder()
        {
            BLL.PurchaseOrder Po = new BLL.PurchaseOrder();
            Po.LoadAll();
            GrdViewPurchaseOrders.DataSource = Po.DefaultView;
            GrdViewPurchaseOrders.DataBind();
        }
        private void BindDetailsPurchaseOrder()
        {
            BLL.PurchaseOrderDetails PoD = new PurchaseOrderDetails();
            PoD.getPurchaseDetails(getQueryString_PurchaseOrder);
            grdPurchaseOrderDetails.DataSource = PoD.DefaultView;
            grdPurchaseOrderDetails.DataBind();
        }

       

        protected void btnSavePurchaseOrderGeneralGrid_Click(object sender, EventArgs e)
        {
            BLL.PurchaseOrder Pur = new BLL.PurchaseOrder();
            if (getQueryString_PurchaseOrder > 0)
            {
                Pur.LoadByPrimaryKey(getQueryString_PurchaseOrder);
            }
            else
            {
                Pur.AddNew();
                Pur.CreatedBy = new Guid(Membership.GetUser().ProviderUserKey.ToString());
                Pur.CreatedDate = DateTime.Now;
            }
            Pur.PurchaseOrderNumber = txtPurchaseOrderNumber.Text;
            Pur.PurchaseOrderDate = DateTime.ParseExact(txtPurchaseOrderDate.Text, "dd/MM/yyyy", null);
            Pur.Management = txtManagement.Text;
            Pur.DeliveryDate = DateTime.ParseExact(txtDeliveryDate.Text, "dd/MM/yyyy", null);
            Pur.DeliveryPlace = txtDeliveryPlace.Text;
            Pur.PaymentRequierment = txtPaymentRequirement.Text;
            Pur.ManagerName = TxtManagerName.Text;
            Pur.ISFinalProduct = uiCheckBoxListType.Items[0].Selected;
            Pur.ISProductUnderManufacturing = uiCheckBoxListType.Items[2].Selected;
            Pur.ISSample = uiCheckBoxListType.Items[1].Selected;
            Pur.UpdatedBy = new Guid(Membership.GetUser().ProviderUserKey.ToString());
            Pur.LastUpdatedDate = DateTime.Now;
            Pur.Save();

            PanelPurchaseOrdersGrid.Visible = true;
            PanelPurchaseOrderGeneral.Visible = false;
            PanelGrdPurcahseOrderDetails.Visible = true;
            PanelPurchaseOrderDetails.Visible = true;
            
            Response.Redirect("PurchaseOrder.aspx?PurchaseOrderID=" + Pur.PurchaseOrderID.ToString());

           
        }

        protected void btnCancelPurchaseOrderGeneralGrid_Click(object sender, EventArgs e)
        {
            Response.Redirect("PurchaseOrder.aspx");
        }

        protected void btnSavePurchaseOrderDetails_Click(object sender, EventArgs e)
        {
            PurchaseOrderDetails Purd = new PurchaseOrderDetails();
            if (getQueryString_PurchaseOrderDetails > 0)
            {
                Purd.LoadByPrimaryKey(getQueryString_PurchaseOrderDetails);

            }
            else
            {
                Purd.AddNew();
                Purd.CreatedBy = new Guid(Membership.GetUser().ProviderUserKey.ToString());
                Purd.CreatedDate = DateTime.Now;
            }
            Purd.TotalValue = double.Parse(txtTotalValue.Text);
            Purd.UnitPrice = double.Parse(txtUnitPrice.Text);
            Purd.QuantityRequired = int.Parse(txtQuantityRequired.Text);
            Purd.StockOnHand = int.Parse(txtStockOnHands.Text);
            Purd.Unit = int.Parse(txtUnit.Text);
            Purd.Description = txtDescription.Text;
            Purd.PurchaseOrderID = getQueryString_PurchaseOrder;
            Purd.LastUpdatedDate = DateTime.Now;
            Purd.UpdatedBy = new Guid(Membership.GetUser().ProviderUserKey.ToString());
            Purd.Save();
            
            BindDetailsPurchaseOrder();
            cleardetails();
            
        }

        protected void btnCancelPurchaseOrderDetails_Click(object sender, EventArgs e)
        {
            cleardetails();
        }
        private int getQueryString_PurchaseOrder
        {
            get
            {
                if (!string.IsNullOrEmpty(Request.QueryString["PurchaseOrderID"]))
                {
                    return int.Parse(Request.QueryString["PurchaseOrderID"].ToString());
                }
                else
                {
                    return 0;
                }
            }
        }
        private int getQueryString_PurchaseOrderDetails
        {
            get
            {
                if (!string.IsNullOrEmpty(Request.QueryString["PurchaseOrderDetailsID"]))
                {
                    return int.Parse(Request.QueryString["PurchaseOrderDetailsID"].ToString());
                }
                else
                {
                    return 0;
                }
            }
        }

        protected void GrdViewPurchaseOrders_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "editGeneralOrder")
            {
                int ID = int.Parse(e.CommandArgument.ToString());


                
                Response.Redirect("PurchaseOrder.aspx?PurchaseOrderID=" + ID.ToString());


            }
            else if (e.CommandName == "deleteGeneralOrder")
            {
               BLL.PurchaseOrder purdel = new BLL.PurchaseOrder();
                PurchaseOrderDetails Purddel = new PurchaseOrderDetails();
                purdel.LoadByPrimaryKey(int.Parse(e.CommandArgument.ToString()));
                Purddel.getPurchaseDetails(int.Parse(e.CommandArgument.ToString()));
                Purddel.DeleteAll();
                Purddel.Save();
                purdel.MarkAsDeleted();
                purdel.Save();
            }
            BindGeneralPurchaseOrder();
        }

        protected void grdPurchaseOrderDetails_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "deleteDetailsOrder")
            {
                BLL.PurchaseOrderDetails Del = new BLL.PurchaseOrderDetails();

                Del.LoadByPrimaryKey(int.Parse(e.CommandArgument.ToString()));
                Del.MarkAsDeleted();
                Del.Save();
                BindDetailsPurchaseOrder();

            }
            else if (e.CommandName == "editDetailsOrder")
            {
                int ID = int.Parse(e.CommandArgument.ToString());
                Response.Redirect(Request.Url.AbsolutePath.ToString() + "?PurchaseOrderID=" + Request.QueryString["PurchaseOrderID"].ToString() + "&PurchaseOrderDetailsID=" + ID.ToString());


            }
           
        }
        protected void cleardetails()
        {
            txtTotalValue.Text = "";
            txtUnitPrice.Text = "";
            txtQuantityRequired.Text = "";
            txtStockOnHands.Text = "";
            txtUnit.Text = "";
            txtDescription.Text = "";

        }

        protected void btnAddNewOrder_Click(object sender, EventArgs e)
        {
            PanelPurchaseOrdersGrid.Visible = false;
            PanelPurchaseOrderGeneral.Visible = true;
            PanelGrdPurcahseOrderDetails.Visible = false;
            PanelPurchaseOrderDetails.Visible = false;

        }
    }
}