using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Data.DataModels;
using Data.Extensions;
using Data.Repositories;
using System.Configuration;
using System.IO;

namespace Web.UI.AdminPanel.MainPages
{
    public partial class AboutUsManagement : System.Web.UI.Page
    {

        #region Variables
        PageSectionsRepository _rpoObj;
        #endregion
        #region Property
        public String PageSectionId
        {
            set { ViewState["PageSectionId"] = value; }
            get { return ViewState["PageSectionId"] == null ? string.Empty : ViewState["PageSectionId"].ToString(); }
        }
        #endregion
        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["ID"]))
            {
                PageSectionId = Request.QueryString["ID"].ToString();
            }
            if (!IsPostBack)
            {
                GetInfo();
                LoadPages();
                LoadLanguages();
                LoadPageTitle();
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            Save();
            GetInfo();
        }
        protected void btnSaveAndNew_Click(object sender, EventArgs e)
        {
            Save();
            Response.Redirect("AboutUsManagement.aspx");
        }
        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("AboutusList.aspx");
        }
        #endregion
        #region Methods
        void Save()
        {
            string ImageFile = string.Empty;
            _rpoObj = new PageSectionsRepository();
            #region Manage Item
            string FileName = string.Empty;
            _rpoObj._Obj.PageId = new Guid(ddlPage.SelectedValue.ToString());
            _rpoObj._Obj.LanguageId = new Guid(ddlLanguage.SelectedValue.ToString());
            _rpoObj._Obj.SectionTitle = txtSectionTitle.Text;
            _rpoObj._Obj.SectionContent = edSectionContent.Content;
            _rpoObj._Obj.IsDefault = chkIsDefault.Checked;



            if (string.IsNullOrEmpty(PageSectionId))
            {
                _rpoObj._Obj.CreatedBy = new Guid(Request.Cookies["CooLoginUserId"].Value);
                if (fpld.PostedFile.FileName != "")
                {
                    FileName = Guid.NewGuid().ToString() + System.IO.Path.GetExtension(fpld.PostedFile.FileName);
                    string PathUrl = Server.MapPath(ConfigurationManager.AppSettings["Pages"].ToString()) + FileName;
                    fpld.SaveAs(PathUrl);
                    // DAL.ImagesFact.ResizeWithCropResizeImage("", FileName, "Section");
                    _rpoObj._Obj.ImageFile = FileName;
                }
                PageSectionId = _rpoObj.Add().ToString();
                //if (!string.IsNullOrEmpty(PageSectionId))
                //{
                //    BackendMessages(101);
                //}
                //else
                //{
                //    BackendMessages(201);
                //}
            }
            else
            {
                _rpoObj._Obj = _rpoObj.LoadById(PageSectionId);
                _rpoObj._Obj.PageId = new Guid(ddlPage.SelectedValue);
                _rpoObj._Obj.LanguageId = new Guid(ddlLanguage.SelectedValue);
                _rpoObj._Obj.SectionTitle = txtSectionTitle.Text;
                _rpoObj._Obj.SectionContent = edSectionContent.Content;

                if (fpld.PostedFile.FileName != "")
                {
                    if (_rpoObj._Obj.ImageFile != null)
                    {
                        DirectoryInfo di = new DirectoryInfo(Server.MapPath(ConfigurationManager.AppSettings["Pages"]));
                        foreach (FileInfo fi in di.GetFiles())
                        {
                            if (_rpoObj._Obj.ImageFile == fi.Name)
                            {
                                File.Delete(fi.Name);
                            }
                        }
                    }
                    FileName = Guid.NewGuid().ToString() + System.IO.Path.GetExtension(fpld.PostedFile.FileName);
                    string PathUrl = Server.MapPath(ConfigurationManager.AppSettings["Pages"].ToString()) + FileName;
                    fpld.SaveAs(PathUrl);
                    // DAL.ImagesFact.ResizeWithCropResizeImage("", FileName, "Section");
                    _rpoObj._Obj.ImageFile = FileName;
                }

                _rpoObj._Obj.ModifiedBy = new Guid(Request.Cookies["CooLoginUserId"].Value);
                if (_rpoObj.Edit())
                {
                    //lblMessge.Text = "Done, changes has been saved successfully!";
                    //msg.Attributes["class"] = "msg-success";
                }
                else
                {
                    //lblMessge.Text = "Error, Please try again later!";
                    //msg.Attributes["class"] = "msg-error";
                }
            }
            #endregion
        }
        void GetInfo()
        {
            if (!string.IsNullOrEmpty(PageSectionId))
            {
                _rpoObj = new PageSectionsRepository();
                PageSection PageSectionEnt = _rpoObj.LoadById(PageSectionId);
                if (PageSectionEnt != null)
                {
                    txtSectionTitle.Text = PageSectionEnt.SectionTitle;

                    //if (!string.IsNullOrEmpty(PageSectionEnt.ImageFile))
                    //{
                    //    imgSection.ImageUrl = ConfigurationManager.AppSettings["Pages"].ToString() + PageSectionEnt.ImageFile;
                    //    imgSection.Visible = true;
                    //}
                    //else
                    //    imgSection.Visible = false;
                    edSectionContent.Content = PageSectionEnt.SectionContent;
                    try
                    {
                        ddlPage.SelectedValue = PageSectionEnt.PageId.ToString();
                        ddlLanguage.SelectedValue = PageSectionEnt.LanguageId.ToString();
                    }
                    catch
                    {
                        ddlPage.SelectedIndex = -1;
                        ddlLanguage.SelectedIndex = -1;
                    }
                }
            }

        }
        void Clear()
        {
            txtSectionTitle.Text = edSectionContent.Content = string.Empty;
            ddlPage.SelectedIndex = ddlLanguage.SelectedIndex = -1;
        }
        private void LoadLanguages()
        {
            LanguageRepository _Obj = new LanguageRepository();
            ddlLanguage.DataSource = _Obj.LoadByActiveState();
            ddlLanguage.DataTextField = "Name";
            ddlLanguage.DataValueField = "Id";

            ddlLanguage.DataBind();
            ddlLanguage.Items.Insert(0, "Select Lnguage...");
        }
        private void LoadPages()
        {
            PageRepository _Obj = new PageRepository();
            ddlPage.DataSource = _Obj.LoadByActiveState();
            ddlPage.DataTextField = "PageName";
            ddlPage.DataValueField = "Id";

            ddlPage.DataBind();

        }
        private void LoadPageTitle()
        {
            MasterPages.Admin.PageTitle = "About Us";
            MasterPages.Admin.PageType = "Management";
        }

        #endregion

    }
}