using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YMC.BLL;
namespace YMC_Website
{
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int pid = 1;                                
                Pages page = new Pages();
                page.LoadByPrimaryKey(pid);                    
                uiLiteralContent.Text = Server.HtmlDecode(page.ContentArabic);                
            }
        }
    }
}
