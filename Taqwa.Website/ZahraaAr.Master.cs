using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;
using System.Text.RegularExpressions;

namespace Taqwa.Website
{
    public partial class ZahraaAr : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DBLayer db = new DBLayer();
                DataSet ds = new DataSet();
                ds = db.GetPage(5);
                string inputHTML = Server.HtmlDecode(ds.Tables[0].Rows[0]["ArPageContent"].ToString());
                string noHTML = Regex.Replace(inputHTML, @"<[^>]+>|&nbsp;", "").Trim();
                string noHTMLNormalised = Regex.Replace(noHTML, @"\s{2,}", " ");
                uiLiteralAbout.Text = noHTMLNormalised.Substring(0, 330) + " ...";
            }
        }

        protected void uiLinkButtonEnglish_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/en/" + Request.RawUrl);
        }
    }
}