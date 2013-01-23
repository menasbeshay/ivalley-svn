using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YMC.BLL;
namespace YMC_Website.Controls
{
    public partial class News : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                YMC.BLL.News news = new YMC.BLL.News();
                news.LoadAll();
                news.Query.Top = 5;
                uiRepeaterNews.DataSource = news.DefaultView;
                uiRepeaterNews.DataBind();                
            }
        }
    }
}