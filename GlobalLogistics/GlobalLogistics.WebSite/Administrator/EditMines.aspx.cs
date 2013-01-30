using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GlobalLogistics.BLL;

namespace GlobalLogistics.WebSite.Administrator
{
    public partial class EditMines : System.Web.UI.Page
    {
        #region properties
        public BLL.Mines CurrentMines
        {
            get
            {
                if (Session["CurrentMines"] != null)
                    return (BLL.Mines)Session["CurrentMines"];
                else
                    return null;
            }
            set
            {
                Session["CurrentMines"] = value;
            }
        }
        #endregion
        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
                uiPanelViewMines.Visible = true;
                uiPanelEdit.Visible = false;
            }
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            Clearfields();
            uiPanelEdit.Visible = true;
            uiPanelViewMines.Visible = false;
        }

        protected void uiGridViewMines_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewMines.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewMines_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditCurrency")
            {
                Mines objData = new Mines();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                uiTextBoxEnName.Text = objData.EnName;
                uiTextBoxArName.Text = objData.ArName;
                uiPanelViewMines.Visible = false;
                uiPanelEdit.Visible = true;
                CurrentMines = objData;
            }
            else if (e.CommandName == "DeleteCurrency")
            {
                Mines objData = new Mines();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
                CurrentMines = null;
                BindData();
            }
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            if (CurrentMines != null)
            {
                UpdateRecord();
            }
            else
            {
                AddNewRecord();
            }

            uiPanelEdit.Visible = false;
            uiPanelViewMines.Visible = true;
            BindData();
            Clearfields();
            CurrentMines = null;
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            Clearfields();
            uiPanelEdit.Visible = false;
            uiPanelViewMines.Visible = true;
        }
        #endregion
        #region Methods

        private void BindData()
        {
            Mines objData = new Mines();
            objData.LoadAll();
            uiGridViewMines.DataSource = objData.DefaultView;
            uiGridViewMines.DataBind();
        }


        private void Clearfields()
        {
            uiTextBoxEnName.Text = "";
            uiTextBoxArName.Text = "";
            uiLabelError.Visible = false;
        }

        private void AddNewRecord()
        {
            Mines objData = new Mines();
            objData.AddNew();
            objData.EnName = uiTextBoxEnName.Text;
            objData.ArName = uiTextBoxArName.Text;
            objData.Save();
        }

        private void UpdateRecord()
        {
            Mines objData = CurrentMines;
            objData.EnName = uiTextBoxEnName.Text;
            objData.ArName = uiTextBoxArName.Text;
            objData.Save();
        }

        #endregion
    }
}