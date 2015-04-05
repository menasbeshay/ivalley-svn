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
    public partial class ManageProducts : System.Web.UI.Page
    {
        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FillCategories();
                Session["CategoryID"] = null;
            }

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
                TN = new TreeNode(dr[ProductCategories.ColumnNames.NameEn].ToString(), dr[ProductCategories.ColumnNames.ProductCategoryID].ToString(), "", "products.aspx?cid=" + dr[ProductCategories.ColumnNames.ProductCategoryID].ToString(), "");
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
                TN = new TreeNode(dr[ProductCategories.ColumnNames.NameEn].ToString(), dr[ProductCategories.ColumnNames.ProductCategoryID].ToString(), "", "products.aspx?cid=" + dr[ProductCategories.ColumnNames.ProductCategoryID].ToString(), "");
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