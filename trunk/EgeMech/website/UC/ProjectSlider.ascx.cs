using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace website.UC
{
    public partial class ProjectSlider : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                EGEMech.BLL.Project projects = new EGEMech.BLL.Project();
                projects.Query.Top = 5;
                projects.Where.IsEPC.Value = false;
                projects.Query.Load();
                uiRepeaterProjects.DataSource = projects.DefaultView;
                uiRepeaterProjects.DataBind();
            }
        }
    }
}