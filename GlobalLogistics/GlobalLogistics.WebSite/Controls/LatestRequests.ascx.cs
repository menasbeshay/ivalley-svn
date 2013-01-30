using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GlobalLogistics.BLL;

namespace GlobalLogistics.WebSite.Controls
{
    public partial class LatestRequests : System.Web.UI.UserControl
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
            Services obj = new Services ();
            obj.GetTopServicesByType(6);
            uiRepeaterArRequests.DataSource = obj.DefaultView;
            uiRepeaterArRequests.DataBind();
        }

        private void BindEnglishData()
        {
            Services obj = new Services();
            obj.GetTopServicesByType(6);
            uiRepeaterEnRequests.DataSource = obj.DefaultView;
            uiRepeaterEnRequests.DataBind();
        }
    }
}