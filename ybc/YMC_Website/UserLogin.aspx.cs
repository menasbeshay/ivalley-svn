using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YMC.BLL;

namespace YMC_Website
{
    public partial class UserLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CurrentUser"] != null)
                {
                    Response.Redirect("Default.aspx");
                }
            }
        }

        protected void uiButtonUpdate_Click(object sender, EventArgs e)
        {
            SiteUsers user = new SiteUsers();
            uiLabelError.Visible = false;            
            user.GetUserByUserNameAndPassword(uiTextBoxUserName.Text, uiTextBoxPassword.Text);
            if (user.RowCount == 0)
            {
                uiLabelError.Visible = true;
            }
            else
            {
                if (user.IsColumnNull("IsApproved") || !user.IsApproved)
                {
                    uiLabelError.Visible = false;
                    uiLabelNotApproved.Visible = true;
                }
                else
                {
                    Session["CurrentUser"] = user;
                    Response.Redirect("Default.aspx");

                }
            }
        }
    }
}