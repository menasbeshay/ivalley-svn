using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ermia_BLL;
namespace Website.Admin
{
    public partial class EditPages : System.Web.UI.Page
    {
        #region Properties
        public Pages CurrentPage
        {
            get
            {
                if (Session["CurrentPage"] != null)
                    return (Pages)Session["CurrentPage"];
                else
                    return null;
            }
            set
            {
                Session["CurrentPage"] = value;
            }
        }

        public RelatedContent CurrentRelatedVideo
        {
            get
            {
                if (Session["CurrentRelatedVideo"] != null)
                    return (RelatedContent)Session["CurrentRelatedVideo"];
                else
                    return null;
            }
            set
            {
                Session["CurrentRelatedVideo"] = value;
            }
        }

        public RelatedContent CurrentRelatedFile
        {
            get
            {
                if (Session["CurrentRelatedFile"] != null)
                    return (RelatedContent)Session["CurrentRelatedFile"];
                else
                    return null;
            }
            set
            {
                Session["CurrentRelatedFile"] = value;
            }
        }

        public RelatedContent CurrentRelatedPic
        {
            get
            {
                if (Session["CurrentRelatedPic"] != null)
                    return (RelatedContent)Session["CurrentRelatedPic"];
                else
                    return null;
            }
            set
            {
                Session["CurrentRelatedPic"] = value;
            }
        }

        public RelatedContent CurrentRelatedArticle
        {
            get
            {
                if (Session["CurrentRelatedArticle"] != null)
                    return (RelatedContent)Session["CurrentRelatedArticle"];
                else
                    return null;
            }
            set
            {
                Session["CurrentRelatedArticle"] = value;
            }
        }

        public string RelatedFilePath
        {
            get
            {
                if (Session["RelatedFilePath"] != null)
                    return Session["RelatedFilePath"].ToString();
                else
                    return null;
            }
            set
            {
                Session["RelatedFilePath"] = value;
            }
        }

        public string RelatedPicPath
        {
            get
            {
                if (Session["RelatedPicPath"] != null)
                    return Session["RelatedPicPath"].ToString();
                else
                    return null;
            }
            set
            {
                Session["RelatedPicPath"] = value;
            }
        }

