using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flight_BLL;

namespace Flights_GUI.Common
{
    public partial class SectorClients : System.Web.UI.Page
    {
        #region Properties        
        public Flight_BLL.SectorClients CurrentClient
        {
            get
            {
                if (Session["CurrentClient"] != null)
                    return (Flight_BLL.SectorClients)Session["CurrentClient"];
                else
                    return null;
            }
            set
            {
                Session["CurrentClient"] = value;
            }
        }
        #endregion
        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {                
                SearchSectorClients();
                uiPanelViewAll.Visible = true;
                uiPanelEdit.Visible = false;
            }
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            uiPanelViewAll.Visible = false;
            uiPanelEdit.Visible = true;
            ClearFields();            
            CurrentClient = null;
        }


        protected void uiLinkButtonSaveClient_Click(object sender, EventArgs e)
        {
            if (CurrentClient != null)
            {
                Flight_BLL.SectorClients objData = CurrentClient;
                objData.Name = uiTextBoxName.Text;
                objData.Tele= uiTextBoxTele.Text;
                objData.Fax= uiTextBoxFax.Text;
                objData.Mail= uiTextBoxMail.Text;
                objData.Website = uiTextBoxWebsite.Text;
                objData.Address = uiTextBoxAddress.Text;
                objData.ContactName = uiTextBoxContactName.Text;
                objData.ContactMail = uiTextBoxContactMail.Text;
                objData.ContactTele = uiTextBoxContactTele.Text;
                objData.ContactMobile= uiTextBoxContactMobile.Text;
                string filepath = "";
                if (uiFileUploadLogo.HasFile)
                {
                    uiFileUploadLogo.SaveAs(Server.MapPath("~/FileUploads/Clients" + "/" + uiFileUploadLogo.FileName));
                    filepath = "/Fileuploads/Clients" + "/" + uiFileUploadLogo.FileName;                    
                }
                if (!string.IsNullOrEmpty(filepath))
                {
                    objData.LogoPath = filepath;
                }
                objData.Save();
            }
            else
            {
                Flight_BLL.SectorClients objData = new Flight_BLL.SectorClients();
                objData.AddNew();
                objData.Name = uiTextBoxName.Text;
                objData.Tele = uiTextBoxTele.Text;
                objData.Fax = uiTextBoxFax.Text;
                objData.Mail = uiTextBoxMail.Text;
                objData.Website = uiTextBoxWebsite.Text;
                objData.Address = uiTextBoxAddress.Text;
                objData.ContactName = uiTextBoxContactName.Text;
                objData.ContactMail = uiTextBoxContactMail.Text;
                objData.ContactTele = uiTextBoxContactTele.Text;
                objData.ContactMobile = uiTextBoxContactMobile.Text;
                string filepath = "";
                if (uiFileUploadLogo.HasFile)
                {
                    uiFileUploadLogo.SaveAs(Server.MapPath("~/FileUploads/Clients" + "/" + uiFileUploadLogo.FileName));
                    filepath = "/Fileuploads/Clients" + "/" + uiFileUploadLogo.FileName;
                }
                if (!string.IsNullOrEmpty(filepath))
                {
                    objData.LogoPath = filepath;
                }
                objData.Save();
            }

            uiPanelViewAll.Visible = true;
            uiPanelEdit.Visible = false;
            ClearFields();            
            CurrentClient = null;
            SearchSectorClients();
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            ClearFields();
            CurrentClient= null;
            uiPanelEdit.Visible = false;
            uiPanelViewAll.Visible = true;
        }

        protected void uiButtonSearch_Click(object sender, EventArgs e)
        {
            SearchSectorClients();
        }


        protected void uiRadGridClients_PageSizeChanged(object sender, Telerik.Web.UI.GridPageSizeChangedEventArgs e)
        {
            SearchSectorClients();
        }

        protected void uiRadGridClients_PageIndexChanged(object sender, Telerik.Web.UI.GridPageChangedEventArgs e)
        {
            SearchSectorClients();
        }

        protected void uiRadGridClients_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName == "EditSectorClient")
            {
                Flight_BLL.SectorClients objData = new Flight_BLL.SectorClients();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                CurrentClient = objData;
                FillSectorClientData();
                uiPanelEdit.Visible = true;
                uiPanelViewAll.Visible = false;
                
            }

            else if (e.CommandName == "DeleteSectorClient")
            {
                Flight_BLL.SectorClients objData = new Flight_BLL.SectorClients();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));                
                objData.MarkAsDeleted();
                objData.Save();
                SearchSectorClients();
            }
        }

        #endregion

        #region Methods

        private void SearchSectorClients()
        {
            Flight_BLL.SectorClients sectorObj = new Flight_BLL.SectorClients();
            sectorObj.SearchSectorClients(uiTextBoxSearch.Text);            
            uiRadGridClients.DataSource = sectorObj.DefaultView;
            uiRadGridClients.DataBind();
        }
        
        private void FillSectorClientData()
        {
            uiTextBoxName.Text = CurrentClient.Name;
            uiTextBoxTele.Text = CurrentClient.Tele;
            uiTextBoxFax.Text = CurrentClient.Fax;
            uiTextBoxMail.Text = CurrentClient.Mail;
            uiTextBoxWebsite.Text = CurrentClient.Website;
            uiTextBoxAddress.Text = CurrentClient.Address;
            uiTextBoxContactName.Text = CurrentClient.ContactName;
            uiTextBoxContactMail.Text = CurrentClient.ContactMail;
            uiTextBoxContactTele.Text = CurrentClient.ContactTele;
            uiTextBoxContactMobile.Text = CurrentClient.ContactMobile;
        }

        private void ClearFields()
        {
            uiTextBoxName.Text = "";
            uiTextBoxTele.Text = "";
            uiTextBoxFax.Text = "";
            uiTextBoxMail.Text = "";
            uiTextBoxWebsite.Text = "";
            uiTextBoxAddress.Text = "";
            uiTextBoxContactName.Text = "";
            uiTextBoxContactMail.Text = "";
            uiTextBoxContactTele.Text = "";
            uiTextBoxContactMobile.Text = "";
        }

        #endregion

    }
}