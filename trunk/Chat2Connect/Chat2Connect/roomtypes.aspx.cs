using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;

namespace Chat2Connect
{
    public partial class roomtypes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Loadrooms();
            }
        }

        private void Loadrooms()
        {
            Member member = new Member();
            member.GetMemberByUserId(new Guid(Membership.GetUser().ProviderUserKey.ToString()));

            Room rooms = new Room();
            rooms.GetRoomsByCreatorID(member.MemberID);

            uiDropDownListMyRooms.DataSource = rooms.DefaultView;
            uiDropDownListMyRooms.DataValueField = "RoomID";
            uiDropDownListMyRooms.DataTextField = "Name";
            uiDropDownListMyRooms.DataBind();

        }

        protected void uiLinkButtonConfirm_Click(object sender, EventArgs e)
        {
            Member member = new Member();
            member.GetMemberByUserId(new Guid(Membership.GetUser().ProviderUserKey.ToString()));

            Room rooms = new Room();
            rooms.LoadByPrimaryKey(Convert.ToInt32(uiDropDownListMyRooms.SelectedValue));

            
        }
    }
}