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
    public partial class ProductManagement : System.Web.UI.Page
    {

        #region Variables
        ProductRepository _rpoObj;
        #endregion
        #region Property
        public String ProductId
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
                ProductId = Request.QueryString["ID"].ToString();
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
            Response.Redirect("ProductManagement.aspx");
        }
        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProductList.aspx");
        }
        protected void btnProductGallery_Click(object sender, EventArgs e)
        {
            Response.Redirect(string.Format( "ProductImagesGalleryMaster.aspx?ProductId={0}&LanguageId={1}" , ProductId , ddlLanguage.SelectedValue.ToString()));
        }

        #endregion
        #region Methods
        void Save()
        {
            string ImageFile = string.Empty;
            _rpoObj = new ProductRepository();
            #region Manage Item
            //string FileName = string.Empty;
            string FileName = string.Empty;
            _rpoObj._Obj.LanguageId = new Guid(ddlLanguage.SelectedValue.ToString());
            _rpoObj._Obj.ProductTitle = txtproductTitile.Text;
            _rpoObj._Obj.ShortDescription = edtrShortDescription.Content;
            _rpoObj._Obj.FullDescription = edtrFullDescription.Content;

            //isdefault here


            if (string.IsNullOrEmpty(ProductId))
            {
                _rpoObj._Obj.CreatedBy = new Guid(Request.Cookies["CooLoginUserId"].Value);
                if (fpld.PostedFile.FileName != "")
                {
                    FileName = Guid.NewGuid().ToString() + System.IO.Path.GetExtension(fpld.PostedFile.FileName);
                    string PathUrl = Server.MapPath(ConfigurationManager.AppSettings["Products"].ToString()) + FileName;
                    fpld.SaveAs(PathUrl);
                    // DAL.ImagesFact.ResizeWithCropResizeImage("", FileName, "Section");
                    _rpoObj._Obj.ImageFile = FileName;
                }
                ProductId = _rpoObj.Add().ToString();
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
                _rpoObj._Obj = _rpoObj.LoadById(ProductId);
                _rpoObj._Obj.LanguageId = new Guid(ddlLanguage.SelectedValue.ToString());
                _rpoObj._Obj.ProductTitle = txtproductTitile.Text;
                _rpoObj._Obj.ShortDescription = edtrShortDescription.Content;
                _rpoObj._Obj.FullDescription = edtrFullDescription.Content;

                if (fpld.PostedFile.FileName != "")
                {
                    if (_rpoObj._Obj.ImageFile != null)
                    {
                        DirectoryInfo di = new DirectoryInfo(Server.MapPath(ConfigurationManager.AppSettings["Products"]));
                        foreach (FileInfo fi in di.GetFiles())
                        {
                            if (_rpoObj._Obj.ImageFile == fi.Name)
                            {
                                File.Delete(fi.Name);
                            }
                        }
                    }
                    FileName = Guid.NewGuid().ToString() + System.IO.Path.GetExtension(fpld.PostedFile.FileName);
                    string PathUrl = Server.MapPath(ConfigurationManager.AppSettings["Products"].ToString()) + FileName;
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
            if (!string.IsNullOrEmpty(ProductId))
            {
                _rpoObj = new ProductRepository();
                Product ProductEnt = _rpoObj.LoadById(ProductId);
                if (ProductEnt != null)
                {
                    txtproductTitile.Text = ProductEnt.ProductTitle;
                    edtrShortDescription.Content = ProductEnt.ShortDescription;
                    edtrFullDescription.Content = ProductEnt.FullDescription;


                    //ifrmProductImages.Attributes["src"] = "../MainPages/ProductImagesGallery.aspx?ProductId=" + ProductEnt.Id.ToString() + "&LanguageId=" + ProductEnt.LanguageId.ToString();
                    //TabContainer1.ActiveTabIndex = 1;

                    //TabGallery.Enabled = true;


                    if (!string.IsNullOrEmpty(ProductEnt.ImageFile))
                    {
                        imgProductImage.ImageUrl = ConfigurationManager.AppSettings["Products"].ToString() + ProductEnt.ImageFile;
                        imgProductImage.Visible = true;
                    }
                    else
                        imgProductImage.Visible = false;
                    try
                    {
                        ddlLanguage.SelectedValue = ProductEnt.LanguageId.ToString();
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
            txtproductTitile.Text = edtrShortDescription.Content = edtrFullDescription.Content = string.Empty;
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
            MasterPages.Admin.PageTitle = "Products ";
            MasterPages.Admin.PageType = "Management";
        }

        #endregion

    }
}