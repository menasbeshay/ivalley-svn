using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace website
{
    public partial class Projects : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int pid = 0;
                if (Request.QueryString["pid"] != null)
                {
                    try
                    {
                        pid = Convert.ToInt32(Request.QueryString["pid"].ToString());
                    }
                    catch (Exception ex)
                    {
                        pid = 0;
                    }
                }

                if (pid == 0)
                {
                    Response.Redirect("~/Default.aspx");
                }
                else
                {
                    EGEMech.BLL.Project project = new EGEMech.BLL.Project();
                    project.LoadByPrimaryKey(pid);
                    uiLabelTitle.Text = project.Name;
                    uiLiteralContent.Text = Server.HtmlDecode(project.Description);
                    uiImageProj.ImageUrl = project.PicPath;
                }
            }
        }
    }
}