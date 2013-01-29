using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GlobalLogistics.BLL;

namespace GlobalLogistics.WebSite.Administrator
{
    public partial class EditCurrency : System.Web.UI.Page
    {
        #region properties
        public BLL.Currency CurrentCurrency
        {
            get
            {
                if (Session["CurrentCurrency"] != null)
                    return (BLL.Currency)Session["CurrentCurrency"];
                else
                    return null;
            }
            set
            {
                Session["CurrentCurrency"] = value;
            }
        }
        #endregion
        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
                uiPanelViewCurrency.Visible = true;
                uiPanelEdit.Visible = false;
            }   
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            Clearfields();
            uiPanelEdit.Visible = true;
            uiPanelViewCurrency.Visible = false;
        }

        protected void uiGridViewCurrency_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewCurrency.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewCurrency_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditCurrency")
            {
                Currency objData = new Currency();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                uiTextBoxEnName.Text = objData.EnName;
                uiTextBoxArName.Text = objData.ArName;
                uiTextBoxCode.Text = objData.Code;
                uiPanelViewCurrency.Visible = false;
                uiPanelEdit.Visible = true;
                CurrentCurrency = objData;
            }
            else if (e.CommandName == "DeleteCurrency")
            {
                Currency objData = new Currency();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
                CurrentCurrency = null;
                BindData();
            }
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            if (CurrentCurrency != null)
            {
                UpdateRecord();
            }
            else
            {
                AddNewRecord();
            }

            uiPanelEdit.Visible = false;
            uiPanelViewCurrency.Visible = true;
            BindData();
            Clearfields();
            CurrentCurrency = null;
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            Clearfields();
            uiPanelEdit.Visible = false;
            uiPanelViewCurrency.Visible = true;
        }
        #endregion
        #region Methods 
        
        private void BindData()
        {
            Currency objData = new Currency();
            objData.LoadAll();
            uiGridViewCurrency.DataSource = objData.DefaultView;
            uiGridViewCurrency.DataBind();
        }


        private void Clearfields()
        {
            uiTextBoxEnName.Text = "";
            uiTextBoxArName.Text = "";            
            uiLabelError.Visible = false;
        }

        private void AddNewRecord()
        {
            Currency objData = new Currency();
            objData.AddNew();
            objData.EnName = uiTextBoxEnName.Text;
            objData.ArName = uiTextBoxArName.Text;
            objData.Code = uiTextBoxCode.Text;
            objData.Save();
        }

        private void UpdateRecord()
        {
            Currency objData = CurrentCurrency;            
            objData.EnName = uiTextBoxEnName.Text;
            objData.ArName = uiTextBoxArName.Text;
            objData.Code = uiTextBoxCode.Text;
            objData.Save();
        }

        #endregion
    }
}