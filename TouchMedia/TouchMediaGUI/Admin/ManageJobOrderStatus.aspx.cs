using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace TouchMediaGUI.Admin
{
    public partial class ManageJobOrderStatus : System.Web.UI.Page
    {

        public int EditJobOrderStatus
        {
            get
            {
                if (Session["EditJobOrderStatus"] != null)
                {
                    return int.Parse(Session["EditJobOrderStatus"].ToString());
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                Session["EditJobOrderStatus"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.PageTitle = "ادارة حالة طلب الشغل";
                bindData();
            }
        }
        public void bindData()
        {
            JobOrderStatus status = new JobOrderStatus();
            status.LoadAll();
            GridViewStatus.DataSource = status.DefaultView;
            GridViewStatus.DataBind();
        }

        public void ClearFields()
        {
            EditJobOrderStatus = 0;
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
                JobOrderStatus status = new JobOrderStatus();
                status.LoadByPrimaryKey(int.Parse(e.CommandArgument.ToString()));
                txtStatusName.Text = status.JobOrderStatusName;
                txtStatusNameAr.Text = status.JobOrderStatusNameAr;
                dropDownStatusColor.Value = status.StatusClass;
                EditJobOrderStatus = int.Parse(e.CommandArgument.ToString());
                panelStatusGrid.Visible = false;
                panelStatusEdit.Visible = true;
            }
            else if (e.CommandName == "deleteStatus")
            {
                JobOrderStatus status = new JobOrderStatus();
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
            JobOrderStatus status = new JobOrderStatus();

            if (EditJobOrderStatus > 0)
            {
                status.LoadByPrimaryKey(EditJobOrderStatus);
            }
            else
            {
                status.AddNew();
            }
            status.JobOrderStatusName = txtStatusName.Text;
            status.JobOrderStatusNameAr = txtStatusNameAr.Text;
            status.StatusClass = dropDownStatusColor.Value;
            status.Save();

            ClearFields();
            bindData();
            panelStatusGrid.Visible = true;
            panelStatusEdit.Visible = false;

        }
    }
}