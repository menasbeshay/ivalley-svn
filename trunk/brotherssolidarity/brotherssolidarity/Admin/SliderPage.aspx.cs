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
    public partial class SliderPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (getQueryString>0)
            {
                if (!Page.IsPostBack)
                {
                    SliderTable.Visible = true;
                    GrdSlider.Visible = false;
                    BtnNewSlider.Visible = false;

                    Slider EditSlider = new Slider();
                    EditSlider.LoadByPrimaryKey(getQueryString);
                    uiFCKeditorTitle.Value = Server.HtmlDecode(EditSlider.TitleEn);
                    uiFCKeditorDesc.Value = Server.HtmlDecode(EditSlider.SliderDescriptionEn);
                    chkboxActive.Checked = EditSlider.IsActive;
                    SliderBannerImg.Src = EditSlider.ImagePath;
                    SliderBannerImg.Visible = true;
                    //txtSliderLink.Text = EditSlider.SliderLink;
                    BtnSaveSlider.Text = "Update Slider";
                }
            }
            else if (!string.IsNullOrEmpty(Request.QueryString["NewSlider"]))
            {
                if (!Page.IsPostBack)
                {
                    SliderTable.Visible = true;
                    GrdSlider.Visible = false;
                    BtnNewSlider.Visible = false;
                }
            }
            else
            {
                if (!Page.IsPostBack)
                {
                    SliderTable.Visible = false;
                    GrdSlider.Visible = true;
                    BtnNewSlider.Visible = true;
                }
            }
            if (!Page.IsPostBack)
            {
                GrdBind();
            }
        }

        private int getQueryString
        {
            get
            {
                if (!string.IsNullOrEmpty(Request.QueryString["PID"]))
                {
                    return int.Parse(Request.QueryString["PID"].ToString());
                }
                else
                {
                    return 0;
                }
            }
        }

        protected void BtnSaveSlider_Click(object sender, EventArgs e)
        {
            Slider UpdateSlider = new Slider();
            if (getQueryString>0)
            {
                UpdateSlider.LoadByPrimaryKey(getQueryString);
            }
            else
            {
                UpdateSlider.AddNew();
            }
            UpdateSlider.TitleEn = Server.HtmlEncode(uiFCKeditorTitle.Value);
            UpdateSlider.SliderDescriptionEn = Server.HtmlEncode(uiFCKeditorDesc.Value);

            if (UploadImgSlider.HasFile)
            {
                string path = "/admin/UploadedFiles/sliderimg/" + DateTime.Now.ToString("ddmmyyyyhhmmss") + UploadImgSlider.FileName;

                //Bitmap upimg = (Bitmap)Bitmap.FromStream(UploadImgSlider.PostedFile.InputStream);
                //upimg.Save(MapPath(path), System.Drawing.Imaging.ImageFormat.Png);
                UploadImgSlider.SaveAs(Server.MapPath("~" + path));
                UpdateSlider.ImagePath = path;
                
            }
            UpdateSlider.IsActive = chkboxActive.Checked;
            UpdateSlider.Save();

            Response.Redirect("SliderPage.aspx");
            GrdBind();
        }

        private void GrdBind()
        {
            Slider AllSliders = new Slider();
            AllSliders.LoadAll();
            GrdSlider.DataSource = AllSliders.DefaultView;
            GrdSlider.DataBind();
        }

        protected void GrdSlider_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName=="EditSlider")
            {
                Response.Redirect("SliderPage.aspx?PID=" + e.CommandArgument.ToString());
            }
            else if (e.CommandName=="DeleteSlider")
            {
                Slider DeleteSlider = new Slider();
                DeleteSlider.LoadByPrimaryKey(int.Parse(e.CommandArgument.ToString()));
                DeleteSlider.MarkAsDeleted();
                DeleteSlider.Save();
                GrdBind();
            }
        }

        protected void BtnNewSlider_Click(object sender, EventArgs e)
        {
            Response.Redirect("SliderPage.aspx?NewSlider=1");
        }

        protected void BtnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("SliderPage.aspx");
        }

       
    } 
   
}