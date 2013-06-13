using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Website.Controls
{
    public partial class NewsSlider : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Ermia_BLL.News N = new Ermia_BLL.News();
                N.Query.AddOrderBy(Ermia_BLL.News.ColumnNames.PostedDate, MyGeneration.dOOdads.WhereParameter.Dir.DESC);
                N.Query.Top = 5;
                N.Query.Load();                
                uiRepeaterContent.DataSource = N.DefaultView;
                uiRepeaterNav.DataSource = N.DefaultView;
                uiRepeaterContent.DataBind();
                uiRepeaterNav.DataBind();
            }
        }
    }
}