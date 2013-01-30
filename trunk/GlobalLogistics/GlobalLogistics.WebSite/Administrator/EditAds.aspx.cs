using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GlobalLogistics.BLL;
using System.Data;

namespace GlobalLogistics.WebSite.Administrator
{
    public partial class EditAds : System.Web.UI.Page
    {
        #region properties
        public BLL.Ads CurrentAd
        {
            get
            {
                if (Session["CurrentAd"] != null)
                    return (BLL.Ads)Session["CurrentAd"];
                else
                    return null;
            }
            set
            {
                Session["CurrentAd"] = value;
            }
        }

        #endregion

        #region events

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {                
                BindAll();
                LoadDDLs();
                uiPanelViewAds.Visible = true;
                uiPanelEdit.Visible = false;
            }
        }

        protected void uiGridViewAds_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewAds.PageIndex = e.NewPageIndex;
            BindAll();
        }

        protected void uiGridViewAds_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditAds")
            {
                BLL.Ads objData = new Ads();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                //uiDropDownListCategories.SelectedValue = objData.CategoryID.ToString();
                uiDropDownListLocation.SelectedValue = objData.AdsLocationID.ToString();
                uiTextBoxEnName.Text = objData.EnTitle;
                uiTextBoxArName.Text = objData.ArTitle;
                if (!string.IsNullOrEmpty(objData.EnFilePath))
                {
                    uiEnImage.ImageUrl = objData.EnFilePath;
                }

                if (!string.IsNullOrEmpty(objData.ArFilePath))
                {
                    uiArImage.ImageUrl = objData.ArFilePath;
                }

                uiTextBoxURL.Text = objData.URL;
                uiTextBoxStartDate.Text = objData.StartDate.ToString("dd/MM/yyyy");
                uiTextBoxEndDate.Text = objData.EndDate.ToString("dd/MM/yyyy");

                uiPanelEdit.Visible = true;
                uiPanelViewAds.Visible = false;
                CurrentAd = objData;
            }
            else if (e.CommandName == "DeleteAds")
            {
                BLL.Ads objData = new Ads();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
                CurrentAd = null;
                BindAll();
            }
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            CurrentAd = null;
            Clearfields();
            uiPanelEdit.Visible = true;
            uiPanelViewAds.Visible = false;
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            if (CurrentAd != null)
            {
                UpdateRecord();
            }
            else
            {
                AddNewRecord();
            }
            uiPanelViewAds.Visible = true;
            uiPanelEdit.Visible = false;
            BindAll();
            Clearfields();
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            CurrentAd = null;
            uiPanelEdit.Visible = false;
            uiPanelViewAds.Visible = true;
            Clearfields();
        }

        protected void uiButtonSearch_Click(object sender, EventArgs e)
        {
            Ads objData = new Ads();
            objData.SearchAds(uiTextBoxSearch.Text, Convert.ToInt32(uiDropDownListAdsLocations.SelectedValue));
            uiGridViewAds.DataSource = objData.DefaultView;
            uiGridViewAds.DataBind();
        }

        protected void uiGridViewAds_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView objData = (DataRowView)e.Row.DataItem;
                AdsLocations adlocation = new AdsLocations();
                adlocation.LoadByPrimaryKey(Convert.ToInt32(objData["AdsLocationID"].ToString()));
                Label temp = (Label)e.Row.FindControl("uiLabelAdLocation");
                temp.Text = adlocation.ArTitle;
            }
        }
        #endregion


        #region Methods
        private void BindAll()
        {
            Ads objData = new Ads ();
            objData.LoadAll();
            uiGridViewAds.DataSource = objData.DefaultView;
            uiGridViewAds.DataBind();
        }

        private void LoadDDLs()
        {
            Categories objData = new Categories();
            objData.LoadAll();
            uiDropDownListCategories.DataSource = objData.DefaultView;
            uiDropDownListCategories.DataTextField = "ArName";
            uiDropDownListCategories.DataValueField = "CategoryID";
            uiDropDownListCategories.DataBind();

            AdsLocations adsLocationsData = new AdsLocations();
            adsLocationsData.LoadAll();
            uiDropDownListLocation.DataSource = adsLocationsData.DefaultView;
            uiDropDownListLocation.DataTextField = "ArTitle";
            uiDropDownListLocation.DataValueField = "AdsLocationID";
            uiDropDownListLocation.DataBind();

            uiDropDownListAdsLocations.DataSource = adsLocationsData.DefaultView;
            uiDropDownListAdsLocations.DataTextField = "ArTitle";
            uiDropDownListAdsLocations.DataValueField = "AdsLocationID";
            uiDropDownListAdsLocations.DataBind();
            uiDropDownListAdsLocations.Items.Insert(0, new ListItem("إختر مكان الإعلان", "0"));
        }

        private void AddNewRecord()
        {
            BLL.Ads objData = new Ads();
            objData.AddNew();
            //objData.CategoryID = Convert.ToInt32(uiDropDownListCategories.SelectedValue);
            objData.AdsLocationID = Convert.ToInt32(uiDropDownListLocation.SelectedValue);
            objData.EnTitle = uiTextBoxEnName.Text;
            objData.ArTitle = uiTextBoxArName.Text;
            if (uiFileUploadEnFile.HasFile)
            {
                uiFileUploadEnFile.SaveAs(Server.MapPath("~/FileUploads/Ads/" + uiFileUploadEnFile.FileName));
                objData.EnFilePath = "~/FileUploads/Ads/" + uiFileUploadEnFile.FileName;
            }

            if (uiFileUploadArFile.HasFile)
            {
                uiFileUploadArFile.SaveAs(Server.MapPath("~/FileUploads/Ads/" + uiFileUploadArFile.FileName));
                objData.ArFilePath = "~/FileUploads/Ads/" + uiFileUploadArFile.FileName;                
            }

            objData.URL = uiTextBoxURL.Text;
            objData.StartDate = DateTime.ParseExact(uiTextBoxStartDate.Text, "dd/MM/yyyy",null);
            objData.EndDate = DateTime.ParseExact(uiTextBoxEndDate.Text ,"dd/MM/yyyy", null);
            objData.Save();
        }

        private void UpdateRecord()
        {
            BLL.Ads objData = CurrentAd;            
           // objData.CategoryID = Convert.ToInt32(uiDropDownListCategories.SelectedValue);
            objData.AdsLocationID = Convert.ToInt32(uiDropDownListLocation.SelectedValue);
            objData.EnTitle = uiTextBoxEnName.Text;
            objData.ArTitle = uiTextBoxArName.Text;
            if (uiFileUploadEnFile.HasFile)
            {
                uiFileUploadEnFile.SaveAs(Server.MapPath("~/FileUploads/Ads/" + uiFileUploadEnFile.FileName));
                string imagepath = "~/FileUploads/Ads/" + uiFileUploadEnFile.FileName;
                if (objData.EnFilePath != imagepath)
                    objData.EnFilePath = imagepath;                
            }

            if (uiFileUploadArFile.HasFile)
            {
                uiFileUploadArFile.SaveAs(Server.MapPath("~/FileUploads/Ads/" + uiFileUploadArFile.FileName));                
                string imagepath = "~/FileUploads/Ads/" + uiFileUploadArFile.FileName;
                if (objData.ArFilePath != imagepath)
                    objData.ArFilePath = imagepath;
            }

            objData.URL = uiTextBoxURL.Text;
            objData.StartDate = DateTime.ParseExact(uiTextBoxStartDate.Text, "dd/MM/yyyy", null);
            objData.EndDate = DateTime.ParseExact(uiTextBoxEndDate.Text, "dd/MM/yyyy", null);
            objData.Save();
            CurrentAd = null;

        }

        private void Clearfields()
        {
            uiTextBoxEnName.Text = "";
            uiTextBoxArName.Text = "";
            uiDropDownListCategories.SelectedIndex = 0;
            uiDropDownListLocation.SelectedIndex = 0;
            uiTextBoxURL.Text = "";
            uiArImage.ImageUrl = "";
            uiEnImage.ImageUrl = "";
            uiTextBoxStartDate.Text = "";
            uiTextBoxEndDate.Text = "";
            uiLabelError.Visible = false;
            
        }
        #endregion        
    }
}