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


            if (Session["CurrentUser"] != null)
            {
                divLogin.Visible = false;

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

        protected void uiLinkButtonMainLogin_Click(object sender, EventArgs e)
        {
            UserInfo user = new UserInfo();
            user.GetUserByUserNameAndPassword(uiTextBoxUserName.Text, uiTextBoxPassword.Text);
            if (user.RowCount > 0)
            {
                Session["CurrentUser"] = user.UserID;
                if (Request.QueryString["url"] != null)
                    Response.Redirect(Request.QueryString["url"].ToString());
                Response.Redirect("default.aspx");
                divLogin.Visible = false;

            }
            else
            {
                uiLabelError.Visible = true;
            }
        }

    }
}