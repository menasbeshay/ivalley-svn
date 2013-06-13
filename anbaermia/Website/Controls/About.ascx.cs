using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Ermia_BLL;
namespace Website.Controls
{
    public partial class About : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GeneralSettings GS = new GeneralSettings();
                GS.LoadByPrimaryKey(2);
                uiLiteralContent.Text = GS.Value;
            }
        }
    }
}