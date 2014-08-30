using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace archiplan
{
    public partial class Projrcts_en : System.Web.UI.MasterPage
    {
        public String PageTitle { get { return lblPageTitle.Text; } set { lblPageTitle.Text = value; } }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ActivePages();
            }
        }

        private void ActivePages()
        {

            if (Request.Url.PathAndQuery.Contains("Projects"))
            {
                liProjects.Attributes.Add("class", "active");
            }

            else
            {
                liHome.Attributes.Add("class", "active");
            }
        }

    }
}