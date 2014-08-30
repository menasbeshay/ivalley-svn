using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace archiplan
{
    public partial class Site_en : System.Web.UI.MasterPage
    {
        public String PageTitle { get { return lblPageTitle.Text; } set { lblPageTitle.Text = value; } }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ActivePages_en();
            }
        }

        private void ActivePages_en()
        {

            if (Request.Url.PathAndQuery.Contains("Pages_en.aspx?PID=14"))
            {
                liAbout.Attributes.Add("class", "active");
            }
            else if (Request.Url.PathAndQuery.Contains("Pages_en.aspx?PID=15"))
            {
                liAbout.Attributes.Add("class", "active");
            }
            else if (Request.Url.PathAndQuery.Contains("Pages_en.aspx?PID=16"))
            {
                liAbout.Attributes.Add("class", "active");
            }
            else if (Request.Url.PathAndQuery.Contains("Pages_en.aspx?PID=17"))
            {
                liServices.Attributes.Add("class", "active");
            }
            else if (Request.Url.PathAndQuery.Contains("Pages_en.aspx?PID=18"))
            {
                liServices.Attributes.Add("class", "active");
            }
            else if (Request.Url.PathAndQuery.Contains("Pages_en.aspx?PID=19"))
            {
                liServices.Attributes.Add("class", "active");
            }
            else if (Request.Url.PathAndQuery.Contains("Pages_en.aspx?PID=20"))
            {
                liServices.Attributes.Add("class", "active");
            }
            else if (Request.Url.PathAndQuery.Contains("Pages_en.aspx?PID=21"))
            {
                liServices.Attributes.Add("class", "active");
            }
            else if (Request.Url.PathAndQuery.Contains("Pages_en.aspx?PID=22"))
            {
                liServices.Attributes.Add("class", "active");
            }

            else if (Request.Url.PathAndQuery.Contains("Pages_en.aspx?PID=23"))
            {
                liContact.Attributes.Add("class", "active");
            }
            else
            {
                liHome.Attributes.Add("class", "active");
            }
        }

    }
}