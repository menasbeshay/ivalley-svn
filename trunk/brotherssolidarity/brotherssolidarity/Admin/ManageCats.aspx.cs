using BLL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace brotherssolidarity.Admin
{
    public partial class ManageCats : System.Web.UI.Page
    {
        #region Properties
        public int CatID
        {
            get
            {
                if (Request.QueryString["cid"] != null && !string.IsNullOrEmpty(Request.QueryString["cid"]))
                {
                    return Convert.ToInt32(Request.QueryString["cid"].ToString());
                }
                return 0;
            }
        }

        public int ParentCatID
        {
            get
            {
                if (Request.QueryString["pcid"] != null && !string.IsNullOrEmpty(Request.QueryString["pcid"]))
                {
                    return Convert.ToInt32(Request.QueryString["pcid"].ToString());
                }
                return 0;
            }
        }

        public int AddNew
        {
            get
            {
                if (Request.QueryString["new"] != null && !string.IsNullOrEmpty(Request.QueryString["new"]))
                {
                    return Convert.ToInt32(Request.QueryString["new"].ToString());
                }
                return 0;
            }
        }

        public bool IsParent
        {
            get
            {
                if (Request.QueryString["isp"] != null && !string.IsNullOrEmpty(Request.QueryString["isp"]))
                {
                    return Convert.ToBoolean(Request.QueryString["isp"].ToString());
                }
                return false;
            }
        }
        #endregion

        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {               
                if (CatID != 0)
                {
                    ProductCategories cat = new ProductCategories();
                    cat.LoadByPrimaryKey(CatID);
                    uiTextBoxName.Text = cat.NameEn;
                    uiTextBoxDesc.Text = cat.DescriptionEn;
                    uiImageMain.ImageUrl = cat.ImagePath;
                    uiPanelEdit.Visible = true;
                    
                    
                }
                else if(AddNew == 1)
                    uiPanelEdit.Visible = true;
                else
                {
                    uiPanelEdit.Visible = false;
                }

                // Bind Categories from the DB.
                FillCategories();
            }
        }

        protected void uiLinkButtonAddParentCat_Click(object sender, EventArgs e)
        {
            Response.Redirect("managecats.aspx?new=1&isp=true");
        }

        protected void uiLinkButtonAddSubCat_Click(object sender, EventArgs e)
        {
            Response.Redirect("managecats.aspx?new=1&isp=false&pcid=" + CatID.ToString());
        }

        protected void uiLinkButtonSave_Click(object sender, EventArgs e)
        {
            ProductCategories cat = new ProductCategories();
            if (AddNew != 0)
                cat.AddNew();
            else
                cat.LoadByPrimaryKey(CatID);
            cat.NameEn = uiTextBoxName.Text;
            cat.DescriptionEn = uiTextBoxDesc.Text;
            if (!IsParent && ParentCatID !=0)
            {
                cat.CategoryParentID = ParentCatID;
            }
            if (uiFileUploadImg.HasFile) 
            {
                string filepath = "/admin/UploadedFiles/cats/" + DateTime.Now.ToString("ddMMyyyyhhmmss") + "_" + uiFileUploadImg.FileName;
                uiFileUploadImg.SaveAs(Server.MapPath("~" + filepath));
                cat.ImagePath= filepath;
            }
            cat.Save();
            FillCategories();
            uiPanelEdit.Visible = false;
            clearFields();
        }

        protected void uiLinkButtonCancel_Click(object sender, EventArgs e)
        {
            clearFields();
            uiPanelEdit.Visible = false;

        }

        protected void uiLinkButtonDelete_Click(object sender, EventArgs e)
        {
            ProductCategories cat = new ProductCategories();
            cat.LoadByPrimaryKey(CatID);
            cat.MarkAsDeleted();
            cat.Save();
            FillCategories();
            uiPanelEdit.Visible = false;
        }

        #endregion

        #region Methods

        private void FillCategories()
        {
            uiTreeViewCats.Nodes.Clear();
            // Fill Main Categories and loop with each nood to bind it's childs 
            ProductCategories objCat = new ProductCategories();

            TreeNode TN = new TreeNode();
            DataTable dt = objCat.GetMainCategories();
            foreach (DataRow dr in dt.Rows)
            {
                TN = new TreeNode(dr[ProductCategories.ColumnNames.NameEn].ToString() , dr[ProductCategories.ColumnNames.ProductCategoryID].ToString(), "", "ManageCats.aspx?cid=" + dr[ProductCategories.ColumnNames.ProductCategoryID].ToString(), "");
                TN.SelectAction = TreeNodeSelectAction.Expand;
                //TN.Expanded = true;
                GetCategories(TN);
                uiTreeViewCats.Nodes.Add(TN);
            }
        }

        private void GetCategories(TreeNode TNN)
        {
            // Fill child categories for certain Parent .. and loop inside it to bind all leafs under it.
            ProductCategories objCat = new ProductCategories();
            TreeNode TN = new TreeNode();

            DataTable dt = objCat.GetSubCategories(Int32.Parse(TNN.Value));
            foreach (DataRow dr in dt.Rows)
            {
                TN = new TreeNode(dr[ProductCategories.ColumnNames.NameEn].ToString(), dr[ProductCategories.ColumnNames.ProductCategoryID].ToString(), "", "ManageCats.aspx?cid=" + dr[ProductCategories.ColumnNames.ProductCategoryID].ToString(), "");
                TN.SelectAction = TreeNodeSelectAction.Expand;
                //TN.Expanded = true;
                TNN.ChildNodes.Add(TN);
                GetCategories(TN);
            }
        }


        private void clearFields()
        {
            uiTextBoxDesc.Text = "";
            uiTextBoxName.Text = "";
            uiImageMain.ImageUrl = "";           
        }
        #endregion

        

        
    }
}