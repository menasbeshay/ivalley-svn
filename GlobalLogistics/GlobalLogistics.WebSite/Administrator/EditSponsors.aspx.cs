using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GlobalLogistics.BLL;
using System.Data;
using System.Configuration;

namespace GlobalLogistics.WebSite.Administrator
{
    public partial class EditSponsors : System.Web.UI.Page
    {
        #region properties
        public BLL.Sponsors CurrentSponsor
        {
            get
            {
                if (Session["CurrentSponsor"] != null)
                    return (BLL.Sponsors)Session["CurrentSponsor"];
                else
                    return null;
            }
            set
            {
                Session["CurrentSponsor"] = value;
            }
        }
        #endregion

        #region Events

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
                uiPanelViewSponsors.Visible = true;
                uiPanelEdit.Visible = false;                
            }
        }

        protected void uiGridViewSponsors_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditSponsor")
            {
                Sponsors objData = new Sponsors();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                CurrentSponsor = objData;
                uiTextBoxArTitle.Text = objData.ArTitle;
                uiTextBoxEnTitle.Text = objData.EnTitle;
                uiTextBoxURL.Text = objData.URL;
                uiTextBoxOrder.Text = objData.ViewOrder.ToString();
                if (!string.IsNullOrEmpty(objData.EnFilePath))
                {
                    uiImageEnglish.ImageUrl = objData.EnFilePath;
                    uiImageEnglish.Visible = true;
                }
                else
                {
                    uiImageEnglish.Visible = false;
                }

                if (!string.IsNullOrEmpty(objData.ArFilePath))
                {
                    uiImageArabic.ImageUrl = objData.ArFilePath;
                    uiImageArabic.Visible = true;
                }
                else
                {
                    uiImageArabic.Visible = false;
                }
                uiPanelViewSponsors.Visible = false;
                uiPanelEdit.Visible = true;
            }
            else if (e.CommandName == "DeleteSponsor")
            {
                Sponsors objData = new Sponsors();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
                uiPanelEdit.Visible = false;
                uiPanelViewSponsors.Visible = true;
                BindData();
                Clearfields();
               
            }
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            
            string Enfilepath = "";
            string Arfilepath = "";
            if (uiFileUploadEnglishPhoto.HasFile)
            {
                uiFileUploadEnglishPhoto.SaveAs(Server.MapPath("~/FileUploads/Sponsors/" + uiFileUploadEnglishPhoto.FileName));
                Enfilepath = "/Fileuploads/Sponsors/" + uiFileUploadEnglishPhoto.FileName;

            }

            if (uiFileUploadArabicPhoto.HasFile)
            {
                uiFileUploadArabicPhoto.SaveAs(Server.MapPath("~/FileUploads/Sponsors/" + uiFileUploadArabicPhoto.FileName));
                Arfilepath = "/Fileuploads/Sponsors/" + uiFileUploadArabicPhoto.FileName;

            }

            if (CurrentSponsor != null)
            {
                Sponsors objData = CurrentSponsor;
                string Entemp = objData.EnFilePath;
                string Artemp = objData.ArFilePath;
                bool done = false;

                if (Artemp != Arfilepath && !string.IsNullOrEmpty(Arfilepath))
                {
                    objData.ArFilePath = Arfilepath;
                }

                if (Entemp != Enfilepath && !string.IsNullOrEmpty(Enfilepath))
                {
                    objData.EnFilePath = Enfilepath;
                }

                objData.EnTitle = uiTextBoxEnTitle.Text;
                objData.ArTitle = uiTextBoxArTitle.Text;
                objData.URL = uiTextBoxURL.Text;
                objData.ViewOrder = Convert.ToInt32(uiTextBoxOrder.Text);

                objData.Save();
                uiPanelEdit.Visible = false;
                uiPanelViewSponsors.Visible = true;
                BindData();
                Clearfields();
                
            }
            else
            {
                Sponsors objData = new Sponsors();
                objData.AddNew();
                objData.EnTitle = uiTextBoxEnTitle.Text;
                objData.ArTitle = uiTextBoxArTitle.Text;
                objData.URL = uiTextBoxURL.Text;
                objData.ViewOrder = Convert.ToInt32(uiTextBoxOrder.Text);
                objData.ArFilePath = Arfilepath;
                objData.EnFilePath = Enfilepath;
                objData.Save();
                uiPanelEdit.Visible = false;
                uiPanelViewSponsors.Visible = true;
                BindData();
                Clearfields();
                
            }
            CurrentSponsor = null;

        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            Clearfields();
            uiPanelViewSponsors.Visible = false;
            uiPanelEdit.Visible = true;
        }

        protected void uiGridViewSponsors_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewSponsors.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            Clearfields();
            uiPanelViewSponsors.Visible = true;
            uiPanelEdit.Visible = false;
            CurrentSponsor = null;
        }

        protected void uiButtonSearch_Click(object sender, EventArgs e)
        {
            Sponsors objData = new Sponsors();
            objData.SearchSponsors(uiTextBoxSearch.Text);
            uiGridViewSponsors.DataSource = objData.DefaultView;
            uiGridViewSponsors.DataBind();
        }
        #endregion
        #region Methods

        private void BindData()
        {
            Sponsors objData = new Sponsors();
            objData.LoadAll();
            uiGridViewSponsors.DataSource = objData.DefaultView;
            uiGridViewSponsors.DataBind();
        }

        private void Clearfields()
        {
            uiTextBoxArTitle.Text = "";
            uiTextBoxEnTitle.Text = "";
            uiTextBoxOrder.Text = "";
            uiTextBoxURL.Text = "";
            uiLabelError.Visible = false;
        }

        #endregion

        
    }
}