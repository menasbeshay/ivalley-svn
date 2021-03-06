﻿using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GlobalLogistics.BLL;
namespace GlobalLogistics.WebSite.Controls
{
    public partial class NewsLetter : System.Web.UI.UserControl
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
                    //BindEnglishData();
                }
                else if (Currentlang == "AR")
                {
                    EnPanel.Visible = false;
                    ArPanel.Visible = true;
                    //BindArabicData();
                }
            }
        }

        private void BindArabicData()
        {
            
        }

        private void BindEnglishData()
        {
            
        }

        protected void uiLinkButtonSend_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(uiTextBoxEnMail.Text))
            {
                Subscribers sub = new Subscribers();
                sub.AddNew();
                sub.Email = uiTextBoxEnMail.Text;
                sub.Save();
                uiLabelMessage.Visible = true;
            }
            
        }

        protected void uiLinkButtonArSend_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(uiTextBoxArMail.Text))
            {
                Subscribers sub = new Subscribers();
                sub.AddNew();
                sub.Email = uiTextBoxArMail.Text;
                sub.Save();
                uiLabelArMessage.Visible = true;
            }
        }
    }
}