using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace TouchMediaGUI
{
    public partial class ManageTransformationSupplier : System.Web.UI.Page
    {

        public int EditTransformationSupplier
        {
            get
            {
                if (Session["EditTransformationSupplier"] != null)
                {
                    return int.Parse(Session["EditTransformationSupplier"].ToString());
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                Session["EditTransformationSupplier"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.PageTitle = "إدارة مقاولين النقل";
                bindData();
            }
        }

        public void bindData()
        {
            TransformationSupplier suppliers = new TransformationSupplier();
            suppliers.LoadAll();
            GridViewSuppliers.DataSource = suppliers.DefaultView;
            GridViewSuppliers.DataBind();
        }
        public void ClearFields()
        {
            EditTransformationSupplier = 0;
            txtSupplierName.Text = "";
            txtSupplierTelephone.Text = "";
            txtSupplierAddress.Text = "";
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            TransformationSupplier supplier = new TransformationSupplier();

            if (EditTransformationSupplier > 0)
            {
                supplier.LoadByPrimaryKey(EditTransformationSupplier);
            }
            else
            {
                supplier.AddNew();
            }
            supplier.TransformationSupplierName = txtSupplierName.Text;
            supplier.TransformationSupplierTelephone = txtSupplierTelephone.Text;
            supplier.TransformationSupplierAddress = txtSupplierAddress.Text;
            supplier.Save();

            ClearFields();
            bindData();
            panelSupplierGrid.Visible = true;
            panelSupplierEdit.Visible = false;
        }
        protected void btnNewSupplier_Click(object sender, EventArgs e)
        {
            ClearFields();
            panelSupplierEdit.Visible = true;
            panelSupplierGrid.Visible = false;
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            panelSupplierEdit.Visible = false;
            panelSupplierGrid.Visible = true;
        }
        protected void GridViewSuppliers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "editSupplier")
            {
                TransformationSupplier supplier = new TransformationSupplier();
                supplier.LoadByPrimaryKey(int.Parse(e.CommandArgument.ToString()));
                txtSupplierName.Text = supplier.TransformationSupplierName;
                txtSupplierTelephone.Text = supplier.TransformationSupplierTelephone;
                txtSupplierAddress.Text = supplier.TransformationSupplierAddress;
                EditTransformationSupplier = int.Parse(e.CommandArgument.ToString());
                panelSupplierGrid.Visible = false;
                panelSupplierEdit.Visible = true;
            }
            else if (e.CommandName == "deleteSupplier")
            {
                TransformationSupplier supplier = new TransformationSupplier();
                supplier.LoadByPrimaryKey(int.Parse(e.CommandArgument.ToString()));
                supplier.MarkAsDeleted();
                supplier.Save();
                bindData();
            }
        }
    }
}