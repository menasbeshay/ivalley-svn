using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using E3zmni.BLL;

namespace E3zemni_WebGUI
{
    public partial class UserProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["CurrentUser"] != null)
            {

                UserInfo user = (UserInfo)Session["CurrentUser"];                
                Response.Write(user.UserName.ToString ());

            }
            else
            {
                Response.Redirect("default.aspx");
            }

        }
    }
}