using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using EGEMech.BLL;
namespace website.Admin
{
    public partial class EditProducts : System.Web.UI.Page
    {
        #region properties
        public Product CurrentProduct
        {
            get
            {
                if (Session["CurrentProduct"] != null)
                    return (Product)Session["CurrentProduct"];
                else
                    return null;
            }
            set
            {
                Session["CurrentProduct"] = value;
            }
        }
        #endregion

        #region events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {            
                if (Session["CurrentUser"] != null)
                {
                    Users user = (Users)Session["CurrentUser"];
                    if (!user.IsColumnNull("IsAdmin") && user.IsAdmin)
                    {
                        BindData();
                        LoadDDL();
                        uiPanelViewProducts.Visible = true;
                        uiPanelEdit.Visible = false;
                    }
                    else
                    {
                        Response.Redirect("~/default.aspx");
                    }
                }
                else
                {
                    Response.Redirect("login.aspx");
                }

            }
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            uiPanelEdit.Visible = true;
            uiPanelViewProducts.Visible = false;
            Clearfields();
        }

        protected void uiGridViewProducts_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewProducts.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void uiGridViewProducts_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditProduct")
            {
                Product product = new Product();
                product.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument));
                CurrentProduct = product;
                
                uiTextBoxName.Text = product.Name;
                uiTextBoxCode.Text = product.ProductCode;
                if(!product.IsColumnNull("Price"))
                    uiTextBoxPrice.Text = product.Price.ToString();
                uiFCKeditorDesc.Value = Server.HtmlDecode(product.Description);
                uiDropDownListCategory.SelectedValue = product.CategoryID.ToString();
                if (!product.IsColumnNull("SubCategoryID"))
                    uiDropDownListSubCat.SelectedValue = product.SubCategoryID.ToString();
                uiPanelViewProducts.Visible = false;
                uiPanelEdit.Visible = true;
            }
            else if (e.CommandName == "DeleteProduct")
            {
                try
                {
                    Product product = new Product();
                    product.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument));
                    product.MarkAsDeleted();
                    product.Save();
                    BindData();
                }
                catch (Exception ex)
                {
                    uiLabelError.Visible = true;
                }

            }
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            Product product= new Product();
            if (CurrentProduct != null)
            {
                product = CurrentProduct;
            }
            else
            {
                product.AddNew();
            }

            product.ProductCode = uiTextBoxCode.Text;
            product.Name = uiTextBoxName.Text;
            product.Description = Server.HtmlEncode(uiFCKeditorDesc.Value);
            product.CategoryID = Convert.ToInt32(uiDropDownListCategory.SelectedValue);
            if (!string.IsNullOrEmpty(uiDropDownListSubCat.SelectedValue))
                product.SubCategoryID = Convert.ToInt32(uiDropDownListSubCat.SelectedValue);
            if(!string.IsNullOrEmpty(uiTextBoxPrice.Text))
                product.Price = decimal.Parse(uiTextBoxPrice.Text);
            string file = "";
            if (uiFileUploadImg.HasFile)
            {
                uiFileUploadImg.SaveAs(Server.MapPath("~/UploadFolder/products/" + uiFileUploadImg.FileName));
                file = "/UploadFolder/products/" + uiFileUploadImg.FileName;
                product.PicPath = file;
            }
            
            product.Save();
            uiPanelEdit.Visible = false;
            uiPanelViewProducts.Visible = true;
            Clearfields();
            BindData();
            CurrentProduct = null;
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            uiPanelEdit.Visible = false;
            uiPanelViewProducts.Visible = true;
            Clearfields();
            CurrentProduct = null;

        }


        protected void uiDropDownListCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindSubCats();
        }
        #endregion

        #region methods


        private void BindData()
        {
            Product prod = new Product();
            prod.GetAllProducts();
            uiGridViewProducts.DataSource = prod.DefaultView;
            uiGridViewProducts.DataBind();
        }

        private void LoadDDL()
        {
            Category cats = new Category();
            cats.LoadAll();
            uiDropDownListCategory.DataSource = cats.DefaultView;
            uiDropDownListCategory.DataTextField = "Name";
            uiDropDownListCategory.DataValueField = "CategoryID";
            uiDropDownListCategory.DataBind();
            BindSubCats();
        }

        private void BindSubCats()
        {
            SubCategory subcats = new SubCategory();
            subcats.GetSubCategoryByCatID(Convert.ToInt32(uiDropDownListCategory.SelectedValue));
            uiDropDownListSubCat.DataSource = subcats.DefaultView;
            uiDropDownListSubCat.DataTextField = "Name";
            uiDropDownListSubCat.DataValueField = "SubCategoryID";
            uiDropDownListSubCat.DataBind();
        }

        private void Clearfields()
        {
            uiTextBoxName.Text = "";
            uiTextBoxCode.Text = "";
            uiTextBoxPrice.Text = "";
            uiFCKeditorDesc.Value = "";
        }


        #endregion

    }
}