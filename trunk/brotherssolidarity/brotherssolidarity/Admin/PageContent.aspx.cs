using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace brotherssolidarity
{
    public partial class PageContent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            pageData();

            if (!Page.IsPostBack)
            {
                if (!string.IsNullOrEmpty(Request.QueryString["Pid"]))
                {
                    uiPanelCurrent.Visible = true;
                    uiGridViewPages.Visible = false;

                    BLL.Page addPage = new BLL.Page();
                    addPage.LoadByPrimaryKey(int.Parse(Request.QueryString["Pid"]));
                    txtPageTitle.Text = addPage.TitleAr;
                    FCKeditor1.Value = Server.HtmlDecode(addPage.ContentAr);

                    if (FileUploadPageImg.HasFile)
                    {
                        string path = "/admin/images/" + DateTime.Now.ToString("ddmmyyyyhhmmss") + FileUploadPageImg.FileName;

                        Bitmap upimg = (Bitmap)Bitmap.FromStream(FileUploadPageImg.PostedFile.InputStream);
                        upimg.Save(MapPath(path), System.Drawing.Imaging.ImageFormat.Png);
                        addPage.ImagePath = path;
                    }
                }
                else
                {
                    uiPanelCurrent.Visible = false;
                    uiGridViewPages.Visible = true;
                }
            }
        }

        protected void uiGridViewPages_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditPage")
            {
                Response.Redirect("PageContent.aspx?Pid=" + e.CommandArgument);
            }
        }

        private void pageData()
        {
            BLL.Page pg = new BLL.Page();
            pg.LoadAll();
            uiGridViewPages.DataSource = pg.DefaultView;
            uiGridViewPages.DataBind();
        }

        protected void btnSaveContent_Click(object sender, EventArgs e)
        {
            BLL.Page pag = new BLL.Page();
            pag.LoadByPrimaryKey(int.Parse(Request.QueryString["Pid"]));
            pag.TitleAr = lblPageTitle.Text;
            pag.ContentAr = Server.HtmlEncode(FCKeditor1.Value);

            pag.Save();
            Response.Redirect("PageContent.aspx");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("PageContent.aspx");
        }
    }
}