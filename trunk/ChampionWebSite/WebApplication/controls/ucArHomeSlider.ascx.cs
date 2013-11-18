using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace WebApplication.controls
{
    public partial class ucArHomeSlider : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            DirectoryInfo dir = new DirectoryInfo(Server.MapPath("~/" + "HomeGallery"));
            uiRepeaterSlider.DataSource = dir.GetFiles();
            uiRepeaterSlider.DataBind();
        }
    }
}