using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyGeneration.dOOdads;
using BLL;



namespace TouchMediaGUI
{
    public partial class DeliveryOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.PageTitle = "اوامر النقل";
            }

            DeliveryOrderBind();
            DeliveryOrderDetailsBind();

            if (getQueryString_DeliveryOrder > 0)
            {
                BLL.DeliveryOrder EditDO = new BLL.DeliveryOrder();
                EditDO.LoadByPrimaryKey(getQueryString_DeliveryOrder);
                txtCarNumber.Text = EditDO.CarNumber;
                txtClientCode.Text = (EditDO.ClientCode).ToString();
                txtkiloMeterAfter.Text = EditDO.KilometerCounterAfter.ToString();
                txtKiloMeterBefore.Text = EditDO.KilometerCounterBefore.ToString();
                txtTotalPrice.Text = EditDO.TotalPrice.ToString();
                txtGeneralDeliveryCode.Text = EditDO.GeneralDeliveryCode;
                drpTransformationSupplier.Text = EditDO.TransformationSupplier;
                txtDriverName.Text = EditDO.DriverName;
                txtDriverNationID.Text = EditDO.DriverNationID.ToString();
                txtDriverTelephone.Text = EditDO.DriverTelephone;
                if (!EditDO.IsColumnNull("WatingHours"))
                    txtWatingHours.Text = EditDO.WatingHours.ToString();
                else
                    txtWatingHours.Text = "0";
                txtPermission.Text = EditDO.PermationNumber.ToString();
                txtDepartment.Text = EditDO.Department;
                txtDeliveryOrderName.Text = EditDO.DeliveryOrderName;
            }



            BLL.DeliveryOrderStatus DOS = new DeliveryOrderStatus();
            DOS.LoadAll();
            txtStatus.DataSource = DOS.DefaultView;
            txtStatus.DataValueField = DeliveryOrderStatus.ColumnNames.DeliveryOrderStatusID;
            txtStatus.DataTextField = DeliveryOrderStatus.ColumnNames.DeliveryOrderStatusName;
            
            txtStatus.DataBind();

            BLL.TransformationSupplier DOO = new BLL.TransformationSupplier();
            DOO.LoadAll();
            drpTransformationSupplier.DataSource = DOO.DefaultView;
            drpTransformationSupplier.DataValueField = TransformationSupplier.ColumnNames.TransformationSupplierID;
            drpTransformationSupplier.DataTextField = TransformationSupplier.ColumnNames.TransformationSupplierName;
            drpTransformationSupplier.DataBind();
        }

        protected void addDeliveryOrderDetailsGrd_Click(object sender, EventArgs e)
        {


            BLL.DeliveryOrderDetails Dodd = new DeliveryOrderDetails();
           


                Dodd.AddNew();
                Dodd.DeliveryFrom = txtDeliveryFrom.Text;
                Dodd.DeliveryTo = txtDeliveryTo.Text;
                Dodd.DateFrom = Convert.ToDateTime(txtDateFrom.Text);
                Dodd.DateTo = Convert.ToDateTime(txtDateTo.Text);
                Dodd.ReceivableName = txtRecivableName.Text;
                Dodd.ReceivableTelephone = txtRecivableTelephone.Text;
                Dodd.DeliveryOrderCode = txtDeliveryOrderCode.Text;
                Dodd.WatingHours = float.Parse(txtWatingHours.Text);
                Dodd.Price = float.Parse(txtPrice.Text);
                Dodd.DeliveryOrderStatusID = int.Parse(txtStatus.SelectedItem.Value);
                Dodd.Save();
                
        }

        protected void btnDeliceryOrderGrd_Click(object sender, EventArgs e)
        {
            BLL.DeliveryOrder DO = new BLL.DeliveryOrder();

            if (getQueryString_DeliveryOrder > 0)
            {
                DO.LoadByPrimaryKey(getQueryString_DeliveryOrder);
            }
            else
            {
                DO.AddNew();
            }
            
            DO.ClientCode = int.Parse(txtClientCode.Text);
            DO.DeliveryOrderName = txtDeliveryOrderName.Text;
            DO.Department = txtDepartment.Text;
            DO.PermationNumber = int.Parse(txtPermission.Text);
            DO.TransformationSupplier = drpTransformationSupplier.SelectedItem.Value;
            DO.CarNumber = txtCarNumber.Text;
            DO.KilometerCounterBefore = decimal.Parse(txtKiloMeterBefore.Text);
            DO.KilometerCounterAfter = decimal.Parse(txtkiloMeterAfter.Text);
            DO.DriverName = txtDriverName.Text;
            DO.DriverNationID = int.Parse(txtDriverNationID.Text);
            DO.DriverTelephone = txtDriverTelephone.Text;
            DO.GeneralDeliveryCode = txtGeneralDeliveryCode.Text;
            DO.TotalPrice = double.Parse(txtTotalPrice.Text);
            DO.DeliveryOrderStatusID = int.Parse(txtStatus.SelectedValue);
            DO.Save();
            Response.Redirect("DeliveryOrder.aspx");
        }
        private void DeliveryOrderBind()
        {
            BLL.DeliveryOrder DlvO = new BLL.DeliveryOrder();
            DlvO.LoadAll();
            GrdDeliveryOrder.DataSource = DlvO.DefaultView;
            GrdDeliveryOrder.DataBind();
        }
        private void DeliveryOrderDetailsBind()
        {
            BLL.DeliveryOrderDetails DOD = new DeliveryOrderDetails();
            DOD.LoadAll();
            grdDeliveryOrderDetails.DataSource = DOD.DefaultView;
            grdDeliveryOrderDetails.DataBind();
        }
        private int getQueryString_DeliveryOrder
        {
            get
            {
                if (!string.IsNullOrEmpty(Request.QueryString["DeliveryOrderID"]))
                {
                    return int.Parse(Request.QueryString["DeliveryOrderID"].ToString());
                }
                else
                {
                    return 0;
                }
            }
        }
        private int getQueryString_DeliveryOrderDetails
        {
            get
            {
                if (!string.IsNullOrEmpty(Request.QueryString["DeliveryOrderDetailsID"]))
                {
                    return int.Parse(Request.QueryString["DeliveryOrderDetailsID"].ToString());
                }
                else
                {
                    return 0;
                }
            }
        }

        protected void GrdDeliveryOrder_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            if (e.CommandName == "DeleteGrdDO")
            {
                BLL.DeliveryOrder DelDO = new BLL.DeliveryOrder();
                DeliveryOrderDetails DelDetails = new DeliveryOrderDetails();
                DelDO.LoadByPrimaryKey(int.Parse(e.CommandArgument.ToString()));
                DelDetails.getDetails(int.Parse(e.CommandArgument.ToString()));
                DelDetails.DeleteAll();
                DelDetails.Save();
                DelDO.MarkAsDeleted();
                DelDO.Save();
               

            }
            else if (e.CommandName == "EditGrdDO")
            {
                int ID = int.Parse(e.CommandArgument.ToString());
                Response.Redirect("DeliveryOrder.aspx?DeliveryOrderID=" + ID.ToString());

            }
            DeliveryOrderBind();
        }

        protected void grdDeliveryOrderDetails_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteGrdDetailsDO")
            {
                DeliveryOrderDetails DelDODetails = new DeliveryOrderDetails();
                DelDODetails.LoadByPrimaryKey(int.Parse(e.CommandArgument.ToString()));
                DelDODetails.MarkAsDeleted();
                DelDODetails.Save();
            }
        }
    }
}