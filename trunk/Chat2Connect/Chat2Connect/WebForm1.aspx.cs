using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Chat2Connect
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string htmltemplate = "<li class='itemColor'><a data-wysihtml5-command-value='{0}' data-wysihtml5-command='foreColor' data-bind=\"click:setForeColor('{0}')\"  style='color: {0};' href='javascript:;' unselectable='on'><div style='background-color: {0};' class='colorDiv'></div></a></li>";
            string csstemplate = "color: {0};";
            string line;
            string fullhtml = "";
            string fullcss = "";
            System.IO.StreamReader file = new System.IO.StreamReader(Server.MapPath("colors.txt"));
            while ((line = file.ReadLine()) != null)
            {
                fullhtml += string.Format(htmltemplate, line.Trim());
                fullcss += ".wysiwyg-color-" + line.Trim() + "{" + string.Format(csstemplate, line.Trim()) + "}";
            }

            file.Close();

            Response.Write("css : <br />" + fullcss);
            Response.Write("html : <br /><code>" + fullhtml + "</code>");
        }
    }
}