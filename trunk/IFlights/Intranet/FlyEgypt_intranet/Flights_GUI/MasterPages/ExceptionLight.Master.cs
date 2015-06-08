using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Flight_BLL;

namespace Flights_GUI.MasterPages
{
    public partial class ExceptionLight : System.Web.UI.MasterPage
    {
        public string PageTitle { get { return uiLabelTitle.Text; } set { uiLabelTitle.Text = value; } }
        public string ModuleTitle { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(Page.User.Identity.ToString()))
            {
                UsersNofications usNotif = new UsersNofications();
                usNotif.getNotification1(Page.User.Identity.ToString());

            }
        }
    }
}