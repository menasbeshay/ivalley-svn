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
    public partial class ContactManagement : System.Web.UI.Page
    {
        #region Variables
        ContactRepository _rpoObj;
        #endregion
        #region Property
        public String ContactId
        {
            set { ViewState["ContactId"] = value; }
            get { return ViewState["ContactId"] == null ? string.Empty : ViewState["ContactId"].ToString(); }
        }
        #endregion
        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["ID"]))
            {
                ContactId = Request.QueryString["ID"].ToString();
            }
            if (!IsPostBack)
            {
                GetInfo();
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
            Response.Redirect("ContactManagement.aspx");
        }
        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("ContactList.aspx");
        }
        #endregion
        #region Methods
        void Save()
        {
            string ImageFile = string.Empty;
            _rpoObj = new ContactRepository();
            #region Manage Item
            //string FileName = string.Empty;
            _rpoObj._Obj.LanguageId = new Guid(ddlLanguage.SelectedValue.ToString());
            _rpoObj._Obj.Title = txtTitle.Text;
            _rpoObj._Obj.Address = txtAddress.Text;
            _rpoObj._Obj.Phone = txtPhone.Text;
            _rpoObj._Obj.Mobile = txtMobile.Text;
            _rpoObj._Obj.Fax = txtFax.Text;
            _rpoObj._Obj.Email = txtEmail.Text;
            _rpoObj._Obj.WorkHours = txtWorkHours.Text;

            //isdefault here


            if (string.IsNullOrEmpty(ContactId))
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
                ContactId = _rpoObj.Add().ToString();
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
                _rpoObj._Obj = _rpoObj.LoadById(ContactId);
                _rpoObj._Obj.LanguageId = new Guid(ddlLanguage.SelectedValue.ToString());
                _rpoObj._Obj.Title = txtTitle.Text;
                _rpoObj._Obj.Address = txtAddress.Text;
                _rpoObj._Obj.Phone = txtPhone.Text;
                _rpoObj._Obj.Mobile = txtMobile.Text;
                _rpoObj._Obj.Fax = txtFax.Text;

                _rpoObj._Obj.Email = txtEmail.Text;
                _rpoObj._Obj.WorkHours = txtWorkHours.Text;

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
            if (!string.IsNullOrEmpty(ContactId))
            {
                _rpoObj = new ContactRepository();
                Contact ContactEnt = _rpoObj.LoadById(ContactId);
                if (ContactEnt != null)
                {
                    txtTitle.Text = ContactEnt.Title;
                    txtAddress.Text = ContactEnt.Address;
                    txtPhone.Text = ContactEnt.Phone;
                    txtMobile.Text = ContactEnt.Mobile;
                    txtFax.Text = ContactEnt.Fax;
                    txtEmail.Text = ContactEnt.Email;
                    txtWorkHours.Text = ContactEnt.WorkHours;
                    try
                    {
                        ddlLanguage.SelectedValue = ContactEnt.LanguageId.ToString();
                    }
                    catch
                    {
                        ddlLanguage.SelectedIndex = -1;
                    }
                }
            }

        }
        void Clear()
        {
            txtTitle.Text = txtAddress.Text = txtFax.Text = txtMobile.Text = txtPhone.Text = txtWorkHours.Text = txtEmail.Text = string.Empty;
            ddlLanguage.SelectedIndex = -1;
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
        private void LoadPageTitle()
        {
            MasterPages.Admin.PageTitle = "Contact Us";
            MasterPages.Admin.PageType = "Management";
        }

        #endregion
    }
}