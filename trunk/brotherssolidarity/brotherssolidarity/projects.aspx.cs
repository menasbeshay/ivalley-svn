using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace brotherssolidarity
{
    public partial class projects : System.Web.UI.Page
    {
        private int CurrentProject
        {
            get
            {
                if (!string.IsNullOrEmpty(Request.QueryString["pid"]))
                {
                    return int.Parse(Request.QueryString["pid"]);
                }
                else
                {
                    return 0;
                }
            }
            
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (CurrentProject == 0)
            {
                BLL.Reference refs = new BLL.Reference();
                refs.LoadAll();
                uiRepeaterProjects.DataSource = refs.DefaultView;
                uiRepeaterProjects.DataBind();
                uiPanelProjects.Visible = true;
                uiPanelSingle.Visible = false;
            }
            else
            {
                BLL.Reference refs = new BLL.Reference();
                refs.LoadByPrimaryKey(CurrentProject);
                BLL.ReferenceImages images = new BLL.ReferenceImages();
                images.GetImagesByRefID(CurrentProject);
                uiRepeaterImages.DataSource = images.DefaultView;
                uiRepeaterImages.DataBind();

                uiImageMain.ImageUrl = "/admin/" +refs.MainImagePath;
                uiLiteralProjectDesc.Text = refs.DescriptionAr;
                uiLiteralProjectPath.Text = "<span class='line-separate'>/</span><span>" + refs.NameAr + "</span>";

                uiPanelProjects.Visible = false;
                uiPanelSingle.Visible = true;
            }
        }
    }
}