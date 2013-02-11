using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Obtravel.Arabic
{
    public partial class Packages : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindData();
            }
        }

        private void BindData()
        {
            DBLayer db = new DBLayer();
            uiRepeaterCurrentLists.DataSource = db.GetArabicPackages();
            uiRepeaterCurrentLists.DataBind();
        }

        protected void uiRepeaterCurrentLists_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "ViewSubPackages")
            {
                Session["TopPackage"] = e.CommandArgument.ToString();
                Response.Redirect("TourismList.aspx");
            }
        }
    }
}