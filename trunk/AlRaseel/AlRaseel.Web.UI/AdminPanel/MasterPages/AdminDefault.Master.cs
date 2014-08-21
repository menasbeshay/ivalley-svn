using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.UI.AdminPanel.MainPages
{
    public partial class AdminDefault : System.Web.UI.MasterPage
    {
        public static String PageTitle { get; set; }
        public static String PageType { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            LoadCurrentActiveMenue();
        }

        private void LoadCurrentActiveMenue()
        {

            try
            {

                if (PageTitle.Contains("About"))
                {
                    liAboutus.Attributes["class"] = "current";

                }
                if (PageTitle.Contains("Contact"))
                {
                    liContactUs.Attributes["class"] = "current";

                }
                if (PageTitle.Contains("Product"))
                {
                    liProducts.Attributes["class"] = "current";

                }
                if (PageTitle.Contains("ProductAlbum"))
                {
                    liProductAlbum.Attributes["class"] = "current";

                }
                if (PageTitle.Contains("Social"))
                {
                    liSocialLinks.Attributes["class"] = "current";

                }



            }
            catch (Exception)
            {

            }
        }
    }
}