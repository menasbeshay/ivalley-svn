using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GlobalLogistics.BLL;

namespace GlobalLogistics.WebSite.Administrator
{
    public partial class EditAirPorts : System.Web.UI.Page
    {
        #region Properties
        public BLL.AirPorts CurrentAirPort
        {
            get
            {
                if (Session["CurrentAirPort"] != null)
                    return (BLL.AirPorts)Session["CurrentAirPort"];
                else
                    return null;
            }
            set
            {
                Session["CurrentAirPort"] = value;
            }
        }
        #endregion

        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
                uiPanelViewAirPorts.Visible = true;
                uiPanelEdit.Visible = false;
            }   
        }

        
        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            Clearfields();
            uiPanelEdit.Visible = true;
            uiPanelViewAirPorts.Visible = false;
        }

        protected void uiButtonSearch_Click(object sender, EventArgs e)
        {
            BLL.AirPorts objData = new AirPorts();
            objData.SearchAirPorts(uiTextBoxSearch.Text);
            uiGridViewAirPorts.DataSource = objData.DefaultView;
            uiGridViewAirPorts.DataBind();
        }

        protected void uiGridViewAirPorts_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewAirPorts.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewAirPorts_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditAirPort")
            {
                AirPorts objData = new AirPorts();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                uiTextBoxEnName.Text = objData.EnName;
                uiTextBoxArName.Text = objData.ArName;
                uiTextBoxCode.Text = objData.AirPortCode;
                
                uiPanelViewAirPorts.Visible = false;
                uiPanelEdit.Visible = true;
                CurrentAirPort = objData;
            }
            else if (e.CommandName == "DeleteAirPort")
            {
                AirPorts objData = new AirPorts();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
                CurrentAirPort = null;
                BindData();
            }
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            if (CurrentAirPort != null)
            {
                UpdateRecord();
            }
            else
            {
                AddNewRecord();
            }

            uiPanelEdit.Visible = false;
            uiPanelViewAirPorts.Visible = true;
            BindData();
            Clearfields();
            CurrentAirPort = null;
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            Clearfields();
            uiPanelEdit.Visible = false;
            uiPanelViewAirPorts.Visible = true;
        }

        
        #endregion

        #region Methods
        private void BindData()
        {
            BLL.AirPorts objData = new AirPorts();
            objData.LoadAll();
            uiGridViewAirPorts.DataSource = objData.DefaultView;
            uiGridViewAirPorts.DataBind();
        }

        private void Clearfields()
        {
            uiTextBoxEnName.Text = "";
            uiTextBoxArName.Text = "";
            uiTextBoxCode.Text = "";
            
            uiLabelError.Visible = false;
        }


        private void AddNewRecord()
        {
            AirPorts objData = new AirPorts();
            objData.AddNew();
            objData.EnName = uiTextBoxEnName.Text;
            objData.ArName = uiTextBoxArName.Text;
            objData.AirPortCode = uiTextBoxCode.Text;

            objData.Save();
        }

        private void UpdateRecord()
        {
            AirPorts objData = CurrentAirPort ;
            objData.EnName = uiTextBoxEnName.Text;
            objData.ArName = uiTextBoxArName.Text;
            objData.AirPortCode = uiTextBoxCode.Text;
            
            objData.Save();
        }

        #endregion
    }
}