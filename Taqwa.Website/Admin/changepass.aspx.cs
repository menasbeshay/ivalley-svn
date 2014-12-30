using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Taqwa.BLL;

namespace Taqwa.Website.Admin
{
    public partial class changepass : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void uiLinkButtonSave_Click(object sender, EventArgs e)
        {
            DBLayer db = new DBLayer();
            if (db.UpdateUser(1, "admin", uiTextBoxPassword.Text))
                uiPanelError.Visible = true;
            else
            {
                uiPanelError.Visible = true;
                uiLabelMsg.Text = "حدث خطا . حاول مرة أخرى";
                uiLabelMsg.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}