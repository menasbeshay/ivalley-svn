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
    public partial class ManageReference : System.Web.UI.Page
    {
        private int getCurrentReference
        {
            get
            {
                if (!string.IsNullOrEmpty(Request.QueryString["RefID"]))
                {
                    return int.Parse(Request.QueryString["RefID"]);
                }
               else
                {
                    return 0;
                }
            }

            set
            {
                Session["RefID"] = value;
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (getCurrentReference > 0)
                {
                    LoadRefernceForEdit();
                    btnSaveRef.Text = "Update Reference";
                    requiredImg.Enabled = false;
                    pnlReferenceImages.Enabled = true;
                    LayerImgFileUpload.Enabled = true;
                    LoadAllReferenceImages();
                }
                else
                {
                    btnSaveRef.Text = "Create Reference";
                    requiredImg.Enabled = true;
                    pnlReferenceImages.Enabled = false;
                    LayerImgFileUpload.Enabled = false;
                }
            }
        }

        private void ClearContents()
        {
            txtDescription.Text = "";
            txtRefernceName.Text = "";
            chkActive.Checked = false;
            CollImg.Src = "~/Admin/Images/no-image.png";
        }

        private void LoadRefernceForEdit()
        {
            Reference NewRef = new Reference();

             NewRef.LoadByPrimaryKey(getCurrentReference);

             chkActive.Checked = NewRef.IsActive;
             txtRefernceName.Text = NewRef.NameEn;
             txtDescription.Text = NewRef.DescriptionEn;
             CollImg.Src = NewRef.MainImagePath;
        }

        protected void btnSaveRef_Click(object sender, EventArgs e)
        {
            Reference NewRef = new Reference();

            if (getCurrentReference > 0)
            {
                NewRef.LoadByPrimaryKey(getCurrentReference);
            }
            else
            {
                NewRef.AddNew();
            }
            if (CollImgFileUpload.HasFile)
            {
                Bitmap UpImg = (Bitmap)Bitmap.FromStream(CollImgFileUpload.PostedFile.InputStream);
                string path = "UploadedFiles/References/" + DateTime.Now.ToString("ddMMyyyyhhmmss") + CollImgFileUpload.FileName;
                UpImg.Save(MapPath(path), System.Drawing.Imaging.ImageFormat.Png);
                NewRef.MainImagePath = path;
            }

            NewRef.IsActive = chkActive.Checked;            
            NewRef.NameAr = txtRefernceName.Text;
            NewRef.DescriptionAr = txtDescription.Text;
            NewRef.DescriptionEn = txtDescription.Text;
            NewRef.Save();

            Response.Redirect("ManageReference.aspx?refid=" + NewRef.ReferenceID.ToString());

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            ClearContents();
        }

        protected void btnAddNew_Click(object sender, EventArgs e)
        {
           
        }

        protected void btnAddLayer_Click(object sender, EventArgs e)
        {
            Bitmap UpImg = (Bitmap)Bitmap.FromStream(LayerImgFileUpload.PostedFile.InputStream);
            string path = "UploadedFiles/References/" + DateTime.Now.ToString("ddMMyyyyhhmmss") + LayerImgFileUpload.FileName;
            UpImg.Save(MapPath(path), System.Drawing.Imaging.ImageFormat.Png);


            BLL.ReferenceImages NewLayer = new BLL.ReferenceImages();
            NewLayer.AddNew();
            NewLayer.ReferenceID = getCurrentReference;
            NewLayer.NameEn = txtImageName.Text;
            NewLayer.IsActive = true;
            NewLayer.ImagePath = path;
            NewLayer.Save();

            LoadAllReferenceImages();

            txtImageName.Text = "";
        }

        private void LoadAllReferenceImages()
        {
            BLL.ReferenceImages obj = new BLL.ReferenceImages();
            obj.GetImagesByRefID(getCurrentReference);
            
            LayerImgsDataList.DataSource = obj.DefaultView;
            LayerImgsDataList.DataBind();
            
            
        }

        

        protected void ImgBtnDeleteLayer_Click(object sender, ImageClickEventArgs e)
        {
            ImageButton btn = (ImageButton)sender;
            int ID = int.Parse(btn.CommandArgument.ToString());
            BLL.ReferenceImages DeleteLayer = new BLL.ReferenceImages();
            DeleteLayer.LoadByPrimaryKey(ID);
            DeleteLayer.MarkAsDeleted();
            DeleteLayer.Save();

            LoadAllReferenceImages();
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("ReferenceList.aspx");
        }
    }
}