using Flight_BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flights_GUI.Admin
{
    public partial class linksManagement : System.Web.UI.Page
    {
        #region Properties
        public UsefulLink CurrentLink
        {
            get
            {
                if (Session["CurrentLink"] != null)
                    return (UsefulLink)Session["CurrentLink"];
                else
                    return null;
            }
            set
            {
                Session["CurrentLink"] = value;
            }
        }
        #endregion

        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.PageTitle = "Links Management";
                BindData();
                uiPanelViewAll.Visible = true;
                uiPanelEdit.Visible = false;
            }
        }

        protected void uiRadGridLinks_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName == "EditLink")
            {
                UsefulLink objData = new UsefulLink();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                uiTextBoxTitle.Text = objData.Title;
                uiRadEditorDescription.Content = Server.HtmlDecode(objData.Description);
                //uiTextBoxCreatedBy.Text = objData.CreatedBy;
                
                uiTextBoxURL.Text = objData.URL;
                CurrentLink = objData;
                uiPanelEdit.Visible = true;
                uiPanelViewAll.Visible = false;
            }

            else if (e.CommandName == "DeleteLink")
            {
                UsefulLink objData = new UsefulLink();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
                BindData();
            }
        }

        protected void uiRadGridLinks_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            BindData();
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            CurrentLink = null;
            uiPanelViewAll.Visible = false;
            uiPanelEdit.Visible = true;            
            ClearFields();
        }

        protected void uiButtonSave_Click(object sender, EventArgs e)
        {
            UsefulLink objdata = new UsefulLink();
            if (CurrentLink == null)
            {
                objdata.AddNew();
                objdata.CreatedBy = new Guid(Membership.GetUser().ProviderUserKey.ToString());
                objdata.CreatedDate = DateTime.Now;
            }
            else
            {
                objdata = CurrentLink;                
            }
            objdata.Title = uiTextBoxTitle.Text;
            objdata.URL = uiTextBoxURL.Text;
            //objdata.CreatedBy = uiTextBoxCreatedBy.Text;
            objdata.UpdatedBy = new Guid(Membership.GetUser().ProviderUserKey.ToString());
            objdata.LastUpdatedDate = DateTime.Now;
            objdata.Description = Server.HtmlEncode(uiRadEditorDescription.Content);            
            objdata.Save();
            BindData();
            CurrentLink = null;
            uiPanelViewAll.Visible = true;
            uiPanelEdit.Visible = false;
            ClearFields();
            
        }


        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            CurrentLink = null;
            uiPanelViewAll.Visible = true;
            uiPanelEdit.Visible = false;
            ClearFields();
        }
        #endregion

        #region Methods

        private void BindData()
        {
            UsefulLink objdata = new UsefulLink();
            objdata.GetAllLinks();
            uiRadGridLinks.DataSource = objdata.DefaultView;
            uiRadGridLinks.DataBind();

        }


        private void ClearFields()
        {
            uiTextBoxTitle.Text = "";
            uiTextBoxURL.Text = "";
            uiRadEditorDescription.Content = "";            
        }


        #endregion
       
    }
}