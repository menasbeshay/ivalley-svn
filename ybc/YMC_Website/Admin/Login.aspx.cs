using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using YMC.BLL;

namespace YMC_Website.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        #region Events
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void uiButtonLogin_Click(object sender, EventArgs e)
        {
            AdminUsers user = new AdminUsers();
            user.GetAdminUserByUserNameAndPassword(uiTextBoxUserName.Text, uiTextBoxPassword.Text);
            if (user.RowCount > 0)
            {
                Session["LoggedInUser"] = user;
                Response.Redirect("~/Admin/Default.aspx");
            }
            else
            {
                uiLabelError.Visible = true;
            }
        }

        #endregion
    }
}