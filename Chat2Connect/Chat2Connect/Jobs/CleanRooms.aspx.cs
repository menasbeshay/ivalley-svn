using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Web.Security;
namespace Chat2Connect
{
    public partial class CleanRooms : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Response.Write( Membership.GetNumberOfUsersOnline().ToString());
                RoomMember members = new RoomMember();
                members.CleanRooms();
            }
        }
    }
}