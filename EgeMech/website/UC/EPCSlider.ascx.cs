using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace website.UC
{
    public partial class EPCSlider : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                EGEMech.BLL.Project projects = new EGEMech.BLL.Project();
                projects.Query.Top = 10;
                projects.Where.IsEPC.Value = true;
                projects.Query.Load();
                uiRepeaterEPC.DataSource = projects.DefaultView;
                uiRepeaterEPC.DataBind();
            }
        }
    }
}