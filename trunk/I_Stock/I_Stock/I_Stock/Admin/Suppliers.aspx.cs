using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IStock.BLL;

namespace I_Stock.Admin
{
    public partial class Suppliers : System.Web.UI.Page
    {
        #region properties
        public IStock.BLL.Suppliers CurrentSupplier
        {
            get
            {
                if (Session["CurrentSupplier"] != null)
                    return (IStock.BLL.Suppliers)Session["CurrentSupplier"];
                else
                    return null;
            }
            set
            {
                Session["CurrentSupplier"] = value;
            }
        }

        #endregion

        #region events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.CustomPageTitle = GetLocalResourceObject("Title").ToString();
                BindSupplier();
                uipanelError.Visible = false;
                uiPanelEditSupplier.Visible = false;
                uiPanelAllSupp.Visible = true;
            }
        }

        protected void uiLinkButtonBack_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentSupplier = null;
            uiPanelEditSupplier.Visible = false;
            uiPanelAllSupp.Visible = true;
            BindSupplier();
        }

        protected void uiLinkButtonOK_Click(object sender, EventArgs e)
        {
            IStock.BLL.Suppliers Supp = new IStock.BLL.Suppliers();
            if (CurrentSupplier == null)
                Supp.AddNew();
            else
                Supp = CurrentSupplier;

            Supp.Name = uiTextBoxName.Text;
            Supp.Description = uiTextBoxDesc.Text;
            Supp.Save();
            ClearFields();
            CurrentSupplier = null;
            uiPanelEditSupplier.Visible = false;
            uiPanelAllSupp.Visible = true;
            BindSupplier();
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentSupplier = null;
            uiPanelEditSupplier.Visible = false;
            uiPanelAllSupp.Visible = true;
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentSupplier = null;
            uiPanelEditSupplier.Visible = true;
            uiPanelAllSupp.Visible = false;
        }

        protected void uiGridViewSupps_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewSupps.PageIndex = e.NewPageIndex;
            BindSupplier();
        }

        protected void uiGridViewSupps_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditSupp")
            {
                IStock.BLL.Suppliers objData = new IStock.BLL.Suppliers();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                uiTextBoxName.Text = objData.Name;
                uiTextBoxDesc.Text = objData.Description;

                uiPanelAllSupp.Visible = false;
                uiPanelEditSupplier.Visible = true;
                CurrentSupplier = objData;

                BindSupplier();
            }
            else if (e.CommandName == "DeleteSupp")
            {
                try
                {
                    IStock.BLL.Suppliers objData = new IStock.BLL.Suppliers();
                    objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                    objData.MarkAsDeleted();
                    objData.Save();
                    CurrentSupplier = null;
                    BindSupplier();
                }
                catch (Exception ex)
                {
                    uipanelError.Visible = true;
                }
            }
        }
        #endregion

        #region methods

        private void BindSupplier()
        {
            IStock.BLL.Suppliers Supps = new IStock.BLL.Suppliers();
            Supps.LoadAll();
            Supps.Sort = "Name";
            uiGridViewSupps.DataSource = Supps.DefaultView;
            uiGridViewSupps.DataBind();
        }

        private void ClearFields()
        {
            uiTextBoxName.Text = "";
            uiTextBoxDesc.Text = "";
        }


        #endregion
    }
}