using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Drawing;

namespace brotherssolidarity.Admin
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["Cid"]))
                {
                    Session["CategoryID"] = int.Parse(Request.QueryString["Cid"]);
                    lblCatNameTitle.Text = "Category : " + getCatName();
                    GrdCatsBind();
                }

                if (!string.IsNullOrEmpty(Request.QueryString["NewProd"]))
                {
                    PlaceHolderEditProd.Visible = true;
                    PlaceHolderFiles.Visible = false;
                    PlaceHolderGrd.Visible = false;
                    PlaceHolderImgs.Visible = false;

                    lblCatName.Text = getCatName();
                }
                else if (productID > 0)
                {
                    if (!string.IsNullOrEmpty(Request.QueryString["EditProd"]))
                    {
                        PlaceHolderEditProd.Visible = true;
                        PlaceHolderFiles.Visible = false;
                        PlaceHolderGrd.Visible = false;
                        PlaceHolderImgs.Visible = false;

                        RequiredFieldValidator4.Enabled = false;

                        BtnSaveProduct.Text = "Update Product";

                        Product prod = new Product();
                        prod.LoadByPrimaryKey(productID);

                        txtProdName.Text = prod.NameEn;
                        txtProdDesc.Text = prod.DescriptionEn;
                        txtVidLink.Text = prod.YouTubeLink;
                        if (!string.IsNullOrWhiteSpace(prod.MainImagePath))
                        {
                            ProdImg.Src = prod.MainImagePath;
                        }
                        chkAvailHome.Checked = prod.AppearInHome;
                        chkActive.Checked = prod.IsActive;
                    }
                    else if (!string.IsNullOrEmpty(Request.QueryString["AddFiles"]))
                    {
                        PlaceHolderEditProd.Visible = false;
                        PlaceHolderFiles.Visible = true;
                        PlaceHolderGrd.Visible = false;
                        PlaceHolderImgs.Visible = false;

                        FilesGrdBind();
                    }
                    else if (!string.IsNullOrEmpty(Request.QueryString["AddImgs"]))
                    {
                        PlaceHolderEditProd.Visible = false;
                        PlaceHolderFiles.Visible = false;
                        PlaceHolderGrd.Visible = false;
                        PlaceHolderImgs.Visible = true;

                        galleryBind();
                    }
                    else
                    {
                        PlaceHolderGrd.Visible = true;
                    }
                }
                else
                {
                    PlaceHolderGrd.Visible = true;
                }
            }

           
        }

        private int productID
        {
            get
            {
                if (!string.IsNullOrEmpty(Request.QueryString["EditProd"]))
                {
                    return int.Parse(Request.QueryString["EditProd"]);
                }
                else if (!string.IsNullOrEmpty(Request.QueryString["AddFiles"]))
                {
                    return int.Parse(Request.QueryString["AddFiles"]);
                }
                else if (!string.IsNullOrEmpty(Request.QueryString["AddImgs"]))
                {
                    return int.Parse(Request.QueryString["AddImgs"]);
                }
                else
                {
                    return 0;
                }
            }
        }

        private string getCatName()
        {
            ProductCategories Cats = new ProductCategories();
            Cats.LoadByPrimaryKey(int.Parse(Session["CategoryID"].ToString()));
            return Cats.NameEn;
        }

        //private void GrdBind()
        //{
        //    Product prod = new Product();
        //    prod.LoadAll();
        //    GrdViewProducts.DataSource = prod.DefaultView;
        //    GrdViewProducts.DataBind();
        //}

        private void GrdCatsBind()
        {
            Product prod = new Product();
            prod.Where.CatID.Value = int.Parse(Request.QueryString["Cid"]);
            prod.Where.CatID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
            prod.Query.Load();

            GrdViewProducts.DataSource = prod.DefaultView;
            GrdViewProducts.DataBind();
        }

        protected void GrdViewProducts_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            switch (e.CommandName.ToString())
            {
                case "EditProduct":
                    Response.Redirect("Products.aspx?EditProd=" + e.CommandArgument.ToString());
                    break;

                case "AddFiles":
                    Response.Redirect("Products.aspx?AddFiles=" + e.CommandArgument.ToString());
                    break;

                case "AddImgs":
                    Response.Redirect("Products.aspx?AddImgs=" + e.CommandArgument.ToString());
                    break;

                case "DeleteProduct":
                    Product delProd = new Product();
                    delProd.LoadByPrimaryKey(int.Parse(e.CommandArgument.ToString()));
                    delProd.MarkAsDeleted();
                    delProd.Save();
                    GrdCatsBind();
                    break;

                default:
                    break;
            }
        }

        protected void GrdViewFiles_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteFile")
            {
                ProductFiles ProdFile = new ProductFiles();
                ProdFile.LoadByPrimaryKey(int.Parse(e.CommandArgument.ToString()));
                ProdFile.MarkAsDeleted();
                ProdFile.Save();
                FilesGrdBind();
            }
        }
        //private void drpDwnBind()
        //{
        //    ProductCategories prodCats = new ProductCategories();
        //    prodCats.LoadAll();
        //    drpDwnCats.DataSource = prodCats.DefaultView;
        //    drpDwnCats.DataBind();
        //}

        private void FilesGrdBind()
        {
            ProductFiles prodF = new ProductFiles();
            prodF.Where.ProductID.Value = productID;
            prodF.Where.ProductID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
            prodF.Query.Load();

            GrdViewFiles.DataSource = prodF.DefaultView;
            GrdViewFiles.DataBind();
        }

        protected void ProdImgsGallery_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName =="DelteImg")
            {
                ProductImages prodImgs = new ProductImages();
                prodImgs.LoadByPrimaryKey(int.Parse(e.CommandArgument.ToString()));
                prodImgs.MarkAsDeleted();
                prodImgs.Save();
                galleryBind();
            }
        }

        private void galleryBind()
        {
            ProductImages prodImgs = new ProductImages();
            prodImgs.Where.ProductID.Value = productID;
            prodImgs.Where.ProductID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
            prodImgs.Query.Load();

            ProdImgsGallery.DataSource = prodImgs.DefaultView;
            ProdImgsGallery.DataBind();
        }

        protected void BtnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Products.aspx?cid=" + Session["CategoryID"]);
        }

        protected void BtnSaveProduct_Click(object sender, EventArgs e)
        {
            Product prod = new Product();

            if (productID>0)
            {
                prod.LoadByPrimaryKey(productID);
            }
            else
            {
                prod.AddNew();
            }
            prod.NameEn = txtProdName.Text;
            prod.CatID = int.Parse(Session["CategoryID"].ToString());
            prod.DescriptionEn = txtProdDesc.Text;
            if (FileUploadMainImg.HasFile)
            {
                Bitmap UpImg = (Bitmap)Bitmap.FromStream(FileUploadMainImg.PostedFile.InputStream);
                string path = "UploadedFiles/Products/" + DateTime.Now.ToString("ddMMyyyyhhmmss") + FileUploadMainImg.FileName;
                UpImg.Save(MapPath(path), System.Drawing.Imaging.ImageFormat.Png);
                prod.MainImagePath = path;
            }
            prod.YouTubeLink = txtVidLink.Text;
            prod.AppearInHome = chkAvailHome.Checked;
            prod.IsActive = chkActive.Checked;
            prod.Save();
            Response.Redirect("Products.aspx?cid=" + Session["CategoryID"]);
        }

        protected void btnAddFile_Click(object sender, EventArgs e)
        {
            ProductFiles prodFile = new ProductFiles();
            prodFile.AddNew();
            prodFile.ProductID = productID;
            prodFile.FileNameEn = txtFileName.Text;
            prodFile.FileDescriptionEn = txtFileDesc.Text;

            if (FileUploadFile.HasFile)
            {
                string path = "/admin/UploadedFiles/ProductsFiles/" + DateTime.Now.ToString("ddMMyyyyhhmmss") + FileUploadFile.FileName;
                FileUploadFile.SaveAs(MapPath("~/" + path));
                prodFile.FilePath = path;
            }
            prodFile.Save();
            FilesGrdBind();
        }

        protected void BtnSaveGalleryImg_Click(object sender, EventArgs e)
        {
            ProductImages prodImgs = new ProductImages();
            prodImgs.AddNew();
            prodImgs.ProductID = productID;
            prodImgs.NameEn = txtProdImgName.Text;
            
            if (FileUploadProdGalleryImg.HasFile)
            {
                Bitmap UpImg = (Bitmap)Bitmap.FromStream(FileUploadProdGalleryImg.PostedFile.InputStream);
                string path = "UploadedFiles/Products/" + DateTime.Now.ToString("ddMMyyyyhhmmss") + FileUploadProdGalleryImg.FileName;
                UpImg.Save(MapPath(path), System.Drawing.Imaging.ImageFormat.Png);
                prodImgs.ImagePath = path;
            }
            prodImgs.Save();
            galleryBind();
        }

        protected void btnCreateProduct_Click(object sender, EventArgs e)
        {
            Response.Redirect("Products.aspx?NewProd=1");
        }
    }
}