using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IStock.BLL;

namespace I_Stock.Admin
{
    public partial class Companies : System.Web.UI.Page
    {

        #region properties
        public IStock.BLL.Companies CurrentCompany
        {
            get
            {
                if (Session["CurrentCompany"] != null)
                    return (IStock.BLL.Companies)Session["CurrentCompany"];
                else
                    return null;
            }
            set
            {
                Session["CurrentCompany"] = value;
            }
        }

        #endregion

        #region events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.CustomPageTitle = GetLocalResourceObject("Title").ToString();
                BindComapnies();
                uipanelError.Visible = false;
                uiPanelEditCompanies.Visible = false;
                uiPanelAllCompanies.Visible = true;
            }
        }

        protected void uiLinkButtonBack_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentCompany = null;
            uiPanelEditCompanies.Visible = false;
            uiPanelAllCompanies.Visible = true;
            BindComapnies();
        }

        protected void uiLinkButtonOK_Click(object sender, EventArgs e)
        {
            IStock.BLL.Companies company = new IStock.BLL.Companies();
            if (CurrentCompany == null)
                company.AddNew();
            else
                company = CurrentCompany;

            company.Name = uiTextBoxName.Text;
            company.Description = uiTextBoxDesc.Text;
            company.Address = uiTextBoxAddress.Text;
            company.Save();
            ClearFields();
            CurrentCompany = null;
            uiPanelEditCompanies.Visible = false;
            uiPanelAllCompanies.Visible = true;
            BindComapnies();
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentCompany = null;
            uiPanelEditCompanies.Visible = false;
            uiPanelAllCompanies.Visible = true;
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentCompany = null;
            uiPanelEditCompanies.Visible = true;
            uiPanelAllCompanies.Visible = false;
        }

        protected void uiGridViewCompanies_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewCompanies.PageIndex = e.NewPageIndex;
            BindComapnies();
        }

        protected void uiGridViewCompanies_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditCompany")
            {
                IStock.BLL.Companies objData = new IStock.BLL.Companies();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                uiTextBoxName.Text = objData.Name;
                uiTextBoxDesc.Text = objData.Description;
                uiTextBoxAddress.Text = objData.Address;

                uiPanelAllCompanies.Visible = false;
                uiPanelEditCompanies.Visible = true;
                CurrentCompany = objData;

                BindComapnies();
            }
            else if (e.CommandName == "DeleteCompany")
            {
                try
                {
                    IStock.BLL.Companies objData = new IStock.BLL.Companies();
                    objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                    objData.MarkAsDeleted();
                    objData.Save();
                    CurrentCompany = null;
                    BindComapnies();
                }
                catch (Exception ex)
                {
                    uipanelError.Visible = true;
                }
            }
        }
        #endregion

        #region methods

        private void BindComapnies()
        {
            IStock.BLL.Companies companies = new IStock.BLL.Companies();
            companies.LoadAll();
            companies.Sort = "Name";
            uiGridViewCompanies.DataSource = companies.DefaultView;
            uiGridViewCompanies.DataBind();
        }

        private void ClearFields()
        {
            uiTextBoxName.Text = "";
            uiTextBoxDesc.Text = "";
            uiTextBoxAddress.Text = "";
        }


        #endregion
    }
}