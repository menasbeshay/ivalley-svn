using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Data.DataModels;
using Data.Extensions;
using Data.Repositories;

namespace Web.UI.AdminPanel.MainPages
{
    public partial class SocialLinkManagement : System.Web.UI.Page
    {
        #region Variables
        SocialLinkRepository _rpoObj;
        #endregion
        #region Property
        public String SocialLinkId
        {
            set { ViewState["SocialLinkId"] = value; }
            get { return ViewState["SocialLinkId"] == null ? string.Empty : ViewState["SocialLinkId"].ToString(); }
        }
        #endregion
        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["ID"]))
            {
                SocialLinkId = Request.QueryString["ID"].ToString();
            }
            if (!IsPostBack)
            {
                GetInfo();
                LoadSocialLinkTypes();
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
            Response.Redirect("ProductManagement.aspx");
        }
        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("SocialLinkList.aspx");
        }
        #endregion
        #region Methods
        void Save()
        {
            string ImageFile = string.Empty;
            _rpoObj = new SocialLinkRepository();
            #region Manage Item
            //string FileName = string.Empty;
            _rpoObj._Obj.SocialLinkTypeId = new Guid(ddlSocialLinkType.SelectedValue.ToString());
            _rpoObj._Obj.SocialLinkTitle = txtTitle.Text;
            _rpoObj._Obj.SocialLinkUrl = txtURL.Text;


            //isdefault here


            if (string.IsNullOrEmpty(SocialLinkId))
            {
                _rpoObj._Obj.CreatedBy = new Guid(Request.Cookies["CooLoginUserId"].Value);
                //if (fpld.PostedFile.FileName != "")
                //{
                //    FileName = Guid.NewGuid().ToString() + System.IO.Path.GetExtension(fpld.PostedFile.FileName);
                //    string PathUrl = Server.MapPath(ConfigurationManager.AppSettings["Pages"].ToString()) + FileName;
                //    fpld.SaveAs(PathUrl);
                //    // DAL.ImagesFact.ResizeWithCropResizeImage("", FileName, "Section");
                //    _PageSectionManagement._pageSection.ImageFile = FileName;
                //}
                SocialLinkId = _rpoObj.Add().ToString();
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
                _rpoObj._Obj = _rpoObj.LoadById(SocialLinkId);
                _rpoObj._Obj.SocialLinkTypeId = new Guid(ddlSocialLinkType.SelectedValue.ToString());
                _rpoObj._Obj.SocialLinkTitle = txtTitle.Text;
                _rpoObj._Obj.SocialLinkUrl = txtURL.Text;

                //if (fpld.PostedFile.FileName != "")
                //{
                //    if (_PageSectionManagement._pageSection.ImageFile != null)
                //    {
                //        DirectoryInfo di = new DirectoryInfo(Server.MapPath(ConfigurationManager.AppSettings["Pages"]));
                //        foreach (FileInfo fi in di.GetFiles())
                //        {
                //            if (_PageSectionManagement._pageSection.ImageFile == fi.Name)
                //            {
                //                File.Delete(fi.Name);
                //            }
                //        }
                //    }
                //    FileName = Guid.NewGuid().ToString() + System.IO.Path.GetExtension(fpld.PostedFile.FileName);
                //    string PathUrl = Server.MapPath(ConfigurationManager.AppSettings["Pages"].ToString()) + FileName;
                //    fpld.SaveAs(PathUrl);
                //    // DAL.ImagesFact.ResizeWithCropResizeImage("", FileName, "Section");
                //    _PageSectionManagement._pageSection.ImageFile = FileName;
                //}

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
            if (!string.IsNullOrEmpty(SocialLinkId))
            {
                _rpoObj = new SocialLinkRepository();
                SocialLink SocialLinkEnt = _rpoObj.LoadById(SocialLinkId);
                if (SocialLinkEnt != null)
                {
                    txtTitle.Text = SocialLinkEnt.SocialLinkTitle;
                    txtURL.Text = SocialLinkEnt.SocialLinkUrl;

                    try
                    {
                        ddlSocialLinkType.SelectedValue = SocialLinkEnt.SocialLinkTypeId.ToString();
                    }
                    catch
                    {
                        ddlSocialLinkType.SelectedIndex = -1;
                    }
                }
            }

        }
        void Clear()
        {
            txtTitle.Text = txtURL.Text =string.Empty;
            ddlSocialLinkType.SelectedIndex = -1;
        }
        private void LoadSocialLinkTypes()
        {
            SocialLinkTypeRepository _Obj = new SocialLinkTypeRepository();
            ddlSocialLinkType.DataSource = _Obj.LoadByActiveState();
            ddlSocialLinkType.DataTextField = "SocialLinkTitle";
            ddlSocialLinkType.DataValueField = "Id";

            ddlSocialLinkType.DataBind();
            ddlSocialLinkType.Items.Insert(0, "Select Social Link Type...");
        }
        private void LoadPageTitle()
        {
            MasterPages.Admin.PageTitle = "Social Link ";
            MasterPages.Admin.PageType = "Management";
        }

        #endregion
    }
}