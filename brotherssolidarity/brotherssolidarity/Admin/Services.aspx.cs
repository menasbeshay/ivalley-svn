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
    public partial class Services : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                LoadAllServices();

                if (ServiceID>0)
                {
                    placeHolderEditServ.Visible = true;
                    placeHolderGrdView.Visible = false;

                    BLL.Services Serv = new BLL.Services();
                    Serv.LoadByPrimaryKey(ServiceID);
                    txtServiceName.Text = Serv.NameEn;
                    txtServiceDesc.Text = Serv.DescriptionEn;
                    chkIsActive.Checked = Serv.IsActive;
                    if (!string.IsNullOrWhiteSpace(Serv.InternalImagePath))
                    {
                        imgInternalImage.Src = Serv.InternalImagePath;
                                        
                    }
                    if (!string.IsNullOrWhiteSpace(Serv.MainImagePath))
                    {
                        imgMainImage.Src = Serv.MainImagePath;
                        
                    }
                    BtnSave.Text = "Update Service";

                    RequiredFieldValidator3.Enabled = false;
                    RequiredFieldValidator4.Enabled = false;
                }
                else if (!string.IsNullOrEmpty(Request.QueryString["NewServ"]))
                {
                    placeHolderEditServ.Visible = true;
                    placeHolderGrdView.Visible = false;
                }
                else
                {
                    placeHolderEditServ.Visible = false;
                    placeHolderGrdView.Visible = true;
                }
            }
        }

        public int ServiceID
        {
            get
            {
                if (!string.IsNullOrEmpty(Request.QueryString["Sid"]))
                {
                    return int.Parse(Request.QueryString["Sid"]);
                }
                else
                {
                    return 0;
                }
            }
        }

        protected void BtnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Services.aspx");
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            BLL.Services Serv = new BLL.Services();

            if (ServiceID>0)
            {
                Serv.LoadByPrimaryKey(ServiceID);
            }
            else
            {
                Serv.AddNew();
            }

            Serv.NameEn = txtServiceName.Text;
            Serv.DescriptionEn = txtServiceDesc.Text;

            if (FileUploadMainImage.HasFile)
            {
                Bitmap UpImg = (Bitmap)Bitmap.FromStream(FileUploadMainImage.PostedFile.InputStream);
                string path = "UploadedFiles/Services/" + DateTime.Now.ToString("ddMMyyyyhhmmss") + FileUploadMainImage.FileName;
                UpImg.Save(MapPath(path), System.Drawing.Imaging.ImageFormat.Png);
                Serv.MainImagePath = path;
            }

            if (FileUploadInternalImage.HasFile)
            {
                Bitmap UpImg = (Bitmap)Bitmap.FromStream(FileUploadInternalImage.PostedFile.InputStream);
                string path = "UploadedFiles/Services/" + DateTime.Now.ToString("ddMMyyyyhhmmss") + FileUploadInternalImage.FileName;
                UpImg.Save(MapPath(path), System.Drawing.Imaging.ImageFormat.Png);
                Serv.InternalImagePath = path;
            }
            Serv.IsActive = chkIsActive.Checked;
            Serv.Save();
            Response.Redirect("services.aspx?sid=" + Serv.s_ServiceID);
        }

        private void LoadAllServices()
        {
            BLL.Services obj = new BLL.Services();
            obj.LoadAll();

            GrdViewServices.DataSource = obj.DefaultView;
            GrdViewServices.DataBind();
        }

        protected void btnCreateService_Click(object sender, EventArgs e)
        {
            Response.Redirect("Services.aspx?NewServ=1");
        }

        protected void LinkBtnEdit_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            Response.Redirect("services.aspx?sid=" + btn.CommandArgument.ToString());
        }

        protected void LinkBtnDelete_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;

            BLL.Services obj = new BLL.Services();
            obj.LoadByPrimaryKey(int.Parse(btn.CommandArgument));
            obj.MarkAsDeleted();
            obj.Save();

            LoadAllServices();
        }
    }
}