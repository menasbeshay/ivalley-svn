using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GlobalLogistics.BLL;

namespace GlobalLogistics.WebSite.Administrator
{
    public partial class EditSeaPorts : System.Web.UI.Page
    {
        #region Properties
        public BLL.SeaPorts CurrentSeaPort
        {
            get
            {
                if (Session["CurrentSeaPort"] != null)
                    return (BLL.SeaPorts)Session["CurrentSeaPort"];
                else
                    return null;
            }
            set
            {
                Session["CurrentSeaPort"] = value;
            }
        }
        #endregion

        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
                uiPanelViewSeaPorts.Visible = true;
                uiPanelEdit.Visible = false;
            }
        }


        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            Clearfields();
            uiPanelEdit.Visible = true;
            uiPanelViewSeaPorts.Visible = false;
        }

        protected void uiButtonSearch_Click(object sender, EventArgs e)
        {
            BLL.SeaPorts objData = new SeaPorts();
            objData.SearchSeaPorts(uiTextBoxSearch.Text);
            uiGridViewSeaPorts.DataSource = objData.DefaultView;
            uiGridViewSeaPorts.DataBind();
        }

        protected void uiGridViewSeaPorts_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewSeaPorts.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewSeaPorts_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditSeaPort")
            {
                SeaPorts objData = new SeaPorts();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                uiTextBoxEnName.Text = objData.EnName;
                uiTextBoxArName.Text = objData.ArName;
                uiTextBoxCode.Text = objData.SeaPortCode;

                uiPanelViewSeaPorts.Visible = false;
                uiPanelEdit.Visible = true;
                CurrentSeaPort = objData;
            }
            else if (e.CommandName == "DeleteSeaPort")
            {
                SeaPorts objData = new SeaPorts();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
                CurrentSeaPort = null;
                BindData();
            }
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            if (CurrentSeaPort != null)
            {
                UpdateRecord();
            }
            else
            {
                AddNewRecord();
            }

            uiPanelEdit.Visible = false;
            uiPanelViewSeaPorts.Visible = true;
            BindData();
            Clearfields();
            CurrentSeaPort = null;
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            Clearfields();
            uiPanelEdit.Visible = false;
            uiPanelViewSeaPorts.Visible = true;
        }


        #endregion

        #region Methods
        private void BindData()
        {
            BLL.SeaPorts objData = new SeaPorts();
            objData.LoadAll();
            uiGridViewSeaPorts.DataSource = objData.DefaultView;
            uiGridViewSeaPorts.DataBind();
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
            SeaPorts objData = new SeaPorts();
            objData.AddNew();
            objData.EnName = uiTextBoxEnName.Text;
            objData.ArName = uiTextBoxArName.Text;
            objData.SeaPortCode = uiTextBoxCode.Text;

            objData.Save();
        }

        private void UpdateRecord()
        {
            SeaPorts objData = CurrentSeaPort;
            objData.EnName = uiTextBoxEnName.Text;
            objData.ArName = uiTextBoxArName.Text;
            objData.SeaPortCode = uiTextBoxCode.Text;

            objData.Save();
        }

        #endregion
    }
}