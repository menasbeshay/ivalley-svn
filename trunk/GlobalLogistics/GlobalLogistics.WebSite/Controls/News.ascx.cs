using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GlobalLogistics.WebSite.Controls
{
    public partial class News : System.Web.UI.UserControl
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
            BLL.ArNews objData = new BLL.ArNews();
            objData.GetTopNews();
            uiRepeaterArNews.DataSource = objData.DefaultView;
            uiRepeaterArNews.DataBind();
        }

        private void BindEnglishData()
        {
            BLL.News objData = new BLL.News();
            objData.GetTopNews();
            uiRepeaterEnNews.DataSource = objData.DefaultView;
            uiRepeaterEnNews.DataBind();
        }
    }
}