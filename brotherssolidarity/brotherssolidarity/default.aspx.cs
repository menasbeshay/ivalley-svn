using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
namespace brotherssolidarity
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BLL.Page page = new BLL.Page();
                page.LoadByPrimaryKey(7);
                uiLiteralContent.Text = Server.HtmlDecode(page.ContentAr);

                BLL.Slider slides = new Slider();
                slides.GetActiveSlides();
                uiRepeaterSlider.DataSource = slides.DefaultView;
                uiRepeaterSlider.DataBind();
            }
        }
    }
}