        public string CMSMainImagePath
        {
            get
            {
                if (Session["CMSMainImagePath"] != null)
                    return Session["CMSMainImagePath"].ToString();
                else
                    return null;
            }
            set
            {
                Session["CMSMainImagePath"] = value;
            }
        }
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPages();
                uiPanelViewAllPages.Visible = true;
                uiPanelEdit.Visible = false;
                InitializePanels();
            }
        }        

        #region Pages

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            CurrentPage.ArTitle = uiTextBoxArTitle.Text;
            CurrentPage.ArContent = Server.HtmlEncode(uiRadEditorPageContent.Content);
            if (uiFileUploadMainImage.HasFile)
            {
                uiFileUploadMainImage.SaveAs(Server.MapPath("~/UploadedFiles/Pages/" + uiFileUploadMainImage.FileName));
                CurrentPage.MainImagePath = "/UploadedFiles/Pages/" + uiFileUploadMainImage.FileName;
            }
            string type = "";
            for (int i = 0; i < 5; i++)
            {
                if (uiCheckBoxListPageType.Items[i].Selected)
                {
                    type += "T";
                }
                else
                {
                    type += "F";
                }
            }
            CurrentPage.PageType = type;
            CurrentPage.Save();
            ClearPagesFields();
            CurrentPage = null;
            uiPanelViewAllPages.Visible = true;
            uiPanelEdit.Visible = false;
            LoadPages();
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            ClearPagesFields();
            CurrentPage = null;
            uiPanelViewAllPages.Visible = true;
            uiPanelEdit.Visible = false;
        }

        protected void uiGridViewPages_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditPage")
            {
                Pages objData = new Pages();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));                
                uiTextBoxArTitle.Text = objData.ArTitle;
                uiRadEditorPageContent.Content = Server.HtmlDecode(objData.ArContent);
                if (!string.IsNullOrEmpty(objData.PageType) && objData.PageType.Length == 5)
                {
                    for (int i = 0; i < 5; i++)
                    {
                        if (objData.PageType[i] == 'T')
                        {
                            uiCheckBoxListPageType.Items[i].Selected = true;
                        }
                    }
                }
                uiPanelViewAllPages.Visible = false;
                uiPanelEdit.Visible = true;
                CurrentPage = objData;
                LoadAllRelatedContent();
            }
            
        }

        private void LoadPages()
        {
            Pages objdata = new Pages();
            objdata.LoadAll();
            uiGridViewPages.DataSource = objdata.DefaultView;
            uiGridViewPages.DataBind();
        }


        private void ClearPagesFields()
        {
            uiTextBoxArTitle.Text = "";
            uiRadEditorPageContent.Content = "";
            uiCheckBoxListPageType.ClearSelection();
        }

        private void LoadAllRelatedContent()
        {
            // load videos
            LoadVideos();
            // load articles
            LoadCMSCats();
            //load files cats 
            LoadFilesCats();
            // load pics
            LoadPics();
        }

        #endregion  

        #region Videos

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            ClearVideoFields();            
            CurrentRelatedVideo = null;
            uiPanelViewAllVideos.Visible = false;
            uiPanelEditVideos.Visible = true;
        }

        protected void uiLinkButtonUpdateVideo_Click(object sender, EventArgs e)
        {
            if (CurrentRelatedVideo != null)
            {
                CurrentRelatedVideo.ArTitle = uiTextBoxName.Text;
                CurrentRelatedVideo.URL = uiTextBoxURL.Text;
                CurrentRelatedVideo.Description = uiTextBoxArDesc.Text;
                CurrentRelatedVideo.TypeID = 3;
                CurrentRelatedVideo.PageID = CurrentPage.PageID;
                CurrentRelatedVideo.Save();
            }
            else
            {
                RelatedContent rcv = new RelatedContent();
                rcv.AddNew();
                rcv.ArTitle = uiTextBoxName.Text;
                rcv.URL = uiTextBoxURL.Text;
                rcv.Description = uiTextBoxArDesc.Text;
                rcv.TypeID = 3;
                rcv.PageID = CurrentPage.PageID;
                rcv.Save();
            }
            ClearVideoFields();
            CurrentRelatedVideo = null;
            LoadVideos();
            uiPanelViewAllVideos.Visible = true;
            uiPanelEditVideos.Visible = false;
        }

        protected void uiLinkButtonCancelVideo_Click(object sender, EventArgs e)
        {
            ClearVideoFields();
            CurrentRelatedVideo = null;
            uiPanelViewAllVideos.Visible = true;
            uiPanelEditVideos.Visible = false;
        }

        protected void uiGridViewVideos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditVideo")
            {
                RelatedContent objData = new RelatedContent();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                uiTextBoxName.Text = objData.ArTitle;
                uiTextBoxURL.Text = objData.URL;
                uiTextBoxArDesc.Text = objData.Description;
                uiPanelViewAllVideos.Visible = false;
                uiPanelEditVideos.Visible = true;
                CurrentRelatedVideo = objData;                
            }
            else if (e.CommandName == "DeleteVideo")
            {
                RelatedContent objData = new RelatedContent();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
                LoadVideos();
            }
        }


        protected void uiGridViewVideos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewVideos.PageIndex = e.NewPageIndex;
            LoadVideos();
        }

        private void ClearVideoFields()
        {
            uiTextBoxName.Text = "";
            uiTextBoxURL.Text = "";
            uiTextBoxArDesc.Text = "";

        }

        #endregion

        #region Files

        protected void uiLinkButtonAddFiles_Click(object sender, EventArgs e)
        {
            ClearFileFields();
            CurrentRelatedFile = null;
            uiPanelAllFiles.Visible = false;
            uiPanelEditFiles.Visible = true;
        }

        protected void uiGridViewFiles_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewFiles.PageIndex = e.NewPageIndex;
            LoadFiles();
        }

        protected void uiGridViewFiles_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditFile")
            {
                RelatedContent objData = new RelatedContent();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                uiTextBoxFileName.Text = objData.ArTitle;                
                uiTextBoxDescFile.Text = objData.Description;
                uiPanelEditFiles.Visible = true;
                uiPanelAllFiles.Visible = false;
                CurrentRelatedFile = objData;
            }
            else if (e.CommandName == "DeleteFile")
            {
                RelatedContent objData = new RelatedContent();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
                LoadFiles();
            }
        }

        protected void uiLinkButtonUpdateFile_Click(object sender, EventArgs e)
        {
            RelatedContent rcv = new RelatedContent();
            if (CurrentRelatedFile == null)
                rcv.AddNew();
            else
                rcv = CurrentRelatedFile;
            rcv.ArTitle = uiTextBoxFileName.Text;
            if (CurrentRelatedFile == null)
            {
                if (!string.IsNullOrEmpty(RelatedFilePath))
                {
                    rcv.URL = RelatedFilePath;
                }
            }
            rcv.Description = uiTextBoxDescFile.Text;
            rcv.TypeID = 2;
            rcv.PageID = CurrentPage.PageID;
            rcv.SubCategoryID = Convert.ToInt32(uiDropDownListsubCats.SelectedValue);
            rcv.Save();
            
            ClearFileFields();
            CurrentRelatedFile = null;
            RelatedFilePath = null;
            LoadFiles();
            uiPanelAllFiles.Visible = true;
            uiPanelEditFiles.Visible = false;
        }

        protected void uiLinkButtonCancelFile_Click(object sender, EventArgs e)
        {
            ClearFileFields();
            CurrentRelatedFile = null;
            uiPanelAllFiles.Visible = true;
            uiPanelEditFiles.Visible = false;
        }


        private void ClearFileFields()
        {
            uiTextBoxFileName.Text = "";
            uiTextBoxDescFile.Text = "";
        }
       
        protected void uiDropDownListAllCategories_SelectedIndexChanged(object sender, EventArgs e)
        {
            SubCategories Scats = new SubCategories();
            if (uiDropDownListAllCategories.SelectedIndex != -1)
            {
                Scats.GetSubCatsByCategoryID(Convert.ToInt32(uiDropDownListAllCategories.SelectedValue));
            }
            uiDropDownListsubCats.DataSource = Scats.DefaultView;
            uiDropDownListsubCats.DataTextField = "Title";
            uiDropDownListsubCats.DataValueField = "SubCategoryID";
            uiDropDownListsubCats.DataBind();

            if (Scats.RowCount > 0)
                LoadFiles();
        }


        protected void uiDropDownListsubCats_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadFiles();
        }
        #endregion

        #region CMS

        protected void uiLinkButtonAddCMS_Click(object sender, EventArgs e)
        {
            ClearCMSFields();
            CurrentRelatedArticle = null;
            uiPanelAllCMS.Visible = false;
            uiPanelEditCMS.Visible = true;
        }

        protected void uiGridViewCMS_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewCMS.PageIndex = e.NewPageIndex;
            LoadArticles();
        }

        protected void uiGridViewCMS_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditCMS")
            {
                RelatedContent objData = new RelatedContent();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                CMS_Content cms = new CMS_Content();
                cms.LoadByPrimaryKey(objData.CMSID);
                uiTextBoxCMSTitle.Text = cms.ArTitle;
                uiRadEditorCMSContent.Content = Server.HtmlDecode(cms.ArContent);                
                uiPanelAllCMS.Visible = false;
                uiPanelEditCMS.Visible = true;
                CurrentRelatedArticle = objData;
            }
            else if (e.CommandName == "DeleteCMS")
            {
                RelatedContent objData = new RelatedContent();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                CMS_Content cms = new CMS_Content();
                cms.LoadByPrimaryKey(objData.CMSID);
                objData.MarkAsDeleted();
                objData.Save();
                cms.MarkAsDeleted();
                cms.Save();
                LoadArticles();
            }
        }

        protected void uiLinkButtonUpdateCMS_Click(object sender, EventArgs e)
        {
            if (CurrentRelatedArticle != null)
            {
                CurrentRelatedArticle.ArTitle = uiTextBoxCMSTitle.Text;
                CMS_Content cms = new CMS_Content();
                cms.LoadByPrimaryKey(CurrentRelatedArticle.CMSID);
                cms.ArTitle = uiTextBoxCMSTitle.Text;
                cms.ArContent = Server.HtmlEncode(uiRadEditorCMSContent.Content);
                if (!string.IsNullOrEmpty(CMSMainImagePath))
                {
                    cms.MainImagePath = CMSMainImagePath;
                }
                CMSMainImagePath = null;
                cms.Save();
                CurrentRelatedArticle.TypeID = 1;
                CurrentRelatedArticle.PageID = CurrentPage.PageID;
                CurrentRelatedArticle.Save();
            }
            else
            {
                RelatedContent rcv = new RelatedContent();
                rcv.AddNew();
                CMS_Content cms = new CMS_Content();
                cms.AddNew();
                cms.ArTitle = uiTextBoxCMSTitle.Text;
                if (!string.IsNullOrEmpty(CMSMainImagePath))
                {
                    cms.MainImagePath = CMSMainImagePath;
                }
                CMSMainImagePath = null;
                rcv.ArTitle = uiTextBoxCMSTitle.Text;
                cms.ArContent = Server.HtmlEncode(uiRadEditorCMSContent.Content);
                cms.Save();
                rcv.TypeID = 1;
                rcv.PageID = CurrentPage.PageID;
                rcv.SubCategoryID = Convert.ToInt32(uiDropDownListCMSSubCats.SelectedValue);
                rcv.CMSID = cms.CMSID;
                rcv.Save();
            }
            ClearCMSFields();
            CurrentRelatedArticle = null;
            LoadArticles();
            uiPanelAllCMS.Visible = true;
            uiPanelEditCMS.Visible = false;
        }

        protected void uiLinkButtonCancelCMS_Click(object sender, EventArgs e)
        {
            ClearCMSFields();
            CurrentRelatedArticle = null;
            uiPanelAllCMS.Visible = true;
            uiPanelEditCMS.Visible = false;
        }

        private void ClearCMSFields()
        {
            uiTextBoxCMSTitle.Text = "";
            uiRadEditorCMSContent.Content = "";
        }

        protected void uiDropDownListAllCMSCats_SelectedIndexChanged(object sender, EventArgs e)
        {
            SubCategories Scats = new SubCategories();
            if (uiDropDownListAllCMSCats.SelectedIndex != -1)
            {
                Scats.GetSubCatsByCategoryID(Convert.ToInt32(uiDropDownListAllCMSCats.SelectedValue));
            }
            uiDropDownListCMSSubCats.DataSource = Scats.DefaultView;
            uiDropDownListCMSSubCats.DataTextField = "Title";
            uiDropDownListCMSSubCats.DataValueField = "SubCategoryID";
            uiDropDownListCMSSubCats.DataBind();

            if (Scats.RowCount > 0)
                LoadArticles();
        }


        protected void uiDropDownListCMSSubCats_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadArticles();
        }

        #endregion

        #region Pics

        protected void uiLinkButtonAddPics_Click(object sender, EventArgs e)
        {
            ClearPicsFields();
            CurrentRelatedFile = null;
            uiPanelAllPics.Visible = false;
            uiPanelEditPics.Visible = true;
        }

        protected void uiGridViewPics_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewPics.PageIndex = e.NewPageIndex;
            LoadPics();
        }

        protected void uiGridViewPics_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeletePic")
            {
                RelatedContent objData = new RelatedContent();
                objData.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument.ToString()));
                objData.MarkAsDeleted();
                objData.Save();
                LoadPics();
            }
        }

        protected void uiLinkButtonUpdatePic_Click(object sender, EventArgs e)
        {
            RelatedContent rcv = new RelatedContent();
            rcv.AddNew();
            rcv.ArTitle = uiTextBoxPicName.Text;
            if (!string.IsNullOrEmpty(RelatedPicPath))
            {
                rcv.URL = RelatedPicPath;
            }
            rcv.Description = uiTextBoxPicDesc.Text;
            rcv.TypeID = 4;
            rcv.PageID = CurrentPage.PageID;
            rcv.Save();

            ClearPicsFields();
            CurrentRelatedPic = null;
            RelatedPicPath = null;
            LoadPics();
            uiPanelAllPics.Visible = true;
            uiPanelEditPics.Visible = false;
        }

        protected void uiLinkButtonCancelPic_Click(object sender, EventArgs e)
        {
            ClearPicsFields();
            CurrentRelatedPic = null;
            uiPanelAllPics.Visible = true;
            uiPanelEditPics.Visible = false;
        }


        private void ClearPicsFields()
        {
            uiTextBoxPicName.Text = "";
            uiTextBoxPicDesc.Text = "";
        }

        
        #endregion

        #region General
        private void LoadFilesCats()
        {
            Categories cats = new Categories();
            cats.GetCategoriesByTypeIDAndPageID(3, CurrentPage.PageID);
            uiDropDownListAllCategories.DataSource = cats.DefaultView;
            uiDropDownListAllCategories.DataTextField = "Title";
            uiDropDownListAllCategories.DataValueField = "CategoryID";
            uiDropDownListAllCategories.DataBind();
            if (cats.RowCount > 0)
                uiDropDownListAllCategories.SelectedIndex = 0;
            
            SubCategories Scats = new SubCategories();
            if (uiDropDownListAllCategories.SelectedIndex != -1)
            {
                Scats.GetSubCatsByCategoryID(Convert.ToInt32(uiDropDownListAllCategories.SelectedValue));
            }
            uiDropDownListsubCats.DataSource = Scats.DefaultView;
            uiDropDownListsubCats.DataTextField = "Title";
            uiDropDownListsubCats.DataValueField = "SubCategoryID";
            uiDropDownListsubCats.DataBind();

            if (Scats.RowCount > 0)
                LoadFiles();
        }

        private void LoadFiles()
        {
            RelatedContent rc = new RelatedContent();
            rc.GetRelatedContentByTypeIDAndPageIDAndSubCatID(CurrentPage.PageID, 2, Convert.ToInt32(uiDropDownListsubCats.SelectedValue));
            uiGridViewFiles.DataSource = rc.DefaultView;
            uiGridViewFiles.DataBind();
        }

        private void LoadCMSCats()
        {
            Categories cats = new Categories();
            cats.GetCategoriesByTypeIDAndPageID(4, CurrentPage.PageID);
            uiDropDownListAllCMSCats.DataSource = cats.DefaultView;
            uiDropDownListAllCMSCats.DataTextField = "Title";
            uiDropDownListAllCMSCats.DataValueField = "CategoryID";
            uiDropDownListAllCMSCats.DataBind();
            if (cats.RowCount > 0)
                uiDropDownListAllCMSCats.SelectedIndex = 0;

            SubCategories Scats = new SubCategories();
            if (uiDropDownListAllCMSCats.SelectedIndex != -1)
            {
                Scats.GetSubCatsByCategoryID(Convert.ToInt32(uiDropDownListAllCMSCats.SelectedValue));
            }
            uiDropDownListCMSSubCats.DataSource = Scats.DefaultView;
            uiDropDownListCMSSubCats.DataTextField = "Title";
            uiDropDownListCMSSubCats.DataValueField = "SubCategoryID";
            uiDropDownListCMSSubCats.DataBind();

            if (Scats.RowCount > 0)
                LoadArticles();
        }

        private void LoadArticles()
        {
            RelatedContent rc = new RelatedContent();
            rc.GetRelatedContentByTypeIDAndPageIDAndSubCatID(CurrentPage.PageID, 1, Convert.ToInt32(uiDropDownListCMSSubCats.SelectedValue));
            uiGridViewCMS.DataSource = rc.DefaultView;
            uiGridViewCMS.DataBind();
        }

        private void LoadVideos()
        {
            RelatedContent rc = new RelatedContent();
            rc.GetRelatedContentByTypeIDAndPageID(CurrentPage.PageID, 3);
            uiGridViewVideos.DataSource = rc.DefaultView;
            uiGridViewVideos.DataBind();
        }


        private void LoadPics()
        {
            RelatedContent rc = new RelatedContent();
            rc.GetRelatedContentByTypeIDAndPageID(CurrentPage.PageID, 4);
            uiGridViewPics.DataSource = rc.DefaultView;
            uiGridViewPics.DataBind();
        }


        private void InitializePanels()
        {
            uiPanelViewAllVideos.Visible = true;
            uiPanelEditVideos.Visible = false;

            uiPanelAllFiles.Visible = true;
            uiPanelEditFiles.Visible = false;

            uiPanelAllCMS.Visible = true;
            uiPanelEditCMS.Visible = false;

            uiPanelAllPics.Visible = true;
            uiPanelEditPics.Visible = false;
        }
        #endregion

        protected void uiFileUploadFiles_UploadedComplete(object sender, AjaxControlToolkit.AsyncFileUploadEventArgs e)
        {
            if (uiFileUploadFiles.HasFile)
            {
                uiFileUploadFiles.SaveAs(Server.MapPath("~/UploadedFiles/Files/" + uiFileUploadFiles.FileName));
                RelatedFilePath = "/UploadedFiles/Files/" + uiFileUploadFiles.FileName;
            }
        }

        protected void AsyncFileUploadMainImage_UploadedComplete(object sender, AjaxControlToolkit.AsyncFileUploadEventArgs e)
        {
            if (AsyncFileUploadMainImage.HasFile)
            {
                AsyncFileUploadMainImage.SaveAs(Server.MapPath("~/UploadedFiles/Pages/" + AsyncFileUploadMainImage.FileName));
                CMSMainImagePath = "/UploadedFiles/Pages/" + AsyncFileUploadMainImage.FileName;
            }
        }

        protected void uiAsyncFileUploadPics_UploadedComplete(object sender, AjaxControlToolkit.AsyncFileUploadEventArgs e)
        {
            if (uiAsyncFileUploadPics.HasFile)
            {
                uiAsyncFileUploadPics.SaveAs(Server.MapPath("~/UploadedFiles/Pages/" + uiAsyncFileUploadPics.FileName));
                RelatedPicPath = "/UploadedFiles/Pages/" + uiAsyncFileUploadPics.FileName;
            }
        }


       




    }
}