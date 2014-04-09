using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Chat2Connect.Admin.UserControls.Room
{
    public partial class RoomStatus : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var lstStatus = Helper.EnumUtil.GetValues<Helper.Enums.RowStatus>().Select(r => new
                {
                    ID = (int)r,
                    Name = Helper.StringEnum.GetStringValue(r)
                }).ToList();
                drpRoomStatus.DataValueField = "ID";
                drpRoomStatus.DataTextField = "Name";
                drpRoomStatus.DataSource = lstStatus;
                drpRoomStatus.DataBind();
            }
        }

        public int RoomID
        {
            get
            {
                return Convert.ToInt32(ViewState["SelectedRoomID"]);
            }
            set
            {
                ViewState["SelectedRoomID"] = value;
                BindRoomInfo();
            }
        }

        private void BindRoomInfo()
        {
            
        }

        protected void btnUpdateRoomStatus_Click(object sender, EventArgs e)
        {

        }
    }
}