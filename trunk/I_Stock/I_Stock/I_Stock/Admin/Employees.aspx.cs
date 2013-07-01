using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace I_Stock.Admin
{
    public partial class Employees : System.Web.UI.Page
    {
        #region properties
        public IStock.BLL.Employees CurrentEmployee
        {
            get
            {
                if (Session["CurrentEmployee"] != null)
                    return (IStock.BLL.Employees)Session["CurrentEmployee"];
                else
                    return null;
            }
            set
            {
                Session["CurrentEmployee"] = value;
            }
        }

        #endregion

        #region events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.CustomPageTitle = GetLocalResourceObject("Title").ToString();
                BindEmployees();
                uipanelError.Visible = false;
                uiPanelEditEmployees.Visible = false;
                uiPanelAllEmp.Visible = true;
            }
        }

        protected void uiLinkButtonBack_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentEmployee = null;
            uiPanelEditEmployees.Visible = false;
            uiPanelAllEmp.Visible = true;
            BindEmployees();
        }

        protected void uiLinkButtonOK_Click(object sender, EventArgs e)
        {
            IStock.BLL.Employees Supp = new IStock.BLL.Employees();
            if (CurrentEmployee == null)
                Supp.AddNew();
            else
                Supp = CurrentEmployee;

            Supp.Name = uiTextBoxName.Text;
            Supp.Description = uiTextBoxDesc.Text;
            Supp.Save();
            ClearFields();
            CurrentEmployee = null;
            uiPanelEditEmployees.Visible = false;
            uiPanelAllEmp.Visible = true;
            BindEmployees();
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentEmployee = null;
            uiPanelEditEmployees.Visible = false;
            uiPanelAllEmp.Visible = true;
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentEmployee = null;
            uiPanelEditEmployees.Visible = true;
            uiPanelAllEmp.Visible = false;
        }

        protected void uiGridViewEmp_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewEmp.PageIndex = e.NewPageIndex;
            BindEmployees();
        }

        protected void uiGridViewEmp_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditEmp")
            {
                IStock.BLL.Employees objData = new IStock.BLL.Employees();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                uiTextBoxName.Text = objData.Name;
                uiTextBoxDesc.Text = objData.Description;

                uiPanelAllEmp.Visible = false;
                uiPanelEditEmployees.Visible = true;
                CurrentEmployee = objData;

                BindEmployees();
            }
            else if (e.CommandName == "DeleteEmp")
            {
                try
                {
                    IStock.BLL.Employees objData = new IStock.BLL.Employees();
                    objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                    objData.MarkAsDeleted();
                    objData.Save();
                    CurrentEmployee = null;
                    BindEmployees();
                }
                catch (Exception ex)
                {
                    uipanelError.Visible = true;
                }
            }
        }
        #endregion

        #region methods

        private void BindEmployees()
        {
            IStock.BLL.Employees Supps = new IStock.BLL.Employees();
            Supps.LoadAll();
            Supps.Sort = "Name";
            uiGridViewEmp.DataSource = Supps.DefaultView;
            uiGridViewEmp.DataBind();
        }

        private void ClearFields()
        {
            uiTextBoxName.Text = "";
            uiTextBoxDesc.Text = "";
        }


        #endregion
    }
}