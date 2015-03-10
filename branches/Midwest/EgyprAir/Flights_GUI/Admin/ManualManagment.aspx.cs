using Flight_BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flights_GUI.Admin
{
    public partial class ManualManagment : System.Web.UI.Page
    {
        #region Properties
        public Manual CurrentManual
        {
            get
            {
                if (Session["CurrentManual"] != null)
                    return (Manual)Session["CurrentManual"];
                else
                    return null;
            }
            set
            {
                Session["CurrentManual"] = value;
            }
        }
        #endregion

        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.PageTitle = "Manuals";
                BindData();
                uiPanelViewAll.Visible = true;
                uiPanelEdit.Visible = false;
            }
        }

        protected void uiRadGridmanuals_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName == "EditManual")
            {
                Manual objData = new Manual();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                uiTextBoxTitle.Text = objData.Title;                
                uiTextBoxCreatedBy.Text = objData.CreatedBy;
                CurrentManual = objData;
                uiPanelEdit.Visible = true;
                uiPanelViewAll.Visible = false;
            }

            else if (e.CommandName == "DeleteManual")
            {
                Manual objData = new Manual();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
                BindData();
            }
        }

        protected void uiRadGridcirculars_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            BindData();
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            CurrentManual = null;
            uiPanelViewAll.Visible = false;
            uiPanelEdit.Visible = true;
            ClearFields();
        }

        protected void uiButtonSave_Click(object sender, EventArgs e)
        {
            Manual objdata = new Manual();
            if (CurrentManual == null)
                objdata.AddNew();
            else
                objdata = CurrentManual;
            objdata.Title = uiTextBoxTitle.Text;
            objdata.CreatedBy = uiTextBoxCreatedBy.Text;
            if (uiFileUploadManual.HasFile)
            {
                string path = "/fileUploads/manuals/" + Guid.NewGuid() + "_" + uiFileUploadManual.FileName;
                uiFileUploadManual.SaveAs(Server.MapPath("~" + path));
                objdata.Path = path;
            }
            objdata.Save();
            BindData();
            CurrentManual = null;
            uiPanelViewAll.Visible = true;
            uiPanelEdit.Visible = false;
            ClearFields();

        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            CurrentManual = null;
            uiPanelViewAll.Visible = true;
            uiPanelEdit.Visible = false;
            ClearFields();
        }
        #endregion

        #region Methods

        private void BindData()
        {
            Manual objdata = new Manual();
            objdata.LoadAll();
            uiRadGridmanuals.DataSource = objdata.DefaultView;
            uiRadGridmanuals.DataBind();

        }


        private void ClearFields()
        {
            uiTextBoxTitle.Text = "";
            uiTextBoxCreatedBy.Text = "";            
        }


        #endregion
    }
}