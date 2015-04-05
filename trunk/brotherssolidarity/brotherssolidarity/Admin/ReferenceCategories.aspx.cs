using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace brotherssolidarity.Admin
{
    public partial class ReferenceCategories : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadAllCategories();

                if (Request.QueryString["CatID"] != null)
                {
                    if (Request.QueryString["CatID"].ToString() != "")
                    {
                        // Now we are in edit mode

                        LoadCategoryForEdit(int.Parse(Request.QueryString["CatID"].ToString()));
                        SaveCategory.Text = "Update Category";
                    }
                }
                else
                {
                    pnlAddMode.Visible = true;
                    pnlEditMode.Visible = false;
                    SaveCategory.Text = "Save Ctegory";
                }
            }
        }

        private void ClearData()
        {
            TxtName.Text = "";
            pnlAddMode.Visible = true;
            pnlEditMode.Visible = false;
            SaveCategory.Text = "Save Ctegory";
        }

        private void LoadAllCategories()
        {
            BLL.ReferenceCategories obj = new BLL.ReferenceCategories();
            obj.LoadAll();

            GrdCtegories.DataSource = obj.DefaultView;
            GrdCtegories.DataBind();
        }

        private void LoadCategoryForEdit(int catID)
        {
            BLL.ReferenceCategories obj = new BLL.ReferenceCategories();
            obj.LoadByPrimaryKey(catID);

            pnlAddMode.Visible = false;
            pnlEditMode.Visible = true;

            TxtName.Text = obj.CatNameEn;
            imgReferenceCategory.ImageUrl = obj.RefernceImagePath;
            btnDeleteImage.CommandArgument = catID.ToString();
        }

        private void SaveCtegory()
        {
            BLL.ReferenceCategories obj = new BLL.ReferenceCategories();

            obj.AddNew();
            obj.CatNameEn = TxtName.Text;

            if (UploadImg.HasFile)
            {
                Bitmap UpImg = (Bitmap)Bitmap.FromStream(UploadImg.PostedFile.InputStream);
                string path = "UploadedFiles/ReferenceCategories/" + DateTime.Now.ToString("ddMMyyyyhhmmss") + UploadImg.FileName;
                UpImg.Save(MapPath(path), System.Drawing.Imaging.ImageFormat.Png);
                obj.RefernceImagePath = path;
            }

            obj.Save();


        }

        private void UpdateCtegory()
        {
            BLL.ReferenceCategories obj = new BLL.ReferenceCategories();
            obj.LoadByPrimaryKey(int.Parse(Request.QueryString["CatID"].ToString()));

            obj.CatNameEn = TxtName.Text;

            if (UploadImg.HasFile)
            {
                Bitmap UpImg = (Bitmap)Bitmap.FromStream(UploadImg.PostedFile.InputStream);
                string path = "UploadedFiles/ReferenceCategories/" + DateTime.Now.ToString("ddMMyyyyhhmmss") + UploadImg.FileName;
                UpImg.Save(MapPath(path), System.Drawing.Imaging.ImageFormat.Png);
                obj.RefernceImagePath = path;
            }

            obj.Save();


        }

        protected void GrdCtegories_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                int ID = int.Parse(e.CommandArgument.ToString());
                BLL.ReferenceCategories obj = new BLL.ReferenceCategories();
                obj.LoadByPrimaryKey(ID);
                obj.MarkAsDeleted();
                obj.Save();

                LoadAllCategories();
            }
            else if (e.CommandName == "Edit")
            {
                Response.Redirect("ReferenceCategories.aspx?CatID=" + e.CommandArgument.ToString() );
            }
           
        }

        protected void btnDeleteImage_Click(object sender, EventArgs e)
        {
            int ID = int.Parse(btnDeleteImage.CommandArgument.ToString());
            BLL.ReferenceCategories obj = new BLL.ReferenceCategories();
            obj.LoadByPrimaryKey(ID);
            obj.RefernceImagePath = "";
            obj.Save();

            pnlAddMode.Visible = true;
            pnlEditMode.Visible = false;
        }

        protected void SaveCategory_Click(object sender, EventArgs e)
        {
            if (SaveCategory.Text == "Save Ctegory")
            {
                SaveCtegory();
            }
            else
            {
                UpdateCtegory();
            }
            LoadAllCategories();
            ClearData();
        }



        protected void BtnCancel_Click(object sender, EventArgs e)
        {
            ClearData();
        }
    }
}