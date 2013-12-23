using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace Chat2Connect.MasterPages
{
    public partial class Main : System.Web.UI.MasterPage
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadUserInfo();
            }
        }

        private void loadUserInfo()
        {
            Member user = new Member();
            user.GetMemberByUserId(new Guid(Membership.GetUser().ProviderUserKey.ToString()));
            if (!user.IsColumnNull("ProfilePic"))
                uiImageUser.ImageUrl = user.ProfilePic;
            uiLabelName.Text = user.Name;
        }
    }
}