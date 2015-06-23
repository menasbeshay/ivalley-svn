using BLL;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TouchMediaGUI
{
    public partial class JobOrders : System.Web.UI.Page
    {
        #region properties
        #endregion

        #region Events
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                Master.PageTitle = GetLocalResourceObject("PageTitle").ToString();               
                BindData();
                uiPanelAll.Visible = true;
                uiPanelEdit.Visible = false;
            }
        }

        #endregion

        #region Methods
        private void BindData()
        {
            JobOrder Jos = new JobOrder();
            Jos.GetAllJos();
            uiGridViewJOs.DataSource = Jos.DefaultView;
            uiGridViewJOs.DataBind();
        }

        #endregion 

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            uiPanelAll.Visible = false;
            uiPanelEdit.Visible = true;
        }
    }
}