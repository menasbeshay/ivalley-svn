using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace website.Admin
{
    public partial class EditProducts : System.Web.UI.Page
    {

        #region properties
        public int CurrentProduct
        {
            get
            {
                if (Session["CurrentProduct"] != null)
                    return (int)Session["CurrentProduct"];
                else
                    return 0;
            }
            set
            {
                Session["CurrentProduct"] = value;
            }
        }

        public int CurrentItem
        {
            get
            {
                if (Session["CurrentItem"] != null)
                    return (int)Session["CurrentItem"];
                else
                    return 0;
            }
            set
            {
                Session["CurrentItem"] = value;
            }
        }
        #endregion

        #region Events
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CurrentUser"] == null)
                {
                    Response.Redirect("Login.aspx");
                }    
                LoadDDLs();
                BindData();
                uiPanelViewProducts.Visible = true;
                uiPanelEdit.Visible = false;
                uiPanelAllItems.Visible = false;
            }
        }

        protected void uiDropDownListCats_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindData();
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            uiPanelEdit.Visible = true;
            uiPanelViewProducts.Visible = false;
            uiPanelAllItems.Visible = false;
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
                DBLayer db = new DBLayer();
                CurrentProduct = Convert.ToInt32(e.CommandArgument);
                DataSet ds = db.GetProductContent(CurrentProduct);
                uiTextBoxName.Text = ds.Tables[0].Rows[0]["ProductName"].ToString();
                
                uiPanelViewProducts.Visible = false;
                uiPanelEdit.Visible = true;
                uiPanelAllItems.Visible = true;
                BindItems();

            }
            else if (e.CommandName == "DeleteProduct")
            {
                DBLayer db = new DBLayer();
                db.DeleteProduct(Convert.ToInt32(e.CommandArgument));
                CurrentProduct = 0;
                BindData();

            }
        }


        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            if (CurrentProduct != 0)
            {
                UpdateRecord();
            }
            else
            {
                AddNewRecord();
            }

            uiPanelEdit.Visible = (CurrentProduct != 0 );
            uiPanelViewProducts.Visible = (CurrentProduct == 0);
            uiPanelAllItems.Visible = (CurrentProduct != 0);
            Clearfields();
            BindData();
            
        }

        protected void uiButtonCancel_Click(object sender, EventArgs e)
        {
            uiPanelEdit.Visible = false;
            uiPanelViewProducts.Visible = true;
            Clearfields();
            CurrentProduct = 0;
        }



        protected void uiLinkButtonBack_Click(object sender, EventArgs e)
        {
            uiPanelEdit.Visible = false;
            uiPanelViewProducts.Visible = true;
            uiPanelAllItems.Visible = false;
            Clearfields();
            CurrentProduct = 0;
            CurrentItem = 0;
        }

        protected void uiLinkButtonAddItems_Click(object sender, EventArgs e)
        {
            if (CurrentItem != 0)
            {                
                DBLayer db = new DBLayer();
                db.SetItemContent(CurrentItem, CurrentProduct, uiTextBoxItemName.Text, uiTextBoxDim.Text, uiTextBoxCode.Text);
                BindItems();
                uiTextBoxItemName.Text = "";
                uiTextBoxDim.Text = "";
                uiTextBoxCode.Text = "";
            }
            else
            {
                DBLayer db = new DBLayer();
                db.AddItemContent(uiTextBoxItemName.Text, uiTextBoxDim.Text, uiTextBoxCode.Text, CurrentProduct);
                BindItems();
                uiTextBoxItemName.Text = "";
                uiTextBoxDim.Text = "";
                uiTextBoxCode.Text = "";  
            }
        }

        protected void uiGridViewItems_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            uiGridViewItems.PageIndex = e.NewPageIndex;
            BindItems();
        }

        protected void uiGridViewItems_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditItem")
            {
                DBLayer db = new DBLayer();
                CurrentItem = Convert.ToInt32(e.CommandArgument);
                DataSet ds = db.GetItemContent(CurrentItem);
                uiTextBoxItemName.Text = ds.Tables[0].Rows[0]["itemName"].ToString();
                uiTextBoxDim.Text = ds.Tables[0].Rows[0]["dimension"].ToString();
                uiTextBoxCode.Text = ds.Tables[0].Rows[0]["code"].ToString();                                
                
            }
            else if (e.CommandName == "DeleteItem")
            {
                DBLayer db = new DBLayer();
                db.Deleteitem(Convert.ToInt32(e.CommandArgument));
                CurrentItem = 0;
                BindItems();

            }
        }
        #endregion

        #region Methods
        private void BindData()
        {
            DBLayer db = new DBLayer();
            uiGridViewProducts.DataSource = db.GetAllProductByCatID(Convert.ToInt32(uiDropDownListCats.SelectedValue));
            uiGridViewProducts.DataBind();
        }

        private void BindItems()
        {
            DBLayer db = new DBLayer();
            uiGridViewItems.DataSource = db.GetAllItemsByProductID(CurrentProduct);
            uiGridViewItems.DataBind();
        }

        private void AddNewRecord()
        {
            DBLayer db = new DBLayer();

            string filepath = "";
            if (uiFileUploadMainPicturePath.HasFile)
            {
                uiFileUploadMainPicturePath.SaveAs(Server.MapPath("~/UploadedFiles/products/" + uiFileUploadMainPicturePath.FileName));
                filepath = "/UploadedFiles/products/" + uiFileUploadMainPicturePath.FileName;
            }
            db.AddProductContent(uiTextBoxName.Text, filepath, Convert.ToInt32(uiDropDownListCats.SelectedValue));

        }

        private void UpdateRecord()
        {
            DBLayer db = new DBLayer();

            string filepath = "";
            if (uiFileUploadMainPicturePath.HasFile)
            {
                uiFileUploadMainPicturePath.SaveAs(Server.MapPath("~/UploadedFiles/products/" + uiFileUploadMainPicturePath.FileName));
                filepath = "/UploadedFiles/products/" + uiFileUploadMainPicturePath.FileName;
            }

            db.SetProductContent(CurrentProduct, uiTextBoxName.Text,filepath);

        }



        private void Clearfields()
        {
            uiTextBoxName.Text = "";            
        }

        private void LoadDDLs()
        {
             DBLayer db = new DBLayer();
             uiDropDownListCats.DataSource = db.GetAllCats();
             uiDropDownListCats.DataTextField = "CategoryName";
             uiDropDownListCats.DataValueField = "ID";
             uiDropDownListCats.DataBind();
        }

        #endregion



    }
}