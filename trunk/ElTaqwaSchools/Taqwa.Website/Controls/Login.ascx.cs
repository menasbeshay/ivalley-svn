using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;

namespace Taqwa.Website.Controls
{
    public partial class Login : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CurrentLoggedInStudent"] == null)
                {
                    uiPanelLogin.Visible = true;
                    uiPanelAccount.Visible = false;
                }
                else
                {
                    uiPanelLogin.Visible = false;
                    uiPanelAccount.Visible = true;
                }
            }
        }

        protected void uiImageButtonLogin_Click(object sender, ImageClickEventArgs e)
        {
            DBLayer db = new DBLayer();
            DataSet ds = new DataSet();
            ds = db.GetStudentByUserNameAndSecertCode(uiTextBoxUserName.Text, uiTextBoxSecertCode.Text);

            if (ds.Tables[0].Rows.Count > 0)
            {
                Session["CurrentLoggedInStudent"] = ds.Tables[0].Rows[0]["StudentID"].ToString();
                uiPanelLogin.Visible = false;
                uiPanelAccount.Visible = true;
                Response.Redirect("~/MyAccount.aspx");
            }

            else
            {
                uiPanelLogin.Visible = true;
                uiPanelAccount.Visible = false;
                Response.Redirect("~/Login.aspx");
            }
        }

        protected void uiImageButtonLogout_Click(object sender, ImageClickEventArgs e)
        {
            Session["CurrentLoggedInStudent"] = null;
            uiPanelLogin.Visible = true;
            uiPanelAccount.Visible = false;
            Response.Redirect("home.aspx");
        }

        protected void uiImageButtonMyAccount_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("~/MyAccount.aspx");
        }
    }
}