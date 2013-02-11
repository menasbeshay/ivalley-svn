using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Obtravel.Admin
{
    public partial class AdminCP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CurrentUser"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void uiLinkButtonEditAboutPage_Click(object sender, EventArgs e)
        {
            Session["CurrentPage"] = 1;
            Response.Redirect("EditPageContent.aspx");
        }

        protected void uiLinkButtonEditConactPage_Click(object sender, EventArgs e)
        {
            Session["CurrentPage"] = 2;
            Response.Redirect("EditPageContent.aspx");
        }

        protected void uiLinkButtonEditCompanyProfile_Click(object sender, EventArgs e)
        {
            Session["CurrentPage"] = 3;
            Response.Redirect("EditPageContent.aspx");
        }

        protected void uiLinkButtonEditMissionVision_Click(object sender, EventArgs e)
        {
            Session["CurrentPage"] = 4;
            Response.Redirect("EditPageContent.aspx");
        }

        protected void uiLinkButtonEditKeyPersons_Click(object sender, EventArgs e)
        {
            Session["CurrentPage"] = 5;
            Response.Redirect("EditPageContent.aspx");
        }
    }
}