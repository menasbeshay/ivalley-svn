using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace Chat2Connect.usercontrols
{
    public partial class ucFriends : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Member user = new Member();
            user.GetMemberByUserId(new Guid(Membership.GetUser().ProviderUserKey.ToString()));
            Member online = new Member();
            online.GetMemberFriendsByStatus(user.MemberID, true);
            Member offline = new Member();
            offline.GetMemberFriendsByStatus(user.MemberID, false);

            uiRepeaterOnline.DataSource = online.DefaultView;
            uiRepeaterOnline.DataBind();

            uiRepeaterOffline.DataSource = offline.DefaultView;
            uiRepeaterOffline.DataBind();            
        }
    }
}