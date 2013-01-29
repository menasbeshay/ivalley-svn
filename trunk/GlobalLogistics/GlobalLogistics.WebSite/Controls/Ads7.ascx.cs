using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GlobalLogistics.BLL;

namespace GlobalLogistics.WebSite.Controls
{
    public partial class Ads7 : System.Web.UI.UserControl
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
                LoadLocationDefaults();
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

        private void LoadLocationDefaults()
        {
            AdsLocations location1 = new AdsLocations();
            location1.LoadByPrimaryKey(7);
            uiLiteralScript.Text = "<script type=\"text/javascript\">$(document).ready(function () {$('#Ad7').cycle({ fx: 'fade' , timeout: " + location1.AdsTimeout.ToString() + " }); }); </script>";
        }

        private void BindArabicData()
        {
            BLL.Ads objData = new BLL.Ads();
            objData.GetAllAdsByLocation(7);
            if (objData.RowCount > 0)
            {
                uiRepeaterArAds.DataSource = objData.DefaultView;
                uiRepeaterArAds.DataBind();
                DefArImage.Visible = false;
            }
            else
            {
                uiRepeaterArAds.Visible = false;
                DefArImage.Visible = true;
            }
        }

        private void BindEnglishData()
        {
            BLL.Ads objData = new BLL.Ads();
            objData.GetAllAdsByLocation(7);
            if (objData.RowCount > 0)
            {
                uiRepeaterEnAds.DataSource = objData.DefaultView;
                uiRepeaterEnAds.DataBind();
                DefEnImage.Visible = false;
            }
            else
            {
                uiRepeaterEnAds.Visible = false;
                DefEnImage.Visible = true;
            }
        }
    }
}