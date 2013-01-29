using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace GlobalLogistics.WebSite.Controls
{
    public partial class Sponsors : System.Web.UI.UserControl
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
            BLL.Sponsors objData = new BLL.Sponsors();
            objData.LoadAll();
            uiRepeaterAr.DataSource = objData.DefaultView;
            HtmlGenericControl mydiv = (HtmlGenericControl)ArPanel.FindControl("SponsorsDivAr");
            mydiv.Attributes.CssStyle.Add("width", (objData.DefaultView.Table.Rows.Count * 170).ToString() + "px");
            uiRepeaterAr.DataBind();
        }

        private void BindEnglishData()
        {
            BLL.Sponsors objData = new BLL.Sponsors();
            objData.LoadAll();
            uiRepeaterEn.DataSource = objData.DefaultView;
            HtmlGenericControl mydiv = (HtmlGenericControl)EnPanel.FindControl("SponsorsDivEn");
            mydiv.Attributes.CssStyle.Add("width", (objData.DefaultView.Table.Rows.Count * 170).ToString() + "px");
            uiRepeaterEn.DataBind();
        }
    }
}