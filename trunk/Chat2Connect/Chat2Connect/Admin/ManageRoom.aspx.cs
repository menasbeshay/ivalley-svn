using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Chat2Connect.Admin
{
    public partial class ManageRoom : System.Web.UI.Page
    {
        public static List<string> PageRoles
        {
            get
            {
                List<string> lstRoles = new List<string>();
                lstRoles.Add(Helper.Enums.AdminRoles.Admin_RoomStatus.ToString());
                lstRoles.Add(Helper.Enums.AdminRoles.Admin_RoomType.ToString());
                lstRoles.Add(Helper.Enums.AdminRoles.Admin_AddVIPRoom.ToString());
                return lstRoles;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BLL.Room room = new BLL.Room();
                room.LoadAll();
                room.DefaultView.Sort = BLL.Room.ColumnNames.Name + " ASC";

                drpRooms.DataTextField = BLL.Room.ColumnNames.Name;
                drpRooms.DataValueField = BLL.Room.ColumnNames.RoomID;
                drpRooms.DataSource = room.DefaultView;
                drpRooms.DataBind();
            }
        }

        protected void lnkLoadRoom_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(drpRooms.SelectedValue))
            {
                if (Helper.Admin.HasRole(Helper.Enums.AdminRoles.Admin_RoomStatus.ToString()))
                {
                    ctrlRoomStatus.Visible = true;
                    ctrlRoomStatus.RoomID = Convert.ToInt32(drpRooms.SelectedValue);
                }

                ctrlRoomInfo.RoomID = Convert.ToInt32(drpRooms.SelectedValue);
            }
        }
    }
}