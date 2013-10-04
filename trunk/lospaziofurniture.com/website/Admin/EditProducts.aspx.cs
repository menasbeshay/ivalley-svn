using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;

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
            }
        }

        protected void uiDropDownListCats_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindData();
        }

        protected void uiLinkButtonAdd_Click(object sender, EventArgs e)
        {
            if (uiDropDownListCats.SelectedValue != "0")
            {
                uiPanelEdit.Visible = true;
                uiPanelViewProducts.Visible = false;
                CurrentProduct = 0;
                Clearfields();
            }
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
                uiTextBoxDescription.Text = ds.Tables[0].Rows[0]["Description"].ToString();
                uiTextBoxPrice.Text = ds.Tables[0].Rows[0]["Price"].ToString();
                uiPanelViewProducts.Visible = false;
                uiPanelEdit.Visible = true;
                

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
            CurrentProduct = 0;
            uiPanelEdit.Visible = (CurrentProduct != 0);
            uiPanelViewProducts.Visible = (CurrentProduct == 0);
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
            
            Clearfields();
            CurrentProduct = 0;
        }

        #endregion

        #region Methods
        private void BindData()
        {
            DBLayer db = new DBLayer();
            uiGridViewProducts.DataSource = db.GetAllProductByCatID(Convert.ToInt32(uiDropDownListCats.SelectedValue));
            uiGridViewProducts.DataBind();
        }

        

        private void AddNewRecord()
        {
            DBLayer db = new DBLayer();

            string filepath = "";
            if (uiFileUploadMainPicturePath.HasFile)
            {


                filepath = "/UploadedFiles/products/" + uiDropDownListCats.SelectedValue + "b_" +uiFileUploadMainPicturePath.FileName;
                if(uiCheckBoxOptimize.Checked)
                    optimizePic(filepath);
                else
                    uiFileUploadMainPicturePath.SaveAs(Server.MapPath("~/UploadedFiles/products/" + uiDropDownListCats.SelectedValue + "b_"  +uiFileUploadMainPicturePath.FileName));
            }

            string thumbfilepath = "";
            if (uiFileUploadThumbs.HasFile)
            {
                uiFileUploadThumbs.SaveAs(Server.MapPath("~/UploadedFiles/products/" + uiDropDownListCats.SelectedValue + "s_"  +uiFileUploadThumbs.FileName));
                thumbfilepath = "/UploadedFiles/products/" + uiDropDownListCats.SelectedValue + "s_" + uiFileUploadThumbs.FileName;
            }
            db.AddProductContent(uiTextBoxName.Text, filepath, Convert.ToInt32(uiDropDownListCats.SelectedValue), thumbfilepath, uiTextBoxDescription.Text, uiTextBoxPrice.Text);

        }

        private void UpdateRecord()
        {
            DBLayer db = new DBLayer();

            string filepath = "";
            if (uiFileUploadMainPicturePath.HasFile)
            {

                filepath = "/UploadedFiles/products/" + uiDropDownListCats.SelectedValue + "b_" + uiFileUploadMainPicturePath.FileName;
                if(uiCheckBoxOptimize.Checked)
                    optimizePic(filepath);
                else
                    uiFileUploadMainPicturePath.SaveAs(Server.MapPath("~/UploadedFiles/products/" + uiDropDownListCats.SelectedValue + "b_" + uiFileUploadMainPicturePath.FileName));
            }

            string thumbfilepath = "";
            if (uiFileUploadThumbs.HasFile)
            {
                uiFileUploadThumbs.SaveAs(Server.MapPath("~/UploadedFiles/products/" + uiDropDownListCats.SelectedValue + "s_" + uiFileUploadThumbs.FileName));
                thumbfilepath = "/UploadedFiles/products/" + uiDropDownListCats.SelectedValue + "s_" + uiFileUploadThumbs.FileName;
            }
            db.SetProductContent(CurrentProduct, uiTextBoxName.Text, filepath, thumbfilepath, uiTextBoxDescription.Text, uiTextBoxPrice.Text);

        }



        private void Clearfields()
        {
            uiTextBoxName.Text = "";
            uiTextBoxDescription.Text = "";
            uiTextBoxPrice.Text = "";
            uiCheckBoxOptimize.Checked = false;
        }

        private void LoadDDLs()
        {
            DBLayer db = new DBLayer();
            uiDropDownListCats.DataSource = db.GetAllCats();
            uiDropDownListCats.DataTextField = "CategoryName";
            uiDropDownListCats.DataValueField = "ID";
            uiDropDownListCats.DataBind();
            uiDropDownListCats.Items.Insert(0, new ListItem("Choose Category", "0"));
        }


        private void optimizePic(string path)
        {
            /*****************************************************************************************************************/
            const int bmpW = 710;
            const int bmpH = 410;
            int newWidth = bmpW;
            int newHeight = bmpH;
            //string upName = uiFileUploadPhoto.FileName.Substring(0, (uiFileUploadPhoto.FileName.IndexOf(".") - 1));

            //string filePath = "~/Upload/" + upName + ".png";
            Bitmap upBmp = (Bitmap)Bitmap.FromStream(uiFileUploadMainPicturePath.PostedFile.InputStream);
            Bitmap newBmp = new Bitmap(newWidth, newHeight, System.Drawing.Imaging.PixelFormat.Format24bppRgb);
            newBmp.SetResolution(72, 72);
            decimal upWidth = upBmp.Width;
            decimal upHeight = upBmp.Height;
            int newX = 0;
            int newY = 0;
            decimal reDuce;
            if (upWidth > upHeight)
            {
                reDuce = newWidth / upWidth;
                newHeight = Convert.ToInt32(upHeight * reDuce);
                //newY = Convert.ToInt32((bmpH - newHeight) / 2);
                newY = 0;
                newX = 0;
            }
            else if (upWidth < upHeight)
            {
                reDuce = newHeight / upHeight;
                newWidth = Convert.ToInt32(upWidth * reDuce);
                newX = Convert.ToInt32((bmpW - newWidth) / 2);
                newY = 0;
            }
            else if (upWidth == upHeight)
            {
                reDuce = newHeight / upHeight;
                newWidth = Convert.ToInt32(upWidth * reDuce);
                newX = Convert.ToInt32((bmpW - newWidth) / 2);
                newY = Convert.ToInt32((bmpH - newHeight) / 2);
            }

            Graphics newGraphic = Graphics.FromImage(newBmp);

            try
            {
                newGraphic.Clear(Color.White);

                newGraphic.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.AntiAlias;

                newGraphic.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;

                newGraphic.DrawImage(upBmp, newX, newY, newWidth, newHeight);

                newBmp.Save(MapPath(path), System.Drawing.Imaging.ImageFormat.Png);


            }
            catch (Exception ex)
            {
                //Label1.Text = ex.Message.ToString();
            }
            finally
            {
                upBmp.Dispose();
                newBmp.Dispose();
                newGraphic.Dispose();
            }
            /*****************************************************************************************************************/
        }
        #endregion
    }
}