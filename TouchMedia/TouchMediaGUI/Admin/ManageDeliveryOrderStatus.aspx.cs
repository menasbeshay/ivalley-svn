using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace TouchMediaGUI.Admin
{
    public partial class ManageDeliveryOrderStatus : System.Web.UI.Page
    {
        public int EditDeliveryOrderStatus
        {
            get
            {
                if (Session["EditDeliveryOrderStatus"] != null)
                {
                    return int.Parse(Session["EditDeliveryOrderStatus"].ToString());
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                Session["EditDeliveryOrderStatus"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.PageTitle = "ادارة حالة طلب النقل";
                bindData();
            }
        }
        public void bindData()
        {
            DeliveryOrderStatus status = new DeliveryOrderStatus();
            status.LoadAll();
            GridViewStatus.DataSource = status.DefaultView;
            GridViewStatus.DataBind();
        }

        public void ClearFields()
        {
            EditDeliveryOrderStatus = 0;
            txtStatusName.Text = "";
            txtStatusNameAr.Text = "";
            dropDownStatusColor.SelectedIndex = 0;
        }

        protected void btnNewStatus_Click(object sender, EventArgs e)
        {
            ClearFields();
            panelStatusEdit.Visible = true;
            panelStatusGrid.Visible = false;
        }

        protected void GridViewStatus_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "editStatus")
            {
                DeliveryOrderStatus status = new DeliveryOrderStatus();
                status.LoadByPrimaryKey(int.Parse(e.CommandArgument.ToString()));
                txtStatusName.Text = status.DeliveryOrderStatusName;
                txtStatusNameAr.Text = status.DeliveryOrderStatusNameAr;
                dropDownStatusColor.Value = status.StatusClass;
                EditDeliveryOrderStatus = int.Parse(e.CommandArgument.ToString());
                panelStatusGrid.Visible = false;
                panelStatusEdit.Visible = true;
            }
            else if (e.CommandName == "deleteStatus")
            {
                DeliveryOrderStatus status = new DeliveryOrderStatus();
                status.LoadByPrimaryKey(int.Parse(e.CommandArgument.ToString()));
                status.MarkAsDeleted();
                status.Save();
                bindData();
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            panelStatusEdit.Visible = false;
            panelStatusGrid.Visible = true;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            DeliveryOrderStatus status = new DeliveryOrderStatus();

            if (EditDeliveryOrderStatus > 0)
            {
                status.LoadByPrimaryKey(EditDeliveryOrderStatus);
            }
            else
            {
                status.AddNew();
            }
            status.DeliveryOrderStatusName = txtStatusName.Text;
            status.DeliveryOrderStatusNameAr = txtStatusNameAr.Text;
            status.StatusClass = dropDownStatusColor.Value;
            status.Save();

            ClearFields();
            bindData();
            panelStatusGrid.Visible = true;
            panelStatusEdit.Visible = false;

        }
    }
}