using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YMC.BLL;
namespace YMC_Website.Controls
{
    public partial class ImpLinks : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ImportantLinks links = new ImportantLinks();
                links.LoadAll();
                links.Query.Top = 5;
                uiRepeaterLinks.DataSource = links.DefaultView;
                uiRepeaterLinks.DataBind();                
            }
        }
    }
}