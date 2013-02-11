using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Obtravel.Arabic.Admin
{
    public partial class UploadStieMusic : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["CurrentUser"] == null)
                {
                    Response.Redirect("Login.aspx");
                }               
            }
        }

        protected void uiButtonUpload_Click(object sender, EventArgs e)
        {

            if (uiFileUpload.HasFile)
            {
                uiFileUpload.SaveAs(Server.MapPath("~/media/1.mp3"));
                Response.Redirect("AdminCP.aspx");
            }
            else
            {
                uiLabelError.Visible = true;
            }
        }
    }
}