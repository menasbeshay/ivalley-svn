using Flight_BLL;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Flights_GUI.Admin
{
    public partial class certificateManagement : System.Web.UI.Page
    {
        #region Properties
        public Certificate CurrentCertificate
        {
            get
            {
                if (Session["CurrentCertificate"] != null)
                    return (Certificate)Session["CurrentCertificate"];
                else
                    return null;
            }
            set
            {
                Session["CurrentCertificate"] = value;
            }
        }
        #endregion

        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.PageTitle = "Certificates Management";
                BindData();                
                uiPanelViewAll.Visible = true;
                uiPanelEdit.Visible = false;
            }
        }

        protected void uiRadGridcirculars_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName == "EditCir")
            {
                Certificate objData = new Certificate();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));

                uiTextBoxTitle.Text = objData.Name;
                
                //uiTextBoxCreatedBy.Text = objData.CreatedBy;

                if (!objData.IsColumnNull(Certificate.ColumnNames.Path))
                {
                    txtCurrentFile.Visible = true;
                    btnDeleteCurrentFile.Visible = true;
                    lblCurrentFile.Visible = true;
                    txtCurrentFile.Text = objData.Path.Substring(objData.Path.LastIndexOf('/') + 1);
                }

              
                CurrentCertificate = objData;
                uiPanelEdit.Visible = true;
                uiPanelViewAll.Visible = false;
            }

            else if (e.CommandName == "DeleteCir")
            {
                Certificate objData = new Certificate();
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
            CurrentCertificate = null;
            uiPanelViewAll.Visible = false;
            uiPanelEdit.Visible = true;
           
            ClearFields();
        }

        protected void uiButtonSave_Click(object sender, EventArgs e)
        {
            Certificate objdata = new Certificate();
            if (CurrentCertificate == null)
            {
                objdata.AddNew();
                objdata.CreatedBy = new Guid(Membership.GetUser().ProviderUserKey.ToString());
                objdata.CreatedDate = DateTime.Now;
            }
            else
                objdata = CurrentCertificate;
            objdata.Name = uiTextBoxTitle.Text;
            
            if (Session["CurrentUploadedFiles"] != null)
            {
                Hashtable Files;
                Files = (Hashtable)Session["CurrentUploadedFiles"];

                if (Files.Count > 0)
                {
                    foreach (DictionaryEntry item in Files)
                    {
                        objdata.Path = item.Value.ToString();
                    }

                    Session["CurrentUploadedFiles"] = null;
                }
            }


            objdata.Save();
            BindData();
            CurrentCertificate = null;
            uiPanelViewAll.Visible = true;
            uiPanelEdit.Visible = false;
            ClearFields();

            SendingNotifications.sendNotif(7, null, null, null, null, null,null,null);
        }


        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            CurrentCertificate = null;
            uiPanelViewAll.Visible = true;
            uiPanelEdit.Visible = false;
            ClearFields();
        }
        #endregion

        #region Methods

        private void BindData()
        {
            Certificate objdata = new Certificate();
            objdata.GetAllCertificates();
            uiRadGridcirculars.DataSource = objdata.DefaultView;
            uiRadGridcirculars.DataBind();
        }


        private void ClearFields()
        {
            uiTextBoxTitle.Text = "";
            uiTextBoxCreatedBy.Text = "";
            
        }

        protected void btnDeleteCurrentFile_Click(object sender, EventArgs e)
        {
            Certificate objData = new Certificate();
            objData = CurrentCertificate;
            objData.SetColumnNull(Certificate.ColumnNames.Path);
            objData.Save();
            txtCurrentFile.Text = "";
            txtCurrentFile.Visible = false;
            btnDeleteCurrentFile.Visible = false;
            lblCurrentFile.Visible = false;
        }
       

        #endregion
    }
}