using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace TouchMediaGUI.Admin
{
    public partial class ManageDesigners : System.Web.UI.Page
    {
        public int EditDesigner
        {
            get
            {
                if (Session["EditDesigner"] != null)
                {
                    return int.Parse(Session["EditDesigner"].ToString());
                }
                else
                {
                    return 0;
                }
            }
            set
            {
                Session["EditDesigner"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.PageTitle = "ادارة المصممين";
                bindData();
            }
        }
        public void bindData()
        {
            GeneralLookup AllDesigners = new GeneralLookup();
            AllDesigners.Where.CategoryID.Value = 1;
            AllDesigners.Where.CategoryID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
            AllDesigners.Query.Load();
            GridViewDesigners.DataSource = AllDesigners.DefaultView;
            GridViewDesigners.DataBind();
        }
        public void ClearFields()
        {
            EditDesigner = 0;
            txtDesignerAddress.Text = "";
            txtDesignerEmail.Text = "";
            txtDesignerTelephone.Text = "";
            txtDesignerName.Text = "";
        }
        protected void btnNewDesigner_Click(object sender, EventArgs e)
        {
            ClearFields();
            panelDesignersEdit.Visible = true;
            panelDesignersGrid.Visible = false;
        }
        protected void GridViewDesigners_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "editDesigner")
            {
                GeneralLookup designer = new GeneralLookup();
                designer.LoadByPrimaryKey(int.Parse(e.CommandArgument.ToString()));
                txtDesignerAddress.Text = designer.Address;
                txtDesignerEmail.Text = designer.Email;
                txtDesignerName.Text = designer.Name;
                txtDesignerTelephone.Text = designer.Telephone;
                EditDesigner = int.Parse(e.CommandArgument.ToString());
                panelDesignersEdit.Visible = true;
                panelDesignersGrid.Visible = false;
            }
            else if (e.CommandName == "deleteDesigner")
            {
                GeneralLookup designer = new GeneralLookup();
                designer.LoadByPrimaryKey(int.Parse(e.CommandArgument.ToString()));
                designer.MarkAsDeleted();
                designer.Save();
                bindData();
            }
        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            panelDesignersEdit.Visible = false;
            panelDesignersGrid.Visible = true;
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            GeneralLookup designer = new GeneralLookup();

            if (EditDesigner > 0)
            {
                designer.LoadByPrimaryKey(EditDesigner);
            }
            else
            {
                designer.AddNew();
            }
            designer.Name = txtDesignerName.Text;
            designer.Address = txtDesignerAddress.Text;
            designer.Email = txtDesignerEmail.Text;
            designer.Telephone = txtDesignerTelephone.Text;
            designer.CategoryID = 1;
            designer.Save();

            ClearFields();
            bindData();
            panelDesignersGrid.Visible = true;
            panelDesignersEdit.Visible = false;
        }
    }
}