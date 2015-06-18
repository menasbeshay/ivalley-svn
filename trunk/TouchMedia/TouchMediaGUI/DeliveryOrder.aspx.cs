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
            BLL.DeliveryOrder DlvO = new BLL.DeliveryOrder();
            DlvO.LoadAll();
            GrdDeliveryOrder.DataSource = DlvO.DefaultView;
            GrdDeliveryOrder.DataBind();
           
            
            BLL.DeliveryOrderDetails DOD = new DeliveryOrderDetails();
            DOD.LoadAll();
            grdDeliveryOrderDetails.DataSource = DOD.DefaultView;
            grdDeliveryOrderDetails.DataBind();



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
           
            DO.AddNew();
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

            DO.Save();
        }
    }
}