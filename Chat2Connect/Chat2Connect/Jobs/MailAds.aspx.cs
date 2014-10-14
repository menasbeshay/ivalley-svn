using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Chat2Connect.Jobs
{
    public partial class MailAds : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BLL.MailAds bllMailAds = new BLL.MailAds();
                bllMailAds.SendScheduledAds();
            }
        }
    }
}