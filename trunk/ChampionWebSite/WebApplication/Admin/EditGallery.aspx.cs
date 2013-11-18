using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using WebApplication.lib;

namespace WebApplication.Admin
{
    public partial class EditGallery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CurrentUser"] == null)
                {
                    Response.Redirect("Login.aspx");
                }

                LoadDDls();
                BindData();
            }
        }

        private void LoadDDls()
        {
            DBLayer db = new DBLayer();
            uiDropDownListCats.DataSource = db.GetAllCats();
            uiDropDownListCats.DataTextField = "CategoryName";
            uiDropDownListCats.DataValueField = "ID";
            uiDropDownListCats.DataBind();
        }

        private void BindData()
        {
            DBLayer db = new DBLayer();
            if (!string.IsNullOrEmpty(uiDropDownListCats.SelectedValue))
                uiDataListPhotos.DataSource = db.GetAllProductByCatID(Convert.ToInt32(uiDropDownListCats.SelectedValue));
            uiDataListPhotos.DataBind();
        }

        protected void uiLinkButtonUpdate_Click(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            if (uiFileUploadPhoto.HasFile)
            {
                if (!string.IsNullOrEmpty(uiDropDownListCats.SelectedValue))
                {
                    string path = "/UploadedFiles/gallery/" + DateTime.Now.ToString("ddMMyyyyhhmmss") + uiFileUploadPhoto.FileName;
                    optimizePic("~" + path);
                    db.AddProductContent(uiTextBoxTitle.Text, path, Convert.ToInt32(uiDropDownListCats.SelectedValue),"","","","");
                    BindData();
                }
            }
        }

        protected void uiDataListPhotos_ItemCommand(object source, DataListCommandEventArgs e)
        {
            DBLayer db = new DBLayer();
            db.DeleteProduct(Convert.ToInt32(e.CommandArgument));
            BindData();
        }

        protected void uiDropDownListCats_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindData();
        }

        private void optimizePic(string path)
        {
            /*****************************************************************************************************************/
            const int bmpW = 800;
            const int bmpH = 600;
            int newWidth = bmpW;
            int newHeight = bmpH;
            //string upName = uiFileUploadPhoto.FileName.Substring(0, (uiFileUploadPhoto.FileName.IndexOf(".") - 1));

            //string filePath = "~/Upload/" + upName + ".png";
            Bitmap upBmp = (Bitmap)Bitmap.FromStream(uiFileUploadPhoto.PostedFile.InputStream);
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
    }
}