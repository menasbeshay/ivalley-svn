using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MyGeneration.dOOdads;
using BLL;
using System.Globalization;
using System.Web.Security;



namespace TouchMediaGUI
{
    public partial class DeliveryOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                Master.PageTitle = "اوامر تشغيل السيارات";


                DeliveryOrderBind();


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
                    txtCarType.Text = EditDO.CarType;
                    txtDepartmentResponsable.Text = EditDO.DepartmentResponsableName;
                    txtDeliveryOrderDate.Text = EditDO.DeliveryOrderDate.ToString("dd/MM/yyyy");
                    txtPermission.Text = EditDO.PermationNumber.ToString();
                    drpDepartment.Text = EditDO.Department;
                    txtDeliveryOrderName.Text = EditDO.DeliveryOrderName;
                    drpStatusGeneral.SelectedValue = EditDO.DeliveryOrderStatusID.ToString();
                    drpDepartment.SelectedValue = EditDO.DepartmentID.ToString();
                    DeliveryOrderDetailsBind();

                    WidGrdGeneralDeliveryOrder.Visible = false;
                    WidEditDeliveryOrder.Visible = true;
                    PanelDeliveryOrderDetails.Visible = true;
                    createNewDeliveryOrder.Visible = false;
                }

                if (getQueryString_DeliveryOrderDetails > 0)
                {
                    DeliveryOrderDetails DODEdit = new DeliveryOrderDetails();
                    DODEdit.LoadByPrimaryKey(getQueryString_DeliveryOrderDetails);
                    txtDeliveryFrom.Text = DODEdit.DeliveryFrom;
                    txtDeliveryTo.Text = DODEdit.DeliveryTo;
                    txtDateFrom.Text = DODEdit.DateFrom.ToString("HH:mm");
                    txtDateTo.Text = DODEdit.DateTo.ToString("HH:mm");
                    txtRecivableName.Text = DODEdit.ReceivableName;
                    txtRecivableTelephone.Text = DODEdit.ReceivableTelephone;
                    if (!DODEdit.IsColumnNull("Price"))
                        txtPrice.Text = DODEdit.Price.ToString();
                    else
                        txtPrice.Text = "0.0";
                    txtDeliveryOrderCode.Text = DODEdit.DeliveryOrderCode;
                    drpStatusDetails.Text = DODEdit.DeliveryOrderStatusID.ToString();

                    if (!DODEdit.IsColumnNull("WatingHours"))
                        txtWatingHours.Text = DODEdit.WatingHours.ToString();
                    else
                        txtWatingHours.Text = "0";

                }

                BLL.DeliveryOrderStatus DOS = new DeliveryOrderStatus();
                DOS.LoadAll();
                drpStatusDetails.DataSource = DOS.DefaultView;
                drpStatusDetails.DataValueField = DeliveryOrderStatus.ColumnNames.DeliveryOrderStatusID;
                drpStatusDetails.DataTextField = DeliveryOrderStatus.ColumnNames.DeliveryOrderStatusNameAr;

                drpStatusDetails.DataBind();

                drpStatusGeneral.DataSource = DOS.DefaultView;
                drpStatusGeneral.DataValueField = DeliveryOrderStatus.ColumnNames.DeliveryOrderStatusID;
                drpStatusGeneral.DataTextField = DeliveryOrderStatus.ColumnNames.DeliveryOrderStatusNameAr;
                drpStatusGeneral.DataBind();

                BLL.TransformationSupplier DOO = new BLL.TransformationSupplier();
                DOO.LoadAll();
                drpTransformationSupplier.DataSource = DOO.DefaultView;
                drpTransformationSupplier.DataValueField = TransformationSupplier.ColumnNames.TransformationSupplierID;
                drpTransformationSupplier.DataTextField = TransformationSupplier.ColumnNames.TransformationSupplierName;
                drpTransformationSupplier.DataBind();

                Department dep = new Department();
                dep.LoadAll();
                drpDepartment.DataSource = dep.DefaultView;
                drpDepartment.DataValueField = Department.ColumnNames.DepartmentID;
                drpDepartment.DataTextField = Department.ColumnNames.DepartmentName;
                drpDepartment.DataBind();


            }
        }
        protected void addDeliveryOrderDetailsGrd_Click(object sender, EventArgs e)
        {
            BLL.DeliveryOrderDetails Dodd = new DeliveryOrderDetails();
            if (getQueryString_DeliveryOrderDetails > 0)
            {
                Dodd.LoadByPrimaryKey(getQueryString_DeliveryOrderDetails);
            }
            else
            {
                Dodd.AddNew();
                Dodd.CreatedBy = new Guid(Membership.GetUser().ProviderUserKey.ToString());
                Dodd.CreatedDate = DateTime.Now;
            }

            Dodd.DeliveryFrom = txtDeliveryFrom.Text;
            Dodd.DeliveryTo = txtDeliveryTo.Text;
            Dodd.DateFrom = Convert.ToDateTime(txtDateFrom.Text);
            Dodd.DateTo = Convert.ToDateTime(txtDateTo.Text);
            Dodd.ReceivableName = txtRecivableName.Text;
            Dodd.ReceivableTelephone = txtRecivableTelephone.Text;
            Dodd.DeliveryOrderCode = txtDeliveryOrderCode.Text;
            if (txtWatingHours.Text != "")
            {
                Dodd.WatingHours = float.Parse(txtWatingHours.Text);
            }
            else
                txtWatingHours.Text = "0.0";
            if (txtPrice.Text != "")
            {
                Dodd.Price = float.Parse(txtPrice.Text);
            }
            else
                txtPrice.Text = "0.0";
            Dodd.DeliveryOrderStatusID = int.Parse(drpStatusDetails.SelectedItem.Value);
            Dodd.UpdatedBy = new Guid(Membership.GetUser().ProviderUserKey.ToString());
            Dodd.LastUpdatedDate = DateTime.Now;
            Dodd.DeliveryOrderID = getQueryString_DeliveryOrder;
            Dodd.Save();
            DeliveryOrderDetailsBind();
            grdDeliveryOrderDetails.Visible = true;
            ClearGrdDetails();

        }
        private void ClearGrdDetails()
        {
            txtDeliveryFrom.Text = "";
            txtDeliveryTo.Text = "";
            txtDateFrom.Text = "";
            txtDateTo.Text = "";
            txtRecivableName.Text = "";
            txtRecivableTelephone.Text = "";
            txtDeliveryOrderCode.Text = "";
            txtWatingHours.Text = "";
            txtPrice.Text = "";

        }

        protected void btnDeliceryOrderGrd_Click(object sender, EventArgs e)
        {
            BLL.DeliveryOrder DO = new BLL.DeliveryOrder();

            if (getQueryString_DeliveryOrder > 0)
            {
                DO.LoadByPrimaryKey(getQueryString_DeliveryOrder);
                btnDeliceryOrderGrd.Text = "تعديل أمر نقل";

            }
            else
            {
                DO.AddNew();

                btnDeliceryOrderGrd.Text = "أضافة أمر نقل";
                DO.CreatedBy = new Guid(Membership.GetUser().ProviderUserKey.ToString());
                DO.CreatedDate = DateTime.Now;
            }

            DO.ClientCode = int.Parse(txtClientCode.Text);
            DO.DeliveryOrderName = txtDeliveryOrderName.Text;
            DO.DepartmentID = int.Parse(drpDepartment.SelectedValue);
            if (txtPermission.Text != "")
            {
                DO.PermationNumber = int.Parse(txtPermission.Text);
            }
            else
                txtPermission.Text = "0";
            DO.TransformationSupplier = drpTransformationSupplier.SelectedItem.Value;
            DO.CarNumber = txtCarNumber.Text;
            if (txtKiloMeterBefore.Text != "")
            {
                DO.KilometerCounterBefore = decimal.Parse(txtKiloMeterBefore.Text);
            }
            else
                txtKiloMeterBefore.Text = "0.0";
            if (txtkiloMeterAfter.Text != "")
            {
                DO.KilometerCounterAfter = decimal.Parse(txtkiloMeterAfter.Text);
            }
            else
                txtkiloMeterAfter.Text = "0.0";
            DO.DriverName = txtDriverName.Text;
            DO.DriverNationID = txtDriverNationID.Text;
            DO.DriverTelephone = txtDriverTelephone.Text;
            DO.CarType = txtCarType.Text;
            //var eg = new CultureInfo("eg-EG");
            DO.DeliveryOrderDate = DateTime.ParseExact(txtDeliveryOrderDate.Text, "dd/MM/yyyy", null);
            DO.DepartmentResponsableName = txtDepartmentResponsable.Text;

            DO.GeneralDeliveryCode = txtGeneralDeliveryCode.Text;
            if (txtTotalPrice.Text != "")
            {
                DO.TotalPrice = double.Parse(txtTotalPrice.Text);
            }
            else
                txtTotalPrice.Text = "0.0";
            DO.DeliveryOrderStatusID = int.Parse(drpStatusGeneral.SelectedValue);
            DO.LastUpdatedDate = DateTime.Now;
            DO.UpdatedBy = new Guid(Membership.GetUser().ProviderUserKey.ToString());
            DO.Save();

            Response.Redirect("DeliveryOrder.aspx?DeliveryOrderID=" + DO.DeliveryOrderID.ToString());
            PanelDeliveryOrderDetails.Visible = true;
            WidEditDeliveryOrder.Visible = true;
            WidGrdGeneralDeliveryOrder.Visible = false;
            createNewDeliveryOrder.Visible = false;


        }
        private void DeliveryOrderBind()
        {
            BLL.DeliveryOrder DlvO = new BLL.DeliveryOrder();
            DlvO.getAllDeliveryOrder();
            GrdDeliveryOrder.DataSource = DlvO.DefaultView;
            GrdDeliveryOrder.DataBind();
        }
        private void DeliveryOrderDetailsBind()
        {
            BLL.DeliveryOrderDetails DOD = new DeliveryOrderDetails();
            //DOD.LoadAll();
            //DOD.Where.DeliveryOrderID.Value = getQueryString_DeliveryOrder;
            //DOD.Where.DeliveryOrderID.Operator = WhereParameter.Operand.Equal;
            //DOD.Query.Load();
            DOD.getAllDeliveryOrderDetails(getQueryString_DeliveryOrder);

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
            else if (e.CommandName == "EditGrdDetailsDO")
            {
                int ID = int.Parse(e.CommandArgument.ToString());
                Response.Redirect(Request.Url.AbsolutePath.ToString() + "?DeliveryOrderID=" + Request.QueryString["DeliveryOrderID"].ToString() + "&DeliveryOrderDetailsID=" + ID.ToString());

            }
            DeliveryOrderDetailsBind();
        }


        protected void createNewDeliveryOrder_Click(object sender, EventArgs e)
        {
            WidGrdGeneralDeliveryOrder.Visible = false;
            PanelDeliveryOrderDetails.Visible = false;
            WidEditDeliveryOrder.Visible = true;
            createNewDeliveryOrder.Visible = false;
        }

        protected void btnCancelDeliveryOrderDetails_Click(object sender, EventArgs e)
        {
            ClearGrdDetails();

        }

        protected void btnCancelDeliveryOrderGrid_Click(object sender, EventArgs e)
        {
            Response.Redirect("DeliveryOrder.aspx");


        }


    }
}