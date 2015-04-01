using Flight_BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flights_GUI.Operation
{
    public partial class ManageTransactions : System.Web.UI.Page
    {
        #region Properties
        public Transactions CurrentTrx
        {
            get
            {
                if (Session["CurrentTrx"] != null)
                    return (Transactions)Session["CurrentTrx"];
                else
                    return null;
            }
            set
            {
                Session["CurrentTrx"] = value;
            }
        }
        #endregion

        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.PageTitle = "Transactions";
                BindData();
                uiPanelViewAll.Visible = true;
                uiPanelEdit.Visible = false;
            }
        }

        protected void uiRadGridTrx_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName == "EditTrx")
            {
                Transactions objData = new Transactions();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                uiTextBoxName.Text = objData.Name;
                
                CurrentTrx = objData;
                uiPanelEdit.Visible = true;
                uiPanelViewAll.Visible = false;
            }

            else if (e.CommandName == "DeleteTrx")
            {
                Transactions objData = new Transactions();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
                BindData();
            }
        }

        protected void uiRadGridTrx_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            BindData();
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            CurrentTrx = null;
            uiPanelViewAll.Visible = false;
            uiPanelEdit.Visible = true;
            ClearFields();
        }

        protected void uiButtonSave_Click(object sender, EventArgs e)
        {
            Transactions objdata = new Transactions();
            if (CurrentTrx == null)
                objdata.AddNew();
            else
                objdata = CurrentTrx;
            objdata.Name = uiTextBoxName.Text;
            
            objdata.Save();
            BindData();
            CurrentTrx = null;
            uiPanelViewAll.Visible = true;
            uiPanelEdit.Visible = false;
            ClearFields();

        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            CurrentTrx = null;
            uiPanelViewAll.Visible = true;
            uiPanelEdit.Visible = false;
            ClearFields();
        }
        #endregion

        #region Methods

        private void BindData()
        {
            Transactions objdata = new Transactions();
            objdata.LoadAll();
            uiRadGridTrx.DataSource = objdata.DefaultView;
            uiRadGridTrx.DataBind();

        }


        private void ClearFields()
        {
            uiTextBoxName.Text = "";
            
        }


        #endregion
        
    }
}