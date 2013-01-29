using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GlobalLogistics.WebSite.Controls
{
    public partial class AlphaLinks : System.Web.UI.UserControl
    {
        string[] letters = { "All", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K",
					"L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V",
					"W", "X", "Y", "Z"};

        private string selectedLetter;
        private int selectedIndex;

        public void Page_PreRender(object sender, EventArgs e)
        {
            __theAlphalink.DataSource = letters;
            __theAlphalink.DataBind();
        }

        public string Letter
        {
            get
            {
                if (ViewState["selectedLetter"] == null)
                {
                    return "All";
                }
                else
                {
                    return ViewState["selectedLetter"].ToString();
                }
            }
            set
            {
                ViewState["selectedLetter"] = value;
            }
        }

        public void Select(object sender, CommandEventArgs e)
        {
            selectedLetter = e.CommandArgument.ToString();
            ViewState["selectedLetter"] = e.CommandArgument.ToString();
        }

        public void DisableSelectedLink(object sender, RepeaterItemEventArgs e)
        {
            LinkButton lb = (LinkButton)e.Item.Controls[1];
            if (lb.Text == Letter)
                lb.Enabled = false;
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (ViewState["selectedLetter"] == null)
            {
                selectedLetter = "All";
                ViewState["selectedLetter"] = "All";
            }
        }
    }
}