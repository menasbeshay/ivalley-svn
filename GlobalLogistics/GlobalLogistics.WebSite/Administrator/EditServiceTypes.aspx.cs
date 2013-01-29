using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GlobalLogistics.BLL;
using System.Data;

namespace GlobalLogistics.WebSite.Administrator
{
    public partial class EditServiceTypes : System.Web.UI.Page
    {
        #region properties
        public BLL.ServiceTypes CurrentServiceType
        {
            get
            {
                if (Session["CurrentServiceType"] != null)
                    return (BLL.ServiceTypes)Session["CurrentServiceType"];
                else
                    return null;
            }
            set
            {
                Session["CurrentServiceType"] = value;
            }
        }
        #endregion
        #region Events
        
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
                uiPanelViewServiceTypes.Visible = true;
                uiPanelEdit.Visible = false;
            }
                
        }

        

        protected void uiGridViewServiceTypes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditServiceType")
            {
                ServiceTypes objData = new ServiceTypes();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                uiTextBoxEnName.Text = objData.EnName;
                uiTextBoxArName.Text = objData.ArName;
                CurrentServiceType = objData;
                uiPanelViewServiceTypes.Visible = false;
                uiPanelEdit.Visible = true;
            }
            else if (e.CommandName == "DeleteServiceType")
            {
                ServiceTypes objData = new ServiceTypes();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
                BindData();
            }
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            
            if (CurrentServiceType != null)
            {
                ServiceTypes objData = CurrentServiceType;
                objData.EnName = uiTextBoxEnName.Text;
                objData.ArName = uiTextBoxArName.Text;
                objData.Save();
            }
            else
            {
                ServiceTypes objData = new ServiceTypes ();
                objData.AddNew();
                objData.EnName = uiTextBoxEnName.Text;
                objData.ArName = uiTextBoxArName.Text;
                objData.Save();
            }

           
            uiPanelEdit.Visible = false;
            uiPanelViewServiceTypes.Visible = true;
            BindData();
            CurrentServiceType = null;
            Clearfields();
            
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            Clearfields();
            uiPanelEdit.Visible = true;
            uiPanelViewServiceTypes.Visible = false;
        }

        protected void uiGridViewServiceTypes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewServiceTypes.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            Clearfields();
            uiPanelEdit.Visible = false;
            uiPanelViewServiceTypes.Visible = true;
            CurrentServiceType = null;
        }

        protected void uiButtonSearch_Click(object sender, EventArgs e)
        {
            ServiceTypes objData = new ServiceTypes();
            objData.SearchServiceTypes(uiTextBoxSearch.Text);
            uiGridViewServiceTypes.DataSource = objData.DefaultView;
            uiGridViewServiceTypes.DataBind();
        }
        #endregion
        #region Methods

        private void BindData()
        {
            ServiceTypes objData = new ServiceTypes();
            objData.LoadAll();
            uiGridViewServiceTypes.DataSource = objData.DefaultView;
            uiGridViewServiceTypes.DataBind();
        }

        private void Clearfields()
        {
            uiTextBoxEnName.Text = "";
            uiTextBoxArName.Text = "";            
            uiLabelError.Visible = false;
        }
        #endregion


    }
}