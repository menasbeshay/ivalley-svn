using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YMC.BLL;
namespace YMC_Website
{
    public partial class NewsLetter : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void uiButtonSubscrip_Click(object sender, EventArgs e)
        {
            YMC.BLL.NewsLetter sub = new YMC.BLL.NewsLetter();
            sub.AddNew();
            sub.Email = uiTextBoxMail.Text;
            sub.Save();
            uiLabelMsg.Visible = true;
        }
    }
}