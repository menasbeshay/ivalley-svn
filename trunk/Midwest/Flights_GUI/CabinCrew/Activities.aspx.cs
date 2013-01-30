using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flights_GUI.CabinCrew
{
    public partial class Activities : System.Web.UI.Page
    {
        #region Properties
        public Flight_BLL.Activities CurrentActivity
        {
            get
            {
                if (Session["CurrentActivity"] != null)
                    return (Flight_BLL.Activities)Session["CurrentActivity"];
                else
                    return null;
            }
            set
            {
                Session["CurrentActivity"] = value;
            }
        }
        #endregion

        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
                uiPanelViewAll.Visible = true;
                uiPanelEdit.Visible = false;
            }
        }

        protected void uiRadGridActivities_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName == "EditActivity")
            {
                Flight_BLL.Activities objData = new Flight_BLL.Activities();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                
                uiTextBoxName.Text = objData.Name;
                uiTextBoxShortName.Text = objData.ShortName;               
                CurrentActivity = objData;
                uiPanelEdit.Visible = true;
                uiPanelViewAll.Visible = false;                
            }

            else if (e.CommandName == "DeleteActivity")
            {
                Flight_BLL.Activities objData = new Flight_BLL.Activities();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));                
                objData.MarkAsDeleted();
                objData.Save();
                BindData();
            }
        }

        protected void uiRadGridActivities_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            BindData();
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            CurrentActivity = null;
            uiPanelViewAll.Visible = false;
            uiPanelEdit.Visible = true;
            ClearFields();
        }

        protected void uiButtonSave_Click(object sender, EventArgs e)
        {
            Flight_BLL.Activities objdata = new Flight_BLL.Activities();
            if (CurrentActivity == null)
                objdata.AddNew();
            else
                objdata = CurrentActivity;
            objdata.Name = uiTextBoxName.Text;
            objdata.ShortName = uiTextBoxShortName.Text;
            objdata.Save();
            BindData();
            CurrentActivity = null;
            uiPanelViewAll.Visible = true;
            uiPanelEdit.Visible = false;
            ClearFields();

        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            CurrentActivity = null;
            uiPanelViewAll.Visible = true;
            uiPanelEdit.Visible = false;
            ClearFields();
        }
        #endregion

        #region Methods

        private void BindData()
        {
            Flight_BLL.Activities objdata = new Flight_BLL.Activities();
            objdata.LoadAll();
            uiRadGridActivities.DataSource = objdata.DefaultView;
            uiRadGridActivities.DataBind();
            
        }


        private void ClearFields()
        {
            uiTextBoxName.Text = "";
            uiTextBoxShortName.Text = "";
        }


        #endregion
    }
}