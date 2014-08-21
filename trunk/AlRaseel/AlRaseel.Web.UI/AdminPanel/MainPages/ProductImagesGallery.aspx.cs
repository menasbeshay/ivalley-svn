using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Data.DataModels;
using Data.Extensions;
using Data.Repositories;
using System.IO;

namespace Web.UI.AdminPanel.MainPages
{
    public partial class ProductImagesGallery : System.Web.UI.Page
    {
        #region Variables

        ProductImagesRepositories _rpoObj;
        #endregion
        #region Properties
        public string ProductImageId
        {
            set { ViewState["ProductImageId"] = value; }
            get { return ViewState["ProductImageId"] == null ? string.Empty : ViewState["ProductImageId"].ToString(); }
        }
        public string ProductId
        {
            set { ViewState["ProductId"] = value; }
            get { return ViewState["ProductId"] == null ? string.Empty : ViewState["ProductId"].ToString(); }
        }
        public string ImageFile
        {
            set { ViewState["ImageFile"] = value; }
            get { return ViewState["ImageFile"] == null ? string.Empty : ViewState["ImageFile"].ToString(); }
        }
        public string LanguageId
        {
            set { ViewState["LanguageId"] = value; }
            get { return ViewState["LanguageId"] == null ? string.Empty : ViewState["LanguageId"].ToString(); }
        }
        public string Section_Name { get; set; }
        #endregion
        #region EventHandler
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["ProductId"]))
                {
                    ProductId = Request.QueryString["ProductId"];
                }
                if (!string.IsNullOrEmpty(Request.QueryString["LanguageId"]))
                {
                    LanguageId = Request.QueryString["LanguageId"];
                }
                BindingListView();
            }
        }
        protected void AjaxFileUpload1_UploadComplete(object sender, AjaxControlToolkit.AjaxFileUploadEventArgs e)
        {
            string FileName = Section_Name + Guid.NewGuid().ToString().Replace("-", "") + Path.GetExtension(e.FileName);
            string PathUrl = Server.MapPath("~/Files/Products/") + FileName;
            AjaxFileUpload1.SaveAs(PathUrl);
            string x = "";

            if (!Save(FileName, out x))
            {
                lblMessge.Text = x;
            }
            else
                lblMessge.Text = x;
            BindingListView();
        }
        protected void lstview_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            _rpoObj = new ProductImagesRepositories();
            switch (e.CommandName)
            {
                case "restoreitem":
                    if (_rpoObj.Restore(e.CommandArgument.ToString(), Request.Cookies["CooLoginUserId"].Value))
                    { lstview.DataBind(); }
                    break;
                case "deleteitem":
                    if (_rpoObj.Delete(e.CommandArgument.ToString(), Request.Cookies["CooLoginUserId"].Value))
                    { lstview.DataBind(); }
                    break;
                case "edititem":
                    ProductImageId = e.CommandArgument.ToString();
                    GetInfo();
                    break;
            }
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            string x = string.Empty;
            Save(ImageFile, out x);
            lblMessge.Text = x;
            AjaxFileUpload1.MaximumNumberOfFiles = 10;
            Clear();
        }
        protected void updatePanelAttachments_PreRender(object sender, EventArgs e)
        {
            BindingListView();
        }

        protected void TxtTitle_TextChanged(object sender, EventArgs e)
        {
            ViewState["Desc"] = TxtTitle.Text;
        }

        #endregion
        #region Methods
        bool Save(string FileName, out string MSG)
        {
            _rpoObj = new ProductImagesRepositories();
            if (string.IsNullOrEmpty(ProductImageId))
            {
                //Add
                if (!string.IsNullOrEmpty(FileName))
                {
                    //ProductImageId = _rpoObj.Add(null, ProductId, FileName, Request.Cookies["UserWebsiteId"].Value);
                    _rpoObj._Obj.ProductId = new Guid(ProductId);
                    _rpoObj._Obj.ImageFile = FileName;
                    _rpoObj._Obj.CreatedBy = new Guid(Request.Cookies["CooLoginUserId"].Value);
                    _rpoObj._Obj.LanguageId = new Guid(LanguageId);


                    if (!string.IsNullOrEmpty(ProductImageId))
                    {
                        MSG = "done";
                        return true;
                    }
                    else
                    {
                        MSG = "Select Images to upload";
                        return false;
                    }
                }
                else
                {
                    MSG = "Select Images to be uploaded";
                    return false;
                }
            }
            else
            {

                _rpoObj._Obj = _rpoObj.LoadById(ProductImageId);
                _rpoObj._Obj.ProductId = new Guid(ProductId);
                _rpoObj._Obj.ImageFile = FileName;
                _rpoObj._Obj.ModifiedBy = new Guid(Request.Cookies["CooLoginUserId"].Value);
                _rpoObj._Obj.LanguageId = new Guid(LanguageId);

                //Edit
                if (_rpoObj.Edit())
                {
                    MSG = "Update Complete.";
                    return true;
                }
                else
                {
                    MSG = "Update Failed";
                    return false;
                }
            }

        }
        void GetInfo()
        {
            if (!string.IsNullOrEmpty(ProductImageId))
            {
                AjaxFileUpload1.MaximumNumberOfFiles = 1;
                _rpoObj = new ProductImagesRepositories();
                ProductImage ProductImageEnt = _rpoObj.LoadById(ProductImageId);

                if (ProductImageEnt != null)
                {
                    imgEdit.ImageUrl = "~/Files/Products/" + ProductImageEnt.ImageFile;
                    ImageFile = ProductImageEnt.ImageFile;
                    tbEdit.Visible = true;
                }
            }
        }
        public void BindingListView()
        {
            objImages.SelectParameters["ID"].DefaultValue = ProductId;
            lstview.DataBind();
            ScriptManager.GetCurrent(this.Page).RegisterPostBackControl(lstview);
        }
        void Clear() { TxtTitle.Text = imgEdit.ImageUrl = string.Empty; }


        #endregion

    }
}