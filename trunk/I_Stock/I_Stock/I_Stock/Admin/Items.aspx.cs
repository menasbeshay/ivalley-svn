using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IStock.BLL;
namespace I_Stock.Admin
{
    public partial class Items : System.Web.UI.Page
    {
        #region properties
        public IStock.BLL.Items CurrentItem
        {
            get
            {
                if (Session["CurrentItem"] != null)
                    return (IStock.BLL.Items)Session["CurrentItem"];
                else
                    return null;
            }
            set
            {
                Session["CurrentItem"] = value;
            }
        }
        #endregion

        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.CustomPageTitle = GetLocalResourceObject("Title").ToString();
                BindData();
                uiPanelAllItems.Visible = true;
                uiPanelEditItems.Visible = false;
            }
        }


        protected void uiGridViewItems_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewItems.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewItems_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditItem")
            {
                IStock.BLL.Items objData = new IStock.BLL.Items();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                //uiTextBoxEnName.Text = objData.Name;
                //uiTextBoxArName.Text = objData.ItemCode;
                //uiTextBoxEnDesc.Text = objData.Description;
                //uiTextBoxArDesc.Text = objData.Quantity;
                uiPanelAllItems.Visible = false;
                uiPanelEditItems.Visible = true;
                CurrentItem = objData;
            }
            else if (e.CommandName == "DeleteItem")
            {
                IStock.BLL.Items objData = new IStock.BLL.Items();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
                CurrentItem = null;
                BindData();
            }
        }
        #endregion 


        #region Methods

        private void BindData()
        {
            IStock.BLL.Items objData = new IStock.BLL.Items();
            objData.LoadAll();
            uiGridViewItems.DataSource = objData.DefaultView;
            uiGridViewItems.DataBind();
        }
        #endregion

    }
}