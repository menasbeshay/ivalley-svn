using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;
using System.Data;

namespace Taqwa.Website.Controls
{
    public partial class LoginControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CurrentLoggedInStudent"] != null)
                {
                    uiPanelLogin.Visible = false;
                    uiPanelLogout.Visible = true;
                }
                else 
                {
                    uiPanelLogin.Visible = true;
                    uiPanelLogout.Visible = false;
                }
            }
        }

        protected void uiLinkButtonLogin_Click(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            DataSet ds = new DataSet();
            ds = db.GetStudentByUserNameAndSecertCode(uiTextBoxUsername.Text, uiTextBoxPassword.Text);

            if (ds.Tables[0].Rows.Count > 0 )
            {
                if (ds.Tables[0].Rows[0]["IsActive"] != "0")
                {
                    Session["CurrentLoggedInStudent"] = ds.Tables[0].Rows[0]["StudentID"].ToString();
                    uiPanelLogin.Visible = false;
                    uiPanelLogout.Visible = true;
                }
            }
        }

        protected void uiLinkButtonLogout_Click(object sender, EventArgs e)
        {
            Session["CurrentLoggedInStudent"] = null;
            uiPanelLogin.Visible = true;
            uiPanelLogout.Visible = false;
            Response.Redirect("index.aspx");
        }
    }
}