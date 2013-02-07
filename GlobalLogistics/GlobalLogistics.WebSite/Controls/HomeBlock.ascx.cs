using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GlobalLogistics.WebSite.Controls
{
    public partial class HomeBlock : System.Web.UI.UserControl
    {
        public string Currentlang
        {
            get
            {
                if (Session["CurrentLang"] != null && !string.IsNullOrEmpty(Session["CurrentLang"].ToString()))
                {
                    return Session["CurrentLang"].ToString();
                }
                else
                {
                    return "EN";
                }
            }

            set { Session["CurrentLang"] = value; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Currentlang == "EN")
                {
                    EnPanel.Visible = true;
                    ArPanel.Visible = false;
                    BindEnglishData();
                }
                else if (Currentlang == "AR")
                {
                    EnPanel.Visible = false;
                    ArPanel.Visible = true;
                    BindArabicData();
                }
            }

        }

        private void BindArabicData()
        {
            BLL.Pages page = new BLL.Pages();
            page.LoadByPrimaryKey(13);
            uiLabelArTitle.Text = page.ArTitle;
            uiLiteralArContent.Text = Server.HtmlDecode(page.ArContent);
        }

        private void BindEnglishData()
        {
            BLL.Pages page = new BLL.Pages();
            page.LoadByPrimaryKey(13);
            uiLabelEnTitle.Text = page.EnTitle;
            uiLiteralEnContent.Text = Server.HtmlDecode(page.EnContent);
        }
    }
}