using Flight_BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flights_GUI.Admin
{
    public partial class circularsManagment : System.Web.UI.Page
    {
        #region Properties
        public Announcement CurrentAnnouncement
        {
            get
            {
                if (Session["CurrentAnnouncement"] != null)
                    return (Announcement)Session["CurrentAnnouncement"];
                else
                    return null;
            }
            set
            {
                Session["CurrentAnnouncement"] = value;
            }
        }
        #endregion

        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.PageTitle = "Circulars";
                BindData();
                uiPanelViewAll.Visible = true;
                uiPanelEdit.Visible = false;
            }
        }

        protected void uiRadGridcirculars_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName == "EditCircular")
            {
                Announcement objData = new Announcement();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                uiTextBoxTitle.Text = objData.Title;
                uiRadEditorContnet.Content = Server.HtmlDecode(objData.Content);
                uiTextBoxCreatedBy.Text = objData.CreatedBy;
                CurrentAnnouncement = objData;
                uiPanelEdit.Visible = true;
                uiPanelViewAll.Visible = false;
            }

            else if (e.CommandName == "DeleteCircular")
            {
                Announcement objData = new Announcement();
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
            CurrentAnnouncement = null;
            uiPanelViewAll.Visible = false;
            uiPanelEdit.Visible = true;
            ClearFields();
        }

        protected void uiButtonSave_Click(object sender, EventArgs e)
        {
            Announcement objdata = new Announcement();
            if (CurrentAnnouncement == null)
                objdata.AddNew();
            else
                objdata = CurrentAnnouncement;
            objdata.Title = uiTextBoxTitle.Text;
            objdata.CreatedBy = uiTextBoxCreatedBy.Text;
            objdata.Content = Server.HtmlEncode(uiRadEditorContnet.Content);
            objdata.Save();
            BindData();
            CurrentAnnouncement = null;
            uiPanelViewAll.Visible = true;
            uiPanelEdit.Visible = false;
            ClearFields();

        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            CurrentAnnouncement = null;
            uiPanelViewAll.Visible = true;
            uiPanelEdit.Visible = false;
            ClearFields();
        }
        #endregion

        #region Methods

        private void BindData()
        {
            Announcement objdata = new Announcement();
            objdata.LoadAll();
            uiRadGridcirculars.DataSource = objdata.DefaultView;
            uiRadGridcirculars.DataBind();

        }


        private void ClearFields()
        {
            uiTextBoxTitle.Text = "";
            uiTextBoxCreatedBy.Text = "";
            uiRadEditorContnet.Content = ""; 
        }


        #endregion
       
    }
}