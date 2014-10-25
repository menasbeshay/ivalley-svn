using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Chat2Connect
{
    public partial class RoomHistory : System.Web.UI.Page
    {
        public int RoomID
        {
            get
            {
                return Helper.TypeConverter.ToInt32(Request.QueryString["rid"]);
            }
        }

        public Helper.Enums.FollowAdminBotSchedule Schedule
        {
            get
            {
                int sid = Helper.TypeConverter.ToInt32(Request.QueryString["sid"]);
                return Helper.EnumUtil.ParseEnum<Helper.Enums.FollowAdminBotSchedule>(sid);
            }
        }

        public string MembersLevel
        {
            get
            {
                return Request.QueryString["l"];
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (RoomID > 0)
                    BindReport();
            }
        }
        private void BindReport()
        {
            BLL.Room rm = new BLL.Room();
            rm.LoadByPrimaryKey(RoomID);
            lblRoomName.Text = rm.Name;

            DateTime dtCreateDate = DateTime.Now;
            switch (Schedule)
            {
                case Helper.Enums.FollowAdminBotSchedule.Daily:
                    dtCreateDate.AddDays(-1);
                    break;
                case Helper.Enums.FollowAdminBotSchedule.Month:
                    dtCreateDate.AddMonths(-1);
                    break;
                default:
                    dtCreateDate.AddDays(-7);
                    break;

            }
            BLL.MemberLog log = new BLL.MemberLog();
            log.LoadForRoom(RoomID,dtCreateDate,MembersLevel);

            grdLog.DataSource = log.DefaultView;
            grdLog.DataBind();
        }
    }
}