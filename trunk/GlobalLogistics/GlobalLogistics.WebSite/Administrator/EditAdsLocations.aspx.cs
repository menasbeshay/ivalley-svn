using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GlobalLogistics.BLL;

namespace GlobalLogistics.WebSite.Administrator
{
    public partial class EditAdsLocations : System.Web.UI.Page
    {
        #region properties
        public BLL.AdsLocations CurrentAdsLocation
        {
            get
            {
                if (Session["CurrentAdsLocation"] != null)
                    return (BLL.AdsLocations)Session["CurrentAdsLocation"];
                else
                    return null;
            }
            set
            {
                Session["CurrentAdsLocation"] = value;
            }
        }
        #endregion

        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
                uiPanelViewAdsLocations.Visible = true;
                uiPanelEdit.Visible = false;
            }
        }       

        protected void uiGridViewAdsLocations_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewAdsLocations.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewAdsLocations_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditLocation")
            {
                AdsLocations objData = new AdsLocations();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                uiTextBoxEnName.Text = objData.EnTitle;
                uiTextBoxArName.Text = objData.ArTitle;

                try
                {
                    uiTextBoxTimeOut.Text = objData.AdsTimeout.ToString();
                }
                catch (Exception ex)
                {
                    uiTextBoxTimeOut.Text = "";
                }
                uiTextBoxDesc.Text = objData.Description;

                try
                {
                    uiTextBoxWidth.Text = objData.Width.ToString();
                }
                catch (Exception ex)
                {
                    uiTextBoxWidth.Text = "";
                }

                try
                {
                    uiTextBoxHeight.Text = objData.Height.ToString();
                }
                catch (Exception ex)
                {
                    uiTextBoxHeight.Text = "";
                }
                
                CurrentAdsLocation = objData;
                uiPanelViewAdsLocations.Visible = false;
                uiPanelEdit.Visible = true;
            }
            else if (e.CommandName == "DeleteLocation")
            {
                AdsLocations objData = new AdsLocations();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
            }
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            Clearfields();
            uiPanelEdit.Visible = true;
            uiPanelViewAdsLocations.Visible = false;
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            if (CurrentAdsLocation != null)
            {
                AdsLocations objData = CurrentAdsLocation;
                objData.EnTitle = uiTextBoxEnName.Text;
                objData.ArTitle = uiTextBoxArName.Text;
                if (!string.IsNullOrEmpty(uiTextBoxTimeOut.Text))
                    objData.AdsTimeout = Convert.ToInt32(uiTextBoxTimeOut.Text);
                objData.Description = uiTextBoxDesc.Text;
                if(!string.IsNullOrEmpty(uiTextBoxWidth.Text))
                    objData.Width = Convert.ToInt32(uiTextBoxWidth.Text);
                if (!string.IsNullOrEmpty(uiTextBoxHeight.Text))
                    objData.Height = Convert.ToInt32(uiTextBoxHeight.Text);
                if (uiFileUploadAdLocation.HasFile)
                {
                    uiFileUploadAdLocation.SaveAs(Server.MapPath("~/FileUploads/AdsLocations" + uiFileUploadAdLocation.FileName));
                    objData.AdLocationPhoto = "/FileUploads/AdsLocations" + uiFileUploadAdLocation.FileName;
                }
                objData.Save();
            }
            else
            {
                AdsLocations objData = new AdsLocations ();
                objData.AddNew();
                objData.EnTitle = uiTextBoxEnName.Text;
                objData.ArTitle = uiTextBoxArName.Text;
                if (!string.IsNullOrEmpty(uiTextBoxTimeOut.Text))
                    objData.AdsTimeout = Convert.ToInt32(uiTextBoxTimeOut.Text);
                objData.Description = uiTextBoxDesc.Text;
                if (!string.IsNullOrEmpty(uiTextBoxWidth.Text))
                    objData.Width = Convert.ToInt32(uiTextBoxWidth.Text);
                if (!string.IsNullOrEmpty(uiTextBoxHeight.Text))
                    objData.Height = Convert.ToInt32(uiTextBoxHeight.Text);
                if (uiFileUploadAdLocation.HasFile)
                {
                    uiFileUploadAdLocation.SaveAs(Server.MapPath("~/FileUploads/AdsLocations" + uiFileUploadAdLocation.FileName));
                    objData.AdLocationPhoto = "/FileUploads/AdsLocations" + uiFileUploadAdLocation.FileName;
                }
                objData.Save();
            }


            uiPanelEdit.Visible = false;
            uiPanelViewAdsLocations.Visible = true;
            BindData();
            CurrentAdsLocation = null;
            Clearfields();
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            Clearfields();
            uiPanelEdit.Visible = false;
            uiPanelViewAdsLocations.Visible = true;
            CurrentAdsLocation = null;
        }
        #endregion

        #region Methods
        private void BindData()
        {
            AdsLocations objData = new AdsLocations();
            objData.LoadAll();
            uiGridViewAdsLocations.DataSource = objData.DefaultView;
            uiGridViewAdsLocations.DataBind();
        }

        private void Clearfields()
        {
            uiTextBoxEnName.Text = "";
            uiTextBoxArName.Text = "";
            uiLabelError.Visible = false;
            uiTextBoxTimeOut.Text = "";
            uiTextBoxDesc.Text = "";
            uiTextBoxHeight.Text = "";
            uiTextBoxWidth.Text = "";
        }
        #endregion
    }
}