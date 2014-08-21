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
    public partial class ProductAlbumsManagement : System.Web.UI.Page
    {

        #region Variables
        ProductAlbumRepository _rpoObj;
        #endregion
        #region Property
        public String ProductAlbumId
        {
            set { ViewState["ProductAlbumId"] = value; }
            get { return ViewState["ProductAlbumId"] == null ? string.Empty : ViewState["ProductAlbumId"].ToString(); }
        }
        #endregion
        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["ID"]))
            {
                ProductAlbumId = Request.QueryString["ID"].ToString();
            }
            if (!IsPostBack)
            {
                GetInfo();
                LoadLanguages();
                LoadProducts();
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
            Response.Redirect("ProductAlbumsManagement.aspx");
        }
        protected void btnClear_Click(object sender, EventArgs e)
        {
            Clear();
        }
        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("ProductAlbumsList.aspx");
        }
        protected void btnProductGallery_Click(object sender, EventArgs e)
        {
            Response.Redirect(string.Format("AlbumImagesGallery.aspx?AlbumId={0}&LanguageId={1}", ProductAlbumId, ddlLanguage.SelectedValue.ToString()));
        }

        #endregion
        #region Methods
        void Save()
        {
            string ImageFile = string.Empty;
            _rpoObj = new ProductAlbumRepository();
            #region Manage Item
            //string FileName = string.Empty;
            string FileName = string.Empty;
            _rpoObj._Obj.LanguageId = new Guid(ddlLanguage.SelectedValue.ToString());
            _rpoObj._Obj.ProductId = new Guid(ddlProducts.SelectedValue.ToString());
            _rpoObj._Obj.Title = txtAlbumTitile.Text;
            _rpoObj._Obj.AlbumDescription = txtAlbumDescription.Text;
           

            //isdefault here


            if (string.IsNullOrEmpty(ProductAlbumId))
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
                ProductAlbumId = _rpoObj.Add().ToString();
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
                _rpoObj._Obj = _rpoObj.LoadById(ProductAlbumId);
                _rpoObj._Obj.LanguageId = new Guid(ddlLanguage.SelectedValue.ToString());
                _rpoObj._Obj.ProductId = new Guid(ddlProducts.SelectedValue.ToString());
                _rpoObj._Obj.Title = txtAlbumTitile.Text;
                _rpoObj._Obj.AlbumDescription = txtAlbumDescription.Text;

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
            if (!string.IsNullOrEmpty(ProductAlbumId))
            {
                _rpoObj = new ProductAlbumRepository();
                ProductAlbum ProductAlbumEnt = _rpoObj.LoadById(ProductAlbumId);
                if (ProductAlbumEnt != null)
                {
                    txtAlbumTitile.Text = ProductAlbumEnt.Title;
                    txtAlbumDescription.Text = ProductAlbumEnt.AlbumDescription;


                    //ifrmProductImages.Attributes["src"] = "../MainPages/ProductImagesGallery.aspx?ProductId=" + ProductEnt.Id.ToString() + "&LanguageId=" + ProductEnt.LanguageId.ToString();
                    //TabContainer1.ActiveTabIndex = 1;

                    //TabGallery.Enabled = true;


                    if (!string.IsNullOrEmpty(ProductAlbumEnt.ImageFile))
                    {
                        imgProductImage.ImageUrl = ConfigurationManager.AppSettings["Products"].ToString() + ProductAlbumEnt.ImageFile;
                        imgProductImage.Visible = true;
                    }
                    else
                        imgProductImage.Visible = false;
                    try
                    {
                        ddlLanguage.SelectedValue = ProductAlbumEnt.LanguageId.ToString();
                        ddlProducts.SelectedValue = ProductAlbumEnt.ProductId.ToString();
                    }
                    catch
                    {
                        ddlLanguage.SelectedIndex = -1;
                        ddlProducts.SelectedIndex = -1;
                    }
                }
            }

        }
        void Clear()
        {
            txtAlbumTitile.Text = txtAlbumDescription.Text =  string.Empty;
            ddlLanguage.SelectedIndex = -1;
            ddlProducts.SelectedIndex = -1;
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
        private void LoadProducts()
        {
            ProductRepository _Obj = new ProductRepository();
            ddlProducts.DataSource = _Obj.LoadByActiveState();
            ddlProducts.DataTextField = "ProductTitle";
            ddlProducts.DataValueField = "Id";

            ddlProducts.DataBind();
            ddlProducts.Items.Insert(0, "Select Product...");
        }

        private void LoadPageTitle()
        {
            MasterPages.Admin.PageTitle = "Products Albums ";
            MasterPages.Admin.PageType = "Management";
        }

        #endregion

    }
}