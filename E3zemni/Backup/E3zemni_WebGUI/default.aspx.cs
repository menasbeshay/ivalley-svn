using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using E3zmni.BLL;

namespace E3zemni_WebGUI
{
    public partial class _default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCats();
            }
        }

        private void LoadCats()
        {
            Categories cats = new Categories();
            cats.LoadAll();
            uiRepeaterCats.DataSource = cats.DefaultView;
            uiRepeaterCats.DataBind();
        }

        protected void btnCloselogin_Click(object sender, ImageClickEventArgs e)
        {
            divLogin.Visible = false;

        }
    }
}